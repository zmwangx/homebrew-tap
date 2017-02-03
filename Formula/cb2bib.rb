class Cb2bib < Formula
  homepage "http://www.molspaces.com/d_cb2bib-overview.php"
  url "http://www.molspaces.com/dl/progs/cb2bib-1.5.0.tar.gz"
  sha256 "e5eae392c9223889fb21c5a656b014d5a81a333c5378196075a985233885f3b9"

  depends_on "bibutils"

  def install
    # only install the helper scripts; GUI app is useless for me
    bin.install "c2btools/bib2pdf"
    bin.install "c2btools/isi2bib"
    bin.install "c2btools/med2bib"
    bin.install "c2btools/ris2bib"
  end
end
