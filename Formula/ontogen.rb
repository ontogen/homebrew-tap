class Ontogen < Formula
  desc "Version control system for RDF datasets"
  homepage "https://ontogen.io"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_macos_intel"
      sha256 "8cc65770d02efb76ebf1db77ba158781893831ebb9294f196f375c6f9c73ee87"
    else
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_macos_arm"
      sha256 "7c382c2ed5bb5da4a74e24a392a3b2ff90e553a149b36019ed5e17d6e01d7922"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_linux_intel"
      sha256 "b934a28413ef0123e336a9993f6ecaebd9effa70267d392a322cc3a7494e602d"
    else
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_linux_arm"
      sha256 "55208071b31501d04e936722ab5c0ef1f5b6599ed17e2c89f87cce6244f0b8f7"
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
