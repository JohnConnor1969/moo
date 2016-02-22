class AdminsController < ApplicationController
  http_basic_authenticate_with name: "root", password: "1q2w3E"
end