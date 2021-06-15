#!/usr/bin/env python3.7
import sys
import base64
import requests
import json
import os

# Usage : img2tex.py <png_source> <tex_destination>
# CLIPBOARD

# put desired file path here
path = os.path.expanduser(sys.argv[1])

PNG_EXTN = ".png"

for entry in os.scandir(path) :
    if not entry.name.endswith(PNG_EXTN) :
        continue

    print(f"Converting {entry.path}... ", end="")

    image_uri = "data:image/png;base64," + base64.b64encode(open(entry.path, "rb").read()).decode()

    args = {
        'src': image_uri,
        'formats': ['text']
    }

    r = requests.post("https://api.mathpix.com/v3/text",
        data=json.dumps(args),
        headers={"app_id": "thurman_ye_gmail_com_72bb8c_2daf8d", 
                 "app_key": "ec3ec683261268354164ae53c6933dc2eb15373a587b8e6663208dccb133c2f2",
                 "Content-type": "application/json"}
    )

    j = json.loads(r.text)

    with open(os.path.join(path, entry.name[:-len(PNG_EXTN)] + ".tex"), 'w') as f :
        try :
            f.write(j['text'])
        except :
            print(json.dumps(json.loads(r.text), indent=4, sort_keys=True))

    print("Done.")
