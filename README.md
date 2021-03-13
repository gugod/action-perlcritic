# perlcritic as a GitHub Action

This repository is for the GitHub Action that runs perlcritic.

The main difference between what's provided in this action and
super-linter, is that super-linter includes only a vanilla
installation of perlcritic with only policies that comes with
`Perl::Critic` itself, and this action include all policies available
on CPAN.

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
