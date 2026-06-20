class Releaser < Formula
  include Language::Python::Virtualenv

  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.4.6.tar.gz"
  sha256 "31fcec63cfa392e0c16eb903b75fff64f3ffb2329577a062bea0143f2fa30413"
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
