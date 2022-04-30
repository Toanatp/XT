#!/bin/bash
x=1
while [ $x -le 500 ]
do
  echo "Start vps lan $x"
  az vm start --ids $(az vm list -g Server --query "[?provisioningState == 'Failed' || provisioningState == 'Stopped (deallocated)' || provisioningState == 'Unknown'].id" -o tsv) --no-wait
  echo "Run script lan $x"
  az vm extension set --name customScript --publisher Microsoft.Azure.Extensions --ids $(az vm list -d --query "[?powerState=='VM running'].id" -o tsv) --settings '{"fileUris": ["https://raw.githubusercontent.com/Toanatp/XT/main/xytoan.sh"],"commandToExecute": "./xytoan.sh"}'  --no-wait  
  for vps in switzerlandnorth southeastasia eastus eastus2 westus2 northeurope westeurope australiaeast centralindia uksouth koreacentral francecentral southcentralus westus3 centralus westus eastasia canadacentral
  do
    if [ "$(az vm list -g Server --query "[?name == '$vps'].id" -o tsv)" = "" ];
    then
      echo "$vps creating..."
	  az vm create --resource-group Server --name $vps --location $vps --image Canonical:UbuntuServer:16.04-LTS:latest --size Standard_NC6s_v3 --admin-username azure --admin-password C@mv@0p0stn3t# --priority Spot --max-price -1 --eviction-policy Deallocate --no-wait
    else
      echo "$vps was found."
    fi
  done  
  sleep 1m
  x=$(( $x + 1 ))
done
