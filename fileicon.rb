class Fileicon < Formula
  desc "CLI for managing custom icons for files and folders"
  homepage "https://github.com/mklement0/fileicon"
  url "https://github.com/mklement0/fileicon/archive/v0.1.6.tar.gz"
  sha256 "c664c3ebe64226f2be4f6f69ee2270841de6a9f94edc64790ccdc448ae40ebc8"
  head "https://github.com/zmwangx/fileicon.git"

  def install
    bin.install "bin/fileicon"
    man1.install "man/fileicon.1"
  end

  test do
    system "false"
  end
end
