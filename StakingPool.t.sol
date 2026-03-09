// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./StakingPool.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 1000000 ether);
    }
}

contract StakingTest is Test {
    StakingPool public pool;
    MockERC20 public sToken;
    MockERC20 public rToken;
    address public user = address(1);

    function setUp() public {
        sToken = new MockERC20("Stake", "STK");
        rToken = new MockERC20("Reward", "RWD");
        pool = new StakingPool(address(sToken), address(rToken));

        rToken.transfer(address(pool), 10000 ether);
        sToken.transfer(user, 1000 ether);
    }

    function testStakeAndEarn() public {
        vm.startPrank(user);
        sToken.approve(address(pool), 100 ether);
        pool.stake(100 ether);
        
        vm.warp(block.timestamp + 100); // Fast forward 100 seconds
        
        uint256 earnings = pool.earned(user);
        assertTrue(earnings > 0);
        pool.getReward();
        assertEq(rToken.balanceOf(user), earnings);
        vm.stopPrank();
    }
}
