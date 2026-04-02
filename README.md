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

For `worklog` version `0.1.1`, this tap expects a GitHub release asset named `worklog-0.1.1.tar.gz` attached to the `v0.1.1` release in the `worklog` repository.

Generate that source tarball from the exact commit you tag:

```bash
git -C ../worklog archive --format=tar.gz --prefix=worklog-0.1.1/ v0.1.1 -o /tmp/worklog-0.1.1.tar.gz
shasum -a 256 /tmp/worklog-0.1.1.tar.gz
```

Then:

1. Create and push the `v0.1.1` tag in `worklog`.
2. Create the GitHub release for `v0.1.1`.
3. Upload `/tmp/worklog-0.1.1.tar.gz` as a release asset.
4. Verify the checksum matches the value in `Formula/worklog.rb`.
5. Push this tap repository.

## Notes

- The `worklog` formula is MIT-licensed.
- When cutting a new release, update the version, URL, and SHA256 in `Formula/worklog.rb`.
