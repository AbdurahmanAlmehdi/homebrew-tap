cask "xpath" do
  version "1.0.3"
  sha256 "c90004cfb49a619d5a4c5dc618bae4f5d43bb50e3f60c06adabb3e4dc6f807d3"

  url "https://github.com/AbdurahmanAlmehdi/x-path/releases/download/v#{version}/XPath-#{version}.dmg"
  name "XPath"
  desc "Self-hosted release tool for Flutter apps"
  homepage "https://github.com/AbdurahmanAlmehdi/x-path"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "XPath.app"

  uninstall launchctl: "ly.abdurahman.xpath.xpd",
            quit:      "ly.abdurahman.xpath"

  zap trash: [
    "~/.config/xpath",
    "~/Library/Application Support/ly.abdurahman.xpath",
    "~/Library/Application Support/XPath",
    "~/Library/Caches/ly.abdurahman.xpath",
    "~/Library/HTTPStorages/ly.abdurahman.xpath",
    "~/Library/Preferences/ly.abdurahman.xpath.plist",
    "~/Library/Saved Application State/ly.abdurahman.xpath.savedState",
  ]

  caveats <<~EOS
    Open XPath once to start its engine and link the xp command.
    To remove everything, use Settings > Remove XPath in the app before uninstalling.
  EOS
end
