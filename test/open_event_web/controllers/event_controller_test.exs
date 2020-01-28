defmodule OpenEventWeb.EventControllerTest do
  use OpenEventWeb.ConnCase

  alias OpenEvent.Events
  alias OpenEvent.Events.Event

  @create_attrs %{
    external_event_url: "some external_event_url",
    is_sessions_speakers_enabled: true,
    ends_at: "2010-04-17T14:00:00Z",
    show_remaining_tickets: true,
    owner_description: "some owner_description",
    thumbnail_image_url: "some thumbnail_image_url",
    is_stripe_linked: true,
    can_pay_by_paytm: true,
    is_ticketing_enabled: true,
    is_featured: true,
    is_sponsors_enabled: true,
    payment_country: "some payment_country",
    is_billing_info_mandatory: true,
    icon_image_url: "some icon_image_url",
    cheque_details: "some cheque_details",
    can_pay_by_stripe: true,
    logo_url: "some logo_url",
    can_pay_by_alipay: true,
    starts_at: "2010-04-17T14:00:00Z",
    name: "some name",
    large_image_url: "some large_image_url",
    owner_name: "some owner_name",
    code_of_conduct: "some code_of_conduct",
    is_ticket_form_enabled: true,
    location_name: "some location_name",
    timezone: "some timezone",
    can_pay_by_paypal: true,
    ical_url: "some ical_url",
    can_pay_by_omise: true,
    is_donation_enabled: true,
    payment_currency: "some payment_currency",
    schedule_published_on: "2010-04-17T14:00:00Z",
    is_promoted: true,
    has_owner_info: true,
    onsite_details: "some onsite_details",
    original_image_url: "some original_image_url",
    is_event_online: true,
    xcal_url: "some xcal_url",
    searchable_location_name: "some searchable_location_name",
    latitude: 120.5,
    longitude: 120.5,
    can_pay_onsite: true,
    paypal_email: "some paypal_email",
    can_pay_by_cheque: true,
    is_tax_enabled: true,
    description: "some description",
    can_pay_by_bank: true,
    refund_policy: "some refund_policy",
    bank_details: "some bank_details",
    pentabarf_url: "some pentabarf_url",
    ticket_url: "some ticket_url"
  }
  @update_attrs %{
    external_event_url: "some updated external_event_url",
    is_sessions_speakers_enabled: false,
    ends_at: "2011-05-18T15:01:01Z",
    show_remaining_tickets: false,
    owner_description: "some updated owner_description",
    thumbnail_image_url: "some updated thumbnail_image_url",
    is_stripe_linked: false,
    can_pay_by_paytm: false,
    is_ticketing_enabled: false,
    is_featured: false,
    is_sponsors_enabled: false,
    payment_country: "some updated payment_country",
    is_billing_info_mandatory: false,
    icon_image_url: "some updated icon_image_url",
    cheque_details: "some updated cheque_details",
    can_pay_by_stripe: false,
    logo_url: "some updated logo_url",
    can_pay_by_alipay: false,
    starts_at: "2011-05-18T15:01:01Z",
    name: "some updated name",
    large_image_url: "some updated large_image_url",
    owner_name: "some updated owner_name",
    code_of_conduct: "some updated code_of_conduct",
    is_ticket_form_enabled: false,
    location_name: "some updated location_name",
    timezone: "some updated timezone",
    can_pay_by_paypal: false,
    ical_url: "some updated ical_url",
    can_pay_by_omise: false,
    is_donation_enabled: false,
    payment_currency: "some updated payment_currency",
    schedule_published_on: "2011-05-18T15:01:01Z",
    is_promoted: false,
    has_owner_info: false,
    onsite_details: "some updated onsite_details",
    original_image_url: "some updated original_image_url",
    is_event_online: false,
    xcal_url: "some updated xcal_url",
    searchable_location_name: "some updated searchable_location_name",
    latitude: 456.7,
    longitude: 456.7,
    can_pay_onsite: false,
    paypal_email: "some updated paypal_email",
    can_pay_by_cheque: false,
    is_tax_enabled: false,
    description: "some updated description",
    can_pay_by_bank: false,
    refund_policy: "some updated refund_policy",
    bank_details: "some updated bank_details",
    pentabarf_url: "some updated pentabarf_url",
    ticket_url: "some updated ticket_url"
  }
  @invalid_attrs %{ticket_url: nil, pentabarf_url: nil, bank_details: nil, refund_policy: nil, can_pay_by_bank: nil, description: nil, is_tax_enabled: nil, can_pay_by_cheque: nil, paypal_email: nil, can_pay_onsite: nil, longitude: nil, latitude: nil, searchable_location_name: nil, xcal_url: nil, is_event_online: nil, original_image_url: nil, onsite_details: nil, has_owner_info: nil, is_promoted: nil, schedule_published_on: nil, payment_currency: nil, is_donation_enabled: nil, can_pay_by_omise: nil, ical_url: nil, can_pay_by_paypal: nil, timezone: nil, location_name: nil, is_ticket_form_enabled: nil, code_of_conduct: nil, owner_name: nil, large_image_url: nil, name: nil, starts_at: nil, can_pay_by_alipay: nil, logo_url: nil, can_pay_by_stripe: nil, cheque_details: nil, icon_image_url: nil, is_billing_info_mandatory: nil, payment_country: nil, is_sponsors_enabled: nil, is_featured: nil, is_ticketing_enabled: nil, can_pay_by_paytm: nil, is_stripe_linked: nil, thumbnail_image_url: nil, owner_description: nil, show_remaining_tickets: nil, ends_at: nil, is_sessions_speakers_enabled: nil, ...}

  def fixture(:event) do
    {:ok, event} = Events.create_event(@create_attrs)
    event
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create event" do
    test "renders event when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.event_path(conn, :show, id))

      assert %{
               "id" => id,
               "external_event_url" => "some external_event_url",
               "is_sessions_speakers_enabled" => true,
               "ends_at" => "2010-04-17T14:00:00Z",
               "show_remaining_tickets" => true,
               "owner_description" => "some owner_description",
               "thumbnail_image_url" => "some thumbnail_image_url",
               "is_stripe_linked" => true,
               "can_pay_by_paytm" => true,
               "is_ticketing_enabled" => true,
               "is_featured" => true,
               "is_sponsors_enabled" => true,
               "payment_country" => "some payment_country",
               "is_billing_info_mandatory" => true,
               "icon_image_url" => "some icon_image_url",
               "cheque_details" => "some cheque_details",
               "can_pay_by_stripe" => true,
               "logo_url" => "some logo_url",
               "can_pay_by_alipay" => true,
               "starts_at" => "2010-04-17T14:00:00Z",
               "name" => "some name",
               "large_image_url" => "some large_image_url",
               "owner_name" => "some owner_name",
               "code_of_conduct" => "some code_of_conduct",
               "is_ticket_form_enabled" => true,
               "location_name" => "some location_name",
               "timezone" => "some timezone",
               "can_pay_by_paypal" => true,
               "ical_url" => "some ical_url",
               "can_pay_by_omise" => true,
               "is_donation_enabled" => true,
               "payment_currency" => "some payment_currency",
               "schedule_published_on" => "2010-04-17T14:00:00Z",
               "is_promoted" => true,
               "has_owner_info" => true,
               "onsite_details" => "some onsite_details",
               "original_image_url" => "some original_image_url",
               "is_event_online" => true,
               "xcal_url" => "some xcal_url",
               "searchable_location_name" => "some searchable_location_name",
               "latitude" => 120.5,
               "longitude" => 120.5,
               "can_pay_onsite" => true,
               "paypal_email" => "some paypal_email",
               "can_pay_by_cheque" => true,
               "is_tax_enabled" => true,
               "description" => "some description",
               "can_pay_by_bank" => true,
               "refund_policy" => "some refund_policy",
               "bank_details" => "some bank_details",
               "pentabarf_url" => "some pentabarf_url",
               "ticket_url" => "some ticket_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update event" do
    setup [:create_event]

    test "renders event when data is valid", %{conn: conn, event: %Event{id: id} = event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.event_path(conn, :show, id))

      assert %{
               "id" => id,
               "external_event_url" => "some updated external_event_url",
               "is_sessions_speakers_enabled" => false,
               "ends_at" => "2011-05-18T15:01:01Z",
               "show_remaining_tickets" => false,
               "owner_description" => "some updated owner_description",
               "thumbnail_image_url" => "some updated thumbnail_image_url",
               "is_stripe_linked" => false,
               "can_pay_by_paytm" => false,
               "is_ticketing_enabled" => false,
               "is_featured" => false,
               "is_sponsors_enabled" => false,
               "payment_country" => "some updated payment_country",
               "is_billing_info_mandatory" => false,
               "icon_image_url" => "some updated icon_image_url",
               "cheque_details" => "some updated cheque_details",
               "can_pay_by_stripe" => false,
               "logo_url" => "some updated logo_url",
               "can_pay_by_alipay" => false,
               "starts_at" => "2011-05-18T15:01:01Z",
               "name" => "some updated name",
               "large_image_url" => "some updated large_image_url",
               "owner_name" => "some updated owner_name",
               "code_of_conduct" => "some updated code_of_conduct",
               "is_ticket_form_enabled" => false,
               "location_name" => "some updated location_name",
               "timezone" => "some updated timezone",
               "can_pay_by_paypal" => false,
               "ical_url" => "some updated ical_url",
               "can_pay_by_omise" => false,
               "is_donation_enabled" => false,
               "payment_currency" => "some updated payment_currency",
               "schedule_published_on" => "2011-05-18T15:01:01Z",
               "is_promoted" => false,
               "has_owner_info" => false,
               "onsite_details" => "some updated onsite_details",
               "original_image_url" => "some updated original_image_url",
               "is_event_online" => false,
               "xcal_url" => "some updated xcal_url",
               "searchable_location_name" => "some updated searchable_location_name",
               "latitude" => 456.7,
               "longitude" => 456.7,
               "can_pay_onsite" => false,
               "paypal_email" => "some updated paypal_email",
               "can_pay_by_cheque" => false,
               "is_tax_enabled" => false,
               "description" => "some updated description",
               "can_pay_by_bank" => false,
               "refund_policy" => "some updated refund_policy",
               "bank_details" => "some updated bank_details",
               "pentabarf_url" => "some updated pentabarf_url",
               "ticket_url" => "some updated ticket_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete(conn, Routes.event_path(conn, :delete, event))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.event_path(conn, :show, event))
      end
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
