# The moreutils formula in Homebrew's main repo conflicts with the parallel
# formula, even with the --without-parallel option. I only nothing beyond
# sponge from moreutils anyway, so I'm singling it out to avoid the conflict
# hell every time parallel is upgraded.
class Sponge < Formula
  homepage "http://joeyh.name/code/moreutils/"
  url "https://mirrors.kernel.org/debian/pool/main/m/moreutils/moreutils_0.55.orig.tar.gz"
  mirror "http://ftp.us.debian.org/debian/pool/main/m/moreutils/moreutils_0.55.orig.tar.gz"
  sha256 "da9d5cd145ceea967a65dd50031d168d66199c3eb41b9390b57f35d4a5808ab5"

  depends_on "docbook-xsl" => :build

  def install
    inreplace "Makefile",
              "/usr/share/xml/docbook/stylesheet/docbook-xsl",
              "#{Formula["docbook-xsl"].opt_prefix}/docbook-xsl"
    system "make", "sponge", "sponge.1"
    bin.install "sponge"
    man1.install "sponge.1"
  end
end
