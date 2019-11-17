
module Api
  module V1
    class Reports < Grape::API
      include Api::V1::Defaults
      resource :reports do
        desc "Return all reports"
        get "/", root: :reports do
          private_key_json_string = File.open("/Users/trall/dev/personal/dom2/app/controllers/api/v1/rrr.json").read
          firebase = Firebase::Client.new("https://dom-2-ignyda.firebaseio.com", private_key_json_string)
          JSON.parse(firebase.get("problems").response.http_body.content)
        end

        desc "Delete report"
        params do
          requires :id, type: String
        end
        get "/:id/destroy", root: :reports do
          private_key_json_string = File.open("/Users/trall/dev/personal/dom2/app/controllers/api/v1/rrr.json").read
          firebase = Firebase::Client.new("https://dom-2-ignyda.firebaseio.com", private_key_json_string)
          JSON.parse(firebase.delete("problems/#{params[:id]}").response.http_body.content)
        end

        desc "get report"
        params do
          requires :id, type: String
        end
        get "/:id", root: :reports do
          private_key_json_string = File.open("/Users/trall/dev/personal/dom2/app/controllers/api/v1/rrr.json").read
          firebase = Firebase::Client.new("https://dom-2-ignyda.firebaseio.com", private_key_json_string)
          JSON.parse(firebase.get("problems/#{params[:id]}").response.http_body.content)
        end

        desc "change report status"
        params do
          requires :id, type: String
          requires :to, type: String
        end
        get "/:id/change_status", root: :reports do
          private_key_json_string = File.open("/Users/trall/dev/personal/dom2/app/controllers/api/v1/rrr.json").read
          firebase = Firebase::Client.new("https://dom-2-ignyda.firebaseio.com", private_key_json_string)
          JSON.parse(firebase.update("problems/#{params[:id]}", {status: params[:to].to_i}).response.http_body.content)
        end
      end
    end
  end
end