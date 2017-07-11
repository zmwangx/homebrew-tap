require "language/node"

class Hexo < Formula
  desc "Blog framework"
  homepage "https://hexo.io/"
  url "https://github.com/hexojs/hexo-cli/archive/1.0.3.tar.gz"
  version "3.3.7"
  sha256 "f9178a4dc8d1294cc1b211bb1d0a436ed7442099e51b753a771f97cb266b9046"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"hexo", "init", "blog"
    cd "blog" do
      system bin/"hexo", "generate"
    end
    assert_match "Hello World", (testpath/"blog/public/index.html").read
  end
end
