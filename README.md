# cinema_wisdom

# Dev

1. Rename .env.template to .env
2. Change environment variables (TMDB)
3. In order to safely modify any entity in the domain layer 'flutter pub run build_runner build' must be executed afterwards.

# Prod
Change app name:

`flutter pub run change_app_package_name:main com.new.package.name`

Change app icon:

`flutter pub run flutter_launcher_icons`

Change splash screen:

`dart run flutter_native_splash:create`