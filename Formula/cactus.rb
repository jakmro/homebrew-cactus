class Cactus < Formula
  desc "On-device AI inference"
  homepage "https://cactuscompute.com"
  url "https://files.pythonhosted.org/packages/b7/27/a309965a35c50dcdc37625a26586521674c7f1da51e95cf1b72da33cffef/cactus_compute_test-2.5.0.tar.gz"
  sha256 "5ddef1ab806254defc4df5fa34d707224c3d80f6fa88e9c80437c42bb6ca0db5"
  license "Cactus Compute License"
  include Language::Python::Virtualenv
  depends_on "python@3.12"

  livecheck do
    url "https://pypi.org/pypi/cactus-compute-test/json"
    regex(/"version":\s*"(\d+(?:\.\d+)+)"/i)
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install "cactus-compute-test==#{version}"
    bin.install_symlink libexec/"bin/cactus"
  end

  test do
    assert_equal "cactus #{version}\n", shell_output("#{bin}/cactus --version")
  end
end
