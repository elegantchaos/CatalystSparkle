# Catalyst + SwiftUI + Sparkle = ?

Now that we can make Mac applications using Catalyst, the question arises of how to distribute updates if we're not in the App Store. Even if we are in the App Store, we might want to be able to distribute beta versions to testers.

The traditional approach would be to use Sparkle, but that doesn't work out of the box with a Catalyst app, because some of the API that Sparkle relies on is not available.

This project illustrates a way to get it working.

## How To Use This Project

This repository contains all the bits that you actually need to put into your own app.

There's [another repository](https://github.com/elegantchaos/CatalystSparkleExample) which uses this one, and which contains a full example application.

That's probably a better place to start.
