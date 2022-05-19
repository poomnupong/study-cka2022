RG=man-lab-cka20211229-rg
VNET=ckabp-main-vnet
SNET=ckabp-main-snet
NSG=ckabp-main-nsg
LOCATION=southcentralus
VMUSERNAME="user01"
VMPASSWORD="C1sco123456$"
VMIMAGE="Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest"
VMSIZE="Standard_D2as_v4"
SSHKEY="id_rsa-poomkey.pub"

az group create -g $RG -l $LOCATION

az network vnet create --resource-group $RG --location $LOCATION \
--name $VNET \
--address-prefixes 10.1.5.0/24 \
--subnet-name $SNET \
--subnet-prefixes 10.1.5.0/27

# az network vnet subnet create --resource-group $RG \
# --vnet-name $VNET \
# --name BastionSubnet \
# --address-prefixes 172.16.0.0/27

az vm create --resource-group $RG --location $LOCATION \
--name c1-cp1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--nsg "" \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.5.10 \
--public-ip-sku Standard \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name c1-node1 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--nsg "" \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.5.11 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name c1-node2 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--nsg "" \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.5.12 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

az vm create --resource-group $RG --location $LOCATION \
--name c1-node3 \
--admin-username $VMUSERNAME \
--admin-password $VMPASSWORD \
--authentication-type all \
--nsg "" \
--image $VMIMAGE \
--size $VMSIZE \
--vnet-name $VNET \
--subnet $SNET \
--private-ip-address 10.1.5.13 \
--public-ip-address "" \
--priority Spot \
--max-price -1 \
--nsg $NSG \
--ssh-key-values $SSHKEY \
--no-wait

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