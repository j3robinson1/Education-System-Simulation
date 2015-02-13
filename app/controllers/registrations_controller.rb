class RegistrationsController < Devise::RegistrationsController
def new
  @schools = School.all
  super
end
end