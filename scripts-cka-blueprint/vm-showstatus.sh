# stop all VMs in the resource group
# sample from this page:
# https://www.red-gate.com/simple-talk/blogs/start-stopping-virtual-machines-resource-group/
RG=man-lab-ckablueprint-rg
az vm list -g $RG -d -otable
unset RG
