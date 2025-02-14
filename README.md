# Action for running Golang mutation tests

Runs [https://github.com/AntonStoeckl/go-mutesting](https://github.com/AntonStoeckl/go-mutesting) as Github Action. Used a fork of the original [`go-mutesting`](https://github.com/zimmski/go-mutesting) tool since the forked version can be used with Go modules.

See the repository's [README](https://github.com/AntonStoeckl/go-mutesting/blob/master/README.md) for details about the usage of `go-mutesting`.

## Usage in workflow

```yaml
...
- name: Golang mutation testing
  uses: rescDev/go-mutesting-action@<version>
  with:
    targets: main.go entrypoint.go cmd/
    disabled: structinit/remove
    blacklist-file: gomutest.blacklist
    output: verbose
...
```

## Input configuration

Following input variables are available:

- `version`: Installed and used version of `go-mutesting`. Check the repository linked above to see all available releases. Defaults to `latest`.
- `targets`: Targets that will be tested. Can be a space-separated list of specific targets. Defaults to `./...`.
- `disabled`: Space-separated list of mutators that will be disabled.
- `blacklist-file`: List of MD5 checksums of mutations which should be ignored, submitted as file (path).
- `output`: Configure output levels. Available values are `debug` and `verbose`. Use `debug,verbose` or vice versa for using both.

## Outputs

No outputs defined (yet).
