## GitHooks

This repository provides an example of how to prevent pushing a git repository to unverified remote URLs. To enable this behavior users must configure the repository after cloning it. Whenever a user tries to push this repository, git will check the remote URL and verify that it is in the allowed list of URLs found in [AllowedRemotes.config](./hooks/AllowedRemotes.config)

To configure githooks after cloning run:

`
git config --local include.path ../.gitconfig
`
