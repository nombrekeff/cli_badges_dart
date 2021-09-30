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

Some examples are available under `/examples`.

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
