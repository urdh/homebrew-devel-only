class Standardese < Formula
  desc "Next-gen Doxygen for C++"
  homepage "https://github.com/foonathan/standardese"
  head "https://github.com/foonathan/standardese.git"

  devel do
    url "https://github.com/foonathan/standardese/archive/v0.1-1.tar.gz"
    sha256 "edd1c1f6d0df1e319da21987b0b53a4edee3cbece9c4922d705742b99e1e07af"
    version "0.1-1"
  end

  depends_on "cmake" => :build
  depends_on "llvm"
  depends_on "boost"

  def install
    system "cmake", ".", "-DSTANDARDESE_BUILD_TEST=OFF",
                         "-DLIBCLANG_SYSTEM_INCLUDE_DIR=#{Formula["llvm"].opt_include}",
                         *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/standardese", "--help"
  end
end
