module Demo.LayoutGrid exposing
    ( Model
    , Msg(..)
    , defaultModel
    , update
    , view
    )

import Demo.CatalogPage exposing (CatalogPage)
import Html exposing (Html, text)
import Html.Attributes exposing (style)
import Material.LayoutGrid as LayoutGrid
import Material.Typography as Typography


type alias Model =
    {}


defaultModel : Model
defaultModel =
    {}


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> CatalogPage Msg
view model =
    { title = "Layout Grid"
    , prelude = "Material design’s responsive UI is based on a 12-column grid layout."
    , resources =
        { materialDesignGuidelines = Nothing
        , documentation = Just "https://package.elm-lang.org/packages/aforemny/material-components-web-elm/latest/Material-LayoutGrid"
        , sourceCode = Just "https://github.com/material-components/material-components-web/tree/master/packages/mdc-layout-grid"
        }
    , hero = heroGrid
    , content =
        [ Html.h3 [ Typography.subtitle1 ] [ text "Columns" ]
        , columnsGrid
        , Html.h3 [ Typography.subtitle1 ] [ text "Grid Left Alignment" ]
        , Html.p
            [ Typography.body1 ]
            [ text "This requires a max-width on the top-level grid element." ]
        , leftAlignedGrid
        , Html.h3 [ Typography.subtitle1 ] [ text "Grid Right Alignment" ]
        , Html.p
            [ Typography.body1 ]
            [ text "This requires a max-width on the top-level grid element." ]
        , rightAlignedGrid
        , Html.h3 [ Typography.subtitle1 ] [ text "Cell Alignment" ]
        , Html.p
            [ Typography.body1 ]
            [ text "Cell alignment requires a cell height smaller than the inner height of the grid." ]
        , cellAlignmentGrid
        ]
    }


demoGrid : List (Html.Attribute msg) -> List (Html msg) -> Html msg
demoGrid options =
    LayoutGrid.layoutGrid
        (style "background" "rgba(0,0,0,.2)"
            :: style "min-width" "360px"
            :: options
        )


demoCell : List (Html.Attribute msg) -> Html msg
demoCell options =
    LayoutGrid.cell
        (style "background" "rgba(0,0,0,.2)"
            :: style "height" "100px"
            :: options
        )
        []


heroGrid : List (Html msg)
heroGrid =
    [ demoGrid [] [ LayoutGrid.inner [] (List.repeat 3 (demoCell [])) ] ]


columnsGrid : Html msg
columnsGrid =
    demoGrid []
        [ LayoutGrid.inner []
            [ demoCell [ LayoutGrid.span6 ]
            , demoCell [ LayoutGrid.span3 ]
            , demoCell [ LayoutGrid.span2 ]
            , demoCell [ LayoutGrid.span1 ]
            , demoCell [ LayoutGrid.span3 ]
            , demoCell [ LayoutGrid.span1 ]
            , demoCell [ LayoutGrid.span8 ]
            ]
        ]


leftAlignedGrid : Html msg
leftAlignedGrid =
    demoGrid
        [ LayoutGrid.alignLeft
        , style "max-width" "800px"
        ]
        [ LayoutGrid.inner []
            [ demoCell []
            , demoCell []
            , demoCell []
            ]
        ]


rightAlignedGrid : Html msg
rightAlignedGrid =
    demoGrid
        [ LayoutGrid.alignRight
        , style "max-width" "800px"
        ]
        [ LayoutGrid.inner [] (List.repeat 3 (demoCell []))
        ]


cellAlignmentGrid : Html msg
cellAlignmentGrid =
    let
        innerHeight =
            [ style "min-height" "200px" ]

        cellHeight =
            style "max-height" "50px"
    in
    demoGrid
        [ style "min-height" "200px"
        ]
        [ LayoutGrid.inner innerHeight
            [ demoCell [ LayoutGrid.alignTop, cellHeight ]
            , demoCell [ LayoutGrid.alignMiddle, cellHeight ]
            , demoCell [ LayoutGrid.alignBottom, cellHeight ]
            ]
        ]
