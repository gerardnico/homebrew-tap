class BashLib < Formula
  desc "A collection of bash library"
  homepage "https://github.com/gerardnico/bash-lib"
  url "https://github.com/gerardnico/bash-lib/releases/download/v0.1.0/bash-lib-0.1.0.zip"
  version "0.1.0"
  sha256 "4d0eef84043f844c7459f0c59c4ef960ea79abe8b936078b168f092577d75a68"
  license "Apache-2.0"


  def install

    # Install all bash scripts to the bin directory
    # https://docs.brew.sh/Formula-Cookbook#bininstall-foo
    # Bin.install install the script into `/home/linuxbrew/.linuxbrew/bin/`
    bin.install Dir["bin/*"]

    # Install man pages:
    # man1.install Dir["man1/*.1"]

    # Library installation
    libexec.install Dir["lib/*.sh"]

    # Injecting the env
    Dir["#{bin}/*"].each do |f|
      next unless File.file?(f)

      content = File.read(f).lines
      new_header = <<~EOS
        #!/usr/bin/env bash
        BASH_LIB_PATH="#{libexec}"
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

    output = shell_output("#{bin}/bashlib-docgen --help")
    # assert_match "0.1.0", output

  end
end
