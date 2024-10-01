# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dockenv < Formula
  desc "Docker command driven by your environment"
  homepage "https://github.com/gerardnico/dockenv"
  license "MIT"
  # https://rubydoc.brew.sh/Formula#head-class_method
  head "https://github.com/gerardnico/dockenv.git", branch: "main"
  # Head replace the url, sha256 and version properties
  # url "https://github.com/bb010g/betterdiscordctl"
  # version "2.0.1"
  # sha256 "63d1de17449611f1490b1930e63cc8890f9f10c7e317f02c901e6a79236c10e2"

  # depends_on "cmake" => :build

  def install
    # Install all bash scripts to the bin directory
    # https://docs.brew.sh/Formula-Cookbook#bininstall-foo
    # Bin.install install the script into `/home/linuxbrew/.linuxbrew/bin/`
    bin.install Dir["bin/*"]
  end

  # https://rubydoc.brew.sh/Formula#caveats-instance_method
  def caveats
    <<~EOS
      Enjoy dockenv!
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

