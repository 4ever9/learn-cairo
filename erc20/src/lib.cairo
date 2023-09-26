#[starknet::contract]
mod YIIToken {
    use starknet::ContractAddress;
    use openzeppelin::token::erc20::ERC20;
    use starknet::contract_address_const;
    
    #[storage]
    struct Storage {}

    #[constructor]
    fn constructor(ref self: ContractState) {
        let name = 'YII Token';
        let symbol = 'YII';

        let mut unsafe_state = ERC20::unsafe_new_contract_state();
        ERC20::InternalImpl::initializer(ref unsafe_state, name, symbol);
        ERC20::InternalImpl::_mint(ref unsafe_state, contract_address_const::<'OWNER'>(), 1000_000_000);
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
