json.extract! balance, :id, :account_id, :amount, :deposit_references, :withdraw_references, :transfer_references, :created_at, :updated_at
json.url balance_url(balance, format: :json)
