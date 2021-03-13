# perlcritic as a GitHub Action

This repository is for the GitHub Action that runs perlcritic. Violations found by perlcritic are reported by [reviewdog](https://github.com/reviewdog/reviewdog).

The main difference between what's provided in this action and
[Super-Linter](https://github.com/marketplace/actions/super-linter),
is that Super-Linter includes only a vanilla installation of
perlcritic with only policies that comes with `Perl::Critic` itself,
while this action includes all policies available on CPAN.

To use this action, a profile is needed. Conventionally the profile should
be named `.perlcriticrc`.

It is strongly recommended to include flag `only` in `.perlcriticrc`, like this:

```
only = 1
include = RequireUseStrict ProhibitUnusedVariables
```

With that example, only 2 listed policies are enabled. If more are needed,
they need to be expilicitly listed as one of the values in the `include`.

The main reason this is strongly recommended is that the runner of
this action is prepared with all policies installed and due to how
Perl::Critic is written, policies could be enabled simply by being
installed -- which means 

## Inputs

### `github_token`

Optional. `${{ github.token }}` is used by default.

### `perlcritic_flags`

Optional. The flags for perlcritic command. The default is `--quiet --profile .perlcriticrc .`

In addition, the `--verbose` flag, which alter the output format, should not be inculded here. This flag is forcibly set to be `--verbose 1` at the moment  so the output can be processed by `reviewdog`.

### `level`

Optional. Report level for **reviewdog** [`info`,`warning`,`error`].
It's the same as the `-level` flag of **reviewdog**.

### `reporter`

Optional. Reporter for **reviewdog** command [`github-pr-check`,`github-pr-review`].
It's the same as the `-reporter` flag of reviewdog.

### `pattern`

Optional. File patterns of target files. Same as `-name [pattern]` of `find` command. Default: `*`

### `filter_mode`

Optional. Filtering mode for the reviewdog command `[added,diff_context,file,nofilter]`. Default: `added`.

## Example usage

Due to the fact violations are outputed as checks / comments of PRs,
this action works only with `pull_request` event.

```yml
name: perlcritic
on: [pull_request]
jobs:
  perlcritic:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: gugod/action-perlcritic@v1
```
