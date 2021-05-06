class Charls < Formula
  desc "C++ JPEG-LS library implementation"
  homepage "https://github.com/team-charls/charls"
  url "https://github.com/team-charls/charls/archive/2.2.0.tar.gz"
  sha256 "e1d7dd70cd9d6d46de5abbf22278dc8169707995a21e8bf705f5746c04c76891"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any, big_sur: "895f797f5001d7a7d0680875c3c9d0f806a9c7b38a8b2bf3714ea239bb3f3fd1"
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
