#!/usr/bin/bash
### GitHub-Org-Downloader Script ###
# WSmyth
ORG=$1

curl -s https://api.github.com/orgs/"${ORG}"/repos?per_page=200 | python -c $'import json, sys, os\nfor repo in json.load(sys.stdin): os.system("git clone " + repo["ssh_url"])'