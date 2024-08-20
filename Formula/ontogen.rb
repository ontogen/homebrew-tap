class Ontogen < Formula
  desc "Version control system for RDF datasets"
  homepage "https://ontogen.io"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_macos_intel"
      sha256 "3fb16c159059fec0653964ed43276326f6776f16b067ef1c8e08e981e01362f2"
    else
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_macos_arm"
      sha256 "551ef10a1e475a9e5312375d5e7239b84cd26eeef2d2cf84d77812a87fc8d1f6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_linux_intel"
      sha256 "e56babd0724d20450328574d2f2a95d89f389e08107616dd2c7e498656508a59"
    else
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_linux_arm"
      sha256 "8deb1a45c52dc6526a7b856ad13eb39fb586ddfc82489fb06999e49e941749db"
    end
  end

  def install
    binary_name = "og"

    if OS.mac?
      bin.install "og_macos_intel" => binary_name if Hardware::CPU.intel?
      bin.install "og_macos_arm" => binary_name if Hardware::CPU.arm?
    elsif OS.linux?
      bin.install "og_linux_intel" => binary_name if Hardware::CPU.intel?
      bin.install "og_linux_arm" => binary_name if Hardware::CPU.arm?
    end
  end

  test do
    system "#{bin}/og", "--version"
  end
end
