class Coderev < Formula
  desc "Deterministic, polyglot code-standards enforcement — no server, no LLM"
  homepage "https://github.com/srivastava-ami/coderev"
  license "LicenseRef-BusinessSourceLicense-1.1"
  version "0.19.0"

  on_macos do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-arm64"
      sha256 "b253b1ef8fba65e0520e1ca9749c82ca65be9e599c3508f9151b4b78b2914909"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-amd64"
      sha256 "52854022448da83d6bd811bb105149982178b4f4d53ee72196fe76bc49d1b35f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-arm64"
      sha256 "d87988d534692919a4f7eaf16c5172234a1c64d24365e1ffce2bbcdbc4baf6dc"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-amd64"
      sha256 "dc0783824a61cbf2e954d31b2f8f64bf35822649a7b97e7b7d6563061321788e"
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
