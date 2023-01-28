<h1 align=center>Live Activities & Dynamic Island Simulator</h1>

<p align="center">
    <a href="https://en.wikipedia.org/wiki/IOS">
        <img src="https://img.shields.io/badge/iOS-16.2+-blue.svg?style=for-the-badge" />
    </a>
    <a href="https://www.swift.org/">
        <img src="https://img.shields.io/badge/Swift-5.7.2-brightgreen.svg?style=for-the-badge&logo=swift" />
    </a>
    <a href="https://developer.apple.com/xcode/swiftui">
        <img src="https://img.shields.io/badge/SwiftUI-blue.svg?style=for-the-badge&logo=swift&logoColor=black" />
    </a>
    <a href="https://developer.apple.com/xcode">
        <img src="https://img.shields.io/badge/Xcode-14.2-blue.svg?style=for-the-badge" />
    </a>
    <a href="https://mastodon.green/@simonberner">
        <img src="https://img.shields.io/badge/Contact-@simonberner-orange?style=for-the-badge" alt="mastodon.green/@simonberner" />
    </a>
    <a href="https://gitmoji.dev">
        <img src="https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg?style=for-the-badge" alt="Gitmoji">
    </a>
    <a href="https://github.com/conventional-commits/conventionalcommits.org">
        <img src="https://img.shields.io/badge/Conventional%20Commits-📝-lightgrey.svg?style=for-the-badge" alt="Conventional Commits">
    </a>
    <a href="https://opensource.org/licenses/MIT">
        <img src="https://img.shields.io/badge/license-MIT-black.svg?style=for-the-badge" />
    </a>
</p>

A little game simulator to show how to display some up-to-date (live) data with live activities on the lock screen and in the dynamic island (iPhone 14 Pro/Pro Max only!).

---

## Contents
* [Functionality](#functionality)
* [Definitions](#definitions)
* [Tech Stack](#tech-stack)
* [Frameworks](#frameworks)
* [Device and OS Compatibility](#device-and-os-compatibility)
* [Screenshots](#screenshots)
* [Design Patterns](#design-patterns)
* [Architecture](#architecture)
* [Learnings](#learnings)
* [Testing](#testing)
* [Code Comments](#code-comments)
* [Pull Requests](#pull-requests)
* [Credits](#credits)

---

## Functionality
- On devices that support the Dynamic Island (see below), the App displays Live Activities on the leading and trailing side of the TrueDepth camera.

## Definitions

## Tech Stack
- Xcode 14.2
- Swift 5.7.2

## Frameworks
- SwiftUI
- WidgetKit
- ActivityKit

## Device and OS Compatibility
- For Live Activities: iPhone with iOS 16.1+
- For Dynamic Island: iPhone 14 Pro/Pro Max with iOS 16.1+

## Screenshots

## Design Patterns
In this project the following [design patterns](https://en.wikipedia.org/wiki/Software_design_pattern) are used:
### [Delegation Pattern](https://en.wikipedia.org/wiki/Delegation_pattern)
We know the [Delegate Protocol Pattern](https://www.youtube.com/watch?v=qiOKO8ta1n4) best from UIKit. But of course it can also be used in combination with SwiftUI.

## Architecture
This project is build upon the following architecture:

## Learnings
### Live Activities
- [Apple doc: Displaying live data](https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities)

## Testing
I use the [Arrange, Act and Assert Pattern](https://automationpanda.com/2020/07/07/arrange-act-assert-a-pattern-for-writing-good-tests/) for Unit Testing.

## Code Comments
I like putting in the effort of adding comments to my code, [here is why](https://www.youtube.com/watch?v=1NEa-OcsTow).

## Pull Requests
When I create PRs I stick to [this guideline](https://www.youtube.com/watch?v=_sfzAOfY8uc).

## Credits
🙏🏽 Sean Allen

<hr>
<p align="center">
Made with a 🙂 <a href="https://simonberner.dev">Simon Berner
</p>


