# Assuming the router successfully sends the request to the controller:

class ControllerBase

    def initialize(params)
        @params = params
        @errors = []
        validate!
        create_license_key
        render_content
    end

    private

    def validate!
        validate_users
        validate_order
    end


    def validate_users
        customer = SQL_METHOD(@params[customer_id])
        --> SQL
                SELECT
                    id
                FROM
                    users
                WHERE
                    id = ?
        SQL

        shop_owner = SQL_METHOD(@params[shop_owner])
        --> SQL
                SELECT
                    id
                FROM
                    users
                WHERE
                    id = ?
        SQL

        unless customer
            @errors << 'Customer does not exist'
        end

        unless shop_owner
            @errors << 'Shop owner does not exist'
        end

    end
    
    def validate_order
        orders = SQL_METHOD(@params[customer_id], @params[shop_owner_id])
        --> SQL
                SELECT
                    id
                FROM
                    orders
                WHERE
                    customer_id = ?
                AND WHERE
                    shop_owner_id = ?
        SQL

        unless orders
            @errors << 'Order does not exist'
        end
    end
    
    def create_license_key

    end
    
    def update_license_key_count
        shop_owner = (@params[shop_owner_id])
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        end

        shop_owner[:num_license_keys_sent] += 1

        ## update shop owner
    end
    
    def render_content
        ## send email, or not
    end

end

new_controller = ControllerBase.new(route_params)