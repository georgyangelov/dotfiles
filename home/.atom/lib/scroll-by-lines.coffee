{Point} = require 'atom'
tween   = require './tween'

module.exports = (editor, lineCount, animationTime = 150) ->

  showCursorPositionInView = ->
    return if editor.hasMultipleCursors()

    editorView = atom.views.getView(editor)
    cursorPosition = editor.getCursorBufferPosition()
    firstVisibleLine = editorView.getFirstVisibleScreenRow()
    lastVisibleLine = editorView.getLastVisibleScreenRow()

    if cursorPosition.row <= firstVisibleLine
      newPosition = new Point(firstVisibleLine, cursorPosition.column)
      editor.setCursorBufferPosition(newPosition)
    else if cursorPosition.row >= lastVisibleLine
      newPosition = new Point(lastVisibleLine, cursorPosition.column)
      editor.setCursorBufferPosition(newPosition)

  getActualScrollTarget = (scrollTarget) ->
    scrollTop = editor.getScrollTop()
    editor.setScrollTop(scrollTarget)
    showCursorPositionInView()

    actualScrollTarget = editor.getScrollTop()
    editor.setScrollTop(scrollTop)

    actualScrollTarget

  scrollTop = editor.getScrollTop()
  lineHeightInEM = atom.config.get('editor.lineHeight')
  fontSize = atom.config.get('editor.fontSize')
  lineHeightInPixels = fontSize * lineHeightInEM
  scrollTopTarget = getActualScrollTarget(scrollTop + lineCount*lineHeightInPixels)

  tween
    from: scrollTop,
    to: scrollTopTarget,
    duration: animationTime,
    step: editor.setScrollTop.bind(editor),
    done: showCursorPositionInView
