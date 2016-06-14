FactoryGirl.define do
  factory :atlas do
    zoom "18"
    west "-122.37534642219542"
    south "47.713981046182724"
    east "-122.3667526245117"
    north "47.716215187285286"
    rows "1"
    cols "2"
    title "CarkeekPark"
    text "Blah blah notes"
    layout "1"
    private "0"
    paper_size "letter"
    orientation "landscape"
    provider "http://{S}.tile.openstreetmap.org/{Z}/{X}/{Y}.png"
    utm_grid "1"
  end
end
