#!/bin/bash

# NOTE: This script will let you use the Foundry framework,
# to deploy the SimpleStorage contract, on the Sepolia Testnet,
# using Alchemy (Alchemy acts as a "node-as-a-service")

# NOTE: How to use this script:

# Step 1: Make sure that you are in the root directory of your project
# E.g. simple-storage-foundry/ 

# Step 2:
# First make this script executable by running this command while:
# chmod +x deploy-SimpleStorage.sh

# Step 3:
# Source this script to make the command available:
# source deploy-SimpleStorage.sh

# Step 4:
# You can now deploy your contract with one command!
# Use this command:
# deploy-SimpleStorage

#------------------------------------------------------------------------------

# Vararibles

# This is what will deploy the contract:
DEPLOY_SCRIPT=script/DeploySimpleStorage.s.sol 

# This is the end point where the contract will be deployed to:
RPC_URL=https://eth-sepolia.g.alchemy.com/v2/g2KRfy52yVOp-kdHUAU3FKOiYLv-lSFx
# This is the encrypted private key of the account,
# that will be used to deploy the contract.
# This way your private key is never exposed in plain text durin deployment.
SENDER_PRIVATE_KEY=sepolia-test-account-metamask

# This is the public key (aka public address) of the account,
# that is associated with the encrypted private key.
SENDER_PUBLIC_KEY=0xfE301B6a4DA8969FF1010Eb4dbc30f503EB68b1B

#------------------------------------------------------------------------------

# Deployment Command

deploy-SimpleStorage() {
    forge script "$DEPLOY_SCRIPT" \
        --rpc-url "$RPC_URL" \
        --account "$SENDER_PRIVATE_KEY" \
        --sender "$SENDER_PUBLIC_KEY" \
        --broadcast
}

#------------------------------------------------------------------------------
