#[starknet::contract]
mod YIIToken {
    use starknet::ContractAddress;
    use openzeppelin::token::erc20::ERC20;

    #[storage]
    struct Storage {}

    #[constructor]
    fn constructor(ref self: ContractState, initial_supply: u256, recipient: ContractAddress) {
        let name = 'YII Token';
        let symbol = 'YII';

        let mut unsafe_state = ERC20::unsafe_new_contract_state();
        ERC20::InternalImpl::initializer(ref unsafe_state, name, symbol);
        ERC20::InternalImpl::_mint(ref unsafe_state, recipient, initial_supply);
    }

    #[external(v0)]
    fn name(self: @ContractState) -> felt252 {
        let unsafe_state = ERC20::unsafe_new_contract_state();
        ERC20::ERC20Impl::name(@unsafe_state)
    }

    #[external(v0)]
    fn symbol(self: @ContractState) -> felt252 {
        let unsafe_state = ERC20::unsafe_new_contract_state();
        ERC20::ERC20Impl::symbol(@unsafe_state)
    }
}

#[cfg(test)]
mod tests;
