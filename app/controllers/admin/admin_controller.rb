class Admin::AdminController < ApplicationController
  before_filter :require_login
end