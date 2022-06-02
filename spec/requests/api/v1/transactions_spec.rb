require 'swagger_helper'

RSpec.describe 'api/v1/transactions', type: :request do
  path '/api/v1/transactions' do
    get('list transactions') do
      tags :transactions
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

  path '/api/v1/transactions/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show transaction') do
      tags :transactions
      security [
        "client": [],
        "access_token": [],
        "uid": []
      ]

      response(200, 'successful') do
        let(:id) { '123' }

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

  path '/api/v1/transactions/{id}/add_category/{category_id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    parameter name: 'category_id', in: :path, type: :string, description: 'category_id'

    post('add_to_category transaction') do
      tags :transactions
      security [
        "client": [],
        "access_token": [],
        "uid": []
      ]
      response(200, 'successful') do
        let(:id) { '123' }
        let(:category_id) { '123' }

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

  path '/api/v1/transactions/{id}/remove_category/{category_id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    parameter name: 'category_id', in: :path, type: :string, description: 'category_id'

    post('remove_category transaction') do
      tags :transactions
      security [
        "client": [],
        "access_token": [],
        "uid": []
      ]
      response(200, 'successful') do
        let(:id) { '123' }
        let(:category_id) { '123' }

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
