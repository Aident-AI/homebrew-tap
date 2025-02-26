class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/homebrew-tap/archive/v0.0.1-alpha.3.tar.gz"
  sha256 "7a57a9b8f96f8d9fe3a293e1629d6060aba09575161ea15cfab2e028ad16abda"
  license "MIT"

  depends_on "colima"
  depends_on "docker"
  depends_on "docker-compose"

  def install
    script_path = "open-cuak"
    chmod 0755, script_path

    libexec.install Dir["*"]
    bin.install_symlink libexec/script_path
  end

  def post_install
    puts ">>> Post install"
  end

  test do
    system "colima", "status"
  end
end
