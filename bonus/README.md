## install envirenement
```
make install
```


```
kubectl port-forward service/gitlab-service 8080:80 -n testgitlab
```

```
kubectl apply -n argocd -f ./conf/conf.yaml
kubectl apply -n gitlab -f ./conf.yaml
```


```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

```
kubectl exec --stdin --tty (nom du pod) -n gitlab -- cat /etc/gitlab/initial_root_password
```
