class Rlog < Formula
  desc "Research and work session logging CLI"
  homepage "https://github.com/pratyaypandey/rlog"
  url "https://github.com/pratyaypandey/rlog/releases/download/v0.1.0/rlog-0.1.0.tar.gz"
  sha256 "a1b61a96e0025aed4ff4d50a1b359bad7ceb2ced328d3fe8dcba8e47a40cac8b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    data_dir = testpath/"data"
    env = { "RLOG_DATA_DIR" => data_dir.to_s }

    assert_match "rlog #{version}", shell_output("#{bin}/rlog --version")
    assert_match "started ", shell_output(env, "#{bin}/rlog start brew-test --no-tmux")
    assert_match "\"name\": \"brew-test\"", shell_output(env, "#{bin}/rlog list --json")
    assert_match "stopped ", shell_output(env, "#{bin}/rlog stop")
  end
end
