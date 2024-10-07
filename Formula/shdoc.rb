# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Shdoc < Formula
  desc "Documentation generator for shell scripts (bash, sh, zsh)."
  homepage "https://github.com/reconquest/shdoc"
  license "MIT"
  # https://raw.githubusercontent.com/reconquest/shdoc/refs/heads/master/LICENSE
  # https://rubydoc.brew.sh/Formula#head-class_method
  head "https://github.com/reconquest/shdoc.git", branch: "master"
  # Head replace the url, sha256 and version properties???
  url "https://github.com/reconquest/shdoc/archive/refs/tags/v1.2.tar.gz"
  version "1.2"
  sha256 "e963e6dafdef0a214be80de3326659e0f71583b112759dd9cb0bcd2da6870c26"

  # depends_on "cmake" => :build

  def install
    # Install the shdoc script
    # https://docs.brew.sh/Formula-Cookbook#bininstall-foo
    # Bin.install install the script into `/home/linuxbrew/.linuxbrew/bin/`
    bin.install "shdoc"
  end

  # https://rubydoc.brew.sh/Formula#caveats-instance_method
  def caveats
    scripts_list = bin.children.map { |script| "  - #{script.basename}" }.join("\n")
    <<~EOS
      The following files have been installed:

      #{scripts_list}

      You need to delete this commit to have anchor working
      https://github.com/reconquest/shdoc/pull/67
      
      In bash:
      VERSION=$(brew info shdoc --json | jq --raw-output  ".[0].installed[0].version")
      SHDOC_PATH="$(brew --cellar shdoc)/$VERSION/bin/shdoc"
      BAD_PATTERN='gsub(/_/, "", url)'
      sed -i "/${BAD_PATTERN//\//\\/}/d" "$SHDOC_PATH"

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

