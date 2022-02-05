# Stone DevOps challange
  
  Create a Kubernetes cluster on AWS and within it have a tool where we can measure the latency between the nodes of the cluster. All provisioned using terraform.
  
  
  ### **Diagram of infrastructure built on AWS provisioned using terraform.**
  ![stone_challeng](https://user-images.githubusercontent.com/55967749/152402662-bc9e1053-9454-4c9d-9d4b-ae727c1eed4b.png)  
  
 ### **Important informations:**
  - In the EKS control plane will be the master components of the cluster, such as etcd, controller and sheduler. All these are managed by AWS, there will be no access to these instances. We will access the management of workers only.
  - You must create a VPC to create an isolated network environment for the cluster.
  - At least two Availability Zones (AZ) inside the VPC are required to create the EKS cluster.
  - The creation of two subnets in each AZ, being a public and a private subnet. All pods will be created inside the private subnet and the internet access will go through the public subnet through a NAT.
  
### Terraform Modules

We use terraform modules to be able to reuse all the codes that were created in each folder, in this way it becomes an organized project and easy to find each code.
  
#### **About the project structure, just to clarify:**
- We have a paste with the terraform modules, called modules, inside has the "master", "network" and "node" pastes, each one has the .tf files.
- The network module contains all the network configuration (vpc, subnet, internet gw, nat and etc)
- The master module has the EKS control plane configuration.
- In node you have the workers configuration.
- At the root we have the .tf files that will merge all the modules.

## Now we will show how built this infrastructure
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












