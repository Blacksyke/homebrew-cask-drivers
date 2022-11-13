cask "tourbox-console" do
  version "4.1.5"
  sha256 "29fe54bd6667f08f7d97b983892a778068ed0a6e811e5c23352f7995542e4eaf"

  url "https://www.tourboxtech.com/en/src/downloads/TourBox_mac_#{version}.zip"
  name "TourBox Console"
  desc "Configuration utility for the TourBox line of custom editing controllers"
  homepage "https://www.tourboxtech.com/"

  livecheck do
    url "https://www.tourboxtech.com/en/downloads.html"
    strategy :page_match
    regex(/Software\sVersion:\s(.+)</)
  end

  depends_on macos: ">= :sierra"

  pkg "TourBox Console Setup.pkg"

  uninstall quit:      "com.tourbox.mac",
            launchctl: "com.tourbox.mac",
            pkgutil:   "com.tourbox.ui.launch"

  zap trash: [
    "~/Library/Preferences/com.tourbox.ui.launch.plist",
    "~/Library/Application Support/TourBox Console",
    "~/Library/Application Support/TourBox Console BAK",
    "~/Library/Saved Application State/com.tourbox.ui.launch.savedState",
  ]
end
