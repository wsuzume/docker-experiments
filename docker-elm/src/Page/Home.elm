module Page.Home exposing(Model, Msg, init, update, subscriptions, view)

import Html exposing (Html, text)

import Port exposing (PortMsg, elm2js, encodePortMsg)
import Session exposing (Session)

type alias Model =
    { session : Session
    }

type Msg
    = NoOps
    | Send

init : Session -> ( Model, Cmd Msg )
init session =
    ( Model session
    , Cmd.none
    )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOps ->
            ( model, Cmd.none )
        Send ->
            ( model, elm2js (encodePortMsg <| PortMsg "elm-message" "hello")
            )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

view : Model -> { title : String, body : List (Html Msg) }
view model =
    { title = "ignite"
    , body =
        [ text "Home"
        ]
    }

