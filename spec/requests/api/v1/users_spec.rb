require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/auth/sign_in' do
    post('login user') do
      tags :auth
      parameter name: :email, in: :query, type: :string
      parameter name: :password, in: :query, schema: {
        type: :string,
        format: :password
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/user' do
    get('show user') do
      tags :user_info
      security [
        "client": [],
        "access_token": [],
        "uid": []
      ]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/user/capabilities' do
    get('get_capabilities user') do
      tags :user_info
      security [
        "client": [],
        "access_token": [],
        "uid": []
      ]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/user/balance_to_chart' do
    get('balance_to_chart user') do
      tags :user_info
      security [
        "client": [],
        "access_token": [],
        "uid": []
      ]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/api/v1/user/transactions_to_chart' do
    get('transactions_by_category_to_chart user') do
      tags :user_info
      security [
        "client": [],
        "access_token": [],
        "uid": []
      ]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
