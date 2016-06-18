class Pm < Formula
  desc "Preview man page in your browser as you edit"
  homepage "https://github.com/zmwangx/pm"
  url "https://github.com/zmwangx/pm/archive/v0.1.1.tar.gz"
  sha256 "4fcdbae4f4821e4d15bef2d64e9c07212d47308fa226a9f571fb41dbfb7fd23d"
  head "https://github.com/zmwangx/pm.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    system "autoreconf", "-i"
    system "./configure", "prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match /Usage/, shell_output("#{bin}/pm --help 2>&1; :")
  end
end
