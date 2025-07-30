# gh
```bash
gh secret -R UKGEPIC/<repo-name> set SECRET_NAME --body "$(pbpaste)"
```

```bash
gh webhook forward --events="*" --repo="<org-name>/<repo-name>" --url="localhost:3000/"
```

Check on rate limit for a token:
```bash
# copy token onto clipboard

# fish
set -gx GITHUB_TOKEN (pbpaste)
# bash
export GITHUB_TOKEN=$(pbpaste)

gh api rate_limit | jq '.rate.remaining'
```






