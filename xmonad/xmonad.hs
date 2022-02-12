-- Install scrot, alsa-utils, pulseaudio, playerctl, xorg-xbacklight, xscreensaver

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.DynamicBars
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run
import XMonad.Util.EZConfig

import XMonad.Hooks.EwmhDesktops     -- chrome bug
import Graphics.X11.ExtraTypes.XF86  -- fn keys

import System.IO

main = do
    xmproc0 <- spawnPipe $ "xmobar -x " ++ show 0
    xmproc1 <- spawnPipe $ "xmobar -x " ++ show 1
    xmonad $ docks def
        { manageHook      = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook      = avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook  -- chrome bug
        , logHook         = dynamicLogWithPP xmobarPP
                                { ppOutput = \x -> hPutStrLn xmproc0 x >> hPutStrLn xmproc1 x 
                                , ppTitle = xmobarColor "cyan" "" . shorten 60
                                -- , ppHiddenNoWindows = xmobarColor "grey" ""
                                }
        , modMask = mod4Mask
        , terminal = "urxvt -e tmux"
        , borderWidth = 1
        , focusedBorderColor = "#00FFFF"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")                     -- lock screen
        , ((0, xK_Print                 ), spawn "scrot -o /tmp/00.png -q 100 -p -u")              -- screenshot
        , ((shiftMask, xK_Print         ), spawn "sleep 0.2 && scrot -o /tmp/00.png -q 100 -p -s") -- screenshot
        , ((0, xF86XK_AudioLowerVolume  ), spawn "amixer -q set Master 5%-")                       -- 0x1008FF11
        , ((0, xF86XK_AudioMute         ), spawn "amixer -q -D pulse set Master toggle")           -- 0x1008FF12
        , ((0, xF86XK_AudioRaiseVolume  ), spawn "amixer -q set Master 5%+")                       -- 0x1008FF13
        , ((0, xF86XK_AudioPrev         ), spawn "playerctl -p cmus previous")                     -- 0x1008FF16
        , ((0, xF86XK_AudioPlay         ), spawn "playerctl -p cmus play-pause")                   -- 0x1008FF14
        , ((0, xF86XK_AudioNext         ), spawn "playerctl -p cmus next")                         -- 0x1008FF17
        , ((0, xF86XK_MonBrightnessUp   ), spawn "xbacklight +10")                                 -- 0x1008FF02
        , ((0, xF86XK_MonBrightnessDown ), spawn "xbacklight -10")                                 -- 0x1008FF03
        ]

-- https://stackoverflow.com/questions/20446348/xmonad-toggle-fullscreen-xmobar
-- https://superuser.com/questions/389737/how-do-you-make-volume-keys-and-mute-key-work-in-xmonad
-- https://betweentwocommits.com/blog/xmonad-layouts-guide
-- https://stackoverflow.com/questions/66305882/use-xmobar-on-several-monitors
