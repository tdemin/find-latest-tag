# Find Latest Tag

[![Run tests](https://github.com/tdemin/find-latest-tag/actions/workflows/test.yml/badge.svg)](https://github.com/tdemin/find-latest-tag/actions/workflows/test.yml)

GitHub Action to find latest tag of any Git repository available on the
Internet.

## Examples

```yml
steps:
  - uses: tdemin/find-latest-tag@v1
    with:
      repo: https://github.com/tdemin/gmnhg.git
    # v0.4.0
  - uses: tdemin@find-latest-tag@v1
    with:
      repo: https://github.com/golang/go.git
      tag: '^go1'
    # go1.17.1
```

## Usage

### Inputs

* `repo`: *required*, Git URI of a remote to check tags from.
* `tag`: optional, regex to check tag names against (default `""`).

Private repository authentication is currently not implemented, although you can
use the `http://user:password@hostname.tld/repo.git` URI notation for Git over
HTTP(S).

### Outputs

* `tag`: `${{ steps.STEP_NAME.outputs.tag }}`

### Errors

This action will fail if any of the conditions are met:

* Git is unable to `ls-remote` the repository;
* there are no tags in the repository;
* no tags are selected by the `tag` regular expression.

### Sort order

Tags are sorted with `sort -V`. This has a few noticeable pitfalls:

* `1.2` goes before `1.2.5`;
* `v1.2` goes before `1.2`.
