class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/homebrew-tap/archive/v0.0.1-beta.tar.gz"
  sha256 "a8c7ac1118c4d34265540baca530cd439fd42760e2fd2c476994b2baaf9abbcc"
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
