describe "GET /products" do
    it "display some products list" do
        visit products_path
        page.should have_content "Nexus 5"
    end

    it "add a product into product catalog" do
            visit products_path
            click_link 'New Product'
            current_path.should == new_product_path
            fill_in :Name, :with =>  'Nexus 5'
            fill_in :Price, :with => '30000'
            click_button 'Save'
            click_link 'Back'
            current_path.should == products_path
       end
 end