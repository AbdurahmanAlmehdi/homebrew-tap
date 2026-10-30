cask "xpath" do
  version "1.8.2"
  sha256 "8d6d53a65b7a806d3e8155031fd913e4af6182a83f839a6e7587f32700a975c3"

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

  # Only quit the app. The engine is a per-user login item the app registers
  # itself (SMAppService); a `launchctl` stanza would unload it on every upgrade
  # and make Homebrew ask for a password for the system domain. Settings >
  # Remove XPath in the app unregisters it.
  uninstall quit: "ly.abdurahman.xpath"

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
