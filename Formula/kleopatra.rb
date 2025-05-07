class Kleopatra < Formula
  desc "KDE crypto UI (part of KDE PIM)"
  homepage "https://invent.kde.org/pim/kleopatra"
  url "https://download.kde.org/stable/release-service/24.02.2/src/kleopatra-24.02.2.tar.xz"
  sha256 "07743853bb1b66ddf1c0a3f9861fcf21e716bc5e59d84078c02feb9f35c643c5"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "pkg-config" => :build

  depends_on "qt@6"
  depends_on "gpgme"
  depends_on "libassuan"
  depends_on "libgpg-error"
  depends_on "libical"
  depends_on "kf6-kconfig"
  depends_on "kf6-kcoreaddons"
  depends_on "kf6-ki18n"
  depends_on "kf6-kitemmodels"
  depends_on "kf6-kio"
  depends_on "kf6-kwidgetsaddons"
  depends_on "kf6-kwindowsystem"
  depends_on "kf6-kxmlgui"
  depends_on "kf6-notifications"
  depends_on "kf6-auth"
  depends_on "kf6-codecs"
  depends_on "kf6-crash"
  depends_on "kf6-itemmodels"
  depends_on "kf6-statusnotifieritem"
  depends_on "kf6-doc-tools"

  def install
    args = std_cmake_args + %W[
      -G Ninja
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_PREFIX_PATH=#{HOMEBREW_PREFIX}
    ]

    mkdir "build" do
      system "cmake", "..", *args
      system "ninja"
      system "ninja", "install"
    end
  end

  test do
    assert_match "Kleopatra", shell_output("#{bin}/kleopatra --help")
  end
end
