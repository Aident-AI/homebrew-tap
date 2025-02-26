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
    libexec.install Dir["*"]
  
    # Check if open-cuak.sh exists and handle it appropriately
    if File.exist? "open-cuak.sh"
      chmod 0755, "open-cuak.sh"
      bin.install_symlink libexec/"open-cuak.sh"
    else
      # If it's not in the root, look for it in the extracted directory
      open_cuak_script = Dir["*/open-cuak.sh"].first
      if open_cuak_script
        chmod 0755, open_cuak_script
        bin.install_symlink libexec/open_cuak_script
      else
        odie "Could not find open-cuak.sh script"
      end
    end
    
    # Only run inreplace if the symlink exists
    if File.symlink? bin/"open-cuak.sh"
      inreplace bin/"open-cuak.sh", "../", "#{libexec}/"
    end
  end

  def post_install
  end

  test do
    system "colima", "status"
  end
end
