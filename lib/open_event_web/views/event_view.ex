defmodule OpenEventWeb.EventView do
  use OpenEventWeb, :view
  alias OpenEventWeb.EventView

  def render("index.json", %{events: events}) do
    render_many(events, EventView, "event.json")
  end

  def render("show.json", %{event: event}) do
    render_one(event, EventView, "event.json")
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      name: event.name,
      logo_url: event.logo_url,
      starts_at: event.starts_at,
      ends_at: event.ends_at,
      timezone: event.timezone,
      is_event_online: event.is_event_online,
      latitude: event.latitude,
      longitude: event.longitude,
      location_name: event.location_name,
      searchable_location_name: event.searchable_location_name,
      is_featured: event.is_featured,
      is_promoted: event.is_promoted,
      description: event.description,
      external_event_url: event.external_event_url,
      original_image_url: event.original_image_url,
      thumbnail_image_url: event.thumbnail_image_url,
      large_image_url: event.large_image_url,
      icon_image_url: event.icon_image_url,
      owner_name: event.owner_name,
      owner_description: event.owner_description,
      has_owner_info: event.has_owner_info,
      show_remaining_tickets: event.show_remaining_tickets,
      is_sessions_speakers_enabled: event.is_sessions_speakers_enabled,
      ticket_url: event.ticket_url,
      code_of_conduct: event.code_of_conduct,
      schedule_published_on: event.schedule_published_on,
      is_ticketing_enabled: event.is_ticketing_enabled,
      is_donation_enabled: event.is_donation_enabled,
      is_ticket_form_enabled: event.is_ticket_form_enabled,
      payment_country: event.payment_country,
      payment_currency: event.payment_currency,
      paypal_email: event.paypal_email,
      is_tax_enabled: event.is_tax_enabled,
      is_billing_info_mandatory: event.is_billing_info_mandatory,
      can_pay_by_paypal: event.can_pay_by_paypal,
      can_pay_by_stripe: event.can_pay_by_stripe,
      can_pay_by_cheque: event.can_pay_by_cheque,
      can_pay_by_bank: event.can_pay_by_bank,
      can_pay_onsite: event.can_pay_onsite,
      can_pay_by_omise: event.can_pay_by_omise,
      can_pay_by_alipay: event.can_pay_by_alipay,
      can_pay_by_paytm: event.can_pay_by_paytm,
      cheque_details: event.cheque_details,
      bank_details: event.bank_details,
      onsite_details: event.onsite_details,
      pentabarf_url: event.pentabarf_url,
      ical_url: event.ical_url,
      xcal_url: event.xcal_url,
      is_sponsors_enabled: event.is_sponsors_enabled,
      refund_policy: event.refund_policy,
      is_stripe_linked: event.is_stripe_linked}
  end
end
