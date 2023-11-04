# Laravel Auth Slate

Scaffolds Laravel authentication files in your [Nylo](https://nylo.dev) project.

### Getting Started
In your flutter project add the dependency:

``` dart 
dependencies:
  ...
  laravel_auth_slate: ^0.1.0
```

``` bash
flutter pub add laravel_auth_slate
```

## Usage

Run the below command in your project.

``` bash
dart run laravel_auth_slate:main publish:all
// with metro
metro publish:slate laravel_auth_slate
```

## Requirements
* Dart >= 2.19.0
* Flutter >= 3.10.0

## Files generated:
- Pages
  - LoginPage
  - RegisterPage
  - LandingPage
  - DashboardPage
  - AuthLandingPage
- Events
  - LaravelAuthEvent
- Networking
  - LaravelApiService
  - LaravelAuthService
- Models
  - AuthUser
  - AuthResponse

## Changelog
Please see [CHANGELOG](https://github.com/nylo-core/nylo-core/laravel-auth-slate/CHANGELOG.md) for more information what has changed recently.

## Licence

The MIT License (MIT). Please view the [License](https://github.com/nylo-core/nylo-core/laravel-auth-slate/blob/master/licence) File for more information.