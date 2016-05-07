class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    binding.pry
    # do_stuff
  end
end
