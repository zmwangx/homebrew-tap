# The project's official name is translate-shell, but I just call it trans. The
# executable is named trans anyway.
class Trans < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.8.24.tar.gz"
  sha256 "e83d890051f7f3866d81eed9884d7ffa6592c40e80de805bc8c63e9ea36a9161"

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
