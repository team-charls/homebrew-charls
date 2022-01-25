class Charls < Formula
  desc "C++ JPEG-LS library implementation"
  homepage "https://github.com/team-charls/charls"
  url "https://github.com/team-charls/charls/archive/2.3.1.tar.gz"
  sha256 "274107538c70abfce5459c40ed1ec5ef354193ad9e2c55de6293ca358d52e97"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/team-charls/homebrew-tap/releases/download/charls-2.3.1"
    rebuild 1
    sha256 cellar: :any,                 catalina:     "cef510c039c7f062820704fe3a7b1611939c060e5685aa88ec7d44930520c062"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6d34c5f68a3745a2c75162e382bf794d8c1844ebfc6a61fdc97c0ae2bdd4a523"
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
