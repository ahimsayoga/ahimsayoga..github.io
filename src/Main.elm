module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.Grid exposing (..)
import Bootstrap.Navbar exposing (..)
import App.Routes as Routes
import Navigation exposing (Location)


type Msg
    = ChangeRoute Sitemap


parseRoute : Location -> Msg
parseRoute =
    Routes.match >> ChangeRoute


main : Program Never Model Msg
main =
    Navigation.program parseRoute
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- Model


type alias Model =
    { name : String }


init : ( Model, Cmd Msg )
init =
    Model "world" ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []



-- View


view : Model -> Html Msg
view model =
    containerFluid
        [ row
            [ column []
                [ Html.h1 [ class "brand" ]
                    [ Html.text "Ahimsa Yoga"
                    ]
                ]
            ]
        , row
            [ column [ Large Twelve ]
                [ Html.div []
                    [ div [ class "address-bar" ]
                        [ text ("Komatsu-shi | Ishikawa, Japan") ]
                    ]
                ]
            ]
        , row
            [ column [ Large Twelve ]
                [ navbar DefaultNavbar
                    []
                    [ navbarHeader [] []
                    , navbarCollapse [ id "collapseMe" ]
                        [ navbarList (NavbarNav)
                            NavbarDefault
                            []
                            [ li []
                                [ a [ href "index.html" ]
                                    [ text "Home"
                                    ]
                                ]
                            , li []
                                [ a [ href "index.html" ]
                                    [ text "About"
                                    ]
                                ]
                            , li []
                                [ a [ href "index.html" ]
                                    [ text "Contact"
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , row
            [ Html.div [ class "box" ]
                [ column [ Large Twelve ]
                    [ Html.div []
                        [ h2 [ class "intro-text text-center" ]
                            [ text ("Build a website") ]
                        ]
                    ]
                ]
            ]
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
