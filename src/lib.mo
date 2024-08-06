// This is a generated Motoko binding.
// Please use `import service "ic:canister_id"` instead to call canisters on the IC if possible.

module {
  public type bitcoin_address = Text;
  public type bitcoin_get_balance_args = {
    network : bitcoin_network;
    address : bitcoin_address;
    min_confirmations : ?Nat32;
  };
  public type bitcoin_get_balance_query_args = {
    network : bitcoin_network;
    address : bitcoin_address;
    min_confirmations : ?Nat32;
  };
  public type bitcoin_get_balance_query_result = satoshi;
  public type bitcoin_get_balance_result = satoshi;
  public type bitcoin_get_current_fee_percentiles_args = {
    network : bitcoin_network;
  };
  public type bitcoin_get_current_fee_percentiles_result = [
    millisatoshi_per_byte
  ];
  public type bitcoin_get_utxos_args = {
    network : bitcoin_network;
    filter : ?{ #page : Blob; #min_confirmations : Nat32 };
    address : bitcoin_address;
  };
  public type bitcoin_get_utxos_query_args = {
    network : bitcoin_network;
    filter : ?{ #page : Blob; #min_confirmations : Nat32 };
    address : bitcoin_address;
  };
  public type bitcoin_get_utxos_query_result = {
    next_page : ?Blob;
    tip_height : Nat32;
    tip_block_hash : block_hash;
    utxos : [utxo];
  };
  public type bitcoin_get_utxos_result = {
    next_page : ?Blob;
    tip_height : Nat32;
    tip_block_hash : block_hash;
    utxos : [utxo];
  };
  public type bitcoin_network = { #mainnet; #testnet };
  public type bitcoin_send_transaction_args = {
    transaction : Blob;
    network : bitcoin_network;
  };
  public type block_hash = Blob;
  public type canister_id = Principal;
  public type canister_info_args = {
    canister_id : canister_id;
    num_requested_changes : ?Nat64;
  };
  public type canister_info_result = {
    controllers : [Principal];
    module_hash : ?Blob;
    recent_changes : [change];
    total_num_changes : Nat64;
  };
  public type canister_install_mode = {
    #reinstall;
    #upgrade : ?{
      wasm_memory_persistence : ?{ #keep; #replace };
      skip_pre_upgrade : ?Bool;
    };
    #install;
  };
  public type canister_log_record = {
    idx : Nat64;
    timestamp_nanos : Nat64;
    content : Blob;
  };
  public type canister_settings = {
    freezing_threshold : ?Nat;
    controllers : ?[Principal];
    reserved_cycles_limit : ?Nat;
    log_visibility : ?log_visibility;
    wasm_memory_limit : ?Nat;
    memory_allocation : ?Nat;
    compute_allocation : ?Nat;
  };
  public type canister_status_args = { canister_id : canister_id };
  public type canister_status_result = {
    status : { #stopped; #stopping; #running };
    memory_size : Nat;
    cycles : Nat;
    settings : definite_canister_settings;
    query_stats : {
      response_payload_bytes_total : Nat;
      num_instructions_total : Nat;
      num_calls_total : Nat;
      request_payload_bytes_total : Nat;
    };
    idle_cycles_burned_per_day : Nat;
    module_hash : ?Blob;
    reserved_cycles : Nat;
  };
  public type change = {
    timestamp_nanos : Nat64;
    canister_version : Nat64;
    origin : change_origin;
    details : change_details;
  };
  public type change_details = {
    #creation : { controllers : [Principal] };
    #code_deployment : {
      mode : { #reinstall; #upgrade; #install };
      module_hash : Blob;
    };
    #controllers_change : { controllers : [Principal] };
    #code_uninstall;
  };
  public type change_origin = {
    #from_user : { user_id : Principal };
    #from_canister : { canister_version : ?Nat64; canister_id : Principal };
  };
  public type chunk_hash = { hash : Blob };
  public type clear_chunk_store_args = { canister_id : canister_id };
  public type create_canister_args = {
    settings : ?canister_settings;
    sender_canister_version : ?Nat64;
  };
  public type create_canister_result = { canister_id : canister_id };
  public type definite_canister_settings = {
    freezing_threshold : Nat;
    controllers : [Principal];
    reserved_cycles_limit : Nat;
    log_visibility : log_visibility;
    wasm_memory_limit : Nat;
    memory_allocation : Nat;
    compute_allocation : Nat;
  };
  public type delete_canister_args = { canister_id : canister_id };
  public type deposit_cycles_args = { canister_id : canister_id };
  public type ecdsa_curve = { #secp256k1 };
  public type ecdsa_public_key_args = {
    key_id : { name : Text; curve : ecdsa_curve };
    canister_id : ?canister_id;
    derivation_path : [Blob];
  };
  public type ecdsa_public_key_result = {
    public_key : Blob;
    chain_code : Blob;
  };
  public type fetch_canister_logs_args = { canister_id : canister_id };
  public type fetch_canister_logs_result = {
    canister_log_records : [canister_log_record];
  };
  public type http_header = { value : Text; name : Text };
  public type http_request_args = {
    url : Text;
    method : { #get; #head; #post };
    max_response_bytes : ?Nat64;
    body : ?Blob;
    transform : ?{
      function : shared query {
          context : Blob;
          response : http_request_result;
        } -> async http_request_result;
      context : Blob;
    };
    headers : [http_header];
  };
  public type http_request_result = {
    status : Nat;
    body : Blob;
    headers : [http_header];
  };
  public type install_chunked_code_args = {
    arg : Blob;
    wasm_module_hash : Blob;
    mode : canister_install_mode;
    chunk_hashes_list : [chunk_hash];
    target_canister : canister_id;
    store_canister : ?canister_id;
    sender_canister_version : ?Nat64;
  };
  public type install_code_args = {
    arg : Blob;
    wasm_module : wasm_module;
    mode : canister_install_mode;
    canister_id : canister_id;
    sender_canister_version : ?Nat64;
  };
  public type log_visibility = { #controllers; #public_ };
  public type millisatoshi_per_byte = Nat64;
  public type node_metrics = {
    num_block_failures_total : Nat64;
    node_id : Principal;
    num_blocks_proposed_total : Nat64;
  };
  public type node_metrics_history_args = {
    start_at_timestamp_nanos : Nat64;
    subnet_id : Principal;
  };
  public type node_metrics_history_result = [
    { timestamp_nanos : Nat64; node_metrics : [node_metrics] }
  ];
  public type outpoint = { txid : Blob; vout : Nat32 };
  public type provisional_create_canister_with_cycles_args = {
    settings : ?canister_settings;
    specified_id : ?canister_id;
    amount : ?Nat;
    sender_canister_version : ?Nat64;
  };
  public type provisional_create_canister_with_cycles_result = {
    canister_id : canister_id;
  };
  public type provisional_top_up_canister_args = {
    canister_id : canister_id;
    amount : Nat;
  };
  public type raw_rand_result = Blob;
  public type satoshi = Nat64;
  public type schnorr_algorithm = { #ed25519; #bip340secp256k1 };
  public type schnorr_public_key_args = {
    key_id : { algorithm : schnorr_algorithm; name : Text };
    canister_id : ?canister_id;
    derivation_path : [Blob];
  };
  public type schnorr_public_key_result = {
    public_key : Blob;
    chain_code : Blob;
  };
  public type sign_with_ecdsa_args = {
    key_id : { name : Text; curve : ecdsa_curve };
    derivation_path : [Blob];
    message_hash : Blob;
  };
  public type sign_with_ecdsa_result = { signature : Blob };
  public type sign_with_schnorr_args = {
    key_id : { algorithm : schnorr_algorithm; name : Text };
    derivation_path : [Blob];
    message : Blob;
  };
  public type sign_with_schnorr_result = { signature : Blob };
  public type start_canister_args = { canister_id : canister_id };
  public type stop_canister_args = { canister_id : canister_id };
  public type stored_chunks_args = { canister_id : canister_id };
  public type stored_chunks_result = [chunk_hash];
  public type uninstall_code_args = {
    canister_id : canister_id;
    sender_canister_version : ?Nat64;
  };
  public type update_settings_args = {
    canister_id : Principal;
    settings : canister_settings;
    sender_canister_version : ?Nat64;
  };
  public type upload_chunk_args = { chunk : Blob; canister_id : Principal };
  public type upload_chunk_result = chunk_hash;
  public type utxo = { height : Nat32; value : satoshi; outpoint : outpoint };
  public type wasm_module = Blob;
  public type Self = actor {
    bitcoin_get_balance : shared bitcoin_get_balance_args -> async bitcoin_get_balance_result;
    bitcoin_get_balance_query : shared query bitcoin_get_balance_query_args -> async bitcoin_get_balance_query_result;
    bitcoin_get_current_fee_percentiles : shared bitcoin_get_current_fee_percentiles_args -> async bitcoin_get_current_fee_percentiles_result;
    bitcoin_get_utxos : shared bitcoin_get_utxos_args -> async bitcoin_get_utxos_result;
    bitcoin_get_utxos_query : shared query bitcoin_get_utxos_query_args -> async bitcoin_get_utxos_query_result;
    bitcoin_send_transaction : shared bitcoin_send_transaction_args -> async ();
    canister_info : shared canister_info_args -> async canister_info_result;
    canister_status : shared canister_status_args -> async canister_status_result;
    clear_chunk_store : shared clear_chunk_store_args -> async ();
    create_canister : shared create_canister_args -> async create_canister_result;
    delete_canister : shared delete_canister_args -> async ();
    deposit_cycles : shared deposit_cycles_args -> async ();
    ecdsa_public_key : shared ecdsa_public_key_args -> async ecdsa_public_key_result;
    fetch_canister_logs : shared query fetch_canister_logs_args -> async fetch_canister_logs_result;
    http_request : shared http_request_args -> async http_request_result;
    install_chunked_code : shared install_chunked_code_args -> async ();
    install_code : shared install_code_args -> async ();
    node_metrics_history : shared node_metrics_history_args -> async node_metrics_history_result;
    provisional_create_canister_with_cycles : shared provisional_create_canister_with_cycles_args -> async provisional_create_canister_with_cycles_result;
    provisional_top_up_canister : shared provisional_top_up_canister_args -> async ();
    raw_rand : shared () -> async raw_rand_result;
    schnorr_public_key : shared schnorr_public_key_args -> async schnorr_public_key_result;
    sign_with_ecdsa : shared sign_with_ecdsa_args -> async sign_with_ecdsa_result;
    sign_with_schnorr : shared sign_with_schnorr_args -> async sign_with_schnorr_result;
    start_canister : shared start_canister_args -> async ();
    stop_canister : shared stop_canister_args -> async ();
    stored_chunks : shared stored_chunks_args -> async stored_chunks_result;
    uninstall_code : shared uninstall_code_args -> async ();
    update_settings : shared update_settings_args -> async ();
    upload_chunk : shared upload_chunk_args -> async upload_chunk_result;
  }
}
