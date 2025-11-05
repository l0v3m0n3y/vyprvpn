import asyncdispatch, httpclient, json, strutils

const api = "https://api.vyprvpn.com"
const api_2 = "https://validation.api.vyprvpn.com"
var headers = newHttpHeaders({"Connection": "keep-alive",  "Host": "vyprvpn.com",  "Content-Type": "application/x-www-form-urlencoded",  "accept": "application/json, text/plain, */*", "user-agent":"okhttp/4.12.0"})

proc my_ip*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api_2 & "/vyprvpn/connections/self")
    let body = await response.body
    result=parseJson(body)
  finally:
    client.close()

proc get_servers*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/vyprvpn/locations-unauthenticated")
    let body = await response.body
    result=parseJson(body)
  finally:
    client.close()
