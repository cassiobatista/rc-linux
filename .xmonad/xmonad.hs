import XMonad
-- import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook      = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook      = avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook         = dynamicLogWithPP xmobarPP
                                { ppOutput = hPutStrLn xmproc
                                , ppTitle = xmobarColor "cyan" "" . shorten 70
                                -- , ppHiddenNoWindows = xmobarColor "grey" ""
                                }
        , modMask = mod4Mask
        -- , terminal = "urxvt -e tmux new-session"
        , terminal = "urxvt -e tmux"
        , borderWidth = 1
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((shiftMask, xK_Print), spawn "sleep 0.2 && scrot -o /tmp/00.png -p -s")  -- screenshot
        , ((0, xK_Print), spawn "scrot -o /tmp/00.png -p")                          -- screenshot
        , ((0, 0x1008FF11), spawn "amixer -q set Master 5%-")                       -- XF86XK_AudioLowerVolume 
        , ((0, 0x1008FF12), spawn "amixer -q -D pulse set Master toggle")           -- XF86XK_AudioMute        
        , ((0, 0x1008FF13), spawn "amixer -q set Master 5%+")                       -- XF86XK_AudioRaiseVolume 
        , ((0, 0x1008FF16), spawn "playerctl previous")                             -- XF86XK_AudioPrev 
        , ((0, 0x1008FF14), spawn "playerctl play-pause")                           -- XF86XK_AudioPlay 
        , ((0, 0x1008FF17), spawn "playerctl next")                                 -- XF86XK_AudioNext 
        , ((0, 0x1008FF02), spawn "xbacklight +10")                                 -- XF86XK_MonBrightnessUp  
        , ((0, 0x1008FF03), spawn "xbacklight -10")                                 -- XF86XK_MonBrightnessDown
        ]


-- https://stackoverflow.com/questions/20446348/xmonad-toggle-fullscreen-xmobar
-- https://superuser.com/questions/389737/how-do-you-make-volume-keys-and-mute-key-work-in-xmonad
