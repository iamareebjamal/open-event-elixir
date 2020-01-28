defmodule OpenEvent.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :external_event_url, :string
    field :is_sessions_speakers_enabled, :boolean, default: false
    field :ends_at, :utc_datetime_usec
    field :show_remaining_tickets, :boolean, default: false
    field :owner_description, :string
    field :thumbnail_image_url, :string
    field :is_stripe_linked, :boolean, default: false
    field :can_pay_by_paytm, :boolean, default: false
    field :is_ticketing_enabled, :boolean, default: false
    field :is_featured, :boolean, default: false
    field :is_sponsors_enabled, :boolean, default: false
    field :payment_country, :string
    field :is_billing_info_mandatory, :boolean, default: false
    field :icon_image_url, :string
    field :cheque_details, :string
    field :can_pay_by_stripe, :boolean, default: false
    field :logo_url, :string
    field :can_pay_by_alipay, :boolean, default: false
    field :starts_at, :utc_datetime_usec
    field :name, :string
    field :large_image_url, :string
    field :owner_name, :string
    field :code_of_conduct, :string
    field :is_ticket_form_enabled, :boolean, default: false
    field :location_name, :string
    field :timezone, :string
    field :can_pay_by_paypal, :boolean, default: false
    field :ical_url, :string
    field :can_pay_by_omise, :boolean, default: false
    field :is_donation_enabled, :boolean, default: false
    field :payment_currency, :string
    field :schedule_published_on, :utc_datetime_usec
    field :is_promoted, :boolean, default: false
    field :has_owner_info, :boolean, default: false
    field :onsite_details, :string
    field :original_image_url, :string
    field :is_event_online, :boolean, default: false
    field :xcal_url, :string
    field :searchable_location_name, :string
    field :latitude, :float
    field :longitude, :float
    field :can_pay_onsite, :boolean, default: false
    field :paypal_email, :string
    field :can_pay_by_cheque, :boolean, default: false
    field :is_tax_enabled, :boolean, default: false
    field :description, :string
    field :can_pay_by_bank, :boolean, default: false
    field :refund_policy, :string
    field :bank_details, :string
    field :pentabarf_url, :string
    field :ticket_url, :string

    timestamps(
      inserted_at: :created_at,
      updated_at: nil
    )
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :logo_url, :starts_at, :ends_at, :timezone, :is_event_online, :latitude, :longitude, :location_name, :searchable_location_name, :is_featured, :is_promoted, :description, :external_event_url, :original_image_url, :thumbnail_image_url, :large_image_url, :icon_image_url, :owner_name, :owner_description, :has_owner_info, :show_remaining_tickets, :is_sessions_speakers_enabled, :ticket_url, :code_of_conduct, :schedule_published_on, :is_ticketing_enabled, :is_donation_enabled, :is_ticket_form_enabled, :payment_country, :payment_currency, :paypal_email, :is_tax_enabled, :is_billing_info_mandatory, :can_pay_by_paypal, :can_pay_by_stripe, :can_pay_by_cheque, :can_pay_by_bank, :can_pay_onsite, :can_pay_by_omise, :can_pay_by_alipay, :can_pay_by_paytm, :cheque_details, :bank_details, :onsite_details, :pentabarf_url, :ical_url, :xcal_url, :is_sponsors_enabled, :refund_policy, :is_stripe_linked])
    |> validate_required([:name, :logo_url, :starts_at, :ends_at, :timezone, :is_event_online, :latitude, :longitude, :location_name, :searchable_location_name, :is_featured, :is_promoted, :description, :external_event_url, :original_image_url, :thumbnail_image_url, :large_image_url, :icon_image_url, :owner_name, :owner_description, :has_owner_info, :show_remaining_tickets, :is_sessions_speakers_enabled, :ticket_url, :code_of_conduct, :schedule_published_on, :is_ticketing_enabled, :is_donation_enabled, :is_ticket_form_enabled, :payment_country, :payment_currency, :paypal_email, :is_tax_enabled, :is_billing_info_mandatory, :can_pay_by_paypal, :can_pay_by_stripe, :can_pay_by_cheque, :can_pay_by_bank, :can_pay_onsite, :can_pay_by_omise, :can_pay_by_alipay, :can_pay_by_paytm, :cheque_details, :bank_details, :onsite_details, :pentabarf_url, :ical_url, :xcal_url, :is_sponsors_enabled, :refund_policy, :is_stripe_linked])
  end
end
