class Agenttracking < Formula
  desc "Zero-prompt circuit breaker, MCP security audit & fleet monitor for Claude Code, Cursor, Codex, Gemini & cron"
  homepage "https://agenttracking.co"
  url "https://github.com/shufflethis/agent-tracking/releases/download/v0.6.2/agenttracking-0.6.2.tgz"
  sha256 "9114148319f10180d8d79f88c6dcdbecbfead6e5434d4d337e35f3bf5b135e19"
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
