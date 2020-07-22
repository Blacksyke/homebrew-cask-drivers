cask 'kiibohd-configurator' do
  version '1.1.0'
  sha256 '996abcfd4f05420199e0302be50d9e878bd28bb50f541b5f6886a1654862e20f'

  # github.com/kiibohd/configurator/ was verified as official when first introduced to the cask
  url "https://github.com/kiibohd/configurator/releases/download/v#{version}/kiibohd-configurator-#{version}-mac.dmg"
  appcast 'https://github.com/kiibohd/configurator/releases.atom'
  name 'Kiibohd Configurator'
  homepage 'http://kiibohd.com/'

  depends_on formula: 'dfu-util'

  app 'Kiibohd Configurator.app'

  uninstall quit: 'club.input.KiibohdConfigurator'

  zap trash: [
               '~/Library/Application Support/kiibohd-configurator',
               '~/Library/Logs/Kiibohd Configurator',
               '~/Library/Preferences/club.input.KiibohdConfigurator.plist',
               '~/Library/Saved Application State/club.input.KiibohdConfigurator.savedState',
             ]
end
