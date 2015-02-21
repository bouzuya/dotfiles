# Insert bbn:blog.bouzuya.net URL for Markdown
#
# Usage:
#
# ```
# # init.coffee
# atom.commands.add 'atom-text-editor',
#   'user:insert-bbn-url': require './init-scripts/insert-bbn-url'
# ```
#
# Example:
#   In
#   [2015-01-01][]
#
#   Out
#   [2015-01-0][]
#   [2015-01-01]: http://blog.bouzuya.net/2015/01/01/
#
# Author:
#   bouzuya <m@bouzuya.net>
#
# License:
#   MIT
#

formatUrl = (match) ->
  "[#{match[1]}]: http://blog.bouzuya.net/#{match[1].replace(/-/g, '/')}/"

parseBbnUrls = (text) ->
  pattern = /\[(\d{4}-\d{2}-\d{2})\]\[\]/g
  urls = (formatUrl match while match = pattern.exec text)
  urls.reduce(((u, i) -> if i in u then u else u.concat([i])), []).sort()

insertBottom = (text) ->
  editor = atom.workspace.getActiveTextEditor()
  point = editor.getCursorBufferPosition()
  editor.moveToBottom()
  editor.insertText text
  editor.setCursorBufferPosition point

insertBbnUrl = ->
  editor = atom.workspace.getActiveTextEditor()
  text = editor.getText()
  urls = parseBbnUrls text
  insertBottom urls.join '\n'

module.exports = insertBbnUrl
