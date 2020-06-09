import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Util.EZConfig (additionalKeysP)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W


myTerminal    						= "alacritty"
myModMask     						= mod4Mask
myBorderWidth 						= 3
dmenu											= "dmenu_run"
myBrowser									= "brave-browser"
myNormalBorderColor				= "#cccccc"
myFocusedBorderColor			= "#cd8b00"

main = do
  xmonad $ def
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
		-- Startup scripts
		, startupHook = do
				startupHook def
				spawn "/home/ms/swapkeys.sh"
				spawn "/home/ms/mouse.sh"
		-- Border
		, normalBorderColor = myNormalBorderColor
		, focusedBorderColor = myFocusedBorderColor
    } `additionalKeysP` myKeys

myKeys = [
				 -- Xmonad
				 ("M-S-e", io exitSuccess)
				 -- Dmenu
				 , ("M-d", spawn dmenu)
				 -- Windows
				 , ("M-S-q", kill)
				 -- Terminal
				 , ("M-<Return>", spawn myTerminal)
				 -- Browser
				 , ("M-c", spawn myBrowser)
				 ]
