# Explaining what is happening here

## renv snapshot

We do this based on the DESCRIPTION file so that

- we keep track of dependencies
- cache packages when running gh actions

```R
## initialize when starting fresh
renv::init()

## periodically update
renv::snapshot(type="explicit")
```



## Links

I took inspiration from these actions and yaml files

- https://github.com/marketplace/actions/github-pages-action
- https://github.com/r-lib/actions/blob/master/examples/bookdown.yaml

