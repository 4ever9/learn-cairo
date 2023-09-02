use starknet::ContractAddress;
use starknet::contract_address_const;
use debug::PrintTrait;
use openzeppelin::token::erc20::ERC20;
use erc20::YIIToken;

fn OWNER() -> ContractAddress {
    contract_address_const::<'OWNER'>()
}

#[test]
#[available_gas(2000000)]
fn test_create_erc20() {
    let mut state = YIIToken::contract_state_for_testing();
    let token = YIIToken::constructor(ref state, 10_000_000_000, OWNER());
    let name = YIIToken::name(@state);
    let symbol = YIIToken::symbol(@state);

    name.print();
    symbol.print();
}