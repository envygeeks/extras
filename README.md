[![Build Status](https://travis-ci.org/envygeeks/extras.svg?branch=master)][travis]
[![Test Coverage](https://codeclimate.com/github/envygeeks/extras/badges/coverage.svg)][coverage]
[![Code Climate](https://codeclimate.com/github/envygeeks/extras/badges/gpa.svg)][codeclimate]
[![Dependency Status](https://gemnasium.com/envygeeks/extras.svg)][gemnasium]

[gemnasium]: https://gemnasium.com/envygeeks/extras
[codeclimate]: https://codeclimate.com/github/envygeeks/extras
[coverage]: https://codeclimate.com/github/envygeeks/extras/coverage
[travis]: https://travis-ci.org/envygeeks/extras

# Ruby Extras

Provides patches to stdlib that provide extra functions.

## Array
* `stringify`: Stringify an array, skipping allowed objects.
* `symbolize`: Symbolize an array, skipping allowed objects.

## String
* `split`: Split by a character (by default " ")

# Hash
* `stringify`: Stringify a hash keys and values, skipping allowed objects.
* `symbolize`: Symbolize a hash keys and values, skipping allowed objects.
* `stringify_keys`: Stringify a hash keys, skipping allowed objects.
* `symbolize_keys`: Symbolize a hash keys, skipping allowed objects.
* `deep_merge`: Merge hashes into hashes into hashes.
