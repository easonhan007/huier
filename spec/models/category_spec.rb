#encoding: utf-8
require 'spec_helper'

describe Category do
  fixtures :categories

  context 'sort' do
    it 'should sort categories DESC' do
      Category.sorted.first.name.should eq(categories(:m).name)
      Category.sorted.last.name.should eq(categories(:o).name)
    end

    it 'should sort correctly when change the sort' do
      Category.sorted.last.update_attributes sort: 999
      Category.sorted.first.name.should eq(categories(:o).name)
    end

    it 'should sort correctly when create a new category' do
      Category.create name: 'new', sort: 4
      Category.sorted.first.name.should eq('new')
    end
  end

  context 'validation' do
    it 'name is required' do
      Category.new.should_not be_valid
      Category.new(name:'required').should be_valid
    end
  end

end
