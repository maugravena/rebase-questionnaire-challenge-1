require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name must be required' do
    user = build(:user, name: "", email: 'joana@teste.com')

    expect(user).to_not be_valid
    expect(user.errors[:name]).to include("não pode ficar em branco")
  end

  it 'email must be required' do
    user = build(:user, name: 'Joana Silva', email: "")

    expect(user).to_not be_valid

    expect(user.errors[:email]).to include("não pode ficar em branco")
  end
end
