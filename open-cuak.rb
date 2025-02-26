class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/homebrew-tap/archive/vv0.0.1-alpha.1.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "colima"
  depends_on "docker"
  depends_on "docker-compose"

  def install
    script_path = "open-cuak"
    chmod 0755, script_path
    
    libexec.install Dir["*"]
    bin.install_symlink libexec/script_path
    inreplace bin/"open-cuak", "../", "#{libexec}/"
  end

  def post_install
    puts ">>> Post install"
  end

  test do
    system "colima", "status"
  end
end
