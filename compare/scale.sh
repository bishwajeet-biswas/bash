#!/bin/bash

comp="botsmsmodule
channelmsgbroker
fructify
goresponder
hangout-adaptor
integration
mdw-14
mdw-4
mdw-5
mdw-6
mdw-ko-pre
mdw-mobility
mdw-public-mobile
multitenancy-ejabberd-haproxy
nlu-1
notification
qna-maker
s0-nlu
stage-adminpanel
stage-botadminapi
stage-bottrainer
stage-bulkinsert
stage-ejabberd
stage-elasticsearch
stage-haproxy
stage-haproxy-ui
stage-mdw-1
stage-nlu-haproxy
stage-rabbitmq
stage-redis
stage-ui
stage-userpanel
url-shortner
widget-multi-tenancy"

for i in $comp
do
	kubectl scale deploy $i --replicas=0
	echo
done

