class Direnvx < Formula
  desc "Direnv X - Add vault secret and multi-env to direnv"
  homepage "https://github.com/gerardnico/direnv-x"
  license "MIT"
  # https://rubydoc.brew.sh/Formula#head-class_method
  head "https://github.com/gerardnico/direnv-x.git", branch: "main"
  # Head replace the url, sha256 and version properties???
  # url "https://github.com/bb010g/betterdiscordctl"
  # version "2.0.1"
  # sha256 "63d1de17449611f1490b1930e63cc8890f9f10c7e317f02c901e6a79236c10e2"

  depends_on "direnv"
  #depends_on "bash"
  depends_on "gerardnico/tap/bashlib"

  def install
    # Install all bash scripts to the bin directory
    # https://docs.brew.sh/Formula-Cookbook#bininstall-foo
    # Bin.install install the script into `/home/linuxbrew/.linuxbrew/bin/`
    bin.install Dir["bin/*"]

    # Install man pages:
    man1.install Dir["docs/man/*.1"]
    
  end

  # https://rubydoc.brew.sh/Formula#caveats-instance_method
  def caveats
    scripts_list = bin.children.map { |script| "  - #{script.basename}" }.join("\n")
    <<~EOS
      The following files have been installed:

      #{scripts_list}


      You need to set the BASHLIB_LIBRARY_PATH env in your bashrc
      
        export BASHLIB_LIBRARY_PATH=$(brew --prefix bashlib)/lib


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
    
    # Example
    #  system "#{bin}/script1", "--version"
    #  system "#{bin}/script2", "--help"
  end
end

