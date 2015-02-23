closeOtherPanes = ->
  panes = atom.workspace.getPanes()
  activePane = atom.workspace.getActivePane()
  otherPanes = panes.filter (pane) -> pane isnt activePane
  otherPanes.forEach (pane) ->
    pane.close()

module.exports = closeOtherPanes
