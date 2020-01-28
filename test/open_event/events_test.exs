defmodule OpenEvent.EventsTest do
  use OpenEvent.DataCase

  alias OpenEvent.Events

  describe "events" do
    alias OpenEvent.Events.Event

    @valid_attrs %{ticket_url: "some ticket_url", pentabarf_url: "some pentabarf_url", bank_details: "some bank_details", refund_policy: "some refund_policy", can_pay_by_bank: true, description: "some description", is_tax_enabled: true, can_pay_by_cheque: true, paypal_email: "some paypal_email", can_pay_onsite: true, longitude: 120.5, latitude: 120.5, searchable_location_name: "some searchable_location_name", xcal_url: "some xcal_url", is_event_online: true, original_image_url: "some original_image_url", onsite_details: "some onsite_details", has_owner_info: true, is_promoted: true, schedule_published_on: "2010-04-17T14:00:00Z", payment_currency: "some payment_currency", is_donation_enabled: true, can_pay_by_omise: true, ical_url: "some ical_url", can_pay_by_paypal: true, timezone: "some timezone", location_name: "some location_name", is_ticket_form_enabled: true, code_of_conduct: "some code_of_conduct", owner_name: "some owner_name", large_image_url: "some large_image_url", name: "some name", starts_at: "2010-04-17T14:00:00Z", can_pay_by_alipay: true, logo_url: "some logo_url", can_pay_by_stripe: true, cheque_details: "some cheque_details", icon_image_url: "some icon_image_url", is_billing_info_mandatory: true, payment_country: "some payment_country", is_sponsors_enabled: true, is_featured: true, is_ticketing_enabled: true, can_pay_by_paytm: true, is_stripe_linked: true, thumbnail_image_url: "some thumbnail_image_url", owner_description: "some owner_description", show_remaining_tickets: true, ends_at: "2010-04-17T14:00:00Z", is_sessions_speakers_enabled: true, ...}
    @update_attrs %{ticket_url: "some updated ticket_url", pentabarf_url: "some updated pentabarf_url", bank_details: "some updated bank_details", refund_policy: "some updated refund_policy", can_pay_by_bank: false, description: "some updated description", is_tax_enabled: false, can_pay_by_cheque: false, paypal_email: "some updated paypal_email", can_pay_onsite: false, longitude: 456.7, latitude: 456.7, searchable_location_name: "some updated searchable_location_name", xcal_url: "some updated xcal_url", is_event_online: false, original_image_url: "some updated original_image_url", onsite_details: "some updated onsite_details", has_owner_info: false, is_promoted: false, schedule_published_on: "2011-05-18T15:01:01Z", payment_currency: "some updated payment_currency", is_donation_enabled: false, can_pay_by_omise: false, ical_url: "some updated ical_url", can_pay_by_paypal: false, timezone: "some updated timezone", location_name: "some updated location_name", is_ticket_form_enabled: false, code_of_conduct: "some updated code_of_conduct", owner_name: "some updated owner_name", large_image_url: "some updated large_image_url", name: "some updated name", starts_at: "2011-05-18T15:01:01Z", can_pay_by_alipay: false, logo_url: "some updated logo_url", can_pay_by_stripe: false, cheque_details: "some updated cheque_details", icon_image_url: "some updated icon_image_url", is_billing_info_mandatory: false, payment_country: "some updated payment_country", is_sponsors_enabled: false, is_featured: false, is_ticketing_enabled: false, can_pay_by_paytm: false, is_stripe_linked: false, thumbnail_image_url: "some updated thumbnail_image_url", owner_description: "some updated owner_description", show_remaining_tickets: false, ends_at: "2011-05-18T15:01:01Z", is_sessions_speakers_enabled: false, ...}
    @invalid_attrs %{ticket_url: nil, pentabarf_url: nil, bank_details: nil, refund_policy: nil, can_pay_by_bank: nil, description: nil, is_tax_enabled: nil, can_pay_by_cheque: nil, paypal_email: nil, can_pay_onsite: nil, longitude: nil, latitude: nil, searchable_location_name: nil, xcal_url: nil, is_event_online: nil, original_image_url: nil, onsite_details: nil, has_owner_info: nil, is_promoted: nil, schedule_published_on: nil, payment_currency: nil, is_donation_enabled: nil, can_pay_by_omise: nil, ical_url: nil, can_pay_by_paypal: nil, timezone: nil, location_name: nil, is_ticket_form_enabled: nil, code_of_conduct: nil, owner_name: nil, large_image_url: nil, name: nil, starts_at: nil, can_pay_by_alipay: nil, logo_url: nil, can_pay_by_stripe: nil, cheque_details: nil, icon_image_url: nil, is_billing_info_mandatory: nil, payment_country: nil, is_sponsors_enabled: nil, is_featured: nil, is_ticketing_enabled: nil, can_pay_by_paytm: nil, is_stripe_linked: nil, thumbnail_image_url: nil, owner_description: nil, show_remaining_tickets: nil, ends_at: nil, is_sessions_speakers_enabled: nil, ...}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.external_event_url == "some external_event_url"
      assert event.is_sessions_speakers_enabled == true
      assert event.ends_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert event.show_remaining_tickets == true
      assert event.owner_description == "some owner_description"
      assert event.thumbnail_image_url == "some thumbnail_image_url"
      assert event.is_stripe_linked == true
      assert event.can_pay_by_paytm == true
      assert event.is_ticketing_enabled == true
      assert event.is_featured == true
      assert event.is_sponsors_enabled == true
      assert event.payment_country == "some payment_country"
      assert event.is_billing_info_mandatory == true
      assert event.icon_image_url == "some icon_image_url"
      assert event.cheque_details == "some cheque_details"
      assert event.can_pay_by_stripe == true
      assert event.logo_url == "some logo_url"
      assert event.can_pay_by_alipay == true
      assert event.starts_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert event.name == "some name"
      assert event.large_image_url == "some large_image_url"
      assert event.owner_name == "some owner_name"
      assert event.code_of_conduct == "some code_of_conduct"
      assert event.is_ticket_form_enabled == true
      assert event.location_name == "some location_name"
      assert event.timezone == "some timezone"
      assert event.can_pay_by_paypal == true
      assert event.ical_url == "some ical_url"
      assert event.can_pay_by_omise == true
      assert event.is_donation_enabled == true
      assert event.payment_currency == "some payment_currency"
      assert event.schedule_published_on == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert event.is_promoted == true
      assert event.has_owner_info == true
      assert event.onsite_details == "some onsite_details"
      assert event.original_image_url == "some original_image_url"
      assert event.is_event_online == true
      assert event.xcal_url == "some xcal_url"
      assert event.searchable_location_name == "some searchable_location_name"
      assert event.latitude == 120.5
      assert event.longitude == 120.5
      assert event.can_pay_onsite == true
      assert event.paypal_email == "some paypal_email"
      assert event.can_pay_by_cheque == true
      assert event.is_tax_enabled == true
      assert event.description == "some description"
      assert event.can_pay_by_bank == true
      assert event.refund_policy == "some refund_policy"
      assert event.bank_details == "some bank_details"
      assert event.pentabarf_url == "some pentabarf_url"
      assert event.ticket_url == "some ticket_url"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, @update_attrs)
      assert event.external_event_url == "some updated external_event_url"
      assert event.is_sessions_speakers_enabled == false
      assert event.ends_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert event.show_remaining_tickets == false
      assert event.owner_description == "some updated owner_description"
      assert event.thumbnail_image_url == "some updated thumbnail_image_url"
      assert event.is_stripe_linked == false
      assert event.can_pay_by_paytm == false
      assert event.is_ticketing_enabled == false
      assert event.is_featured == false
      assert event.is_sponsors_enabled == false
      assert event.payment_country == "some updated payment_country"
      assert event.is_billing_info_mandatory == false
      assert event.icon_image_url == "some updated icon_image_url"
      assert event.cheque_details == "some updated cheque_details"
      assert event.can_pay_by_stripe == false
      assert event.logo_url == "some updated logo_url"
      assert event.can_pay_by_alipay == false
      assert event.starts_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert event.name == "some updated name"
      assert event.large_image_url == "some updated large_image_url"
      assert event.owner_name == "some updated owner_name"
      assert event.code_of_conduct == "some updated code_of_conduct"
      assert event.is_ticket_form_enabled == false
      assert event.location_name == "some updated location_name"
      assert event.timezone == "some updated timezone"
      assert event.can_pay_by_paypal == false
      assert event.ical_url == "some updated ical_url"
      assert event.can_pay_by_omise == false
      assert event.is_donation_enabled == false
      assert event.payment_currency == "some updated payment_currency"
      assert event.schedule_published_on == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert event.is_promoted == false
      assert event.has_owner_info == false
      assert event.onsite_details == "some updated onsite_details"
      assert event.original_image_url == "some updated original_image_url"
      assert event.is_event_online == false
      assert event.xcal_url == "some updated xcal_url"
      assert event.searchable_location_name == "some updated searchable_location_name"
      assert event.latitude == 456.7
      assert event.longitude == 456.7
      assert event.can_pay_onsite == false
      assert event.paypal_email == "some updated paypal_email"
      assert event.can_pay_by_cheque == false
      assert event.is_tax_enabled == false
      assert event.description == "some updated description"
      assert event.can_pay_by_bank == false
      assert event.refund_policy == "some updated refund_policy"
      assert event.bank_details == "some updated bank_details"
      assert event.pentabarf_url == "some updated pentabarf_url"
      assert event.ticket_url == "some updated ticket_url"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
