class Embedder < Formula
  include Language::Python::Virtualenv
  desc "Dependency-style updater for embedded text snippets"
  homepage "https://github.com/rubykatzen/embedder"
  url "https://github.com/rubykatzen/embedder/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "4aff3dbde4c809238fad575f2f57688ab0047149897e6be9d823f4cdc1c60ab0"
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
