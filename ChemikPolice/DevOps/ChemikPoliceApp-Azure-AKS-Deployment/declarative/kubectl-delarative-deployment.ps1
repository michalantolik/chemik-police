kubectl delete deployment chemikpolice-app
kubectl delete service chemikpolice-app

###########################################################################
### Create deployment
###########################################################################

kubectl create -f .\chemikpolice-app.yml

###########################################################################
### Check deployment
###########################################################################

kubectl get deployment
kubectl get svc

###########################################################################
### Delete deployment
###########################################################################

kubectl delete -f .\chemikpolice-app.yml
