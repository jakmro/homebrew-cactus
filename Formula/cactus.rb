class Cactus < Formula
  desc "On-device AI inference"
  homepage "https://cactuscompute.com"
  url "https://files.pythonhosted.org/packages/source/c/cactus-compute-test/cactus_compute_test-2.0.0.tar.gz"
  sha256 "9c2d3e5a783453c005aa43299fe869974e341f0df813cc2e84a7f1d3a12b3e33"
  license "Cactus Compute License"
  include Language::Python::Virtualenv
  depends_on "python@3.12"
  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "cactus-compute-test==#{version}"
    bin.install_symlink libexec/"bin/cactus"
  end
  test do
    assert_equal "cactus #{version}\n", shell_output("#{bin}/cactus --version")
  end
end
