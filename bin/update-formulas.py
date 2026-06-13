#!/usr/bin/env python3
import argparse
import hashlib
import json
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

ARCHIVE_URL_RE = re.compile(
    r'url\s+"https://github\.com/'
    r'(?P<repo>[^"]+)'
    r'/archive/refs/tags/'
    r'(?P<tag>[^/"]+)'
    r'\.tar\.gz"'
)
SHA256_RE = re.compile(r'sha256 "[0-9a-f]{64}"')


def run(command: list[str]) -> str:
    result = subprocess.run(command, check=False, text=True, capture_output=True)
    if result.returncode != 0:
        sys.stderr.write(result.stdout)
        sys.stderr.write(result.stderr)
        raise SystemExit(result.returncode)

    return result.stdout.strip()


def latest_release_tag(repo: str) -> str:
    return run(
        [
            "gh",
            "release",
            "list",
            "--repo",
            repo,
            "--exclude-drafts",
            "--exclude-pre-releases",
            "--limit",
            "1",
            "--json",
            "tagName",
            "--jq",
            ".[0].tagName",
        ]
    )


def sha256_url(url: str) -> str:
    digest = hashlib.sha256()
    with urllib.request.urlopen(url) as response:
        while chunk := response.read(1024 * 1024):
            digest.update(chunk)

    return digest.hexdigest()


def update_formula(path: Path) -> bool:
    text = path.read_text()
    match = ARCHIVE_URL_RE.search(text)
    if not match:
        print(f"Skipping {path}: unsupported URL format", file=sys.stderr)
        return False

    repo = match.group("repo")
    current_tag = match.group("tag")
    latest_tag = latest_release_tag(repo)
    if not latest_tag or latest_tag == current_tag:
        return False

    url = f"https://github.com/{repo}/archive/refs/tags/{latest_tag}.tar.gz"
    sha256 = sha256_url(url)
    updated = text.replace(match.group(0), f'url "{url}"', 1)
    updated = SHA256_RE.sub(f'sha256 "{sha256}"', updated, count=1)
    path.write_text(updated)
    print(json.dumps({"formula": str(path), "from": current_tag, "to": latest_tag}))
    return True


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "formulas",
        nargs="*",
        default=sorted(Path("Formula").glob("*.rb")),
        type=Path,
    )
    args = parser.parse_args()

    for formula in args.formulas:
        update_formula(formula)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
