# Avatar Rings

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

Custom user avatar widget, waves-like rings around, badges, status points, and many more customizations.

## Preview

![RPReplay_Final1698906431](https://github.com/deam91/avatar_rings/assets/11580629/0b3c0ffc-01ff-4d7f-a6e5-badba8745d6e)
![RPReplay_Final1698906479](https://github.com/deam91/avatar_rings/assets/11580629/588fa0fa-3970-404e-9c43-1b9fa8dbb07b)
![RPReplay_Final1698906588](https://github.com/deam91/avatar_rings/assets/11580629/0654696e-e1a4-4b0e-882a-c7f1b158252b)
![RPReplay_Final1698906656](https://github.com/deam91/avatar_rings/assets/11580629/d8bb7e61-6649-444b-9b34-cf45ea1b5528)
![RPReplay_Final1698906710](https://github.com/deam91/avatar_rings/assets/11580629/b0b8f9bc-e716-4e6f-b8b1-f8676d4300f5)


## Installation 💻

**❗ In order to start using Avatar Rings you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
flutter pub add avatar_rings
```

## Usage

```dart
AvatarRings(
  rings: 2, // The number of rings. Defaults to 1.
  radius: 70, // The radius of the entire rings painter. Defaults to 80.
  spaceBetweenRings: 1, // The space between each ring. Defaults to 1.
  fromPeriod: 250, // The start period value. Used to generate a random value starting from this value. Defaults to 150.
  toPeriod: 350, // The end period value. Used to generate a random value ending in this value. Defaults to 200.
  ringsColor: Colors.red, // The color of the rings. Defaults to [Colors.lightBlue].
  ringsColorOpacity: .3, // The opacity of the rings color. Defaults to 0.4.
  shadowColor: Colors.red, // The color of the shadow. Defaults to [Colors.lightBlue].
  shadowColorOpacity: .45, // The opacity of the shadow color. Defaults to 0.4.
  child: Image.asset(
    'assets/person.jpeg',
  ),
),
```

---

## Continuous Integration 🤖

Avatar Rings comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

---

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
