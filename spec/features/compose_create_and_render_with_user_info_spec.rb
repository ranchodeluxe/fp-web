require 'rails_helper'

feature 'compose atlas' do
  scenario 'user clicks "Make Atlas"' do
    @user = sign_in(:user)
    visit '/compose'
    fill_in 'atlas_title', with: 'MorelCity'
    expect(page).to have_field('atlas[title]', with: 'MorelCity')
    find('input[name="commit"]').click
    sleep 5
    # TODO: Capybara clicks are not firing
    #expect(Atlas.count).to eq(1)
    #expect(page).to have_text(@user.to_s)
    #Rails.logger.debug("[ CURRENT PATH ]: #{page.current_path}")
    #expect(page.current_path).to eq(atlas_url(Atlas.first))
  end
end