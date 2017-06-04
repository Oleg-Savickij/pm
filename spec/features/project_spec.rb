describe 'Taking a project' do

  let!(:user) { create(:user, email: "oleg@mail.ru", password: "123") }

  before(:each) do
    login("oleg@mail.ru", "123")
  end

  it "opens projects page after login" do
    expect(page).to have_content "Listing projects"
  end

end