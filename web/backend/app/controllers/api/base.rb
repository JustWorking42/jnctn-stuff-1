# frozen_string_literal: true

require 'grape-swagger'

module Api
  class Base < Grape::API
    mount Api::V1::Base

    add_swagger_documentation(
        api_version: 'v1',
        hide_documentation_path: true,
        mount_path: '/api/v1/swagger_doc',
        hide_format: true,
        security_definitions: nil
    )


  end
end
