### Command
Write kubeconfig file for a given cluster
```
eksctl utils write-kubeconfig -c <cluster name> -r 
<region> -p <profile>
```
eg: 
```eksctl utils write-kubeconfig -c fullstack_app -r ap-northeast-1 -p personal```