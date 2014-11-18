require 'rails_helper'

describe 'projects' do
	context 'no projects have been added' do
		it 'should display a prompt to add a Project' do
			visit '/projects'
			expect(page).to have_content 'No projects'
			expect(page).to have_link 'Add a project'
		end
	end

	context 'Projects have been added' do
		before do
			@sp = Project.create(title: 'Swimming pool')
		end

		it 'should display projects' do
			visit '/projects'
			expect(page).to have_content('Swimming pool')
			expect(page).not_to have_content('No projects')
		end

		it 'lets a user view a project' do
			visit '/projects'
			click_link 'Swimming pool'
			expect(page).to have_content 'Swimming pool'
			expect(current_path).to eq "/projects/#{@sp.id}"
		end
	end
end

describe 'creating projects' do
	it 'prompts user to fill out a form, then displays the new project' do
		visit '/projects'
		click_link 'Add a project'
		fill_in 'Enter your project title', with: 'Swimming pool'
		click_button 'Create project'
		expect(page).to have_content 'Swimming pool'
		expect(current_path).to eq '/projects'
	end
end
