FactoryGirl.define do

  # == Schema Information
  #
  # Table name: users
  #
  #  id                     :integer          not null, primary key
  #  username               :string(32)
  #  legacy_password        :string(40)
  #  email                  :string(255)
  #  encrypted_password     :string(255)      default(""), not null
  #  reset_password_token   :string(255)
  #  reset_password_sent_at :datetime
  #  remember_created_at    :datetime
  #  confirmation_token     :string(255)
  #  confirmed_at           :datetime
  #  confirmation_sent_at   :datetime
  #  unconfirmed_email      :string(255)
  #  updated_at             :datetime
  #  created_at             :datetime
  #
  factory :unconfirmed_user, :class => User do
    username     'test'
    email    'test@gmail.com'
  end

  factory :confirmed_user, :class => User do
    username     'test'
    email    'test@gmail.com'
    confirmation_token 'abcdedfg'
    confirmed_at '01-01-2016 T00:00:01Z'
    confirmation_sent_at '01-01-2016 T00:00:00Z'
  end

  factory :default_atlas, :class => Atlas do
    # == Schema Information
    #
    # Table name: atlases
    #
    #  id             :integer          not null, primary key
    #  user_id        :integer
    #  slug           :string(8)        not null
    #  title          :text(4294967295)
    #  text           :text(4294967295)
    #  west           :float(53)        not null
    #  south          :float(53)        not null
    #  east           :float(53)        not null
    #  north          :float(53)        not null
    #  zoom           :integer
    #  rows           :integer          not null
    #  cols           :integer          not null
    #  provider       :string(255)
    #  paper_size     :string(6)        default("letter"), not null
    #  orientation    :string(9)        default("portrait"), not null
    #  layout         :string(9)        default("full-page"), not null
    #  pdf_url        :string(255)
    #  preview_url    :string(255)
    #  country_name   :string(64)
    #  country_woeid  :integer
    #  region_name    :string(64)
    #  region_woeid   :integer
    #  place_name     :string(128)
    #  place_woeid    :integer
    #  progress       :float(24)
    #  private        :boolean          default(FALSE), not null
    #  cloned_from    :integer
    #  refreshed_from :integer
    #  created_at     :datetime
    #  updated_at     :datetime
    #  composed_at    :datetime
    #  failed_at      :datetime
    #  workflow_state :string(255)
    #
    user_id 1
    slug "FPSLUG"
    title "FPTEST"
    zoom 18
    rows 2
    cols 2
    provider "http://osm.org/{z}/{x}/{y}.png"
    pdf_url "https://fake-s3/fptest.pdf"
    west  -122.3789
    south  47.5771
    east -122.2931
    north  47.6349
  end

end