require 'json'
require 'typhoeus'

class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
  end

  def new
    @user = current_user
    bearer_token = ENV["BEARER_TOKEN"]
    url = "https://api.twitter.com/2/users/#{@user.uid}/owned_lists"
    # TODO URLのサニタイジング？
    params = {
      'list.fields': 'created_at,follower_count',
    }
    def lists(url, bearer_token, params)
      options = {
      method: 'get',
      headers: {
        "User-Agent": "v2ListLookupRuby",
        "Authorization": "Bearer #{bearer_token}"
      },
      params: params
    }
    request = Typhoeus::Request.new(url, options)
    response = request.run
    return response
    end
    response = lists(url, bearer_token, params)
    list_responses = JSON.parse(response.body)['data']
    list_data = []
    list_responses.each {|list_response|
      list_data.push([{ id: list_response['id'], name: list_response['name'] }])
    }
    @lists = list_data
  end

  def create
  end

  def show
  end
end
