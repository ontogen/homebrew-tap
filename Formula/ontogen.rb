class Ontogen < Formula
  desc "Version control system for RDF datasets"
  homepage "https://ontogen.io"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ontogen/cli/releases/download/v0.1.0/og_macos"
      sha256 "6c783cfcba1b73552cffc8511e3c067423e0cfea1c56ae61bb8b1b1637c365c3"
    else
      url "https://github.com/ontogen/cli/releases/download/v0.1.0/og_macos_silicon"
      sha256 "7046cb55dd68c41a3e183848518c99e4e527a0987d6bfd16cf48ff239adb4a91"
    end
  end

  def install
    bin.install "og_macos" => "og" if Hardware::CPU.intel?
    bin.install "og_macos_silicon" => "og" if Hardware::CPU.arm?
  end

  test do
    system "#{bin}/og", "--version"
  end
end
