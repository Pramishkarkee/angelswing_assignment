require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(name: "Anything",
                email: "prami@gmail.com",
                password: "test_dataddd"
                )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "saves to the database" do
    expect { subject.save }.to change(User, :count).by(1)
  end
end
