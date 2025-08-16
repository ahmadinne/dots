config.load_autoconfig()
c.editor.command = ['alacritty', '-e', 'nvim', '{file}']
config.bind('j', 'scroll-px 0 50', 'youtube.com')
config.bind('k', 'scroll-px 0 -50', 'youtube.com')
config.bind('h', 'scroll-px 50 0', 'youtube.com')
config.bind('l', 'scroll-px -50 0', 'youtube.com')
