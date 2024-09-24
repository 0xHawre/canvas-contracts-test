Scroll Canvas Developer Documentation
Components overview

(Editable link)

Overview
Scroll Canvas consists of the following components:

ProfileRegistry: A contract for users to mint and query their Canvases.
Profile: Each Canvas is an instance of the profile smart contract.
EAS: A technology for issuing on-chain attestations.
ScrollBadgeResolver: Each attestation passes through this resolver before the badge is minted. It enforces Canvas badge rules.
ScrollBadge: Each badge is a contract the conforms to a certain interface.
Profiles
Each user can mint a Profile instance through ProfileRegistry. This contract is the user's Canvas, and minting it is a prerequisite to collecting badges. Each wallet can only mint one profile. All profiles share the same implementation, upgradable by Scroll to enable new features.

The main use of profiles is personalization. Users can configure a username and an avatar. Users can also decide which badges they attach to their profile, and in which order they want to display them.

See the Canvas Interaction Guide section for more details.

ScrollBadge Schema and Resolver
We define a Scroll badge EAS schema:

address badge
bytes   payload
This schema is tied to ScrollBadgeResolver. Every time a Scroll badge attestation is created or revoked through EAS, ScrollBadgeResolver executes some checks and actions. After this, it forwards the call to the actual badge implementation.

You can find the schema UID in the Deployments section. Browse the Scroll mainnet badge attestations on the EAS Explorer.
## Running the Code

### Node.js

First install [`Node.js`](https://nodejs.org/en) and [`npm`](https://www.npmjs.com/).
Run the following command to install [`yarn`](https://classic.yarnpkg.com/en/):

```bash
npm install --global yarn
```

### Foundry

Install `foundryup`, the Foundry toolchain installer:

```bash
curl -L https://foundry.paradigm.xyz | bash
```

If you do not want to use the redirect, feel free to manually download the `foundryup` installation script from [here](https://raw.githubusercontent.com/foundry-rs/foundry/master/foundryup/foundryup). Then, run `foundryup` in a new terminal session or after reloading `PATH`.

Other ways to install Foundry can be found [here](https://github.com/foundry-rs/foundry#installation).

### Install Dependencies

Run the following command to install all dependencies locally.

```
yarn
```

### Run Contract Tests

Run the following command to run the contract tests.

```
yarn test
```

## Contributing

We welcome community contributions to this repository.
For larger changes, please [open an issue](https://github.com/scroll-tech/canvas-contracts/issues/new/choose) and discuss with the team before submitting code changes.

## License

Scroll Monorepo is licensed under the [MIT](./LICENSE) license.
