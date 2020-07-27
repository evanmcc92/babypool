require "application_system_test_case"

class PoolsTest < ApplicationSystemTestCase
  setup do
    @pool = pools(:one)
  end

  test "visiting the index" do
    visit pools_url
    assert_selector "h1", text: "Pools"
  end

  test "creating a Pool" do
    visit pools_url
    click_on "New Pool"

    fill_in "Admin", with: @pool.admin_id
    fill_in "Baby", with: @pool.baby_id
    fill_in "Birth date", with: @pool.birth_date
    fill_in "Birth time", with: @pool.birth_time
    fill_in "Email", with: @pool.email
    fill_in "Gender", with: @pool.gender
    fill_in "Length", with: @pool.length
    fill_in "Name", with: @pool.name
    fill_in "Weight", with: @pool.weight
    click_on "Create Pool"

    assert_text "Pool was successfully created"
    click_on "Back"
  end

  test "updating a Pool" do
    visit pools_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @pool.admin_id
    fill_in "Baby", with: @pool.baby_id
    fill_in "Birth date", with: @pool.birth_date
    fill_in "Birth time", with: @pool.birth_time
    fill_in "Email", with: @pool.email
    fill_in "Gender", with: @pool.gender
    fill_in "Length", with: @pool.length
    fill_in "Name", with: @pool.name
    fill_in "Weight", with: @pool.weight
    click_on "Update Pool"

    assert_text "Pool was successfully updated"
    click_on "Back"
  end

  test "destroying a Pool" do
    visit pools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pool was successfully destroyed"
  end
end
