kubectl delete --all ingresses
kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all services
kubectl delete --all pvc

kubectl delete ingresses --all --all-namespaces
kubectl delete deployment --all --all-namespaces
kubectl delete service --all --all-namespaces
kubectl delete pod --all --all-namespaces
kubectl delete replicaset --all --all-namespaces
kubectl delete statefulset --all --all-namespaces
kubectl delete jobs --all -n kube-system
