require "administrate/base_dashboard"

class FundDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    member: Field::BelongsTo.with_options(
      searchable: true,
      searchable_fields: ['name'],
    ),
    goal_name: Field::Select.with_options(
      collection: ['Retirement','Rent','Education-LongTerm']
    ),
    amc_name: Field::String,
    fund_name: Field::String,
    fund_type: Field::Select.with_options(
      collection: ['Equity','Debt']
    ),
    fund_code: Field::Number,
    folio_number: Field::Number,
    nav_at: Field::Date,
    nav: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    member
    goal_name
    fund_name
    nav_at
    nav
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    amc_name
    fund_name
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    member
    goal_name
    amc_name
    fund_name
    fund_type
    fund_code
    folio_number
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how funds are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(fund)
    "#{fund.fund_name} (#{fund.member.name})"
  end
end
