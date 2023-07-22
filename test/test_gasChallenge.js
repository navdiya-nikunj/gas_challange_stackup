const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Deploy Gas Challenge Contract", () => {
  let gas_contract;

  beforeEach(async () => {
    const gas_challenge_contract = await ethers.getContractFactory(
      "gasChallenge"
    );
    gas_contract = await gas_challenge_contract.deploy();
  });

  describe("Compute Gas", () => {
    it("Should return lower gas", async () => {
      await gas_contract.notOptimizedFunction();
      await gas_contract.optimizedFunction();
    });
  });

  describe("Check Sum Of Array", () => {
    it("Should return 0", async () => {
      // call optimized functions
      await gas_contract.optimizedFunction();
      // call getSumOfArray function and store return value in sum
      const sum = await gas_contract.getSumOfArray();
      // compare sum to 0 for testcase.
      expect(sum).to.equal(0);  
    });
  });
});
