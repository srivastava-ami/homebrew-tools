class PrWatch < Formula
  desc "Watch GitHub PRs you need to review and get notified of updates"
  homepage "https://github.com/srivastava-ami/pr-watch"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/srivastava-ami/pr-watch/releases/download/v#{version}/pr-watch-v#{version}-darwin-arm64"
      sha256 "f0be26a08d1fcd3c50b4c319f53e8c9ef21a98a1fa23afcb0defd881c082f731"
    end
    on_intel do
      url "https://github.com/srivastava-ami/pr-watch/releases/download/v#{version}/pr-watch-v#{version}-darwin-amd64"
      sha256 "41c3b62db65ea7c4fc73eae74e7e6de4b9ed8279554008b8aa61ee3731bdcdf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/srivastava-ami/pr-watch/releases/download/v#{version}/pr-watch-v#{version}-linux-arm64"
      sha256 "2cd26168daa601f1b604a3358c92d1a4abec2d6ea57fbda7a3efce599f34903a"
    end
    on_intel do
      url "https://github.com/srivastava-ami/pr-watch/releases/download/v#{version}/pr-watch-v#{version}-linux-amd64"
      sha256 "5135aa2ae755007483232f06298a71d285d7960f456dc35ef3d64cc9c634661d"
    end
  end

  def install
    os   = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "pr-watch-v#{version}-#{os}-#{arch}" => "pr-watch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pr-watch --version")
  end
end
