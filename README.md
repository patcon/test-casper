## Requirements

* python 2.6+
* phantomjs 1.8.2+

## Usage

    npm install
    GOOGLE_EMAIL=blah@gmail.com GOOGLE_PASSWORD=*********** casperjs index.coffee

## Notes

* Script only logs in and takes a snapshot, `image.png`, which it drops
  in the project root. It's a proof-of-concept for using casperjs to
login and navigate to start a G+ Hangout.
* Parsing G+ will get stuck in an iframe for like 200s before loading
  the page after login completes (prior to snapshot). This issue is
discussed [here][iframe-boobietrap]. I suspect it's an intentional trick
by Google to discourage scraping.

<!-- Links -->
   [iframe-boobietrap]: https://groups.google.com/forum/#!topic/casperjs/h63dOPDkL-w
