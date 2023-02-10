require 'swagger_helper'

describe 'Users Api' do
  path '/api/users/{id}' do
    get 'Retrieve a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo: { type: :string },
                 bio: { type: :string },
                 postsCounter: { type: :integer }
               },
               required: %w[id name postsCounter]

        let(:id) do
          User.create(
            name: 'foo', bio: 'Sports', photo: 'http://example.com/avatar.jpg', postsCounter: 0
          ).id
        end
        run_test!
      end
    end
  end
end
