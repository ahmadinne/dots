config.load_autoconfig()
c.editor.command = ['alacritty', '-e', 'nvim', '{file}']
config.bind('j', 'scroll-px 0 50', )
config.bind('k', 'scroll-px 0 -50',)
config.bind('h', 'scroll-px 50 0', )
config.bind('l', 'scroll-px -50 0',)
