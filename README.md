[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

# Bootstraping

  run `melos bootstrap`

# wl-school-music-manager
Flutter White label app for Music School 


# Creating a new package

  `dart pub global run very_good_cli:very_good create flutter_package wl_music_school_manager --desc "Base package for the white label"`

# Creating a new App

  `dart pub global run very_good_cli:very_good create flutter_app my_app --desc "My new Flutter app"`


# Achitecture

     ┌────────────────────────┐
     │                        │
     │     app other-app      │
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


  ##############
  ## Features ##
  ##############

  - Incluir o campo "Perfil" no signup ---------------> OK
  - Setup Melos --------------------------------------> OK
  - Create login package -----------------------------> Cancelado
  - Create App admin to add new users ----------------> OK
  - Verificar perfil de admin no login do manager ----> OK
    * Alterar usuário reativo --------------> OK
    * Testar ususário sem role admin -------> OK
  - Create menu to add new user ----------------------> OK
  - Call new usser page ------------------------------> OK
  - Implement User list ------------------------------> Paused
  - Allow delete user from list ---------------------->
  - Permitir associar mais de um perfil -------------->
  - Split frets into an app and a package ------------> Doing
  - Call guitar_games from home ---------------------->
  - Create Splash ------------------------------------>
  - Implement instruments home menu ------------------>
  - Link app with with guitar game ------------------->
  - Build Guitar game levels ------------------------->

      * Etapa 1 -> Somente corda E. Mostrar as oitavas em uma cor e outra cor para a nota selecionada.
        - nivel 1 ----------> casas 0 a 5
        - nivel 2 ----------> casas 6 a 12
        - nivel 4 ----------> casas 13 a 17
        - nivel 5 ----------> casas 17 a 22
        - nivel 6 ----------> todas as casas
      * Intervalos
        - Terça maior
        - Terça menor
        - Quinta justa
      * Sustenidos dos Tons (Armadura)
      * Bemol dos Tons (Armadura)



  ## ##############
  ## Tech debit ##
  ## ##############

  - Setup CrashLytics -------------------------------->
  - Setup App Check ---------------------------------->
 
