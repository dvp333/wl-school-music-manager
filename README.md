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


  - Create new email for Tocata app manager ---------->
  - Create Firebase for Tocata Manager --------------->
  - Update Firebase values in Flutter project -------->
  - Setup Firestore ---------------------------------->
  - Colocar AuthenticationRepository no GetIt -------->
  - Setup CrashLytics -------------------------------->
  - Setup Melos -------------------------------------->
  - Setup App Check ---------------------------------->
  - Colocar Scroll na tela de signup ----------------->

  - Create login package ----------------------------->
  - Create Splash ------------------------------------>
  - Create Firebase app distribution ----------------->
  - Create Ap admin to add new users ----------------->
  - Find package to play midi ------------------------> later
  - Find midi with guitar notes sound ----------------> later
  - Build Guitar game levels ------------------------->

      * Etapa 1 -> Somente corda E. Mostrar as oitavas em uma cor e outra cor para a nota selecionada.
        - nivel 1 ----------> casas 0 a 5
        - nivel 2 ----------> casas 6 a 12
        - nivel 4 ----------> casas 13 a 17
        - nivel 5 ----------> casas 17 a 22
        - nivel 6 ----------> todas as casas

  - Implement instruments home menu ------------------>
  - Link app with with guitar game ------------------->