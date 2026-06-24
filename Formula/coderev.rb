class Coderev < Formula
  desc "Deterministic, polyglot code-standards enforcement — no server, no LLM"
  homepage "https://github.com/srivastava-ami/coderev"
  license "LicenseRef-BusinessSourceLicense-1.1"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-arm64"
      sha256 "e796c148b5421273c02937ccff45d0681c11eebed9208c5cc5ec3bcf62257c44"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-amd64"
      sha256 "e7f8bdd0bd20d03bc15a71e6e8f6e62e93c267734ac37127d90d35009bf416c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-arm64"
      sha256 "b1e0bc1a7b49c62fec4aab0e2808b0dd6cea2146651317feae2011e575e58209"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-amd64"
      sha256 "e8437be1ff062e8ee2961638324ab5c5b67d51081d5e5c14e46d6f979fbc989b"
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
