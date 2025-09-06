class Ansx < Formula
  desc "Easy ansible execution with extras thanks to Docker"
  homepage "https://github.com/gerardnico/ansible-x"
  license "MIT"
  # https://rubydoc.brew.sh/Formula#head-class_method
  head "https://github.com/gerardnico/ansible-x.git", branch: "main"
  
  depends_on "gerardnico/tap/bashlib"
  depends_on "docker"
  depends_on "jq"
  
  def install
    
    # Install all bash scripts to the bin directory
    # https://docs.brew.sh/Formula-Cookbook#bininstall-foo
    # Bin.install install the script into `/home/linuxbrew/.linuxbrew/bin/`
    bin.install Dir["bin/*"]
    
    # Install man pages:
    man1.install Dir["docs/man/man1/*.1"]
    
  end

  # https://rubydoc.brew.sh/Formula#caveats-instance_method
  def caveats
    scripts_list = bin.children.map { |script| "  - #{script.basename}" }.join("\n")
    <<~EOS
      The following scripts have been installed:

      #{scripts_list}
    
    EOS
  end
  
  
  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test dockenv`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    
    # We can't really test the installation because it's a wrapper around docker
    # Therefore the docker daemon should be up
    # For now manually test
    # 
    # Example
    # system "#{bin}/script1", "--version"
    # system "#{bin}/ans-x-bash", "synopsis"
  end
end

