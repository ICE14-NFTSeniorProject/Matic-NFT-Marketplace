import * as dotenv from "dotenv";

import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "hardhat-gas-reporter";
import "solidity-coverage";
import { HardhatUserConfig } from "hardhat/config";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.9",
  networks: {
    hardhat: {
      chainId: 1337,
    },
    goerli: {
      url: `https://goerli.infura.io/v3/${process.env.PROJECT_ID}`,
      accounts: [process.env.METAMASK_PRIVATE_KEY ?? ""],
    },
    mumbai: {
      url: process.env.POLYGON_MUMBAI,
      accounts: [process.env.METAMASK_PRIVATE_KEY ?? ""],
    },
    mainnet: {
      url: `https://mainnet.infura.io/v3/${process.env.PROJECT_ID}`,
    },
  },
};

export default config;
