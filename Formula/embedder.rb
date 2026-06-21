class Embedder < Formula
  include Language::Python::Virtualenv

  desc "Dependency-style updater for embedded text snippets"
  homepage "https://github.com/rubykatzen/embedder"
  url "https://github.com/rubykatzen/embedder/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "53eafdcbd6519d081f4a6d711751e239b63330756a8ccca2007daedeb13b049d"
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
    assert_match "embedder", shell_output("#{bin}/embedder --help")
  end
end
