cask :v1 => 'daisydiskbeta' do
  version :latest
  sha256 :no_check

  url 'http://www.daisydiskapp.com/downloads/DaisyDiskBeta.zip'
  name 'DaisyDisk'
  homepage 'http://www.daisydiskapp.com'
  license :freemium

  app 'DaisyDisk.app'

  postflight do
    suppress_move_to_applications
  end
end
