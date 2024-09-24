Scroll Canvas Developer Documentation
Components Overview
(Editable link)


Overview
Scroll Canvas consists of the following components:

ProfileRegistry: A contract for users to mint and query their Canvases.
Profile: Each Canvas is an instance of the profile smart contract.
EAS (Ethereum Attestation Service): A technology for issuing on-chain attestations.
ScrollBadgeResolver: Each attestation passes through this resolver before the badge is minted. It enforces Canvas badge rules.
ScrollBadge: Each badge is a contract that conforms to a specific interface.
