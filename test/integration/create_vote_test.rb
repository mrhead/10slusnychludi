require "test_helper"

class CreateVoteTest < ActionDispatch::IntegrationTest
  test "create new vote" do
    visit root_path

    fill_in "Celé meno", with: "John Doe"
    fill_in "Mesto", with: "Bratislava"
    fill_in "Email", with: "john.doe@example.com"
    check "Zverejniť podpis"
    click_button "Nie je mi to jedno!"

    assert page.has_content?("Váš hlas bol započítaný! Ďakujeme, že Vám to nie je jedno!")
  end
end
