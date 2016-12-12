class Zmwangxsay < Formula
  include Language::Python::Virtualenv

  desc "Fork of MrMsay for @zmwangx"
  homepage "https://github.com/zmwangx/gharchive/tree/master/.scripts/say"
  url "https://github.com/zmwangx/gharchive.git",
      :tag => "v0.3.5",
      :revision => "df89c8a326cef8d554da53a505b1017070339973"

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