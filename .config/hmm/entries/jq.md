# jq

### Given
```json
[{
  "field1": "value1",
  "field2": "value2",
  "field3": "value3"
}]
```

```bash
# just get the fields
jq '.[] | .field1,.field3'
"value1"
"value3"

# preserve the json 
jq '.[] | { field1, field3 }'
{
  "field1": "value1",
  "field3": "value3"
}

# preserve the array
jq '[.[] | { field1, field3 }]'
[
  {
    "field1": "value1",
    "field3": "value3"
  }
]
```

