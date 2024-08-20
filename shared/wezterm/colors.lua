local palette = {
  fg = "#{{theme.base05}}",
  bg = "#{{theme.base00}}",
  base00 = "#{{theme.base00}}",
  base01 = "#{{theme.base01}}",
  base02 = "#{{theme.base02}}",
  base03 = "#{{theme.base03}}",
  base04 = "#{{theme.base04}}",
  base05 = "#{{theme.base05}}",
  base06 = "#{{theme.base06}}",
  base07 = "#{{theme.base07}}",
  base08 = "#{{theme.base08}}",
  base09 = "#{{theme.base09}}",
  base0A = "#{{theme.base0A}}",
  base0B = "#{{theme.base0B}}",
  base0C = "#{{theme.base0C}}",
  base0D = "#{{theme.base0D}}",
  base0E = "#{{theme.base0E}}",
  base0F = "#{{theme.base0F}}",
}

return {
  foreground = palette.fg,
  background = palette.bg,

  cursor_fg = palette.base01,
  cursor_bg = palette.base06,
  cursor_border = palette.base06,
  selection_fg = palette.base01,
  selection_bg = palette.base06,
  scrollbar_thumb = palette.base06,

  ansi = {
    palette.base00,
    palette.base08,
    palette.base09,
    palette.base0A,
    palette.base0B,
    palette.base0C,
    palette.base0D,
    palette.base05,
  },
  brights = {
    palette.base03,
    palette.base08,
    palette.base09,
    palette.base0A,
    palette.base0B,
    palette.base0C,
    palette.base0D,
    palette.base07,
  },

  tab_bar = {
    background = palette.bg,
    active_tab = {
      bg_color = palette.base0E,
      fg_color = palette.base01,
    },
    inactive_tab = {
      bg_color = palette.base01,
      fg_color = palette.base04,
    },
    inactive_tab_hover = {
      bg_color = palette.base02,
      fg_color = palette.fg,
    },
    new_tab = {
      bg_color = palette.base01,
      fg_color = palette.base04,
    },
    new_tab_hover = {
      bg_color = palette.base02,
      fg_color = palette.fg,
    },
  },
}
