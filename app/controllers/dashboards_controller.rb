class DashboardsController < ApplicationController
   before_action :authenticate_user! #protects page with auth

   def overview
   end
end
