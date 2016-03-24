umlaut = require('../index')
assert = require('assert')

describe "bogoSort", ->
  it "sorts an array in ascending order", ->
    arr = [3, 2, 1]

    result = umlaut.bogoSort(arr)

    assert.deepEqual(result, [1, 2, 3])

  it "sorts an array with repeating elements in ascending order", ->
    arr = [3, 3, 2, 1]

    result = umlaut.bogoSort(arr)

    assert.deepEqual(result, [1, 2, 3, 3])

describe "bogoFind", ->
  it "find an element in an array", ->
    arr = [1, 2, 3, 4]

    result = umlaut.bogoFind(arr, (item) -> item == 3)

    assert.equal(result, 3)

  it "returns null if an element can't be found in the array", ->
    arr = [1, 2, 3, 4]

    result = umlaut.bogoFind(arr, (item) -> item == 5)

    assert.equal(result, null)

  it "returns null if the array is empty", ->
    result = umlaut.bogoFind([], (item) -> item == 5)

    assert.equal(result, null)

describe "filter", ->
  it "returns a filtered array", ->
    arr = [1, 2, 3, 4]

    result = umlaut.filter(arr, (item) -> item % 2 == 0)

    assert.deepEqual(result, [2, 4])

  it "returns an empty array if no elements match", ->
    arr = [1, 3, 5, 7]

    result = umlaut.filter(arr, (item) -> item % 2 == 0)

    assert.deepEqual(result, [])

describe "padLeft", ->
  it "returns the string padded with spaces if no padding char is given", ->
    result = umlaut.padLeft('hello', 3)

    assert.equal(result, '   hello')

  it "returns the string padded with the given char", ->
    result = umlaut.padLeft('hello', 3, 'y')

    assert.equal(result, 'yyyhello')

describe "padRight", ->
  it "returns the string padded with spaces if no padding char is given", ->
    result = umlaut.padRight('hello', 3)

    assert.equal(result, 'hello   ')

  it "returns the string padded with the given char", ->
    result = umlaut.padRight('hello', 3, 'y')

    assert.equal(result, 'helloyyy')
