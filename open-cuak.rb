class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/open-cuak/archive/v0.0.1-alpha.tar.gz"
  sha256 "4297e463fc37fffdbe5ad4a2c4dc853696bb39a901db7c04335de8888dd02d5d"
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
    system "colima", "start", "--cpu", "4", "--memory", "8", "--disk", "30", "--mount-type", "virtiofs"
    system "docker", "context", "use", "colima"
  end

  test do
    system "colima", "status"
  end
end
