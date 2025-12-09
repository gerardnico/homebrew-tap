# Generated with JReleaser 1.21.0 at 2025-12-09T16:29:10.713638188+01:00

class Xmli < Formula
  desc "XML Cli"
  homepage "https://github.com/gerarnico/java-xml-xhtml"
  url "https://github.com/gerardnico/java-xml-html/releases/download/v0.1.0/gerardnico-xml-cli-0.1.0-nojre.zip"
  version "0.1.0"
  sha256 "4f3802c6e7ceb3c8afebe0e0ae520109e9d09ef4d9dc636bfa82068e4891baee"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/xmli" => "xmli"
  end

  test do
    output = shell_output("#{bin}/xmli --version")
    assert_match "0.1.0", output
  end
end
