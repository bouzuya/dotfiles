activateLeftSidePane = ->
  getLeftSidePane().activate()

activateOtherSidePane = ->
  getOtherSidePane().activate()

activateRightSidePane = ->
  getRightSidePane().activate()

getCurrentSide = ->
  leftPane = getLeftSidePane()
  activePane = atom.workspace.getActivePane()
  if activePane is leftPane then getLeftSide() else getRightSide()

getCurrentSideItem = ->
  getCurrentSidePane().getActiveItem()

getCurrentSidePane = ->
  atom.workspace.getActivePane()

getLeftSide = ->
  'left'

getLeftSideItem = ->
  getLeftSidePane().getActiveItem()

getLeftSidePane = ->
  atom.workspace.getActivePane().findLeftmostSibling()

getOtherSide = ->
  if getCurrentSide() is getLeftSide() then getRightSide() else getLeftSide()

getOtherSideItem = ->
  getOtherSidePane().getActiveItem()

getOtherSidePane = ->
  if getCurrentSide() is getLeftSide()
    getRightSidePane()
  else
    getLeftSidePane()

getRightSide = ->
  'right'

getRightSideItem = ->
  getRightSidePane().getActiveItem()

getRightSidePane = ->
  atom.workspace.getActivePane().findOrCreateRightmostSibling()

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
