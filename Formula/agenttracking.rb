class Agenttracking < Formula
  desc "Zero-prompt circuit breaker, MCP security audit & fleet monitor for Claude Code, Cursor, Codex, Gemini & cron"
  homepage "https://agenttracking.co"
  url "https://github.com/shufflethis/agent-tracking/releases/download/v0.6.1/agenttracking-0.6.1.tgz"
  sha256 "53b31dae75e9e5b3e9e35a5bc87e89d3be9b1704ed29f38fd5eb7c82d7c8e54c"
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
