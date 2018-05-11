# Coding Challenge

## Tech stack
- Rack? (Middleware, not framework)
- Ruby
- PostgresQL

## Order of operations
- Receive request
    - API endpoint receives stringified params
    - e.g., 
    ```
    {
        shop_owner_id: 123,
        customer_id: 456,
        license_key: "SOME_STRING",
        order_id: 123123
    }
    ```
- Redirect to controller
    - Validates orders and users table
        - Is there an `order` with `customer_id` and `shop_owner_id`?
            - Error message: 'Order does not exist'
        - Are the `shop_owner_id` and `customer_id` associated with users in the database?
            - Error message: 'Shop owner/user does not exist'
    - Creates license key
        - e.g.
        ```
            customer_id: 456
            license_key: "SOME_STRING"
        ```
    - Increment license key counter in users table
        - e.g. `num_of_license_keys_sent: 1`
- Success: Render a view that emails customer (based off `customer_id` in params)
    - Email sent from shop with a noreply option
    - Email contains license key
- Failure: Render a view that displays errors

# Tests
- Validate validation checks (db, models, etc.)
- Validate counter (does it increment?)
- Validate SQL queries
- Validate rendering of email / errors
    - If validations don't work, *don't* send an email

## Questions and Considerations:
- How to create our own router and controller
- How to write non-ORM SQL queries in Ruby
- How to write an email in Ruby without Rails
- Where is email sent from? If it's sent from the shop, how do we prevent access to customer email addresses?

# Bonus features
- Email contains link to order show page with info about the order