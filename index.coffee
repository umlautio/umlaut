umlaut = {}

shuffle = (array) ->
  counter = array.length

  while counter > 0
    index = Math.floor(Math.random() * counter)

    counter--

    temp = array[counter]
    array[counter] = array[index]
    array[index] = temp

  array

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
