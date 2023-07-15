# wl-school-music-manager
Flutter White label app for Music School 


# Creating a new package

  `dart pub global run very_good_cli:very_good create flutter_package wl_music_school_manager --desc "Base package for the white label"`

# Creating a new App

  `dart pub global run very_good_cli:very_good create flutter_app my_app --desc "My new Flutter app"`


# Achitecture

     ┌────────────────────────┐
     │                        │
     │   app sample-app       │
     │                        │
     └───────────┬────────────┘
                 │
                 │                              ┌──────────────────────────┐           ┌───────────────┐
                 │                              │                          │           │               │
                 ▼                         ┌───►│   package guitar-games   │◄──────────┤   app fretz   │
┌─────────────────────────────────────┐    │    │                          │           │               │
│                                     ├────┘    └──────────────────────────┘           └───────────────┘
│   package wl-music-school-manager   │
│                                     ├────┐
└─────────────────────────────────────┘    │    ┌──────────────────────────┐           ┌───────────────┐
                 ▲                         │    │                          │           │               │
                 │                         └───►│  package keyboard-games  │◄──────────┤   app keyz    │
                 │                              │                          │           │               │
     ┌───────────┴────────────┐                 └──────────────────────────┘           └───────────────┘
     │                        │
     │   app tocata-manager   │
     │                        │
     └────────────────────────┘


# TODO:

  - Create Firebase for Tocata Manager
  - Update Firebase values in Flutter project
  - Create login package
  - Create Splash