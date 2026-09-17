import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W

import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- ------------------------------------------------------------
-- Applications
-- ------------------------------------------------------------

myAppKeys =
    [ ("M-<Return>", spawn "kitty")
    , ("M-d",        spawn "dmenu_run")
    , ("M-S-l",      spawn "xsecurelock")
    , ("M-f",        spawn "firefox")
    , ("M-p",        spawn "pycharm-community")
    , ("M-S-r",      spawn "xmonad --recompile && xmonad --restart")
    ]

-- ------------------------------------------------------------
-- Workspaces
-- ------------------------------------------------------------

myWorkspaceKeys =
    [ ("M-²",    windows (W.greedyView "1"))
    , ("M-&",    windows (W.greedyView "2"))
    , ("M-é",    windows (W.greedyView "3"))
    , ("M-\"",   windows (W.greedyView "4"))
    , ("M-'",    windows (W.greedyView "5"))

    , ("M-S-²",  windows (W.shift "1"))
    , ("M-S-&",  windows (W.shift "2"))
    , ("M-S-é",  windows (W.shift "3"))
    , ("M-S-\"", windows (W.shift "4"))
    , ("M-S-'",  windows (W.shift "5"))
    ]

-- ------------------------------------------------------------
-- Media keys
-- ------------------------------------------------------------

myMediaKeys =
    [ ("<F5>", spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")
    , ("<F4>", spawn "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
    , ("<F6>", spawn "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
    , ("<F8>", spawn "flameshot gui")
    ]

myKeys =
    myAppKeys
    ++ myWorkspaceKeys
    ++ myMediaKeys

-- ------------------------------------------------------------
-- Xmobar
-- ------------------------------------------------------------

myXmobarPP :: PP
myXmobarPP = def
    { ppCurrent         = xmobarColor "#98971a" "" . wrap "[" "]"
    , ppVisible         = xmobarColor "#ebdbb2" ""
    , ppHidden          = xmobarColor "#a89984" ""
    , ppHiddenNoWindows = const ""
    , ppUrgent          = xmobarColor "#fb4934" ""
    , ppTitle           = const ""
    , ppLayout          = const ""
    , ppSep             = ""
    , ppWsSep           = "  "
    , ppOrder           = \(ws : _layout : _title : extras) ->
                            [ws, unwords extras]
    }

myStatusBar =
    statusBarProp
        "xmobar /home/sam/.config/xmobar/xmobarrc"
        (pure myXmobarPP)

-- ------------------------------------------------------------
-- Startup
-- ------------------------------------------------------------

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "xrandr --output HDMI-1 --mode 3440x1440 --rate 60 --primary --output eDP-1 --off"
    spawnOnce "xsetroot -solid '#282828'"

-- ------------------------------------------------------------
-- Main
-- ------------------------------------------------------------

main :: IO ()
main =
    xmonad
        $ withEasySB myStatusBar defToggleStrutsKey
        $ def
            { modMask            = mod4Mask
            , terminal           = "kitty"
            , borderWidth        = 2
            , normalBorderColor  = "#504945"
            , focusedBorderColor = "#98971a"
            , startupHook        = myStartupHook
            }
        `additionalKeysP` myKeys
