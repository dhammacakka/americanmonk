---
title: Tipitaka Pali Reader
date: 2022-09-29
categories:
  - software
tags:
  - language
  - pāḷi
  - software
  - tipitaka-pali-reader
  - tpr
  - android
authors:
  - bksubhuti
featured_image: /images/TPR-billboard.webp
---

{{< img src = "/images/TPR-billboard-1024x577.webp" >}}

## Tiptkata Pali Reader


A new beautiful app written in Flutter for all Desktops and Mobile Devices.

## Download:
[{{< resizeimg src="/images/Windows_10_logo.webp" width="50" >}}](https://apps.microsoft.com/store/detail/tipitaka-pali-reader/9MTH9TD82TGR?hl=en-ms&gl=ms) [(Windows Store)](https://apps.microsoft.com/store/detail/tipitaka-pali-reader/9MTH9TD82TGR?hl=en-ms&gl=ms)

[{{< simpleimg src="/images/200px-MacOS_logo_2017.svg_.webp" width="50" alt="MacOS Store Logo" >}}](https://apps.apple.com/us/app/tipitaka-pali-reader/id1541426949) [(Mac OS Store)](https://apps.apple.com/us/app/tipitaka-pali-reader/id1541426949)

[{{< simpleimg src="/images/flathub-logo-toolbar.svg" width="50" alt="Flathub Store Logo" >}}](https://flathub.org/apps/details/org.americanmonk.TipitakaPaliReader) [(Flathub Store)](https://flathub.org/apps/details/org.americanmonk.TipitakaPaliReader)


[](https://github.com/bksubhuti/tipitaka-pali-reader/releases/) [TPR-AppImage](https://github.com/bksubhuti/tipitaka-pali-reader/releases/)

`sudo apt install libfuse2 libsqlite3-dev`

[{{< simpleimg src="/images/480px-Android-logo.webp" width="50" alt="Google Play Store Logo" >}}](https://play.google.com/store/apps/details?id=com.paauk.tipitakapalireader) [(Android Store)](https://play.google.com/store/apps/details?id=com.paauk.tipitakapalireader)


[{{< simpleimg src="/images/App_Store_iOS_11_Custom_size.webp" width="50" alt="iOS Store Logo" >}}](https://apps.apple.com/us/app/tipitaka-pali-reader/id1541426949?platform=iphone) [(iOS Store)](https://apps.apple.com/us/app/tipitaka-pali-reader/id1541426949?platform=iphone)



## What is new?

**Build 85+ Release** — May 2025 for Linux AppImage, Android, and Windows:

This release includes AI integration. You will need an AI API key from {{< extlink "https://openrouter.ai/" "OpenRouter" >}}, but you can get one without a credit card and use the free API engines, which work reasonably well. However, GPT-4o or GPT-4.1 offer better performance.

Simply add the key in the settings and save it. Then, go to the book, highlight some text, right-click (or long-press), and select **AI Context**. This will send a request to OpenRouter with the selected text and chosen prompt.

You can also temporarily modify the prompts. The feature works with multiple languages and scripts out of the box.



## Purpose of Application:

This app is useful for reading Pāḷi texts. It is similar to [TPP](https://americanmonk.org/tipitaka-pali-projector/). Total feature migration is planned in the future. If you read pāḷi and use a reading app, you will most likely prefer this as your pāḷi reading app on the phone or desktop. However, at the moment some features are better in TPP.

{{< img src = "/images/mettasearch-1024x611.webp" >}}

{{< img src = "/images/screenlinux-1024x610.webp" >}}

## Typing Roman Letters:

Typing in Roman script has full integration with the velthuis ascii typing system which is now a standard in pali. The keyboard chart can be found on this [Wikipedia page](https://en.wikipedia.org/wiki/Velthuis)

## Dictionary:

The dictionary and reading experience is where TPR shines the most. We have included [Digital Pāḷi Dictionary](https://digitalpalidictionary.github.io/) and Pāḷi English Ultimate dictionaries as part of the standard installed dictionaries. Soon you will be able to download more.

{{< img src = "/images/dictionaryResult.webp" >}}

Dictionary Results

{{< img src = "/images/MoveDictionary.gif" >}}

Dictionary

## User Interface Diagram:


{{<img src = "/images/TPR-MainScreen-1024x500.webp">}}
## Multiview, Hide/Show, and Expand/Shrink Panel

{{< img src = "/images/multiview3.gif" >}}

Easily open, hide show, new documents. Expand hide panel

## Searching:

{{< img src = "/images/TPR-MainScreen-1024x500.webp" >}}

Searching is very fast because we use an indexed [Sqlite](https://en.wikipedia.org/wiki/SQLite) Full Text Search ([FTS](https://en.wikipedia.org/wiki/Full-text_search)) technology.

{{< img src = "/images/SearchType-1024x742.webp" >}}

{{< img src = "/images/SearchChipFilter.webp" >}}

Turn on and off filter chips

{{< img src = "/images/searchgif.gif" >}}

search filter

## Bookmarks and Recent:

Recent visits and bookmarks items can be deleted by clicking on the trash can on the upper right corner of the screen. You can also swipe right individually and mark for deletion.

{{< img src = "/images/bookmar.webp" >}}

Bookmarks

{{< img src = "/images/recent.webp" >}}

Recent list

## Extensions:

Now you can add extensions to add English and Pāḷi line by line mula suttas. Also dictionary updates for DPD and PEU. Please watch the [Video on YouTube](https://www.youtube.com/watch?v=iw43j8mnGss) to fully understand how to use this.

{{< img src = "/images/extensions-1024x606.webp" >}}

## Contributors:

The main programmer for this app is Venerable Ashin Pannyadazza. His apps can be [found here for Apple](https://apps.apple.com/sg/developer/pinnyar-daza/id1531500544) and [here for Android](https://play.google.com/store/apps/developer?id=Pn%20Daza). He is a very talented self taught programmer and structures his code very nicely according to proper coding practices. I was responsible for the project management, and some minor programming tasks. The project and code are available on [github](https://github.com/bksubhuti/tipitaka-pali-reader) which also lists the original code this was forked from. If you would like to help in technical and non-technical ways, please [contact](https://americanmonk.org/contact/) us. We also owe gratitude to [Tharindu Madushanka](https://github.com/tharindu) who has donated his time for the Apple submissions to the [Path Nirvana Foundation's](https://apps.apple.com/us/developer/path-nirvana-foundation/id1434955292) App store listing.

## Other Software:

Other Software arranged by AmericanMonk.org

{{< img src = "/images/buddhist_sun.webp" >}}

### Buddhist Sun App

If you are a monk, nun or a practicing yogi who has vowed to not eat after Noon, you will benefit from this app.
