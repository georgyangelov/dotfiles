module.exports = ({from, to, duration, step, done}) ->
  startTime = null

  update = (timestamp) =>
    startTime = timestamp unless startTime
    time      = timestamp - startTime

    if duration == 0
      progress = 1
    else
      progress = time / duration
    progress = 1 if progress > 1

    step(from + (to - from) * progress)

    if progress < 1
      requestAnimationFrame(update)
    else
      done() if done

  requestAnimationFrame(update)
