module.exports = (workspace, direction) ->
  panes           = workspace.getPanes()
  activePane      = workspace.getActivePane()
  activePaneIndex = panes.indexOf(activePane)
  newPaneIndex    = (activePaneIndex + direction) % panes.length
  newPaneIndex    = panes.length - 1 if newPaneIndex < 0
  newPane         = panes[newPaneIndex]
  newItemIndex    = newPane.getItems().length

  activePane.moveItemToPane(
    activePane.getActiveItem(),
    newPane,
    newItemIndex
  )
  newPane.activateItemAtIndex(newItemIndex)
  newPane.activate()
