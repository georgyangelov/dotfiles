module.exports = (time, fn) ->
  timeout = null

  (args...) ->
    unless timeout
      timeout = setTimeout (-> timeout = null), time
      fn.call(this, args)
