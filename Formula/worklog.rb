class Worklog < Formula
  desc "Terminal work session logging CLI"
  homepage "https://github.com/pratyaypandey/worklog"
  url "https://github.com/pratyaypandey/worklog/releases/download/v0.1.1/worklog-0.1.1.tar.gz"
  sha256 "3459934d08a6aad71e0fb27383e55b71f3e0f6aed3feda34e8c224d9226a417a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    data_dir = testpath/"data"
    env = { "WORKLOG_DATA_DIR" => data_dir.to_s }

    assert_match "worklog #{version}", shell_output("#{bin}/worklog --version")
    assert_match "started ", shell_output(env, "#{bin}/worklog start brew-test --no-tmux")
    assert_match "\"name\": \"brew-test\"", shell_output(env, "#{bin}/worklog list --json")
    assert_match "stopped ", shell_output(env, "#{bin}/worklog stop")
  end
end
