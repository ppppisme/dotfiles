# Color theme
palette = {
    'red': {
        'dark':  '#cc241d',
        'light': '#fb4934',
    },
    'green': {
        'dark':  '#98971a',
        'light': '#b8bb26',
    },
    'yellow': {
        'dark':  '#d79921',
        'light': '#fabd2f',
    },
    'blue': {
        'dark':  '#458588',
        'light': '#83a598',
    },
    'purple': {
        'dark':  '#b16286',
        'light': '#d3869b',
    },
    'aqua': {
        'dark':  '#689d6a',
        'light': '#8ec07c',
    },
    'orange': {
        'dark':  '#d65d0e',
        'light': '#fe8019',
    },
    'gray': {
        'dark':  '#928374',
        'light': '#a89984',
    },
    'black': {
        'bg0_h': '#1d2021',
        'bg0':   '#282828',
        'bg0_s': '#32302f',
        'bg1':   '#3c3836',
        'bg2':   '#504945',
        'bg3':   '#665c54',
        'bg4':   '#7c6f64',
    },
    'white': {
        'fg0':   '#fbf1c7',
        'fg1':   '#ebdbb2',
        'fg2':   '#d5c4a1',
        'fg3':   '#bdae93',
        'fg4':   '#a89984',
    },
    'transparent': '#ffffff00'
}

theme_variation = 'dark' # light or dark
theme = {
    'bg':        palette['black']['bg0'] if theme_variation == 'dark' else palette['white']['fg1'],
    'fg':        palette['white']['fg1'] if theme_variation == 'dark' else palette['black']['bg0'],
    'subtle_bg': palette['black']['bg1'] if theme_variation == 'dark' else palette['white']['fg3'],
    'subtle_fg': palette['white']['fg3'] if theme_variation == 'dark' else palette['black']['bg1'],
    'red':       palette['red'][theme_variation],
    'green':     palette['green'][theme_variation],
    'yellow':    palette['yellow'][theme_variation],
    'blue':      palette['blue'][theme_variation],
    'purple':    palette['purple'][theme_variation],
    'aqua':      palette['aqua'][theme_variation],
    'orange':    palette['orange'][theme_variation],
}

c.colors.completion.fg = theme['fg']
c.colors.completion.even.bg = theme['bg']
c.colors.completion.odd.bg = theme['bg']
c.colors.completion.match.fg = theme['aqua']
c.colors.completion.item.selected.bg = theme['subtle_bg']
c.colors.completion.item.selected.fg = theme['subtle_fg']
c.colors.completion.item.selected.border.bottom = theme['subtle_bg']
c.colors.completion.item.selected.border.top = theme['subtle_bg']
c.colors.completion.category.bg = theme['subtle_bg']
c.colors.completion.category.fg = theme['subtle_fg']
c.colors.completion.category.border.bottom = theme['bg']
c.colors.completion.category.border.top = theme['bg']
c.colors.completion.scrollbar.bg = theme['bg']
c.colors.completion.scrollbar.fg = theme['subtle_bg']

c.colors.statusbar.command.bg = theme['bg']
c.colors.statusbar.command.fg = theme['fg']
c.colors.statusbar.insert.bg = theme['bg']
c.colors.statusbar.insert.fg = theme['green']
c.colors.statusbar.caret.bg = theme['bg']
c.colors.statusbar.caret.fg = theme['aqua']
c.colors.statusbar.normal.bg = theme['bg']
c.colors.statusbar.normal.fg = theme['fg']
c.colors.statusbar.url.error.fg = theme['red']
c.colors.statusbar.url.fg = theme['fg']
c.colors.statusbar.url.hover.fg = theme['yellow']
c.colors.statusbar.url.success.http.fg = theme['green']
c.colors.statusbar.url.success.https.fg = theme['purple']
c.colors.statusbar.url.warn.fg = theme['yellow']

c.colors.tabs.bar.bg = '#504945'
c.colors.tabs.even.bg = '#504945'
c.colors.tabs.even.fg = '#a89984'
c.colors.tabs.indicator.error = '#fb4934'
c.colors.tabs.indicator.start = '#83a598'
c.colors.tabs.indicator.stop = '#98971a'
c.colors.tabs.odd.bg = '#504945'
c.colors.tabs.odd.fg = '#a89984'
c.colors.tabs.selected.even.bg = theme['bg']
c.colors.tabs.selected.even.fg = theme['fg']
c.colors.tabs.selected.odd.bg = theme['bg']
c.colors.tabs.selected.odd.fg = theme['fg']

# Statusbar
c.statusbar.hide = False
c.statusbar.padding = { 'bottom': 2, 'left': 0, 'right': 0, 'top': 2 }
c.statusbar.position = 'bottom'

# Tabs
c.tabs.background = True
c.tabs.close_mouse_button = 'middle'
c.tabs.favicons.scale = 1.2
c.tabs.favicons.show = 'always'
c.tabs.indicator.padding: { 'bottom': 1, 'left': 0, 'right': 4, 'top': 1 }
c.tabs.last_close = 'ignore'
c.tabs.mousewheel_switching = True
c.tabs.new_position.related = 'next'
c.tabs.new_position.unrelated = 'last'
c.tabs.padding: { 'bottom': 15, 'left': 5, 'right': 5, 'top': 15 }
c.tabs.position = 'top'
c.tabs.show = 'always'

# Misc
c.zoom.default = '110%'
