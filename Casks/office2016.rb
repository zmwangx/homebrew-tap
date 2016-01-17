cask 'office2016' do
  version :latest
  sha256 :no_check

  url 'http://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_2016_Installer.pkg'
  name 'Office for Mac 2016'
  homepage 'https://products.office.com/en-US/mac/microsoft-office-for-mac'
  license :commercial

  pkg 'Microsoft_Office_2016_Installer.pkg'

  # uninstall and zap stanzas copied from
  # https://github.com/caskroom/homebrew-cask/blob/44ff9373decdb2754c03046695e84546cde067a4/Casks/microsoft-office.rb
  # may not be accurate
  uninstall :pkgutil   => [
                           'com.microsoft.package.*',
                           'com.microsoft.pkg.licensing'
                          ],
            :launchctl => 'com.microsoft.office.licensingV2.helper',
            :delete    => [
                           '/Applications/Microsoft Excel.app',
                           '/Applications/Microsoft OneNote.app',
                           '/Applications/Microsoft Outlook.app',
                           '/Applications/Microsoft PowerPoint.app',
                           '/Applications/Microsoft Word.app'
                          ]
  zap       :pkgutil   => [
                           'com.microsoft.mau.all.autoupdate.*',
                           'com.microsoft.merp.all.errorreporting.*'
                          ],
            :delete    => [
                           '/Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist',
                           '/Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper',
                           '/Library/Application Support/Microsoft/MAU2.0',
                           '/Library/Application Support/Microsoft/MERP2.0',
                           '/Library/Preferences/com.microsoft.Excel.plist',
                           '/Library/Preferences/com.microsoft.Outlook.plist',
                           '/Library/Preferences/com.microsoft.PlayReady.plist',
                           '/Library/Preferences/com.microsoft.Powerpoint.plist',
                           '/Library/Preferences/com.microsoft.Word.plist',
                           '/Library/Preferences/com.microsoft.office.licensing.plist',
                           '/Library/Preferences/com.microsoft.outlook.databasedaemon.plist',
                           '/Library/Preferences/com.microsoft.outlook.officereminders.plist',
                           '~/Library/Application Support/Microsoft/Office',
                           '~/Library/Preferences/com.microsoft.Excel.plist',
                           '~/Library/Preferences/com.microsoft.Outlook.plist',
                           '~/Library/Preferences/com.microsoft.Powerpoint.plist',
                           '~/Library/Preferences/com.microsoft.Word.plist',
                           '~/Library/Preferences/com.microsoft.autoupdate2.plist',
                           '~/Library/Preferences/com.microsoft.error_reporting.plist',
                           '~/Library/Preferences/com.microsoft.office.plist',
                           '~/Library/Preferences/com.microsoft.office.setupassistant.plist',
                           '~/Library/Preferences/com.microsoft.outlook.databasedaemon.plist',
                           '~/Library/Preferences/com.microsoft.outlook.office_reminders.plist',
                           '~/Library/Preferences/com.microsoft.outlook.officereminders.plist',
                           '~/Documents/Microsoft User Data/Microsoft',
                           '~/Documents/Microsoft User Data/Office 2011 Identities',
                           '~/Documents/Microsoft User Data/Outlook Sound Sets',
                           '~/Documents/Microsoft User Data/Saved Attachments'
                          ],
            :rmdir     => [
                           '/Library/Application Support/Microsoft',
                           '~/Library/Application Support/Microsoft',
                           '~/Documents/Microsoft User Data'
                          ]
end
