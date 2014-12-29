module Forms
  module FormSteps
    step 'I click on :element' do |element|
      begin
        send 'I click on :element within :container', element, 'form'
      rescue Capybara::ElementNotFound
        click_on element
      end
    end

    step 'I click on :element within :container' do |element, container|
      within container do
        click_on element
      end
    end

    step 'I hover over :element' do |element|
      find_link(element).hover
    end

    step 'I find :element checked' do |element|
      expect(find(:checkbox, element)).to be_checked
    end

    step 'I fill in :input with :value' do |input, value|
      if has_field?(input)
        element = find(:fillable_field, input)

        # phantomjs isn't reporting events like focus when using set.
        #
        # @see https://github.com/ariya/phantomjs/issues/10427
        element.click rescue nil

        fill_in input, with: value
      else
        within 'label', text: input do
          first(:xpath, './/..').set value
        end
      end
    end

    step 'I select :value from :input' do |value, input|
      select value, from: input
    end

    step 'I check :value' do |value|
      check value
    end

    step 'I uncheck :value' do |value|
      uncheck value
    end

    step 'I attach :input with :file_path' do |input, file_path|
      attach_file input, Rails.root.join('spec', 'fixtures', file_path)
    end

    step 'I fill in the form with the following details:' do |table|
      table.hashes.each do |hash|
        within :xpath, scope_to(hash['heading']) do
          case hash['type'].to_sym
          when :file
            send 'I attach :input with :file_path', hash['field'], hash['value']
          when :text
            send 'I fill in :input with :value', hash['field'], hash['value']
          when :dropdown
            send 'I select :value from :input', hash['value'], hash['field']
          when :checkbox
            case hash['value']
              when 'false' then send 'I uncheck :value', hash['field']
              else              send 'I check :value', hash['value']
            end
          when :calendar
            send 'I fill in :input calendar with :value', hash['field'], hash['value']
          end
        end
      end
    end

    step 'I should be able to submit the form by clicking on :element with the following details:' do |element, table|
      send 'I fill in the form with the following details:', table
      send 'I click on :element', element
      send 'I should see the following details:', table
    end

    step 'I should see the following details:' do |table|
      table.hashes.each do |hash|
        if hash['verify'].present?
          within :xpath, scope_to(hash['heading']) do
            expect(page).to have_content(hash['value'])
          end
        end
      end
    end

    step 'I should see error message :text' do |text|
      expect(page.find(:css, '.alert-error')).to have_text(text)
    end

    step 'I should see success message :text' do |text|
      expect(page.find(:css, '.alert-success')).to have_text(text)
    end

    step 'I should see :value in :input' do |value, input|
      expect(page).to have_field(input, with: value)
    end

    def scope_to(heading)
      if heading.present?
        "//*[normalize-space(text())='#{heading}']/parent::div"
      else
        "//body"
      end
    end
  end
end

RSpec.configure { |c| c.include Forms::FormSteps }
