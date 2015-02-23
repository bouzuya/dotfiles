# Cut commands
#
# Author:
#   bouzuya <m@bouzuya.net>
#
# License:
#   MIT
#
_generateCutCommand = (command) ->
  ->
    setTimeout ->
      editor = atom.workspace.getActiveTextEditor()
      editor.mutateSelectedText command
    , 0

cutLeft = _generateCutCommand (selection) ->
  selection.selectLeft()
  selection.copy()
  selection.delete()

cutLine = _generateCutCommand (selection) ->
  selection.selectLine()
  selection.copy()
  selection.delete()

cutSelection = _generateCutCommand (selection) ->
  selection.copy()
  selection.delete()

cutToEndOfLine = _generateCutCommand (selection) ->
  selection.selectToEndOfLine()
  selection.copy()
  selection.delete()

module.exports = {
  cutLeft
  cutLine
  cutSelection
  cutToEndOfLine
}
