require 'rest-client'

class Click2buyApi
  def initialize(token)
    @token = token
  end

  def get_products(shop_key, retail_outlet_id)
    request_base = 'https://api.clic2buy.com/api'
    url = "#{request_base}/shop/v1/shop/#{shop_key}/retail_outlet/#{retail_outlet_id}/products?auth_token=#{@token}"
    response = RestClient.get(url)
    return response
  end
end
