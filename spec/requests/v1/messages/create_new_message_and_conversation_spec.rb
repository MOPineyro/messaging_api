require "rails_helper"

describe "Messages & Conversations" do
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

  it "should retrieve all users conversations" do
    post user_session_path, params: auth_params, headers: headers
    authorization_header = response.headers['Authorization']
    post conversations_path, params: convo_params, headers: headers.merge('Authorization'=> authorization_header)
    conversation_id = JSON.parse(response.body)["id"]
    message_params = { message: { body: "Hey, homie", conversation_id: conversation_id } }
    post messages_path, params: message_params, headers: headers.merge('Authorization'=> authorization_header)
    get conversations_path, headers: headers.merge('Authorization'=> authorization_header)
    expect(response).to have_http_status(:success)
  end

end
