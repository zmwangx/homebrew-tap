class OsxutilsSeticon < Formula
  desc "geticon and seticon from osxutils"
  homepage "https://github.com/specious/osxutils"
  url "https://github.com/specious/osxutils/archive/v1.8.2.tar.gz"
  sha256 "83714582cce83faceee6d539cf962e587557236d0f9b5963bd70e3bc7fbceceb"
  head "https://github.com/specious/osxutils.git"

  def install
    system "make", "geticon", "seticon"
    bin.install "geticon/geticon", "seticon/seticon"
    man1.install "geticon/geticon.1", "seticon/seticon.1"
  end

  test do
    system "#{bin}/geticon", "/Applications/Safari.app"
    assert (testpath/"Safari.icns").exist?
  end
end
