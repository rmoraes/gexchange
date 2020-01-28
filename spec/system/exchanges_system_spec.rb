require 'rails_helper'
 
RSpec.describe "ExchangesSystem", type: :system, js: true do
  
  describe '#index view' do
    
    context "Currency convert" do
      before do 
        Stubs.request_currency
        visit(root_path) 
      end

      xit 'Convert USD 10 currency to BRL' do
        within("#exchange_form") do
          select('BRL', from: 'from')
          select('USD', from: 'to')
          fill_in('amount', with: 10)
        end
      
        page.execute_script "$('#amount').trigger('keyup')"

        expect(page).to have_selector('input[value="34.1325"]')
      end
    end

    context "Criptocurrency convert" do
      before do 
        Stubs.request_blockchain
        visit(root_path) 
      end

      xit 'Convert BTC 2 criptocurrency to BRL' do
        within("#exchange_form") do
          select('BTC', from: 'from')
          select('BRL', from: 'to')
          fill_in('amount', with: 10)
        end
      
        page.execute_script "$('#amount').trigger('keyup')"

        expect(page).to have_selector('input[value="72069.78"]')
      end
    end

  end
end
