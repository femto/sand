require "application_system_test_case"

class PaymentRecordsTest < ApplicationSystemTestCase
  setup do
    @payment_record = payment_records(:one)
  end

  test "visiting the index" do
    visit payment_records_url
    assert_selector "h1", text: "Payment Records"
  end

  test "creating a Payment record" do
    visit payment_records_url
    click_on "New Payment Record"

    fill_in "Money", with: @payment_record.money
    fill_in "Name", with: @payment_record.name
    click_on "Create Payment record"

    assert_text "Payment record was successfully created"
    click_on "Back"
  end

  test "updating a Payment record" do
    visit payment_records_url
    click_on "Edit", match: :first

    fill_in "Money", with: @payment_record.money
    fill_in "Name", with: @payment_record.name
    click_on "Update Payment record"

    assert_text "Payment record was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment record" do
    visit payment_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment record was successfully destroyed"
  end
end
