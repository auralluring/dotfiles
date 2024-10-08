# catppuccin colours
rosewater=#f4dbd6 
flamingo=#f0c6c6 
pink=#f5bde6 
mauve=#c6a0f6 
red=#ed8796 
maroon=#ee99a0 
peach=#f5a97f 
yellow=#eed49f 
green=#a6da95 
teal=#8bd5ca 
sky=#91d7e3 
sapphire=#7dc4e4 
blue=#8aadf4 
lavender=#b7bdf8
# interface colours
text=#cad3f5 
subtext0=#a5adcb 
subtext1=#b8c0e0 
overlay0=#6e738d 
overlay1=#8087a2 
overlay2=#939ab7 
surface0=#363a4f 
surface1=#494d64 
surface2=#5b6078 
base=#24273a 
mantle=#1e2030 
crust=#181926 

# defaults
CATPPUCCIN_ACCENT1=${CATPPUCCIN_ACCENT1:-mauve}
CATPPUCCIN_ACCENT2=${CATPPUCCIN_ACCENT2:-sapphire}

# env/template vars
export CLR_FOREGROUND=$text
export CLR_FOREGROUND_ALT=$subtext0
export CLR_BACKGROUND=$base
export CLR_BACKGROUND_ALT=$mantle
export CLR_CURSOR=${!CATPPUCCIN_ACCENT2}
export CLR_ACCENT=${!CATPPUCCIN_ACCENT1}
export CLR_ACCENT_ALT=${!CATPPUCCIN_ACCENT2}

export CLR_ANSI_BLACK=$crust
export CLR_ANSI_RED=$red
export CLR_ANSI_GREEN=$green
export CLR_ANSI_YELLOW=$yellow
export CLR_ANSI_BLUE=$blue
export CLR_ANSI_MAGENTA=$pink
export CLR_ANSI_CYAN=$teal
export CLR_ANSI_WHITE=$subtext1
export CLR_ANSI_BRIGHTBLACK=$mantle
export CLR_ANSI_BRIGHTRED=$maroon
export CLR_ANSI_BRIGHTGREEN=$green
export CLR_ANSI_BRIGHTYELLOW=$yellow
export CLR_ANSI_BRIGHTBLUE=$sapphire
export CLR_ANSI_BRIGHTMAGENTA=$flamingo
export CLR_ANSI_BRIGHTCYAN=$sky
export CLR_ANSI_BRIGHTWHITE=$text
