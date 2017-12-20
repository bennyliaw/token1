# Some Notes

# smart contract:
  - code is permanent after deployed. so token contract after released cannot be altered in any way
  - using scheme (e.g. factory, proxy...) to future proof ..
  - shall differentiate token (pre)sales contract (with sell, softcap, pausable, time contraint etc) vs token contract (the ERC20) itself
  - known attack:
          short addr attack etc (require payload size),
           uint boundary (use safemath), etc
  -


# solidity:
  - pure/view vs constant:
     * constant deprecated by ^.17 for function as confusing
     * pure not even accessing state var, eg. safemath lib only act on params
 - internal vs private:
     * internal is like protected in C++, allowing sub class to use
 - state (auto persisted, and would cost esp for writes) vs memory (local var)
 - reading state var is cheap, as can be done in/by local nodes


----

# reviewing DemoCoin ICO: https://erc20token.sonnguyen.ws/en/latest/
- need pragma, constant keywords to be replaced with view
- in transferFrom function the below memory assignment is redundant, could be inline same as updating balances state
    >> var _allowance = allowed[_from][msg.sender];
    


----
# ref

good intro on solidity & ethereum
  https://files.slack.com/files-pri/T8E3FSR17-F8HEEDJK0/introducing_ethereum_and_solidity.pdf

solidity ref:
  http://solidity.readthedocs.io/
