class Charls < Formula
  desc "C++ JPEG-LS library implementation"
  homepage "https://github.com/team-charls/charls"
  url "https://github.com/team-charls/charls/archive/refs/tags/2.4.1.tar.gz"
  sha256 "721f4fd6a8dc3ec6a334d1c3c15d1cb9faa149afddd0eff703466c20e775c294"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/team-charls/homebrew-tap/releases/download/charls-2.4.1"
    sha256 cellar: :any,                 big_sur:      "fcafd52fde8ddf11fcd8432e00aff76716e17e002763398f668603b285917303"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a8617ce984db6417f79561958563a3583f23aa161a041bb120780acf460c5bb9"
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
