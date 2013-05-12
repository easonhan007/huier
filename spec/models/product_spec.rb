require 'spec_helper'

describe Product do
  fixtures :products
  fixtures :categories

  context 'picked' do
    it 'should get picked products' do
      picked = Product.picked.map { |p| p.name }
      all = []
      [:one, :two, :three].each do |label|
        all.push products(label).name
      end
      picked.should eql(all.reverse!)
    end

    it 'should create a picked product' do
      Product.create name: 'foo', desc: 'foo', picked: true
      Product.picked.last.name.should eq('foo')
    end
  end #context

  context 'validation' do
    it 'name is required' do
      Product.new.should_not be_valid
      Product.new(name: 'product').should be_valid
    end
  end #context

end
