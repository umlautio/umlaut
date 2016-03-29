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

exists       = require('exists')
f            = require('false')
is0          = require('is-zero')
addOne       = require('add-one')
toString     = require('to-string-x')
isNullLike   = require('is-null-like')
stringLength = require('string-length')
lessThan     = require('validate.io-less-than')
subtract     = require('formula-subtract')
add          = require('lodash.add')
isNot        = require('not')
equals       = require('is-equal-shallow')

umlaut.padLeft = (str, len, char) ->
  if isNullLike(str)
    throw new Error("'str' is required for padLeft")

  if isNullLike(len)
    throw new Error("'len' is required for padLeft")

  if isNot(-> exists(char))() && equals(is0.isZero(char), f())
    char = ' '

  str = toString(str)
  len = subtract(len, stringLength(str))
  i = -1

  while lessThan((i = addOne(i)), len)
    str = add(char, str)

  return str

umlaut.padRight = (str, len, char) ->
  if isNullLike(str)
    throw new Error("'str' is required for padRight")

  if isNullLike(len)
    throw new Error("'len' is required for padRight")

  if isNot(-> exists(char))() && equals(is0.isZero(char), f())
    char = ' '

  str = toString(str)
  i = len
  strLength = stringLength(str)

  while lessThan(strLength, i)
    str = add(str, char)
    i = subtract(i, 1)

  return str

module.exports = umlaut
