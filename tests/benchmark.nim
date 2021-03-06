import benchy
import random
from strutils import nil
from math import pow
{.experimental: "views".}
import ../src/strviewutils

let TempData = block:
  var 
    s = ""
    i = 0
  while i < 300000:
    let digits = rand(1..10)
    for i in 1..digits:
      s.add(rand('0'..'9'))
    s.add(' ')
    inc i
  s

timeit "Views Single Char Split", 1000:
  for x in TempData.split(' '):
    keep(x)

timeit "Stdlib Single Char Split", 1000:
  for x in strutils.split(TempData, ' '): 
    keep(x)

timeit "Views Multi Char Split", 1000:
  for x in TempData.split({' ','3'}):
    keep(x)

timeit "Stdlib Multi Char Split", 1000:
  for x in strutils.split(TempData, {' ','3'}): 
    keep(x)


timeit "Views Int Parse", 1000:
  for x in TempData.split(' '):
    try:
      keep(x.parseInt)
    except: discard

timeit "Stdlib Int Parse", 1000:
  for x in strutils.split(TempData, ' '):
    try: 
      keep(strutils.parseInt(x))
    except: discard


timeit "View String Split", 1000:
  for line in TempData.split("3"):
    keep(line)

timeit "Stdlib String Split", 1000:
  for line in strutils.split(TempData, "3"):
    keep(line)
