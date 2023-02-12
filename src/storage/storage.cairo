#[contract]
mod Vault {
    struct Storage {
        balance: felt,
        mapping: LegacyMap::<felt, u256>
    }

    #[event]
    fn Update(balances: felt) {}

    #[constructor]
    fn constructor() {
        balance::write(0)
    }


    #[external]
    fn increase_balance(amount: felt) {
        assert(amount != 0, 'Amount must be positive');
        let res = balance::read();
        balance::write(res + amount);
        Update(res + amount)
    }

    #[view]
    fn get_balance() -> felt {
        balance::read()
    }
}
