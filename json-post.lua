package.path = './ext/JSON4Lua-0.9.30/json/?.lua;' .. package.path
module('json-post', package.seeall)
local json = require('json')
local http = require('socket.http')
local io = require("io")
local ltn12 = require("ltn12")

function post(url, data)
   local res = {}
   data = json.encode(data)
   http.request{
     url = url,
     method = "POST",
     headers = 
        {
        ["Content-Type"] = "application/json",
        ["Content-Length"] = #data,
        },
     source = ltn12.source.string(data),
     sink = ltn12.sink.table(res)
   }
   return res
end