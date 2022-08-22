> ## Create space to save Jenkins in local

`./init.sh`

> ## Run docker-compose to init Jenkins

`docker-compose up -d`

## Check port Jenkins start

`echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'`

Or

```
localhost:8080
```
