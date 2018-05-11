# Schema

## `USERS`
- `id` - num, primary key
<!-- `type` - string, null: false (`shop` or `customer`) -->
- `email_address` - string, null: false, unique: true
- `num_license_keys_sent` - default: 0

## `LICENSE_KEYS`
- `customer_id` - num, foreign key
- `license_key` - string, unique: true

## `ORDERS`
- `id` - num, primary key
- `customer_id` - num, foreign key
- `shop_owner_id` - num, foreign key

