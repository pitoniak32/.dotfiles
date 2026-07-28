# jj

## get changes from remote

```bash
jj git fetch
jj rebase -o main
jj bookmark advance
```

## See the "evo"lution of a change

```bash
jj evolog -r change-id
```

## check a change for divergence
```bash
jj log -r 'change_id(change-id)'
```

## Abandon and entire "branch" of changes
```text
O
|
| N
| |
| M
| |
| K       O
|/   =>   |
J         J
```
```bash
jj abandon K::
```



