module Api
  module V1
    class Base < Grape::API
      include Grape::Extensions::Hashie::Mash::ParamBuilder

      mount Api::V1::Reports
    end
  end
end
