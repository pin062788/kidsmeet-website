module Common
  module NavigationSteps
    step 'I go to the :page page' do |page|
      noun, verb = page.split(' ')
      url = "/#{noun.pluralize}"
      url += "/#{verb}" unless verb.nil?

      visit url
    end

    step 'I should see :content' do |content|
      expect(page).to have_content(content)
    end

    step 'I should see :content within :container' do |content, container|
      within container do
        expect(page).to have_content(content)
      end
    end

    step 'I should not see :content' do |content|
      expect(page).to_not have_content(content)
    end

    step 'I should not see :content within :container' do |content, container|
      within container do
        expect(page).to_not have_content(content)
      end
    end

    step 'There is no :model' do |model|
      model.camelize.constantize.delete_all
    end

    step 'There is a :model' do |model|
      FactoryGirl.send(:create, model.to_sym)
    end
  end
end

RSpec.configure { |c| c.include Common::NavigationSteps }
