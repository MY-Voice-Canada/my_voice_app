# MY Voice's Official App

Welcome to [MY Voice Canada's](https://www.myvoicecanada.com) official app! This _youth-made_ app allows you to read **articles from our magazine**, **ask questions that can be answered by professional youth councilors**, **connect with other Muslim adolescents nearby**, and much more!!! The rest of this document outlines the app and its technicalities, and contains some information about the team behind it...

## App Layout & Screenshots

Here are some pages of the app in image format...

### Splash Screen

![Splash Screen](./assets/images/app_splashscreen.png)

### Sign in

![Sign In](./assets/images/app_signin.png)

### Homepage

![Home](./assets/images/app_home.png)

## Technicalities

This app was made in Dart using the Flutter SDK (ver. >=2.12.0). At the moment, however, it is only tailored to Android devices, though we do plan on releasing a proper iOS version soon.

The entire list of dependencies is defined in `pubspec.yaml`. Some main dependencies include...

- firebase_auth (ver. 3.3.4)
- cloud_firestore (ver. 3.1.5)
- provider (ver. 6.0.0)
- hexcolor (ver. 2.0.5)
- flutter_spinkit (ver. 5.1.0)
- flutter_phoenix (ver. 1.0.0)
