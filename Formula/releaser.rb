class Releaser < Formula
  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "5fc1d68a856b6578df719da97305ca5c14b9c8b3d4bd161046c3cebfca3a1191"
  license "MIT"

  depends_on "gh"
  depends_on "git"
  depends_on "python@3.13"

  def install
    libexec.install "src"
    python = Formula["python@3.13"].opt_bin/"python3.13"
    (bin/"releaser").write <<~EOS
      #!/bin/bash
      PYTHONPATH="#{libexec}/src" exec "#{python}" -m releaser "$@"
    EOS
    chmod 0755, bin/"releaser"
  end

  test do
    assert_match "releaser", shell_output("#{bin}/releaser --help")
  end
end
