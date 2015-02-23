switchMode = (mode) ->
  workspaceElement = atom.views.getView atom.workspace
  atom.commands.dispatch workspaceElement, 'btom-mode:switch-' + mode

module.exports = switchMode
