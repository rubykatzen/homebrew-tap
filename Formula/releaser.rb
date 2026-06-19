class Releaser < Formula
  include Language::Python::Virtualenv
  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "82f70fb3f6a0a206acf12ec24a5994e56e1cff0714c177060a3f161109c89fd7"
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
