cask 'ffdec' do
  version '6.0.1'
  sha256 '9347b9a0d894cc0d970330c1c07013df452e5bef129bb9e281a3e98c8cb33469'

  # https://github.com/jindrapetrik/jpexs-decompiler
  url "https://www.free-decompiler.com/flash/download/ffdec_#{version}_macosx.zip"
  name 'JPEXS Free Flash Decompiler'
  homepage 'https://www.free-decompiler.com/flash/'

  app 'FFDec.app'
end
