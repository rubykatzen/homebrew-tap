class Releaser < Formula
  include Language::Python::Virtualenv

  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "666865b18654d0136b2bd61ae37c8f2e7be4bf256e56bf4fc246d416ca8d44e8"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "gh"
  depends_on "git"
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "releaser", shell_output("#{bin}/releaser --help")
  end
end
