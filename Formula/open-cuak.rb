class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/open-cuak/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4297e463fc37fffdbe5ad4a2c4dc853696bb39a901db7c04335de8888dd02d5d"
  license "MIT"

  depends_on "colima"
  depends_on "docker"
  depends_on "docker-compose"

  def install
    bin.install "brew/open-cuak.sh"
    libexec.install Dir["*"]
    # Patch open-cuak.sh to reference files in libexec instead of relative paths
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
