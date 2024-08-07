# Laravel Authentication Slate

Scaffolds an authentication UI in your [Nylo](https://nylo.dev) project.

### Getting Started

In your Flutter project add the dependency:

With Dart:

``` bash
dart pub add laravel_auth_slate
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

``` dart 
dependencies:
  ...
  laravel_auth_slate: ^1.2.3
```

## Usage

Step 1: Run the below command in your project.

``` bash
dart run laravel_auth_slate:main publish:all
```

With Nylo

``` bash 
metro publish:slate laravel_auth_slate
```

Step 2: Go to `config/events.dart` and update the following event:

``` bash
// from
SyncAuthToBackpackEvent: SyncAuthToBackpackEvent<User>(),

// to 
SyncAuthToBackpackEvent: SyncAuthToBackpackEvent<LaravelAuthResponse>(),
```

### Routes

The initial route should be `LandingPage`. 

Go to your `routes/router.dart` file and update the following:

``` bash
appRouter() => nyRoutes((router) {
 ...
 router.route(LandingPage.path, (context) => LandingPage(), initialRoute: true); // set to initial route
 
});
```

## Update your .env file

In your **Nylo** project, navigate to your `.env` file and update the following line:

``` bash
APP_URL="https://nylo.dev" // old url

APP_URL="http://examplelaravel.test" // your laravel project url
```

## Laravel project

Install the Laravel composer package [laravel-nylo-auth](https://github.com/nylo-core/laravel-nylo-auth).

You can install the package via composer:

``` bash
composer require nylo/laravel-nylo-auth
```

You can publish with:

``` bash
php artisan vendor:publish --provider="Nylo\LaravelNyloAuth\LaravelNyloAuthServiceProvider"
```

Now, build and run the app and try to login, register and use the forgotten password page.

Check out the Laravel package [here](https://github.com/nylo-core/laravel-nylo-auth) for more information.

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
- Controllers
  - LoginController
  - RegisterController
  - ForgotPasswordController
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
