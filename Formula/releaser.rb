class Releaser < Formula
  include Language::Python::Virtualenv

  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "3bd2f264eb30bd640f0302e4519c4614caac05ccca65873f8cf93efc51cd1ab5"
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
