This repo only exists to test out and share concepts for this Gittip
issue:
https://github.com/gittip/roobot/issues/11

## Requirements

* python 2.6+
* phantomjs 1.8.2+

## Usage

    npm install
    GOOGLE_EMAIL=blah@gmail.com GOOGLE_PASSWORD=*********** casperjs index.coffee

## Notes

* Script only logs in and takes a snapshot, but is not yet clicking the
  hangout button and getting a dialog to show.
* Parsing G+ will get stuck in an iframe for like 200s before loading
  the page after login completes (prior to snapshot). This issue is
discussed [here][iframe-boobietrap]. I suspect it's an intentional trick
by Google to discourage scraping. (This seems to have gone away...)

<!-- Links -->
   [iframe-boobietrap]: https://groups.google.com/forum/#!topic/casperjs/h63dOPDkL-w
