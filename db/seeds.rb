#encoding: utf-8
# clear data
connection = ActiveRecord::Base.connection();
def clear_for(connection, db)
  sql = "delete from #{db}"
  connection.execute sql
  puts "deleted all data from #{db}"
end

clear_for connection, 'categories'
clear_for connection, 'products'

# add categories
Category.create name: '氧化物', sort: 1
Category.create name: '硫化物', sort: 2
Category.create name: '金属',   sort: 3

o = Category.where(name: '氧化物').first
s = Category.where(name: '硫化物').first
m = Category.where(name: '金属').first

# add products
Product.create name: '氧化锌', desc: '氧化锌的描述', category_id: o.id, picked: true
Product.create name: '氧化铝', desc: '氧化铝的描述', category_id: o.id, picked: true
Product.create name: '硫化锌', desc: '硫化锌的描述', category_id: s.id, picked: true
