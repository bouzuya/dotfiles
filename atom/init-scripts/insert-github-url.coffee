# Insert GitHub URL for Markdown
#
# Usage:
#
# ```
# # init.coffee
# atom.commands.add 'atom-text-editor',
#   'user:insert-github-url': require './init-scripts/insert-github-url'
# ```
#
# Example:
#   In
#   [user/repo][]
#
#   Out
#   [user/repo][]
#   [user/repo]: https://github.com/user/repo
#
# Author:
#   bouzuya <m@bouzuya.net>
#
# License:
#   MIT
#

insertBottom = (text) ->
  editor = atom.workspace.getActiveTextEditor()
  point = editor.getCursorBufferPosition()
  editor.moveToBottom()
  editor.insertText text
  editor.insertNewline()
  editor.setCursorBufferPosition point

getGitHubUrls = (text) ->
  pattern = /\[([-\w]+\/[-\w]+)\]\[\]/g
  urls = ("[#{m[1]}]: https://github.com/#{m[1]}" while m = pattern.exec text)
  urls.reduce(((u, i) -> if i in u then u else u.concat([i])), []).sort()

# unused
insertGitHubUrlInCurrentLine = ->
  editor = atom.workspace.getActiveTextEditor()
  line = editor.lineTextForBufferRow point.row
  urls = getGitHubUrls line
  insertBottom urls.join '\n'

insertGitHubUrlInCurrentBuffer = ->
  editor = atom.workspace.getActiveTextEditor()
  text = editor.getText()
  urls = getGitHubUrls text
  insertBottom urls.join '\n'

module.exports = insertGitHubUrlInCurrentBuffer
