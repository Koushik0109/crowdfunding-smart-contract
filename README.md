#Decentralized Crowdfunding Smart Contract
This smart contract allows for the creation of decentralized crowdfunding campaigns on the Ethereum blockchain. It allows for individuals to contribute funds to a project and for the project owner to withdraw the funds if the funding goal is reached.

Features
Set funding goal and deadline
Allow for contributions to be made in Ether
Track contributions made by each address
Goal reached flag and event
Cancel project function and event
Withdraw funds function for project owner
Usage
To use the contract, you will need to deploy it on the Ethereum blockchain using a tool such as Remix. Once deployed, the contract owner can set the funding goal and deadline using the constructor() function.

Anyone can then contribute to the funding campaign by calling the contribute() function and sending Ether to the contract's address. The contract will track the contributions made by each address and emit a FundTransfer event.

If the funding goal is reached before the deadline, the goalReached flag will be set to true and the GoalReached event will be emitted. The contract owner can then call the withdraw() function to withdraw the funds.

If the project needs to be cancelled before the goal is reached, the contract owner can call the cancel() function. This will emit the ProjectCancelled event and return the funds to the contributors.
