import GraphicSVG.EllieApp exposing(GetKeyState)
import Dict exposing (Dict)

type State
  = Login
  | Title
  | LeaderBoard
  | Loading State State Float -- loading oldState newState time
  | Sliding Int Float -- sliding toNewLevel direction time
  | LevelSelect
  | Scenes
  | CreativeMode
  | Game Float Float --game startTime lasTilePlacedTime
  | LevelPlaceholder
  | MenuPlaceholder

type LocalMsg 
    = Tick Float GetKeyState
    | Begin String
    | StartDrawing
    | EndDrawing
    | PaintTile (Int, Int) Colour
    | PickColour Colour
    | Menu
    | MainMenu
    | StartScene
    | ViewLeaderBoard
    | IncreaseLevel
    | DecreaseLevel
    | NextTalk
    | Creative
    | SetUpInto (Float, Float)
    | HoverOver (Float, Float)
    | LeaveHover
    | HoverOverTile (Int, Int)
    | LeaveHoverTile
    | MoveTo (Float, Float)
    | MoveBrush (Float, Float)
    | NextBackground
    | Start
    | NextLevel
    | ChangetoLevel
    | ChangetoMenu
    | Logout
    | PassLevel


type alias LocalModel = 
    {drawing : Bool, time : Float, walking : Bool, mousingOverDoor: Bool, onFrame : (Float, Float)
    , tiles : Dict (Int, Int) Colour, playerX : Float, playerXGoal : Float, talking : Int
    , level : Int, selectedColour : Colour, curSkele : Dict (Int, Int) Colour
    , curGuide : Dict (Int, Int) Colour, curFinish : Dict (Int, Int) Colour, clickedIcon : Bool, goalLocation : (Float, Float)
    , hoveredButton : (Float, Float), hoveredTile : (Int, Int), state : State, playerFacingDir : Float
    , brushX : Float, brushY : Float, background : Int, completedLevels : List (Int), user: String, wifeX : Float, wifeGoalX : Float}

type GlobalMsg
  = RegisterScore Int String String

type alias GlobalModel = 
    {users : List (String), leaderboard1 : List (String, String), leaderboard2 : List (String, String), 
    leaderboard3 : List (String, String), leaderboard4 : List (String, String), leaderboard5 : List (String, String), 
    leaderboard6 : List (String, String), leaderboard7 : List (String, String),
    leaderboard8 : List (String, String)}

type Colour = RGB Int Int Int