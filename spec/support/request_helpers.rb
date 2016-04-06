module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def create_request(full_url, short_url = nil, api_key = "tokentest")
      post :create, link: { full_url: full_url, short_url: short_url, api_key: api_key }, format: :json
    end

    def update_request(link, short_url, old_url, api_key = "tokentest")
      put :update, id: link, link: { short_url: short_url, old: old_url, api_key: api_key }, format: :json
    end
  end
end
