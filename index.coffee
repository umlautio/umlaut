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

module.exports = umlaut
