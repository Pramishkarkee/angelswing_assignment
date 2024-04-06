require 'rails_helper'

RSpec.describe Content, type: :model do
  user = User.find_by(id:1)
  subject {
    Content.new(title: "Anything",
                body: "Lorem ipsum",
                summary: "This is summary",
                slug: "test_dataddd",
                author: user)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without title" do 
    subject.title =nil
    expect(subject).to_not be_valid
  end

  it "is not valid without summary" do 
    subject.summary = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without body" do 
    subject.body = nil
    expect(subject).to_not be_valid
  end
end
