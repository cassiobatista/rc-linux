import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook      = manageDocks <+> manageHook defaultConfig
        , layoutHook      = avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook         = dynamicLogWithPP xmobarPP
                                { ppOutput = hPutStrLn xmproc
                                , ppTitle = xmobarColor "green" "" . shorten 25
                                , ppHiddenNoWindows = xmobarColor "grey" ""
                                }
        , modMask = mod4Mask
        , terminal = "urxvt"
        , borderWidth = 2
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((0, xK_Print), spawn "scrot")
        ]
