# Stone DevOps challange
  
  Create a Kubernetes cluster on AWS and within it have a tool where we can measure the latency between the nodes of the cluster. All provisioned using terraform.

### **Requirements:**
- AWS CLI installed Version 3.73.0
- Terraform installed Version 1.0.8
- kubectl installed and knowledge to manage
- helm installed and knowledge to manage
- git installed

## **Download files** 
```
git clone https://github.com/kayketeixeira/Desafio_Stone
```

## **Installation** 
```
terraform init
```

## **Validate the code** 
```
terraform validate
```

## **Apply and confirm all the infrastructure that will be built on AWS** 
```
terraform apply
```

## **Adding our cluster's context to kubectl** 
```
aws eks --region us-west-w update-kubeconfig --name eks-cluster-kayke
```
```
kubectl get nodes
```

## **Add repository prometheus on your helm and update** 
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

## **Deploy prometheus on your nodes using helm** 
```
helm install prometheus prometheus-community/kube-prometheus-stack
```

## **Access grafana using port-forward on kubectl, get the deployments to access** 
```
kubectl port-forward deployment.apps/prometheus-grafana 3000
```

## **On your browser, access 127.0.0.1:3000** 
```
http://127.0.0.1:3000
user: admin
Password: prom-operator
```
or you can use loadbalancer service to access externally and inform your ip address on LB-service.yaml file.
```
kubectl create -f service\LB-service.yaml
```
Check the public address in the service lb-service-grafana and lb-service-prometheus, wait for replication to complete for public DNS.
```
kubectl get svc
```
Access on your browser.














