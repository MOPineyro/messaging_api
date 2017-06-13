require "rails_helper"

describe "Create New Message" do
  let!(:user_one) { create(:user) }
  let!(:user_two) { create(:user) }
  let (:headers) do
    {
      "ACCEPT" => "application/json"     # This is what Rails > 4 accepts
    }
  end

  let(:auth_params) do
    {
      user: {
        email:    user_one.email,
        password: 'password'
      }
    }
  end

  let(:convo_params) do
    {
      conversation: {
        receiver_email:    user_two.email
      }
    }
  end

  # let(:message_params) do
  #   {
  #     message: {
  #       body:    "Hey, homie"
  #     }
  #   }
  # end

  it "creates a new conversation" do
    post user_session_path, params: auth_params, headers: headers
    authorization_header = response.headers['Authorization']
    post conversations_path, params: convo_params, headers: headers.merge('Authorization'=> authorization_header)
    expect(json).to include_json(status: 'Conversation created')
  end

  it "creates a new message" do
    post user_session_path, params: auth_params, headers: headers
    authorization_header = response.headers['Authorization']
    post conversations_path, params: convo_params, headers: headers.merge('Authorization'=> authorization_header)
    conversation_id = JSON.parse(response.body)["id"]
    message_params = { message: { body: "Hey, homie", conversation_id: conversation_id } }
    post messages_path, params: message_params, headers: headers.merge('Authorization'=> authorization_header)
    expect(json).to include_json(status: 'Message Sent')
  end

  # it "retrieves users conversations a new conversation" do
  #   post user_session_path, params: auth_params, headers: headers
  #   authorization_header = response.headers['Authorization']
  #   post conversations_path, params: convo_params, headers: headers.merge('Authorization'=> authorization_header)
  #   expect(json).to include_json(message: 'Conversation created')
  # end

end
