class Worklog < Formula
  desc "Terminal work session logging CLI"
  homepage "https://github.com/pratyaypandey/worklog"
  url "https://github.com/pratyaypandey/worklog/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "816efd01708476a72f1c82b80a11de9eff53dc82d6feb74534a64df840dd4593"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    data_dir = testpath/"data"
    ENV["WORKLOG_DATA_DIR"] = data_dir.to_s

    assert_match "worklog #{version}", shell_output("#{bin}/worklog --version")
    assert_match "started ", shell_output("#{bin}/worklog start brew-test --no-tmux")
    assert_match "\"name\": \"brew-test\"", shell_output("#{bin}/worklog list --json")
    assert_match "stopped ", shell_output("#{bin}/worklog stop")
  end
end
