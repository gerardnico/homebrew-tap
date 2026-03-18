class Dockx < Formula
  desc "Docker Env Driven"
  homepage "https://github.com/gerardnico/dock-x"
  url "https://github.com/gerardnico/dock-x/releases/download/v0.1.0/dockx-0.1.0.zip"
  version "0.1.0"
  sha256 "7501189f83904357b9a60bae92c8b3ae4b62a0a212ed7eb4f0264ed3c24fb54c"
  license "Apache-2.0"
  # https://rubydoc.brew.sh/Formula#head-class_method
  head "https://github.com/gerardnico/dock-x.git", branch: "main"

  def install

    # Install all bash scripts to the bin directory
    # https://docs.brew.sh/Formula-Cookbook#bininstall-foo
    # Bin.install install the script into `/home/linuxbrew/.linuxbrew/bin/`
    bin.install Dir["bin/*"]

    # Install man pages:
    # man1.install Dir["man1/*.1"]

    # Library installation
    libexec.install "lib"
    # Not `lib.install "lib"`
    # because it will install it as shared library
    # and we get the following link problem
    # libxxx is a symlink belonging to xxx. You can unlink it

    # Injecting the path and version in the header
    Dir["#{bin}/*"].each do |f|
      next unless File.file?(f)

      content = File.read(f).lines
      new_header = <<~EOS
        #!/usr/bin/env bash
        BASHLIB_PATH="#{libexec}/lib"
        PROJECT_VERSION="0.1.0"
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

    output = shell_output("#{bin}/dock-x --help")
    # assert_match "0.1.0", output

  end
end
