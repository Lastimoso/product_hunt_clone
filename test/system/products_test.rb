require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit root_url

    assert_selector "h1", text: "Nuestros productos"
    assert_selector ".card-product", count: Product.count
  end

  test "A user can add a product" do
    #setup
    login_as users(:homero)

    #exercise
    visit "/products/new"

    # fill_in "product_name", with: ""
    fill_in "product_tagline", with: "Las mejores del planeta"

    click_on "Create Product"

    assert_text "Name can't be blank"

    fill_in "product_name", with: "Empanadas locas"
    # fill_in "product_tagline", with: "Las mejores del planeta"

    click_on "Create Product"


    #verify
    assert_equal root_path, page.current_path
    assert_text "Las mejores del planeta"

    # within ".card-product-infos" do
    #   assert_selector "p", with: "Las mejores del planeta"
    # end
    #teardown
    # nothing to do in this example
  end
end
