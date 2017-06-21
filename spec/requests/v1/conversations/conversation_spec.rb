require "rails_helper"

describe "Conversations" do
  let!(:user_one) { create(:user) }
  let!(:user_two) { create(:user) }
  let (:headers) do
    {
      "ACCEPT" => "application/json"     # This is what Rails > 4 accepts
    }
  end

  let(:user_one_auth_params) do
    {
      user: {
        email:    user_one.email,
        password: 'password'
      }
    }
  end

  let(:user_two_auth_params) do
    {
      user: {
        email:    user_two.email,
        password: 'password'
      }
    }
  end

  let(:convo_params_one) do
    {
      conversation: {
        receiver_email:    user_two.email
      }
    }
  end

  let(:convo_params_two) do
    {
      conversation: {
        receiver_email:    user_one.email
      }
    }
  end
  
  it "makes sure conversation isn't duplicated between same participants" do
    post user_session_path, params: user_one_auth_params, headers: headers
    user_one_authorization_header = response.headers['Authorization']
    post conversations_path, params: convo_params_one, headers: headers.merge('Authorization'=> user_one_authorization_header)
    conversation_one = response.body

    post user_session_path, params: user_two_auth_params, headers: headers
    user_two_authorization_header = response.headers['Authorization']
    post conversations_path, params: convo_params_two, headers: headers.merge('Authorization'=> user_two_authorization_header)
    conversation_two = response.body

    expect(conversation_one).to eq(conversation_two)
  end

end
