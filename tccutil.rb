class Tccutil < Formula
  desc "Command line tool to add and remove items from the OS X Accessibility database"
  homepage "https://github.com/jacobsalmela/tccutil"
  url "https://github.com/jacobsalmela/tccutil/archive/v1.0.tar.gz"
  sha256 "cdbe9bd2caf8cc73bd62a1da2e1853ed6634f8e952529eb633e89f906bbec2ce"
  revision 1

  def install
    bin.install "tccutil.py"
  end

  test do
    File.exists?("#{bin}/tccutil.py")
  end
end
