# Homebrew cask for the AbdurahmanAlmehdi/homebrew-tap tap:
#   brew install --cask abdurahmanalmehdi/tap/jidr
# release.yml fills in 0.1.0 and 13b49341c3ff2c860cfdfbd4bfcef4324e6524134f99d4f1fe119dc4a58fbac6 (the DMG's line in
# SHA256SUMS.txt) and pushes the result to Casks/jidr.rb in the tap.
cask "jidr" do
  version "0.1.0"
  sha256 "13b49341c3ff2c860cfdfbd4bfcef4324e6524134f99d4f1fe119dc4a58fbac6"

  url "https://github.com/AbdurahmanAlmehdi/jidr/releases/download/v#{version}/Jidr-#{version}-arm64.dmg"
  name "Jidr"
  desc "Android emulators with one-click rooted devices"
  homepage "https://jidr.ly/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Jidr.app"
  binary "#{appdir}/Jidr.app/Contents/Helpers/jidr"

  uninstall quit: "ly.jidr.Jidr"

  # `jidr uninstall --purge` (D31) removes devices and the private SDK; zap
  # only removes what Homebrew can see without running Jidr.
  zap trash: [
    "~/Library/Application Support/Jidr",
    "~/Library/Caches/Jidr",
    "~/Library/Logs/Jidr",
  ]
end
