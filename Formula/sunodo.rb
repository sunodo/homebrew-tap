require "language/node"

class Sunodo < Formula
  desc "Sunodo CLI"
  homepage "https://github.com/sunodo/sunodo"
  url "https://registry.npmjs.org/@sunodo/cli/-/cli-0.3.0.tgz"
  sha256 "d3d528ac1f4ce55352a6af18faa1dbc79fed9b5fc076440f717d7bd2e36e9447"
  license "MIT"

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
