require "language/node"

class Thelounge < Formula
  desc "Self-hosted Web IRC client"
  homepage "https://thelounge.github.io/"
  url "https://registry.npmjs.org/thelounge/-/thelounge-2.6.0.tgz"
  sha256 "411428dca62edb956623fbaac1db3233653810e90df8ad4df8f2fdd91656121d"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end
