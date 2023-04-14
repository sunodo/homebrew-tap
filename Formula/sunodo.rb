require "language/node"

class Sunodo < Formula
  desc "Sunodo CLI"
  homepage "https://github.com/sunodo/sunodo"
  url "https://registry.npmjs.org/@sunodo/cli/-/cli-0.2.0.tgz"
  sha256 "ac67e71899d5b3f547952dd1c81e590466be1e300bf27b714d050e1014b1f537"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end
