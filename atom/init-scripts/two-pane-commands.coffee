activateLeftSidePane = ->
  pane = getLeftSidePane()
  pane.activate() if pane?

activateOtherSidePane = ->
  pane = getOtherSidePane()
  pane.activate() if pane?

activateRightSidePane = ->
  pane = getRightSidePane()
  pane.activate() if pane?

getCurrentSide = ->
  leftPane = getLeftSidePane()
  activePane = atom.workspace.getActivePane()
  # FIXME
  if activePane is leftPane then getLeftSide() else getRightSide()

getCurrentSideItem = ->
  getCurrentSidePane().getActiveItem()

getCurrentSidePane = ->
  atom.workspace.getActivePane()

getLeftSide = ->
  'left'

getLeftSideItem = ->
  pane = getLeftSidePane()
  if pane? then pane.getActiveItem() else null

getLeftSidePane = ->
  axis = _rootAxis()
  return null if axis.orientation isnt 'horizontal'
  pane = axis.children[0]
  return pane.children[0] if pane.orientation? # left top
  pane

getOtherSide = ->
  if getCurrentSide() is getLeftSide() then getRightSide() else getLeftSide()

getOtherSideItem = ->
  pane = getOtherSidePane()
  if pane? then pane.getActiveItem() else null

getOtherSidePane = ->
  if getCurrentSide() is getLeftSide()
    getRightSidePane()
  else
    getLeftSidePane()

getRightSide = ->
  'right'

getRightSideItem = ->
  pane = getRightSidePane()
  if pane? then pane.getActiveItem() else null

getRightSidePane = ->
  axis = _rootAxis()
  return null if axis.orientation isnt 'horizontal'
  pane = axis.children[1]
  return pane.children[0] if pane.orientation? # right top
  pane

openCurrentSideItemInLeftSidePane = ->
  uri = getCurrentSideItem().getURI()
  split = getLeftSide()
  atom.workspace.open(uri, split: split, activatePane: false)

openCurrentSideItemInOtherSidePane = ->
  uri = getCurrentSideItem().getURI()
  split = getOtherSide()
  atom.workspace.open(uri, split: split, activatePane: false)

openCurrentSideItemInRightSidePane = ->
  uri = getCurrentSideItem().getURI()
  split = getRightSide()
  atom.workspace.open(uri, split: split, activatePane: false)

_rootAxis = ->
  axis = atom.workspace.getActivePane()
  axis = axis.parent while axis.parent.parent?
  axis

module.exports = {
  activateLeftSidePane
  activateOtherSidePane
  activateRightSidePane
  getCurrentSide
  getCurrentSideItem
  getCurrentSidePane
  getLeftSide
  getLeftSideItem
  getLeftSidePane
  getOtherSide
  getOtherSideItem
  getOtherSidePane
  getRightSide
  getRightSideItem
  getRightSidePane
  openCurrentSideItemInLeftSidePane
  openCurrentSideItemInOtherSidePane
  openCurrentSideItemInRightSidePane
}
