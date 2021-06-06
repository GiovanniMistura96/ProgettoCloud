#! /bin/sh
helm delete mongo
helm delete frontend
kubectl delete pvc mongo-pvc

helm install mongo ./mongodb
helm install frontend ./application

echo "Sleeping for 20"
sleep 20
kubectl port-forward svc/frontend 8081:80  > /dev/null 2>&1 & 
