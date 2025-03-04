class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/homebrew-tap/archive/v0.0.11.tar.gz"
  sha256 "e1506a98152d65deb75dca5bd17d26cbb9cbbb95920923d2d37401e718edd445"
  license "MIT"

  depends_on "colima"
  depends_on "curl"
  depends_on "docker"
  depends_on "docker-compose"

  def install
    script_path = "open-cuak"
    chmod 0755, script_path

    libexec.install Dir["*"]
    bin.install_symlink libexec/script_path
  end

  def post_install
    system "echo", "\"Setting Docker context back to default...\""
    system "docker", "context", "use", "default"
  end

  test do
    system "colima", "status"
  end

  def uninstall
    system "open-cuak", "clear"
    system "rm", "-rf", "$HOME/.open-cuak"
  end
end
