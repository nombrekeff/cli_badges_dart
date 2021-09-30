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

### Some more examples:
You could create a donate badge:

```dart
var donateBadge = Badge.cyan(label: '❤️ donate', message: 'please?');

print(donateBadge);
```

![](./images/donate-output-example.png)

You can also only show the label:

```dart
var onlyLabel = Badge(
    label: '❤️ donate', 
    labelColorCode: 169
);

print(onlyLabel);
```

> ###### Example output is a mock, console output will vary slightly from terminal to terminal.

## Badge Structure <!-- omit in toc -->

A badge is conformed of a **label** and a **message** `<label>:<message>`. Each segment can be customized, by changing bg color, text color and style.

## Themes <!-- omit in toc -->
Themes are a way to store badge configuration for repeated use.

|         |                                           |           |                                               |
| ------- | ----------------------------------------- | --------- | --------------------------------------------- |
| `blue`  | ![theme-blue](../images/theme-blue.png)   | `cyan`    | ![theme-cyan](../images/theme-cyan.png)       |
| `green` | ![theme-green](../images/theme-green.png) | `magenta` | ![theme-magenta](../images/theme-magenta.png) |
| `red`   | ![theme-red](../images/theme-red.png)     | `yellow`  | ![theme-yellow](../images/theme-yellow.png)   |

You can also **swap** all themes, this means properties from label will be applied to message and vice versa.

### Inbuilt themes

- **red** : Red Message Background
- **green** : Green Message Background
- **blue** : Blue Message Background
- **yellow** : Black Colored Message on Yellow Background
- **cyan** : Black Colored Message on Cyan Background
- **magenta** : Black Colored Message on Magenta Background
- **success** : (_'Success'_) Message on Green Background
- **failed** : (_'Failed'_) Message on Red Background


### Colors

This is the list of all available colors:
* red
* black
* green
* yellow
* blue
* magenta
* cyan
* white
* brightRed
* brightBlack
* brightGreen
* brightYellow
* brightBlue
* brightMagenta
* brightCyan
* brightWhite

### Using themes
There are 3 main ways to create a themed badge:
#### 1 - Passing in the theme directly to the Badge constructor:
```dart
Badge(
    label: 'failed', 
    message: '2', 
    theme: BadgeTheme.red,
);
```

#### 2 - Using named constructors:
```dart
Badge.red(
    label: 'failed', 
    message: '2', 
);
```

#### 3 - Or by calling the predefined theme methods: 
```dart
Badge(...).red();
```

## Additional info

There is a complete example [here](https://github.com/nombrekeff/cli_badges_dart/tree/main/example)

If you encounter any problems or fancy a feature to be added please head over to the GitHub [repository](https://github.com/nombrekeff/cli_badges_dart/) and [drop an issue](https://github.com/nombrekeff/cli_badges_dart/issues/new).

## Want badges for some other environment or language?

**cli-badges** is also available in other languages:

- `Python` [@haideralipunjabi/cli-badges](https://github.com/haideralipunjabi/cli-badges)
- `Deno` [@Delta456/cli_badges](https://github.com/Delta456/cli_badges)

## Support the project <!-- omit in toc -->

I tend to open source anything I can, and love to help people that might need help with the project.

However, if you are using this project and are happy with it or just want to encourage me to continue creating stuff, there are few ways you can do so:

- Starring and sharing the project 🚀
- Reporting bugs 🐛
- Sending feedback
- Or even coding :P

Thanks! ❤️