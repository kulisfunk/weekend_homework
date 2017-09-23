def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  pet_shop[:admin][:pets_sold] += sold
end

def stock_count(pet_shop)
  pet_shop[:pets].length
end

def pets_by_breed(pet_shop, dog_type)
  #create an empty array
  pet_type = []
  #loop through :pets and get breed value
    for dogs in pet_shop[:pets]
    breed = dogs[:breed]
    #now check breed value against dog_type, if == shovel into pet_type array
      if breed == dog_type
      pet_type << breed
      end
    end
  return pet_type
end

def find_pet_by_name(pet_shop, dog_name)
  #loop through :pets and get name value
    for dogs in pet_shop[:pets]
    name = dogs[:name]
    #now check name value against dog_name, if == return
      if name == dog_name
      return dogs
      end
    end
    # if name doesn't exist return nil
    return
end

def remove_pet_by_name(pet_shop, dog_name)
  #loop through :pets and get name value
  # arr.delete_if { |h| h["k1"] == "v3" }
    #name = pet_shop_array[:pets][:name]

    #read hash into pets variable
    pets = pet_shop[:pets]
    #if name matches, delete pet hash from array then return hash
    #searched google for methods and found delete_if, gave it a try
    pets.delete_if { |key| key[:name] == dog_name }
    #return pets

    # if name doesn't exist return nil
    #return
end


def add_pet_to_stock(pet_shop, new_pet)
  # shovel @new_pet hash straight into @pet_shop[:pets] array
  pet_shop[:pets] << new_pet
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  # shovel @new_pet hash straight into @customers[0][:pets] array
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
#refactored?? with a conditional......
  customer[:cash] >= new_pet[:price]
  #this was original code
  # # get customer's cash amount
  # customer_cash = customer[:cash]
  # # get price of pet
  # pet_cost = new_pet[:price]
  # #if customer can afford new_pet return true else return false
  # if customer_cash >= pet_cost
  #   return true
  # else
  #   return false
  # end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  #create empty array for pet hash
  pets = []
  pets << pet
  #check if pet exists and whether customer can afford pet
  if pet == nil || customer[:cash] >= pet[:price] == false
    #return
  else
    # add pet to customer
      customer[:pets] << pet
      #in admin increase money of store by cost of pet
      add_or_remove_cash(pet_shop, pet[:price])

      #in admin increase number of pets sold by 1
      increase_pets_sold(pet_shop, 1)

      #remove pet from pet shop
      pet_shop[:pets].delete_if { |key| key[:name] == pet[:name] }

      #decrease money of customer by amount pet costs
      customer[:cash] -= pet[:price]
    end
end
