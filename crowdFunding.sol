pragma solidity ^0.8.0;

contract CrowdFunding {
    address public owner;
    mapping(address => uint256) public contributions;
    uint256 public goal;
    uint256 public deadline;
    address payable[] public contributors;
    bool public goalReached;
    event GoalReached();
    event FundTransfer(address sender, uint256 amount);
    event ProjectCancelled();

    constructor() public {
        owner = msg.sender;
        goal = 100 ether; // set the goal for the funding in ether
        deadline = now + 1 weeks; // set the deadline for the funding
    }

    function contribute() payable public {
        require(msg.value > 0);
        require(now <= deadline);
        require(!goalReached);
        contributions[msg.sender] += msg.value;
        contributors.push(msg.sender);
        emit FundTransfer(msg.sender, msg.value);
        if (address(this).balance >= goal) {
            goalReached = true;
            emit GoalReached();
        }
    }

    function cancel() public {
        require(msg.sender == owner);
        require(!goalReached);
        emit ProjectCancelled();
        owner.transfer(address(this).balance);
    }

    function withdraw() public {
        require(msg.sender == owner);
        require(goalReached);
        owner.transfer(address(this).balance);
    }
}
