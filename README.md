# nimhash

Simple command-line app that recursively walks a directory (provided as argument) and computes the md5 hash of each file. Just to get a feel for [nim][] and its concurrency story.

Running this on an Intel Chromebook on the Nimrod/lib source directory gives this:

```
real 0m0.457s
user 0m0.816s
sys  0m0.035s
```

A similar implementation in Go gives this (that arguably does more, as it checks for errors):

```
real 0m0.061s
user 0m0.050s
sys  0m0.011s
```

Running on the whole nim repo (C sources included) yields those results:

Nimrod:

```
real 0m35.995s
user 1m1.480s
sys  0m4.163s
```

Go:

```
real 0m5.315s
user 0m2.188s
sys  0m5.873s
```

Of course I probably got a ton of things wrong in nim as this is my first go at it. As I understand it, nim's `threadpool` library uses OS threads, so that may explain part of it.

[nim]: http://nim-lang.org/
