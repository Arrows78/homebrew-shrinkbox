cask "shrinkbox" do
  version "0.3.0"
  sha256 "bc10a972911771dde3cbebc17ca18a3f684f059ef863a69c59e40bac8a963ed5"

  url "https://github.com/Arrows78/Shrinkbox/releases/download/v#{version}/Shrinkbox-#{version}.zip"
  name "Shrinkbox"
  desc "Image, video, audio and PDF optimiser with a drop zone, folder watching and a command line"
  homepage "https://github.com/Arrows78/Shrinkbox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Shrinkbox.app"
  binary "#{appdir}/Shrinkbox.app/Contents/MacOS/Shrinkbox", target: "shrinkbox"

  # Your own files are never removed.
  zap trash: [
    "~/Library/Application Support/Shrinkbox",
    "~/Library/Preferences/dev.labs.shrinkbox.plist",
  ]

  caveats <<~EOS
    Shrinkbox is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open System Settings > Privacy & Security and click "Open Anyway",
    or run: xattr -dr com.apple.quarantine /Applications/Shrinkbox.app
  EOS
end
