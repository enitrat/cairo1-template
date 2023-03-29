use array::ArrayTrait;
use array::SpanTrait;
use contracts::storage::Vault;

#[test]
#[available_gas(999999)]
fn test_increase_amount() {
    let mut calldata = ArrayTrait::new();
    calldata.append(25);
    
    let val = Vault::balance::read();
    assert( val == 0, 'Balance aint 0' );
    
    Vault::__external::increase_balance(calldata.span());

    let new_val = Vault::balance::read();
    assert( new_val == 25, 'Balance aint 25' );
}
