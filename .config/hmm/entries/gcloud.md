# gcloud

## Auth

```bash
# login with adc
gcloud auth application-default login

# login with a json key
gcloud auth activate-service-account --key-file=PATH_TO_KEY.json
```

## General
view a secret
```
gcloud --project=d-ulti-devx-quark-system-8bc7 secrets versions access latest --secret=""
```
