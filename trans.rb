# The project's official name is translate-shell, but I just call it trans. The
# executable is named trans anyway.
class Trans < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.9.0.3.tar.gz"
  sha256 "b5d9d5435531e83d011dadab3ef044145c04b1e874539630005ed06f440ec289"

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
