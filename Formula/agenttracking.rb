class Agenttracking < Formula
  desc "Zero-prompt circuit breaker, MCP security audit & fleet monitor for Claude Code, Cursor, Codex, Gemini & cron"
  homepage "https://agenttracking.co"
  url "https://github.com/shufflethis/agent-tracking/releases/download/v0.6.5/agenttracking-0.6.5.tgz"
  sha256 "8236a3bb3461df6b2e59d954caacc70c7ed49ee95035b8677eb56e3d716e545a"
  license "AGPL-3.0-only"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"agenttracking").write <<~EOS
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
    chmod 0755, bin/"agenttracking"
  end

  test do
    output = shell_output("#{bin}/agenttracking audit --json")
    assert_match '"score"', output
  end
end
