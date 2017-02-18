module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.Grid exposing (..)
import Bootstrap.Navbar exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- Model


type alias Model =
    { name : String }


init : ( Model, Cmd Msg )
init =
    Model "world" ! []



-- Update


type Msg
    = NoOp


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
            [ column [ ExtraSmall Ten, Small Ten, Medium Twelve, Large Twelve ]
                [ Html.h1 [ class "brand" ]
                    [ Html.text "Ahimsa Yoga"
                    ]
                ]
            ]
        , row
            [ column [ ExtraSmall Ten, Small Ten, Medium Twelve, Large Twelve ]
                [ Html.div []
                    [ div [ class "address-bar" ]
                        [ text ("Komatsu-shi | Ishikawa, Japan") ]
                    ]
                ]
            ]
        , row
            [ column [ ExtraSmall Ten, Small Ten, Medium Twelve, Large Twelve ]
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
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
