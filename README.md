# vyprvpn
api for vyprvpn android vpn service
# Example
```nim
import asyncdispatch, vyprvpn, json

let data = waitFor get_servers()
echo data
let servers=data["locations"]
for server in servers:
  try:
    echo server["country"].getStr()
    echo server["ip"].getStr()
    echo server["basename"].getStr() & " : " & server["hostname"].getStr()
  except Exception as e:
    discard
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
