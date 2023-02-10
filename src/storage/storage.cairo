#[contract]
mod Storage {
    use starknet::get_caller_address;

    struct Storage {
        balance: felt, 
    }

    #[constructor]
    fn constructor() {
        balance::write(0)
    }


    #[external]
    fn increase_balance(amount: felt) {
        assert(amount != 0, 'Amount must be positive');
        let res = balance::read();
        balance::write(res + amount)
    }

    #[view]
    fn get_balance() -> felt {
        balance::read()
    }
}
