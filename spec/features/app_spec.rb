

RSpec.feature "Battle" do
  scenario "User fills out name in form" do
    sign_in_and_play
    expect(page).to have_content 'Tom vs. Dan'
  end

  scenario "User can see player 2 hit points" do
    sign_in_and_play
    expect(page).to have_content 'Dan 100/100 points'
  end

  scenario "Player_2 points reduced upon attack" do
    sign_in_and_play
    click_button 'ATTACK!'
    click_button 'FIGHT AGAIN!'
    expect(page).to have_content "Dan 90/100 points"
  end

  scenario "First player to attack is Tom" do
    sign_in_and_play
    click_button 'ATTACK!'
    click_button 'FIGHT AGAIN!'
    expect(page).to have_content "DAN ATTACK!"

  end

  scenario "Switches players upon attack" do
    sign_in_and_play
    click_button 'ATTACK!'
    click_button 'FIGHT AGAIN!'
    click_button 'ATTACK!'
    click_button 'FIGHT AGAIN!'
    expect(page).to have_content "TOM ATTACK!"
  end

  scenario "Player gets POW confirm of attack" do
    sign_in_and_play
    click_button 'ATTACK!'
    expect(page).to have_content "OUCH! Dan you've been hit!"
  end

end
