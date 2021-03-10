#!/bin/bash
newIdxFile = $1

nIFExt = "${newIdxFile##*.}"

if [ "$nIFExt" != ".htm" ] && [ "$nIFExt" != ".html" ]; then
    echo "This is not a html file!"
    exit 1
fi

read -p "Please enter OpenWRT's IP address (also is default gateway): " oWRTIP
echo "Uploading new index file to router..."
scp $newIdxFile root@"$oWRTIP":/tmp/index.html
echo "Executing replacement, DO NOT TERMINATE!..."
ssh root@"$oWRTIP" curl https://gist.githubusercontent.com/rk0cc/ff9482864b2c11559b26ea5532959134/raw/f57a3945c1bf146d6f272c6d2ed969aaeb0d4a7c/pagesetup.sh -o /tmp/luciidx.sh; chmod +x /tmp/luciidx.sh; /tmp/luciidx.sh
echo "Replacement has been finished!"