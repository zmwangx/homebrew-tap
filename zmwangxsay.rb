class Zmwangxsay < Formula
  include Language::Python::Virtualenv

  desc "Fork of MrMsay for @zmwangx"
  homepage "https://github.com/zmwangx/gharchive/tree/master/.scripts/say"
  url "https://github.com/zmwangx/gharchive/archive/v0.6.0.tar.gz"
  sha256 "0d2ef0252e2296b576b2054e63eb8772f6a0f5a1077319139d50e43fbc81708a"
  revision 1

  bottle do
    root_url "https://dl.bintray.com/zmwangx/bottles"
    sha256 "7982bcf946f77c088f8ce095985c215861ddadfa7a543e6325159a5fdad2aeae" => :sierra
  end

  depends_on "cowsay" => :run
  depends_on :python3

  def install
    package_path = buildpath/".scripts/say"

    # Borrowing from https://github.com/Homebrew/homebrew-core/blob/b15b095/Formula/awscli.rb
    # for resource-less pip install.
    virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-r", package_path/"requirements.txt"
    bin_before = Dir[libexec/"bin/*"].to_set
    system libexec/"bin/pip", "install", package_path
    bin_after = Dir[libexec/"bin/*"].to_set
    bin_to_link = (bin_after - bin_before).to_a
    bin.install_symlink(bin_to_link)
  end

  plist_options :startup => true, :manual => "zmwangxd"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>Program</key>
        <string>#{opt_bin}/zmwangxd</string>
        <key>KeepAlive</key>
        <true/>
        <key>RunAtLoad</key>
        <true/>
        <key>ProcessType</key>
        <string>Background</string>
      </dict>
    </plist>
    EOS
  end

  test do
    ENV["XDG_CONFIG_HOME"] = testpath/".config"
    ENV["XDG_DATA_HOME"] = testpath/".local/share"
    ENV["XDG_CACHE_HOME"] = testpath/".cache"
    say = shell_output("#{bin}/zmwangxsay")
    assert_match "https://git.io/", say
    assert_match "Zhiming Wang", say
  end
end
