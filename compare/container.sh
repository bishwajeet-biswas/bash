#!/bin/bash


name="botsmsmodule
channelmsgbroker
facebook-adaptor
fructify
hangout-adaptor
integration
multitenancy-ejabberd-haproxy
nlu-1
notification
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
widget-multi-tenancy"

for i in $name
  do  
    kubectl get deploy $i -n stage -o jsonpath='{.spec.template.spec.containers[*].name}'
    echo
  done



