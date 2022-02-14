import commands
import json
import sys


arg = ""
if len(sys.argv) >= 2:
    arg = sys.argv[1]


res = []
out = commands.getoutput('./get-tabs.scpt')
for name in out.split(";"):
    if name != "" and arg in name: 
        res.append({"title":name, "subtitle":"", "arg": name})

if len(res) == 0:
    res.append({"title":"404", "subtitle":"Not Found"})


print(json.dumps({"items":res}))

