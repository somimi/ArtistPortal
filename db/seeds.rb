# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

visual_fee = Fee.find_or_initialize_by_name("2013_VISUAL")
visual_fee.description = "Visual Art Submission Fee"
visual_fee.amount = 10
visual_fee.save!

literary_fee = Fee.find_or_initialize_by_name("2013_LITERARY")
literary_fee.description = "Literary Art Submission Fee"
literary_fee.amount = 10
literary_fee.save!

installation_fee = Fee.find_or_initialize_by_name("2013_INSTALLATION")
installation_fee.description = "Installation Art Submission Fee"
installation_fee.amount = 32
installation_fee.save!

film_fee = Fee.find_or_initialize_by_name("2013_FILM")
film_fee.description = "Film Submission Fee"
film_fee.amount = 20
film_fee.save!

store_fee = Fee.find_or_initialize_by_name("2013_STORE")
store_fee.description = "Store Submission Fee"
store_fee.amount = 20
store_fee.save!
