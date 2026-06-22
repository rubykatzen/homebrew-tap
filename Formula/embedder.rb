class Embedder < Formula
  include Language::Python::Virtualenv

  desc "Dependency-style updater for embedded text snippets"
  homepage "https://github.com/rubykatzen/embedder"
  url "https://github.com/rubykatzen/embedder/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3d28a831dc1ed4006d27534216cd05df8bf4610c4a0a823547dbf47aa803c523"
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
