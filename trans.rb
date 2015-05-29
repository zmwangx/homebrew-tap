# The project's official name is translate-shell, but I just call it trans. The
# executable is named trans anyway.
class Trans < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.9.0.5.tar.gz"
  sha256 "7728b64a1b2fd130490d451e4eb42fe9e1f160bdc0532cf0bf43364f9d778c01"

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
