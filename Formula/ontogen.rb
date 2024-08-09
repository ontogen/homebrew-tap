class Ontogen < Formula
  desc "Version control system for RDF datasets"
  homepage "https://ontogen.io"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_macos_intel"
      sha256 "12cf5b9a3e5882711041cd357a59bc1dd17058e6854be3356bfdf793a0c28ab8"
    else
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_macos_arm"
      sha256 "d2f4782b205bd771e2617a7406be2731300c228919528857080a150db768f351"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_linux_intel"
      sha256 "1f67b6289ea1a305b59d97969a91e0016274a8cec8f9be3d639ddfbc95319edb"
    else
      url "https://github.com/ontogen/cli/releases/download/v#{version}/og_linux_arm"
      sha256 "e73de8646a56618cedff1d3ac65fd5d5d559566ceb31d18fe55f189595a95b2c"
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
