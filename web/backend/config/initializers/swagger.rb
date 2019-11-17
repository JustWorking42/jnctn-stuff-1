GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port + "/api/v1"
end

GrapeSwaggerRails.options.app_name = 'heyya!'

GrapeSwaggerRails.options.api_key_name = 'Povysh-Token'
GrapeSwaggerRails.options.api_key_type = 'header'