# Recon-automation
This repository can be used to automate bug bounty recon assessment by running subfinder, httpx and naabu in one script.

The `recon-basic.sh` script uses subfinder to collect subdomains and then do http probe with httpx and collect extra information. The `recon-full.sh` script just adds naabu between `subfinder` and `httpx` to scan ports and expand the attack surface

## Prerequirements

You need to have `httpx` and `subfinder` for `recon-basic.sh` and also `naabu` for `recon-full.sh`
