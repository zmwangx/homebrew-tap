# The moreutils formula in Homebrew's main repo conflicts with the parallel
# formula, even with the --without-parallel option. I only nothing beyond
# sponge from moreutils anyway, so I'm singling it out to avoid the conflict
# hell every time parallel is upgraded.
class Sponge < Formula
  homepage "http://joeyh.name/code/moreutils/"
  url "git://git.kitenet.net/moreutils", :tag => "0.57"

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
