# The project's official name is translate-shell, but I just call it trans. The
# executable is named trans anyway.
class Trans < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.9.0.6.tar.gz"
  sha256 "208ce6057950513441404639ef81bcf31e93d5fee56542755fcb04e0a22e8ee2"

  head "https://github.com/soimort/translate-shell.git", :branch => "develop"

  depends_on 'fribidi' => :optional
  depends_on 'gawk'
  depends_on 'mplayer'
  depends_on 'rlwrap'

  def install
    system "make"
    bin.install "build/trans"
    man1.install "man/trans.1"
  end
end
