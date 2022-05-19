RG=man-lab-ckablueprint-rg
VNET=ckabp-main-vnet
SNET=ckabp-main-snet
NSG=ckabp-main-nsg
LOCATION=southcentralus
VMUSERNAME="user01"
VMPASSWORD="C1sco123456$"
VMIMAGE="Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest"
VMSIZE="Standard_D2as_v4"
SSHKEY="lab-cka-sshkey.pub"

# create resource group
az group create -g $RG -l $LOCATION

# create common NSG
az network nsg create -g $RG --name $NSG --location $LOCATION

# create vnet and subnet
az network vnet create --resource-group $RG --location $LOCATION \
--name $VNET \
--address-prefixes 10.1.6.0/24 \
--subnet-name $SNET \
--subnet-prefixes 10.1.6.0/27

# following this guide: https://docs.linuxfoundation.org/tc-docs/certification/tips-cka-and-ckad

# vm list:
# 01-k8s  1 master 2 worker | flannel
# 02-hk8s 1 master 2 worker | calico
# 03-bk8s 1 master 1 worker | flannel
# 04-wk8s 1 master 2 worker | flannel
# 05-ek8s 1 master 2 worker | flannel
# 06-ik8s 1 master 1 base node | loopback | k8s cluster - missing worker node

# 00-jumphost =====
#===================
az vm create --resource-group $RG --location $LOCATION \
--name 00-jumphost \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.10 \
--public-ip-sku Standard \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

#====================================
# 01-k8s  1 master 2 worker | flannel
#====================================
az vm create --resource-group $RG --location $LOCATION \
--name 01-k8s-master \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.11 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 01-k8s-worker1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.12 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 01-k8s-worker2 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.13 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

#====================================
# 02-hk8s  1 master 2 worker | calico
#====================================
az vm create --resource-group $RG --location $LOCATION \
--name 02-hk8s-master \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.14 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 02-hk8s-worker1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.15 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 02-hk8s-worker2 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.16 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

#====================================
# 03-bk8s  1 master 1 worker | flannel
#====================================
az vm create --resource-group $RG --location $LOCATION \
--name 03-bk8s-master \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.17 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 03-bk8s-worker1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.18 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

#====================================
# 04-wk8s  1 master 2 worker | flannel
#====================================
az vm create --resource-group $RG --location $LOCATION \
--name 04-wk8s-master \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.19 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 04-wk8s-worker1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.20 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 04-wk8s-worker2 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.21 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

#====================================
# 05-ek8s  1 master 2 worker | flannel
#====================================
az vm create --resource-group $RG --location $LOCATION \
--name 05-ek8s-master \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.22 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 05-ek8s-worker1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.23 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 05-ek8s-worker2 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.24 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

#====================================
# 06-ik8s  1 master 1 worker | loopback
#====================================
az vm create --resource-group $RG --location $LOCATION \
--name 06-ik8s-master \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.25 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name 06-ik8s-worker1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.6.26 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

# clean up env

unset RG
unset VNET
unset SNET
unset LOCATION
unset VMUSERNAME
unset VMPASSWORD
unset VMSIZE
unset SSHKEY

# hub1-scus_to_labcka-scus_peer
# labcka-scus_to_hub1-scus_peer