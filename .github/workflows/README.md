# Explaining what is happening here

## renv snapshot

We do this based on the DESCRIPTION file so that

- we keep track of dependencies
- cache packages when running gh actions

```R
## initialize when starting fresh
renv::init(bare = TRUE)

## periodically update
renv::snapshot(type="explicit")
```


