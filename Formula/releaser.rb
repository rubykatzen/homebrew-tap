class Releaser < Formula
  include Language::Python::Virtualenv

  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/dupmachine/releaser"
  url "https://github.com/dupmachine/releaser/releases/download/v0.0.1/dupmachine_releaser-0.0.1.tar.gz"
  sha256 "37fd35dd5cd4f15a728a814bac74f2b4c106df4affc0c38a0ac65c0a3d8b37e5"
  license "MIT"

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
