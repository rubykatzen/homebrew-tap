class Releaser < Formula
  include Language::Python::Virtualenv

  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "c5ca1a0a24ff6c9d5db07b7fead312c1acad8fc44b62efc86d406e52f0374b4b"
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
