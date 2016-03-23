require "active_record"
require "yaml"
require "pry"

require "databasics/version"
require "databasics/user"
require "databasics/address"
require "databasics/orders"
require "databasics/items"

db_config = YAML.load(File.open("config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)
# binding.pry
module Databasics

	class App

		def create_user
			puts "What is your first name?"
				first_name = gets.chomp
			puts "What is your last name?"
				last_name = gets.chomp
			puts "What is your email address?"
				email = gets.chomp
			#new_user = User.find_by_or_create_by(first_name: first_name, last_name: last_name, email: email)
			new_user = User.new(first_name: first_name, last_name: last_name, email: email)
			new_user.save
			puts "Your new user id is #{user.id}"
		end

		def get_current_addy(user_id)
		# Add a method to display a user's current addresses.
		# puts "What user would you like to search for?"
		# 	user = gets.chomp
			puts "What is your first name?"
			first = gets.chomp
			puts "What is your last name"
			last = gets.chomp
			user = User.find_by(first_name: first, last_name: last)
			addresses = Address.where(user_id: user.id)
			addresses.each do |address|
				puts "Address: #{address.street}, #{address.city}, #{address.state}, #{address.zip}"
			end
		# users_address = Address.find_by(user_id: "#{user_id}")
		end

		def item_ordered
		# Add a method to display the items a user has ordered in the past and the number ordered.
			puts "What is your id"
			user_id = gets.chomp
		# user = User.find(user_id)
			orders = Orders.where(user_id: user_id)
			orders.each do |order|
			binding.pry
			"SELECT items.title, orders.quantity FROM orders INNER JOIN items
			ON orders.item_id=items.id WHERE orders.user_id=39;"
			item = Item.find(order.item_id)
			puts "You ordered #{order.quantity} #{item.title.pluralize}"
		# items_order = Items.where(user_id: )
			end	
		end

		def place_order
		# Add a method to prompt a user for an item name and quantity and create a new order. 
		# If no such item can be found, you may tell them the order has been declined.
			puts "What item would you like to purchase?"
				item_name = gets.chomp
			puts "What is the quantity?"
				amount = gets.chomp.to_i
			puts "What is your User id?"
				user_id = gets.chomp
			item = Items.find_by(items: item_name)
			if item == true
				item.each do |item|
					order = Orders.new(user_id: user_id, item_id: item.id ,quantity: amount)
				end
				puts "You order has been placed!"
			else
				puts "Sorry we dont carry that item.."
				exit
			end
		end
	end
end

tony = Databasics::App.new
tony.item_ordered

