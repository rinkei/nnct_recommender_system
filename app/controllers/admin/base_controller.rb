class Admin::BaseController < ApplicationController
  if Rails.env != "test"
    http_basic_authenticate_with :name => "admin", :password => "password"
  end
end
