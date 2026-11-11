# Homebrew cask for the AbdurahmanAlmehdi/homebrew-tap tap:
#   brew install --cask abdurahmanalmehdi/tap/jidr
# release.yml fills in the version and the DMG's checksum (its line in
# SHA256SUMS.txt) and pushes the result to Casks/jidr.rb in the tap.
cask "jidr" do
  version "0.4.0"
  sha256 "a8ab5760f49f9bdace2bdffc6e08f113100c779fc37215da2f8ada768bb540ce"

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
