JSONAPI.configure do |config|
  config.resource_key_type = :uuid
  config.json_key_format = :underscored_key
  config.route_format = :underscored_route

  config.default_paginator = :paged
  config.default_page_size = 50
  config.maximum_page_size = 100
end
