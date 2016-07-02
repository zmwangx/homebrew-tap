class Pm < Formula
  desc "Preview man page in your browser as you edit"
  homepage "https://github.com/zmwangx/pm"
  url "https://github.com/zmwangx/pm/archive/v0.2.tar.gz"
  sha256 "48f29311e01ab54076f09334632af8b5abb4bcc33d40ed3b6739a3b3038ea10e"
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
