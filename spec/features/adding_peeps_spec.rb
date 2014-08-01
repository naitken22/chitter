require 'spec_helper'

feature "User adds a new peep" do 

	scenario "when browsing the homepage" do
		expect(Peep.count).to eq(0)
		visit '/'
		add_peep("This is a test peep")
		expect(Peep.count).to eq(1)
		peep = Peep.first
		expect(peep.peep_text).to eq("This is a test peep")
	end

	def add_peep(peep_text)
		within('#new-peep') do 
			fill_in 'peep_text', with: peep_text
			click_button 'Send a Peep!'
		end
	end

end
