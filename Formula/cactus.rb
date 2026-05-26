class Cactus < Formula
  desc "On-device AI inference"
  homepage "https://cactuscompute.com"
  url "https://files.pythonhosted.org/packages/67/6b/46f22284c1123d043321e781730df4daaf5272cd0eb2fb54117a22a2ceab/cactus_compute_test-2.3.0.tar.gz"
  sha256 "9b3ee5ce6cc5ebeb650d7774cc8f3bfc2b37b6a65314c8d28d6803f2b4a4ccae"
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
