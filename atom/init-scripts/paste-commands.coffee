pasteLeft = ->
  editor = atom.workspace.getActiveTextEditor()
  editor.pasteText()

pasteRight = ->
  editor = atom.workspace.getActiveTextEditor()
  editor.transact ->
    position = editor.getCursorBufferPosition()
    editor.pasteText()
    editor.setCursorBufferPosition(position)

pasteAbove = ->
  editor = atom.workspace.getActiveTextEditor()
  editor.transact ->
    position = editor.getCursorBufferPosition()
    editor.insertNewlineAbove()
    editor.pasteText()
    editor.setCursorBufferPosition(position)

pasteBelow = ->
  editor = atom.workspace.getActiveTextEditor()
  editor.transact ->
    position = editor.getCursorBufferPosition()
    editor.insertNewlineBelow()
    editor.pasteText()
    editor.setCursorBufferPosition(position)

module.exports = {
  pasteBelow
  pasteAbove
}
