# The project's official name is translate-shell, but I just call it trans. The
# executable is named trans anyway.
class Trans < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.9.3.tar.gz"
  sha256 "cb0da68cc984cb275e3c8fddfb1b56a846cef41dad729890ad9b3d7ef35dc807"

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
