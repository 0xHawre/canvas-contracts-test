# Scroll Canvas Developer Documentation

## Components Overview

*(Editable link)*  
![image](https://github.com/user-attachments/assets/6160d661-8569-4bd5-82c4-916f41d0bf7f)

### Overview
Scroll Canvas consists of the following components:

* **ProfileRegistry**: A contract for users to mint and query their Canvases.
* **Profile**: Each Canvas is an instance of the profile smart contract.
* **EAS (Ethereum Attestation Service)**: A technology for issuing on-chain attestations.
* **ScrollBadgeResolver**: Each attestation passes through this resolver before the badge is minted. It enforces Canvas badge rules.
* **ScrollBadge**: Each badge is a contract that conforms to a specific interface.

### Profiles
Each user can mint a Profile instance through `ProfileRegistry`. This contract acts as the user's Canvas, and minting it is a prerequisite for collecting badges. Each wallet can mint only one profile, and all profiles share the same implementation, upgradable by Scroll to enable new features.

The primary purpose of profiles is personalization. Users can configure a username and an avatar. Additionally, users can choose which badges to display on their profile and in which order.

For more details, see the **Canvas Interaction Guide** section.

### ScrollBadge Schema and Resolver
We define a Scroll Badge EAS schema as follows:

* **address**: The badge's address.
* **bytes**: The payload associated with the badge.

This schema is linked to `ScrollBadgeResolver`. Whenever a Scroll Badge attestation is created or revoked via EAS, `ScrollBadgeResolver` performs checks and actions, forwarding the call to the actual badge implementation afterward.

You can find the schema UID in the **Deployments** section.  
To explore Scroll mainnet badge attestations, visit the [EAS Explorer](https://explorer.scroll.io).

---

## Running the Code

### Prerequisites
To run the project, you will need to install the following:

* [`Node.js`](https://nodejs.org/en)
* [`npm`](https://www.npmjs.com/)

After installing `npm`, use the following command to install `yarn` globally:

```bash
npm install --global yarn
```
Foundry Setup
Install foundryup, the installer for Foundry's toolchain:

```bash
curl -L https://foundry.paradigm.xyz | bash
```
If you prefer not to use a redirect, you can manually download the foundryup script here. After installation, run foundryup in a new terminal session or reload your terminal's PATH.

Alternative installation methods can be found in the Foundry GitHub repository.

Install Dependencies
Once you have the necessary prerequisites, install all local dependencies by running:
```bash
yarn
```
Running Contract Tests
To run the contract tests, execute:
```bash
yarn test
```

