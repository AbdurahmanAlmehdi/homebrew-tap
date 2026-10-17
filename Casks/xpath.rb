cask "xpath" do
  version "1.0.0"
  sha256 "7b0f38a49fd88878cbaf09e238d7c4e6a82ab772a9147e8878a00bd83e958024"

  url "https://github.com/AbdurahmanAlmehdi/x-path/releases/download/v#{version}/XPath-#{version}.dmg"
  name "XPath"
  desc "Self-hosted release tool for Flutter apps"
  homepage "https://github.com/AbdurahmanAlmehdi/x-path"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

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
