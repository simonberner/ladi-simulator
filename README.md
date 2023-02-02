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

A little [basketball](https://en.wikipedia.org/wiki/Basketball) game simulator which generates some live data to show how that data can be displayed with live activities on the lock screen and in the dynamic island.

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
* [How does it work?](#how-does-it-work)
* [Learnings](#learnings)
* [Testing](#testing)
* [Code Comments](#code-comments)
* [Pull Requests](#pull-requests)
* [Credits](#credits)

---

## Functionality
This App shows Live Activity (live data updates):
- on the lock screen
- in the compact version of the dynamic island
- in the expanded version of the dynamic island
On devices that support the Dynamic Island (see list below), the App displays Live Activities on the leading and trailing side of the TrueDepth camera.

## Definitions
- The [Golden State Warriors](https://www.nba.com/warriors) is the home team
- The [Chicago Bulls](https://www.nba.com/bulls) is the guest team.

## Tech Stack
- Xcode 14.2
- Swift 5.7.2

## Frameworks
- SwiftUI
- WidgetKit
- ActivityKit

## Device and OS Compatibility
Live activities are iPhone only.
- For Live Activities: iPhone with iOS 16.1+
- For Dynamic Island: iPhone 14 Pro/Pro Max with iOS 16.1+

## Screenshots

## Design Patterns
In this project the following [design patterns](https://en.wikipedia.org/wiki/Software_design_pattern) are used:
### [Delegation Pattern](https://en.wikipedia.org/wiki/Delegation_pattern)
We know the [Delegate Protocol Pattern](https://www.youtube.com/watch?v=qiOKO8ta1n4) best from UIKit. Here we use it so that the GameModel class (as the delegate) can communicate with the GameSimulator class.

## Architecture
This project is build upon the [Model-View architecture](https://quickbirdstudios.com/blog/swiftui-architecture-redux-mvvm/) and uses the following [architectural pattern](https://en.wikipedia.org/wiki/Architectural_pattern):
- Model View State architectural pattern ([MV State](https://azamsharp.com/2022/08/09/intro-to-mv-state-pattern.html)): the GameView is observing state changes in the GameModel and rerenders its UI accordingly.
(Reservation: we don't inject the aggregated root model as global object using `@EnvironmentObject` because we only have one View here)

## How does it work?
- By pressing the _Start Game Sim_, the GameSimulator factory spits out a new GameState every 2 seconds
- The GameView and the Live Activity updates with every new GameState
- The GameModel is (the glue) between the GameView and the GameSimulator
- The GameSimulator stops automatically after 120 ball possessions in total

## Learnings
### Live Activities
- [Apple doc: Displaying live data](https://developer.apple.com/documentation/activitykit/displaying-live-data-with-live-activities)
- Live activities can live for up to 8 hours at max.
- Completed (final state) Live Activity will stay on the Lock Screen for 4 hours.
- Live Activity has to be launched while the App is in the foreground.
- Live Activity can be updated while the App is running in the background.
### Any, AnyObject, any
- AnyObject and Any are used for type erasure
- [AnyObject, Any, and any: When to use which?](https://www.avanderlee.com/swift/anyobject-any/)
#### AnyObject
- All classes, class types, or class-only protocols can use `AnyObject` as their concrete type.
- If possible try to use concrete types as it is more readable to your friends.
- By using it as our destination, we always need to cast and consider casting failures using the default implementation.
- Try to use concrete protocol instead, see [here](https://www.avanderlee.com/swift/anyobject-any/#when-to-use-anyobject)
#### Any 
- An instance of any type including function types can use `Any`.
- `Any` is even more flexible than `AnyObject` by allowing you to cast instances of any type, but it makes code harder to predict compared to using concrete types.
#### any
- [When to use any?](https://www.avanderlee.com/swift/anyobject-any/#when-to-use-any)
### Type Erasure
- [Type Erasure in Swift](https://www.donnywals.com/understanding-type-erasure-in-swift/)

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


