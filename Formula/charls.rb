class Charls < Formula
  desc "C++ JPEG-LS library implementation"
  homepage "https://github.com/team-charls/charls"
  url "https://github.com/team-charls/charls/archive/refs/tags/2.4.2.tar.gz"
  sha256 "d1c2c35664976f1e43fec7764d72755e6a50a80f38eca70fcc7553cad4fe19d9"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/team-charls/homebrew-tap/releases/download/charls-2.4.2"
    sha256 cellar: :any,                 big_sur:      "8ec1d4ecda42619a12709d855c550f7c58a13b8b8410f0fc5eaca81e95c74c3d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fe63541f8d2fa9948af2a7adc0aee50f62e12eb17afa702842ef29ea74f3d19f"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args,
                         "-DBUILD_SHARED_LIBS=ON",
                         "-DCHARLS_BUILD_TESTS=OFF",
                         "-DCHARLS_BUILD_FUZZ_TEST=OFF",
                         "-DCHARLS_BUILD_SAMPLES=OFF"
    system "make", "install"
  end
end
