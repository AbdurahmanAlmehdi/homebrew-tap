# AbdurahmanAlmehdi/homebrew-tap

Homebrew casks for [XPath](https://github.com/AbdurahmanAlmehdi/x-path), the self-hosted release
tool for Flutter apps.

```sh
brew trust abdurahmanalmehdi/tap
brew install --cask abdurahmanalmehdi/tap/xpath
```

Homebrew asks you to trust a third-party tap once before it loads its casks. Already installed
XPath from the DMG? Add `--adopt` to the install so Homebrew takes over the app in /Applications;
after that `brew upgrade --cask xpath` updates it.

Apple silicon, macOS 12 or later (the background engine needs macOS 13). The DMG is signed with Developer ID and notarized.

`brew uninstall --cask xpath` stops the engine and removes the app; `brew uninstall --zap --cask
xpath` also deletes its data. Keychain items stay: remove them with **Settings ▸ Remove XPath** in
the app first.
