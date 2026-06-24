class Embedder < Formula
  include Language::Python::Virtualenv

  desc "Dependency-style updater for embedded text snippets"
  homepage "https://github.com/rubykatzen/embedder"
  url "https://github.com/rubykatzen/embedder/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "8a686f1f2ae998e64803714ced3242d3421c9fcf215a885f46348a1d19afcb89"
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
