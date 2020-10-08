# homebrew-repo

This repository is a [Homebrew](https://brew.sh) tap for Khan Academy tools and
backported core formula. These formula are all known to work on both Linux and
macOS.

As it's a private repository, in order to tap it you'll need to use the full
form:

```
$ brew tap khan/repo git@github.com:Khan/homebrew-repo.git
```

## Formula

### arcanist

- [Repository](https://github.com/Khan/arcanist)
- `HEAD`-only, install with `brew install --HEAD arcanist`

Our arcanist wrapper.

Note that the formula version disables the code that would normally auto-update
the arcanist repository. In order to update you'll need to 
`brew update ; brew reinstall arcanist`

### git-workflow

- [Repository](https://github.com/Khan/git-workflow)
- `HEAD`-only, install with `brew install --HEAD git-workflow`

A collection of scripts that can be called via `git`, see the linked repository
for details.

### khan-linter

- [Repository](https://github.com/Khan/khan-linter)
- `HEAD`-only, install with `brew install --HEAD khan-linter`

A super-linter-runner...or something like that. It can be called via `ka-lint`.

### protobuf@3.4

The protobuf compiler and well-known types pinned to the version we currently
depend on (3.4). This formula is simpler than the `protobuf` in homebrew-core
since it doesn't build anything; instead it downloads a cross-platform release
binary.

### python@2

A backport of the last `python@2` from homebrew core with a couple of minor
changes, notably that it doesn't install unversioned names such as `python` or
`pip`, only `python2` and `pip2`.

## Contributing

The simplest way to test new formula, or additions to formula, is to use
linuxbrew. Run `./linuxbrew-docker.sh` to get a shell inside of a docker
container preconfigured with linuxbrew. Once in there, `brew tap khan/repo
/taps/khanbrew`, and then you can install the formula.

Note that making changes to the formula will require committing the change on
the host and then running `brew update` in the guest.

Once you've tweaked the formula and know that it works, you should rebase your
changes into a single commit.

You should also test, if possible, on macOS. If you've cloned this repository
to `~/Code/khansrc/homebrew-repo` for instance, you can `brew tap khan/repo
~/Code/khansrc/homebrew-repo`. If you've already tapped this repository from
GitHub, you can `brew untap khan/repo` and then re-tap the clone.
