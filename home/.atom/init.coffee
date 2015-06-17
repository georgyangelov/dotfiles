# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
throttle      = require './lib/throttle'
scrollByLines = require './lib/scroll-by-lines'
paneTabMove   = require './lib/pane-tab-move'

atom.commands.add 'atom-workspace atom-text-editor:not([mini])',
  'user:scroll-up': throttle 100, (event) ->
    editor = @getModel()
    scrollByLines(editor, -10)

  'user:scroll-down': throttle 100, (event) ->
    editor = @getModel()
    scrollByLines(editor, 10)

atom.commands.add 'atom-workspace',
  'user:pane-tab-move-right': () ->
    workspace = @getModel()
    paneTabMove(workspace, 1)

  'user:pane-tab-move-left': () ->
    workspace = @getModel()
    paneTabMove(workspace, -1)
