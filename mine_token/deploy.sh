export PRE_MINTED_TOKENS=42_000_000_000_000_000
export DEFAULT=$(dfx identity get-principal)
export TRANSFER_FEE=0
export ARCHIVE_CONTROLLER=$(dfx identity get-principal)
export TRIGGER_THRESHOLD=2000
export CYCLE_FOR_ARCHIVE_CREATION=100000000
export NUM_OF_BLOCK_TO_ARCHIVE=1000
export TOKEN_NAME="Fake MinePro"
export TOKEN_SYMBOL="FMINE"
export MINTER=$(dfx identity get-principal)
export FEATURE_FLAGS=true
export NULL_ADDRESS="aaaaa-aa"

# fake MINE
dfx deploy mine --network ic --argument "(variant {Init =
record {
  token_symbol = \"${TOKEN_SYMBOL}\";
  token_name = \"${TOKEN_NAME}\";
  transfer_fee = ${TRANSFER_FEE};
  metadata = vec {};
  feature_flags = opt record{icrc2 = ${FEATURE_FLAGS}};
  minting_account = record { owner = principal \"${NULL_ADDRESS}\" };
  initial_balances = vec { record { record { owner = principal \"${MINTER}\"; }; ${PRE_MINTED_TOKENS}; }; };
  initial_mints = vec { record { owner = principal \"${MINTER}\"; ${PRE_MINTED_TOKENS}; } };
  archive_options = record {
    num_blocks_to_archive = ${NUM_OF_BLOCK_TO_ARCHIVE};
    trigger_threshold = ${TRIGGER_THRESHOLD};
    controller_id = principal \"${ARCHIVE_CONTROLLER}\";
    cycles_for_archive_creation = opt ${CYCLE_FOR_ARCHIVE_CREATION};
  };
}})"

# fake ckBTC
dfx deploy ckbtc --network ic --argument "(variant {Init =
record {
  token_symbol = \"ckBTC\";
  token_name = \"Fake ckBTC\";
  transfer_fee = ${TRANSFER_FEE};
  metadata = vec {};
  feature_flags = opt record{icrc2 = ${FEATURE_FLAGS}};
  minting_account = record { owner = principal \"${NULL_ADDRESS}\" };
  initial_balances = vec { record { record { owner = principal \"${MINTER}\"; }; ${PRE_MINTED_TOKENS}; }; };
  initial_mints = vec { record { owner = principal \"${MINTER}\"; ${PRE_MINTED_TOKENS}; } };
  archive_options = record {
    num_blocks_to_archive = ${NUM_OF_BLOCK_TO_ARCHIVE};
    trigger_threshold = ${TRIGGER_THRESHOLD};
    controller_id = principal \"${ARCHIVE_CONTROLLER}\";
    cycles_for_archive_creation = opt ${CYCLE_FOR_ARCHIVE_CREATION};
  };
}})"
