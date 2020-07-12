
# Web app performance benchmark

Seeing Pony's web framework performance against those of Rust and Go.

For details on how to run each version, check README in their directories.

* [Pony](./pony/README.md)
* [Rust](./rust/README.md)
* [Go](./go/README.md)

## Usage

Start a web app on port 8080, then run: `make time-<name>`.
`<name>` will be used to create a benchmark result file name.

## Benchmark result snapshot

```sh
echo 'GET http://localhost:8080/health' | vegeta attack -duration 2m
```

```sh
$ vegeta report < result-pony.bin
Requests      [total, rate, throughput]         6000, 50.01, 50.01
Duration      [total, attack, wait]             2m0s, 2m0s, 1.898ms
Latencies     [min, mean, 50, 90, 95, 99, max]  421.927µs, 1.61ms, 1.831ms, 1.954ms, 1.993ms, 2.505ms, 10.556ms
Bytes In      [total, mean]                     120000, 20.00
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:6000
Error Set:

$ vegeta report < result-go.bin
Requests      [total, rate, throughput]         6000, 50.01, 50.01
Duration      [total, attack, wait]             2m0s, 2m0s, 451.487µs
Latencies     [min, mean, 50, 90, 95, 99, max]  199.774µs, 520.203µs, 520.847µs, 564.812µs, 583.082µs, 681.499µs, 6.452ms
Bytes In      [total, mean]                     120000, 20.00
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:6000
Error Set:

$ vegeta report < result-rust.bin
Requests      [total, rate, throughput]         6000, 50.01, 50.01
Duration      [total, attack, wait]             2m0s, 2m0s, 444.301µs
Latencies     [min, mean, 50, 90, 95, 99, max]  98.893µs, 429.685µs, 483.053µs, 521.285µs, 533.733µs, 572.253µs, 3.875ms
Bytes In      [total, mean]                     120000, 20.00
Bytes Out     [total, mean]                     0, 0.00
Success       [ratio]                           100.00%
Status Codes  [code:count]                      200:6000
Error Set:
```

## References

* [TechEmpower Framework Benchmarks](https://www.techempower.com/benchmarks/)
