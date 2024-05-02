require "language/node"

class Sunodo < Formula
  desc "Sunodo CLI"
  homepage "https://github.com/sunodo/sunodo"
  url "https://registry.npmjs.org/@sunodo/cli/-/cli-0.14.0.tgz"
  sha256 "bccf62726472b6942cbe287043c7982b635614652a4b9824601cc5323b6ac583"
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
