class Fileicon < Formula
  desc "CLI for managing custom icons for files and folders"
  homepage "https://github.com/mklement0/fileicon"
  url "https://github.com/mklement0/fileicon/archive/v0.1.8.tar.gz"
  sha256 "01bb1409e054b09721a022255a6ba985292f64575620aa108537a26e1299c774"
  head "https://github.com/zmwangx/fileicon.git"

  depends_on "osxutils-seticon" if build.head?

  def install
    bin.install "bin/fileicon"
    man1.install "man/fileicon.1"
  end

  test do
    system "false"
  end
end
