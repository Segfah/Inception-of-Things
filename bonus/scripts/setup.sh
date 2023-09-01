kubectl create namespace argocd
kubectl create namespace gitlab

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -n gitlab -f ./conf/gitlab.yaml

kubectl wait -n argocd --for=condition=Ready pods --all --timeout=-1s
kubectl wait -n gitlab --for=condition=Ready pods --all --timeout=-1s

