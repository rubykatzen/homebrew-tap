class Embedder < Formula
  include Language::Python::Virtualenv

  desc "Dependency-style updater for embedded text snippets"
  homepage "https://github.com/rubykatzen/embedder"
  url "https://github.com/rubykatzen/embedder/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "6b912f3b168c3a5bd57b633450e547743b872da55079aa2fe930d3f3d27bf442"
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
