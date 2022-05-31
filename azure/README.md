### Instructions

Login on Azure account and select target subscription
```BASH
az login
az account set --subscription "<SUBSCRIPTION_ID>"
```

Create service principal on Azure
```BASH
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```

Setup environment variables regarding Azure Service Principal
```BASH
export ARM_CLIENT_ID="<APPID_VALUE>"
export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
export ARM_TENANT_ID="<TENANT_VALUE>"
```

Init, validate and run the terraform files
```BASH
terraform init
terraform validate
terraform apply
```
