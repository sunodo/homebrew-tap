require "language/node"

class Sunodo < Formula
  desc "Sunodo CLI"
  homepage "https://github.com/sunodo/sunodo"
  url "https://registry.npmjs.org/@sunodo/cli/-/cli-0.13.1.tgz"
  sha256 "8e87db4970503df6f13b9b9a3dd05cc81eba182cf9464dbaebcb48f9ee064cf6"
  license "Apache-2.0"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]

    # use node installed by the "node" formula instead of the PATH one
    inreplace libexec/"lib/node_modules/@sunodo/cli/bin/run.js", "#!/usr/bin/env node", "#!#{Formula["node"].opt_bin}/node"
  end

  test do
    raise "Test not implemented."
  end
end
