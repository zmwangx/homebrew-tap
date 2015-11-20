# adapted from https://github.com/ryanmjacobs/c/blob/master/c.rb
class C < Formula
  desc 'Compile and execute C "scripts" in one go!'
  homepage "https://github.com/ryanmjacobs/c"
  url "https://github.com/ryanmjacobs/c/archive/v0.10.tar.gz"
  sha256 "958a2c2b2392b905cf39d75a3007adb47a818815a8485ca2170b4214233f6b14"

  def install
    bin.install "c"
  end

  test do
    pipe_output("#{bin}/c", "int main(void){return 0;}", 0)
  end
end
