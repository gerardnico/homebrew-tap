class Giture < Formula
  desc "Git commands for your pleaser (Git Flow, Multiple repos command execution, Hosting Backup, ...)"
  homepage "https://github.com/gerardnico/giture"
  url "https://github.com/gerardnico/giture/releases/download/v0.1.1/giture-0.1.1.zip"
  version "0.1.1"
  sha256 "e0c014fa9eb1f0a8d4c3504ca427844e602193c4fef6b97bd2088c23a8d9acc0"
  license "Apache-2.0"

  # Mostly due to the hosting backup command
  # see its documentation
  depends_on "coreutils"
  depends_on "git"
  depends_on "openssh"
  depends_on "curl"

  def install

    # Install all bash scripts to the bin directory
    # https://docs.brew.sh/Formula-Cookbook#bininstall-foo
    # Bin.install install the script into `/home/linuxbrew/.linuxbrew/bin/`
    bin.install Dir["bin/*"]

    # Install man pages:
    man1.install Dir["man1/*.1"]

    # Library installation
    libexec.install Dir["lib/*.sh"]
    # Not: lib.install Dir["lib/*.sh"]
    # because it will install it as shared library
    # and we get the following link problem
    # libxxx is a symlink belonging to giture. You can unlink it

    # Injecting the path and version in the header
    Dir["#{bin}/*"].each do |f|
      next unless File.file?(f)

      content = File.read(f).lines
      new_header = <<~EOS
        #!/usr/bin/env bash
        BASH_LIB_PATH="#{libexec}"
        PROJECT_VERSION="0.1.1"
      EOS

      File.write(f, new_header + content.drop(1).join)
    end

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
    # This test will fail, and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test dockenv`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.

    output = shell_output("#{bin}/git-exec --help")
    # assert_match "0.1.1", output

  end
end
