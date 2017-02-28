module App.Routes exposing (Route(..), match)

import Route exposing (..)


type Route
    = Home
    | About
    | Users
    | NotFound


home =
    Home := static ""


about =
    About := static "about"


users =
    Users := static "users"


routes =
    router [ home, about, users ]


match : String -> Maybe Route
match =
    Route.match routes


toString : Route -> String
toString route =
    case route of
        Home ->
            reverse home []

        About ->
            reverse about []

        Users ->
            reverse users []

        NotFound ->
            Debug.crash "cannot route to NotFound"
