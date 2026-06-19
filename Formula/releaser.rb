class Releaser < Formula
  include Language::Python::Virtualenv
  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "d0df90afc614cb0c0b7a99967f6b216ff06a763c5e09cfd0d74b94ae0d920b01"
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
