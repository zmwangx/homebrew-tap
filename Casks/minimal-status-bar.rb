cask :v1 => 'minimal-status-bar' do
  version '1.17'
  sha256 '345cc1eb986dd94d8025c09c448a7603bbbdce64b1d376a7ebfc4baff9fb6811'

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
