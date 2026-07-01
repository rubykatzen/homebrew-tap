class Embedder < Formula
  include Language::Python::Virtualenv

  desc "Dependency-style updater for embedded text snippets"
  homepage "https://github.com/rubykatzen/embedder"
  url "https://github.com/rubykatzen/embedder/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "33bdcd9f167e630fe36b36325323ad979c27479629d2fc9325a50dfcd44e364a"
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
