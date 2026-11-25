class Agenttracking < Formula
  desc "Zero-prompt circuit breaker, MCP security audit & fleet monitor for Claude Code, Cursor, Codex, Gemini & cron"
  homepage "https://agenttracking.co"
  url "https://github.com/shufflethis/agent-tracking/releases/download/v0.6.4/agenttracking-0.6.4.tgz"
  sha256 "5df58b84e3407dad055eac4fc7531ec71d20a2ad42a622364581fd00841c7357"
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
