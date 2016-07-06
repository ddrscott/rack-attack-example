# Overview
Example Rails 4 project showing performance difference between the full
Rails middleware chain vs simple Rack middleware.

# Running Benchmarks

## Install Apache Bench
[Apache Bench](https://httpd.apache.org/docs/2.4/programs/ab.html)

```sh
brew install homebrew/apache/ab
```

## Running standard Rails root route
```sh
ab -c 20 -n 1000  'http://localhost:3000/'
#=> Requests per second:    294.45 [#/sec] (mean)
```

## Running hijacked Rack route
```sh
ab -c 20 -n 1000  'http://localhost:3000/hijacked'
# => Requests per second:    809.29 [#/sec] (mean)
```
