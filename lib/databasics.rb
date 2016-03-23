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
binding.pry
module Databasics

	class App

	def create_user
		puts "What is your first name?"
			first_name = gets.chomp
		puts "What is your last name?"
			last_name = gets.chomp
		puts "What is your email address?"
			email = gets.chomp
		new_user = Databasics::User.new(first_name: "#{first_name}", last_name: "#{last_name}", email: "#{email}")
	end

	def get_current_addy(user_id)
		# Add a method to display a user's current addresses.
		# puts "What user would you like to search for?"
		# 	user = gets.chomp
		users_address = Databasics::Address.find_by(user_id: "#{user_id}")
	end

	def item_ordered
		# Add a method to display the items a user has ordered in the past and the number ordered.
		items_order = Databasics::Items.where(user_id: )
	end

	def place_order
		# Add a method to prompt a user for an item name and quantity and create a new order. 
		# If no such item can be found, you may tell them the order has been declined.
		puts "What item would you like to purchase?"
			item = gets.chomp
		puts "What is the quantity?"
			amount = gets.chomp.to_i

	end

	
	end
end

  ## 3 ActiveRecord querying methods
  # 1) Model.where
  # 2) Model.find
  # 3) Model.find_by