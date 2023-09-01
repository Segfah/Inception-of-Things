kubectl create namespace argocd
kubectl create namespace dev

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait -n argocd --for=condition=Ready pods --all --timeout=-1s

kubectl apply -n argocd -f ./conf/conf.yaml
