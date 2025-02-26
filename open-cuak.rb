class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/homebrew-tap/archive/v0.0.1-alpha.2.tar.gz"
  sha256 "b5f689654f65210807f8281f625c6b011ca567e580b3ee07c13fc5b34df1bc0c"
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
