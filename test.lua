local post = require('json-post').post
local url = "http://lige.me:3000/sketchit/echo"
local ges = {
  name = 'double_click',
  x = 100,
  y = 100,   
  z = 100,
  pointsArray = {
     20,
     30,
     40,
     {
        key = "value",
        anotherField = {
           1,2,3,4,5,6,7
        }
     }
  }
}

local res = post(url, ges)
table.foreach(res, print)
