defmodule OpenEvent.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :logo_url, :string
      add :starts_at, :utc_datetime
      add :ends_at, :utc_datetime
      add :timezone, :string
      add :is_event_online, :boolean, default: false, null: false
      add :latitude, :float
      add :longitude, :float
      add :location_name, :string
      add :searchable_location_name, :string
      add :is_featured, :boolean, default: false, null: false
      add :is_promoted, :boolean, default: false, null: false
      add :description, :string
      add :external_event_url, :string
      add :original_image_url, :string
      add :thumbnail_image_url, :string
      add :large_image_url, :string
      add :icon_image_url, :string
      add :owner_name, :string
      add :owner_description, :string
      add :has_owner_info, :boolean, default: false, null: false
      add :show_remaining_tickets, :boolean, default: false, null: false
      add :is_sessions_speakers_enabled, :boolean, default: false, null: false
      add :ticket_url, :string
      add :code_of_conduct, :string
      add :schedule_published_on, :utc_datetime
      add :is_ticketing_enabled, :boolean, default: false, null: false
      add :is_donation_enabled, :boolean, default: false, null: false
      add :is_ticket_form_enabled, :boolean, default: false, null: false
      add :payment_country, :string
      add :payment_currency, :string
      add :paypal_email, :string
      add :is_tax_enabled, :boolean, default: false, null: false
      add :is_billing_info_mandatory, :boolean, default: false, null: false
      add :can_pay_by_paypal, :boolean, default: false, null: false
      add :can_pay_by_stripe, :boolean, default: false, null: false
      add :can_pay_by_cheque, :boolean, default: false, null: false
      add :can_pay_by_bank, :boolean, default: false, null: false
      add :can_pay_onsite, :boolean, default: false, null: false
      add :can_pay_by_omise, :boolean, default: false, null: false
      add :can_pay_by_alipay, :boolean, default: false, null: false
      add :can_pay_by_paytm, :boolean, default: false, null: false
      add :cheque_details, :string
      add :bank_details, :string
      add :onsite_details, :string
      add :pentabarf_url, :string
      add :ical_url, :string
      add :xcal_url, :string
      add :is_sponsors_enabled, :boolean, default: false, null: false
      add :refund_policy, :string
      add :is_stripe_linked, :boolean, default: false, null: false

      timestamps()
    end

  end
end
