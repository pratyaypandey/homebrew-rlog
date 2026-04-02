# homebrew-worklog-tap

Homebrew tap for [`worklog`](https://github.com/pratyaypandey/worklog).

## Install

```bash
brew install pratyaypandey/worklog-tap/worklog
```

You can also tap first:

```bash
brew tap pratyaypandey/worklog-tap
brew install worklog
```

## Repository Layout

- `Formula/worklog.rb`: Homebrew formula for the `worklog` CLI.

## Release Process

For `worklog` version `0.1.1`, this tap uses the GitHub tag archive at:

```text
https://github.com/pratyaypandey/worklog/archive/refs/tags/v0.1.1.tar.gz
```

Compute the checksum for the published tag archive:

```bash
curl -L -o /tmp/worklog-v0.1.1.tar.gz https://github.com/pratyaypandey/worklog/archive/refs/tags/v0.1.1.tar.gz
shasum -a 256 /tmp/worklog-v0.1.1.tar.gz
```

Then:

1. Create and push the `v0.1.1` tag in `worklog`.
2. Create the GitHub release for `v0.1.1`.
3. Verify the checksum matches the value in `Formula/worklog.rb`.
4. Push this tap repository.

## Notes

- The `worklog` formula is MIT-licensed.
- When cutting a new release, update the version, URL, and SHA256 in `Formula/worklog.rb`.
