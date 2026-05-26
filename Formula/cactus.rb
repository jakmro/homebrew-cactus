class Cactus < Formula
  desc "On-device AI inference"
  homepage "https://cactuscompute.com"
  url "https://files.pythonhosted.org/packages/97/ef/e36348e846568442bb8db9c199f072e6303fde368a101685ab7f1c763ffa/cactus_compute_test-2.2.0.tar.gz"
  sha256 "3cf88d288cc0a50d2a319c5bdf8949eb923904282c57920eae1454658f5cbc1d"
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
