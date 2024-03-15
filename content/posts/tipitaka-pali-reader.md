---
title: "Tipitaka Pali Reader"
date: 2022-09-29
categories: 
  - software
tags: 
  - language
  - pali
  - software
  - tipitaka-pali-reader
  - tpr
authors: 
  - bksubhuti
image: /images/TPR-billboard.webp
featured_image: /images/TPR-billboard.webp
---

{{< img src = "/images/TPR-billboard-1024x577.webp" >}}

## Tiptkata Pali Reader


A new beautiful app written in Flutter for all Desktops and Mobile Devices.

## Download:
[{{< resizeimg src="/images/Windows_10_logo.webp" width="50" >}}](https://apps.microsoft.com/store/detail/tipitaka-pali-reader/9MTH9TD82TGR?hl=en-ms&gl=ms) [(Windows Store)](https://apps.microsoft.com/store/detail/tipitaka-pali-reader/9MTH9TD82TGR?hl=en-ms&gl=ms)

[{{< simpleimg src="images/200px-MacOS_logo_2017.svg_.webp" width="50" alt="MacOS Store Logo" >}}](https://apps.apple.com/us/app/tipitaka-pali-reader/id1541426949) [(Mac OS Store)](https://apps.apple.com/us/app/tipitaka-pali-reader/id1541426949)

[{{< simpleimg src="images/flathub-logo-toolbar.svg" width="50" alt="Flathub Store Logo" >}}](https://flathub.org/apps/details/org.americanmonk.TipitakaPaliReader) [(Flathub Store)](https://flathub.org/apps/details/org.americanmonk.TipitakaPaliReader)


[](https://github.com/bksubhuti/tipitaka-pali-reader/releases/) [TPR-AppImage](https://github.com/bksubhuti/tipitaka-pali-reader/releases/)

`sudo apt install libfuse2 libsqlite3-dev`

[{{< simpleimg src="images/480px-Android-logo.webp" width="50" alt="Google Play Store Logo" >}}](https://play.google.com/store/apps/details?id=com.paauk.tipitakapalireader) [(Android Store)](https://play.google.com/store/s?id=com.paauk.tipitakapalireader)


[{{< simpleimg src="images/App_Store_iOS_11_Custom_size.webp" width="50" alt="iOS Store Logo" >}}](https://apps.apple.com/us) [(iOS Store)](https://apps.apple.com/us)



## What is new?

**Build 62 Release** Nov 20, 2023 for Win, Mac, Flathub, Appimage, Android (iOS package in App store review)

- Faster initial startup with visible steps and some bug fixes.

- Searchable TOC with Fuzzy Search

- MAT buttons and better logic to find linked books/paragraphs

- Export Bookmarks to disk

- Faster setup with displayed steps to finish

- New Material 3 Theme option

- Better international typing input

- You can undo the Velthuis typing

- New PEU Dictionary Update with 200,000 dictionary entries and 71% edited by humans

- Flashcards and export working better

- New DPD Deconstructor for better dictionary lookup

- Various bug fixes

This 2022 year-end release .

- Extensions which allow for English and Pāḷi to be imported line by line.

- Extensions which allow for dictionary updates such as; DPD and PEU updates

- Multi-window capabilities in Desktop and Tablet Mode with visible and invisible buttons

- General Settings has a Downloader which can download Pali/English books and other dictionaries (be patient and let the whole download/install process finish)

- Adjust size of panel and dictionary size

- Better Dictionary Lookup

- Adjustable dictionary size and panel

- Persistence on Search Filter

- Other bugs and features

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

![This image has an empty alt attribute; its file name is TPR-MainScreen-1024x500.webp](/images/TPR-MainScreen-1024x500.webp" >}}

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
