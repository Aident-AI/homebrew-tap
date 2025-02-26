class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/homebrew-tap/archive/v0.0.1-alpha.tar.gz"
  sha256 "a4ceaf2d8af10c89162b757fc690883aae686bfebcd04785f39a9cdcef873c34"
  license "MIT"

  depends_on "colima"
  depends_on "docker"
  depends_on "docker-compose"

  def install
    # Ensure libexec directory exists and install everything into it
    libexec.install Dir["*"]

    # Ensure open-cuak.sh is installed in libexec
    chmod 0755, libexec/"open-cuak.sh"  # Ensure it's executable

    # Create a symlink so users can run `open-cuak` from anywhere
    bin.install_symlink libexec/"open-cuak.sh"

    # Patch open-cuak.sh to reference libexec paths correctly
    inreplace bin/"open-cuak.sh", "../", "#{libexec}/"
  end

  def post_install
  end

  test do
    system "colima", "status"
  end
end
