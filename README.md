## Example Usage

```
> Result.of('iphone').map(&:host) & Result.of('android').map(&:host)
=> ["ja.wikipedia.org",
 "en.wikipedia.org",
 "twitter.com",
 "www.amazon.com",
 "mashable.com",
 "www.dropbox.com",
 "www.engadget.com",
 "www.theguardian.com",
 "hootsuite.com",
 "www.skype.com",
 "www.crunchbase.com",
 "www.computerworld.com",
 "www.myfitnesspal.com",
 "bgr.com",
 "www.mint.com",
 "www.shazam.com",
 "mobile.grooveshark.com",
 "agilebits.com"]
```
