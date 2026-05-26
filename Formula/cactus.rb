class Cactus < Formula
  desc "On-device AI inference"
  homepage "https://cactuscompute.com"
  url "https://files.pythonhosted.org/packages/source/c/cactus-compute-test/cactus_compute_test-2.1.0.tar.gz"
  sha256 "c61b65b8a00c83ae1bbfee9ba82b8d60ea891820ea168866fe43b571923f9ca6"
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
