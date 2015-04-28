require 'infrastucture/user_model'
require 'users/user_repo'

user_repo = Infrastucture::UserModel.for User
Repos::Users = Repos::Users.for user_repo
