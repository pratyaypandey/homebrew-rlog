# homebrew-rlog

Homebrew tap for [`rlog`](https://github.com/pratyaypandey/rlog).

## Install

```bash
brew install pratyaypandey/rlog/rlog
```

You can also tap first:

```bash
brew tap pratyaypandey/rlog
brew install rlog
```

## Repository Layout

- `Formula/rlog.rb`: Homebrew formula for the `rlog` CLI.

## Release Process

For `rlog` version `0.1.0`, this tap expects a GitHub release asset named `rlog-0.1.0.tar.gz` attached to the `v0.1.0` release in the `rlog` repository.

Generate that source tarball from the exact commit you tag:

```bash
git -C ../rlog archive --format=tar.gz --prefix=rlog-0.1.0/ v0.1.0 -o /tmp/rlog-0.1.0.tar.gz
shasum -a 256 /tmp/rlog-0.1.0.tar.gz
```

Then:

1. Create and push the `v0.1.0` tag in `rlog`.
2. Create the GitHub release for `v0.1.0`.
3. Upload `/tmp/rlog-0.1.0.tar.gz` as a release asset.
4. Verify the checksum matches the value in `Formula/rlog.rb`.
5. Push this tap repository.

## Notes

- The `rlog` formula is MIT-licensed.
- When cutting a new release, update the version, URL, and SHA256 in `Formula/rlog.rb`.
