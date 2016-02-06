umlaut = {}

shuffle = (array) ->
  counter       = array.length
  shuffledArray = []

  while counter > 0
    index = Math.floor(Math.random() * counter)

    counter--

    shuffledArray.push(array[index])
    array[index] = array[counter]

  shuffledArray

umlaut.bogoSort = (array) ->
  checkIsSorted = (sortAttempt) ->
    isSorted = true
    for item, i in sortAttempt
      if item > sortAttempt[i + 1]
        # instead of returning early make sure we loop through the whole array
        isSorted = false
    isSorted

  while !checkIsSorted(array)
    array = shuffle(array)

  array

umlaut.bogoFind = (array, func) ->
  match = null
  while !match? && array.length > 0
    array = shuffle(array)
    [first, array...] = array
    if func(first)
      match = first

  return match

umlaut.filter = (array, func) ->
  filteredArray = []
  returnArray   = []

  for item in array
    if !func(item)
      filteredArray.push(item)

  for item in array
    if filteredArray.indexOf(item) < 0
      returnArray.push(item)

  returnArray

module.exports = umlaut
