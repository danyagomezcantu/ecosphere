const EcoChainNFT = artifacts.require("EcoChainNFT");
const IdentityManagement = artifacts.require("IdentityManagement");
const Verification = artifacts.require("Verification");
const Marketplace = artifacts.require("Marketplace");
const EASAttestation = artifacts.require("EASAttestation");
const PythOracleIntegration = artifacts.require("PythOracleIntegration");
const Governance = artifacts.require("Governance");

module.exports = async function (deployer) {
  // Deploy the core contracts
  await deployer.deploy(EcoChainNFT);
  await deployer.deploy(IdentityManagement);
  await deployer.deploy(Verification);
  await deployer.deploy(Marketplace);

  // Deploy the EAS Attestation contract with the necessary address parameter
  const easAddress = "0xYourEASAddress";  // Replace with the actual EAS address
  await deployer.deploy(EASAttestation, easAddress);

  // Deploy the Pyth Oracle Integration contract with the necessary address parameter
  const pythAddress = "0xYourPythAddress";  // Replace with the actual Pyth address
  await deployer.deploy(PythOracleIntegration, pythAddress);

  // Deploy the Governance contract, assuming the governance token is already deployed
  const governanceTokenAddress = "0xYourGovernanceTokenAddress";  // Replace with the actual Governance token address
  await deployer.deploy(Governance, governanceTokenAddress);
};
