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
