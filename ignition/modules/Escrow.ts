import { ethers } from "hardhat";
import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const EscrowModule = buildModule("EscrowModule", (m) => {
    const buyer = "0x7d9e9A37BcB601912eEe6c599AdF786DB775B8EA";
    const seller = "0xcFeFD54F7D10698b348C9B02D137268d9450AD28";
    const depositAmount = ethers.parseEther("1"); 
    const deployEscrow = m.contract("Escrow", [buyer, seller, depositAmount]);

    return { deployEscrow };
});

export default EscrowModule;

