cask :v1 => 'minimal-status-bar' do
  version '1.18'
  sha256 'b8bdfdfcb2dbf47acc8630eed44dc13ff311c49f73584dfe8223a114b1248c3a'

  url "https://github.com/visnup/Minimal-Status-Bar/releases/download/v#{version}/Minimal-Status-Bar-#{version}.safariextz"
  name 'Minimal Status Bar'
  homepage 'https://visnup.github.io/Minimal-Status-Bar/'
  license :isc

  container :type => :naked

  stage_only true

  postflight do
    system "open", File.join(staged_path, "Minimal-Status-Bar-#{version}.safariextz")
  end

  uninstall :delete => File.expand_path('~/Library/Safari/Extensions/Minimal Status Bar.safariextz')
end
