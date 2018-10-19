json.extract! payment_record, :id, :name, :money, :created_at, :updated_at
json.url payment_record_url(payment_record, format: :json)
