class Cactus < Formula
  desc "On-device AI inference"
  homepage "https://cactuscompute.com"
  url "https://files.pythonhosted.org/packages/7b/82/285ac6b8f9c0a00a07bd43dd12a46a1b9fdb1451df4f146659178baa44ac/cactus_compute_test-2.4.0.tar.gz"
  sha256 "fc863d0a7013ddb1124718fe31b45234ea6194c6e37b15856491134439383588"
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
