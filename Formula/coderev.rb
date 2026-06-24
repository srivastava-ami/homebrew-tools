class Coderev < Formula
  desc "Deterministic, polyglot code-standards enforcement — no server, no LLM"
  homepage "https://github.com/srivastava-ami/coderev"
  license "LicenseRef-BusinessSourceLicense-1.1"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-arm64"
      sha256 "da26f81785771a44d53f2a4f561f74ce4509fb686de0c1dbb717d99b6502a84e"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-amd64"
      sha256 "570eb798924c4014c6f470d8f026d7dea3b32d8f274f73f67471df7d632f4d7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-arm64"
      sha256 "43550b31f94852f2dbaf36031a6352845a648b8c8fe8069e4e7c07bf86b4e91f"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-amd64"
      sha256 "8fb3ec26edf1021be9315ba823d0efa1ab2ea54c364aa6108fd8793a22932122"
    end
  end

  def install
    os   = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "coderev-v#{version}-#{os}-#{arch}" => "coderev"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coderev --version")
  end
end
