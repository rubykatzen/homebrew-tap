class Releaser < Formula
  include Language::Python::Virtualenv

  desc "Opinionated zero-config release gate for GitHub repositories"
  homepage "https://github.com/rubykatzen/releaser"
  url "https://github.com/rubykatzen/releaser/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b3314deffe805e61522310732220092e25c33523f102af109f739089c375269c"
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
