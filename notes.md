# Certified Kubernetes Administrator exam notes
*2022.05.18*

## Topics and score weight

Application Lifecycle Management – 8%
Installation, Configuration & Validation – 12%
Core Concepts – 19%
Networking – 11%
Scheduling – 5%
Security – 12%
Cluster Maintenance – 11%
Logging / Monitoring – 5%
Storage – 7%
Troubleshooting – 10%

# installation

General steps:
- system pre-req
  - no swap
  - container runtime pre-req
    - https://kubernetes.io/docs/setup/production-environment/container-runtimes/
- install runtime
  - https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
  - kubeadm kubelet kubectl (or hold version here)
- create cluster (kubeadm init)

TODO:
- create token & join node







### init script:

sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/default.toml
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/default.toml
grep -i systemdcgroup /etc/containerd/default.toml
sudo systemctl restart containerd

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
