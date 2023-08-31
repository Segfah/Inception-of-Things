kubectl create namespace argocd
kubectl create namespace gitlab
# il faut creer le dev? ou la config le fait? 
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -n gitlab -f ./conf/gitlab.yaml


# para esperar a que los pods de argocd esten preparados. 
kubectl wait -n argocd --for=condition=Ready pods --all --timeout=-1s
kubectl wait -n gitlab --for=condition=Ready pods --all --timeout=-1s

#kubectl apply -n argocd -f ./conf/conf.yaml

argocd admin initial-password -n argocd

#kubectl port-forward svc/argocd-server -n argocd 8080:443
