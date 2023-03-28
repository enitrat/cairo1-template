#[contract]
mod Vault {
    struct Storage {
        balance: felt252,
        mapping: LegacyMap::<felt252, u256>
    }

    #[event]
    fn Update(balances: felt252) {}

    #[constructor]
    fn constructor() {
        balance::write(0)
    }


    #[external]
    fn increase_balance(amount: felt252) {
        assert(amount != 0, 'Amount must be positive');
        let res = balance::read();
        balance::write(res + amount);
        Update(res + amount)
    }

    #[view]
    fn get_balance() -> felt252 {
        balance::read()
    }
}
