class Coderev < Formula
  desc "Deterministic, polyglot code-standards enforcement — no server, no LLM"
  homepage "https://github.com/srivastava-ami/coderev"
  license "LicenseRef-BusinessSourceLicense-1.1"
  version "0.24.1"

  on_macos do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-arm64"
      sha256 "8c555992cbd136078108fad853b570fac35cbdec3969dfc569e42c5c898c430c"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-darwin-amd64"
      sha256 "1c5a4263801768021895d2af18ea16321426e975698f263761141300ea11fd28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-arm64"
      sha256 "aeaa9f6360cc2165b24bd7c3088835d76f1edc7f3c8861cd6d01e5ced1ec5792"
    end
    on_intel do
      url "https://github.com/srivastava-ami/coderev/releases/download/v#{version}/coderev-v#{version}-linux-amd64"
      sha256 "5aeb6b3932e9775471ccb0182acc04c605c49843fb7c79be1d70dd1da9d82771"
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
