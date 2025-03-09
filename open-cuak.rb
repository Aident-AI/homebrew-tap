class OpenCuak < Formula
  desc "OpenCUAK - the platform to run reliable automation agents at scale"
  homepage "https://github.com/Aident-AI/open-cuak"
  url "https://github.com/Aident-AI/homebrew-tap/archive/v0.0.18.tar.gz"
  sha256 "7359c8c8e22c7f1232ecf53871aedf8925283e128759ca141d0d752897a3e993"
  license "MIT"

  depends_on "bc"
  depends_on "colima"
  depends_on "coreutils"
  depends_on "curl"
  depends_on "docker"
  depends_on "gnu-sed"
  depends_on "pv" 
  depends_on "unzip"

  def install
    script_path = "open-cuak"
    chmod 0755, script_path

    libexec.install Dir["*"]
    bin.install_symlink libexec/script_path
  end

  def post_install
    system "echo", "\"Open-CUAK installed successfully!\""
  end

  test do
    system "colima", "status"
  end

  def uninstall
    system "open-cuak", "clear"
    system "rm", "-rf", "$HOME/.open-cuak"
  end
end
