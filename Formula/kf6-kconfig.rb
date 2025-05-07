# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Kf6Kconfig < Formula
  desc ""
  homepage ""
  url "https://download.kde.org/stable/frameworks/6.14.0/src/kconfig-6.14.0.tar.xz"
  sha256 "e0efff427b2155b09784851fa1645511ffb93629e557e887ec5dacff2fe223a0"
  license ""

   depends_on "cmake" => :build
   depends_on "ninja" => :build
   depends_on "extra-cmake-modules" => :build
   depends_on "qt@6"
   depends_on "kf6-kcoreaddons"

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url "https://download.kde.org/stable/frameworks/6.14.0/src/kconfig-6.14.0.tar.xz"
  #   sha256 "e0efff427b2155b09784851fa1645511ffb93629e557e887ec5dacff2fe223a0"
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test kf6-kconfig`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
