class Coderev < Formula
  desc "Deterministic, polyglot code-standards enforcement — no server, no LLM"
  homepage "https://github.com/srivastava-ami/coderev"
  license "LicenseRef-BusinessSourceLicense-1.1"
  version "0.28.4"

  on_macos do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-arm64"
      sha256 "fb36dd583fa5008c619f9ca22b4503e3c8c13ddc6f08428100e6daecc597c052"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-amd64"
      sha256 "10a0e6c2f05482bdad37628e3c07d58828995d2041719ef75afb4e7035fe7293"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-arm64"
      sha256 "c37b70e65c6ee4093af49cf675f0b5bec181e4144f41ea8472bb625e555eb947"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-amd64"
      sha256 "0d420acac591be2b0b67ae938645874629b505ffcf60d78814d7e798b37f5f0a"
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
