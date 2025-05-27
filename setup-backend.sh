#!/bin/bash
set -euo pipefail

# Define unique names (change STORAGE_ACCOUNT_NAME to a truly unique value)
RESOURCE_GROUP="${RESOURCE_GROUP:-myResourceGroup}"
LOCATION="${LOCATION:-eastus}"
CONTAINER_NAME="${CONTAINER_NAME:-tfstate}"
STORAGE_ACCOUNT_NAME="${STORAGE_ACCOUNT_NAME:-uniquestorage$(date +%s)}"

echo "Creating resource group: $RESOURCE_GROUP in $LOCATION..."
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

echo "Creating storage account: $STORAGE_ACCOUNT_NAME..."
az storage account create \
  --name "$STORAGE_ACCOUNT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --encryption-services blob

echo "Retrieving storage account key..."
ACCOUNT_KEY=$(az storage account keys list \
  --resource-group "$RESOURCE_GROUP" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --query '[0].value' -o tsv)

echo "Creating blob container: $CONTAINER_NAME..."
az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --account-key "$ACCOUNT_KEY"

echo "Storage account and container created successfully."
