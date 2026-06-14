class Releaser < Formula
  include Language::Python::Virtualenv

  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "700d803eb1ca68fd8afd79c57fcd00361c10b3f886de23fd8a4702258c1a01d3"
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
