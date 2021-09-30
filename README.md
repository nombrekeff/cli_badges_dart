<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

<div align="center">
  
  ![](https://vectr.com/kerff/ddbmvyZmm.svg?width=600&height=300&select=aNbKxciPh)
  
  Quirky little dart library for generating badges for your cli apps.
  
  <!-- ![GitHub file size in bytes](https://img.shields.io/github/size/nombrekeff/cli-badges/index.js?style=flat-square)
  [![npm](https://img.shields.io/npm/v/cli-badges?label=version&style=flat-square)](https://www.npmjs.com/package/cli-badges)
   -->

<!-- TODO: add badges -->

</div>

---

Print badges to the terminal. Yup, those nifty little thingies we use on readmes, but for CLI apps.

## Features
* Easy to use
* Inbuilt themes
* Customizable

This is what it can do:
```dart
var failedBadge  = Badge(label: 'failed', message: '2', theme: BadgeTheme.red);
var successBadge = Badge(label: 'success', message: '2').green();
var skippedBadge = Badge.yellow(label: 'skipped',  message: '2');

print(
    Badge.inline([
        failedBadge, 
        skippedBadge, 
        successBadge
    ]),
);
```

The above would output something similar to the terminal:

![](./images/output-example.png)
## Usage

Usage is simple, import the package and start creating Badges!

```dart
import 'package:cli_badges/cli_badges.dart';

var failedBadge = Badge(label: 'failed', message: '2', theme: BadgeTheme.red);

print(failedBadge);
```

There are 3 main ways to create a themed badge:
#### 1: Passing in the theme directly to the Badge constructor:
```dart
Badge(
    label: 'failed', 
    message: '2', 
    theme: BadgeTheme.red,
);
```

#### 2: Using named constructors:
```dart
Badge.red(
    label: 'failed', 
    message: '2', 
);
```

#### 3: Or by calling the predefined theme methods: 
```dart
Badge(...).red();
```

## Additional info

There is a complete example [here](https://github.com/nombrekeff/cli_badges_dart/tree/main/example)

If you encounter any problems or fancy a feature to be added please head over to the GitHub [repository](https://github.com/nombrekeff/cli_badges_dart/) and [drop an issue](https://github.com/nombrekeff/cli_badges_dart/issues/new).

