# frozen_string_literal: true

#
# Chat Engine is built with Rails Engine.
#

# USAGE
#
# KNOWN ISSUES

require "chat/engine" if defined?(Rails)

module Chat
  # Create message
  #
  # @param message_params [Hash] Message attributes
  # @return [Hash]
  #  {
  #    "group_id"=>1,
  #    "user_id"=>1,
  #    "message"=>"Where can I buy this?",
  #    "created_at"=>"2020-12-01T20:03:11.762Z",
  #    "updated_at"=>"2020-12-01T20:03:11.762Z",
  #  }
  def self.create_message(message_params)
    GroupMessage.create(message_params)
  end

  # Create group
  #
  # @param group_params [Hash] Group attributes
  # @return [Hash]
  #  {
  #    "name"=>"Stanley Park Group",
  #    "description"=>"Stanley Park Chat Group",
  #    "created_at"=>"2020-12-01T20:03:11.762Z",
  #    "updated_at"=>"2020-12-01T20:03:11.762Z",
  #  }
  def self.create_group(group_params)
    Group.create(group_params)
  end

  # Find group
  #
  # @param id [String] Group id
  # @return [Hash]
  #  {
  #    "id"=>"1",
  #    "name"=>"Stanley Park Group",
  #    "description"=>"Stanley Park Chat Group",
  #    "created_at"=>"2020-12-01T20:03:11.762Z",
  #    "updated_at"=>"2020-12-01T20:03:11.762Z",
  #  }
  def self.find_group(id)
    Group.find(id)
  end

  # Retrieve groups
  #
  # @return [Hash]
  #  [{
  #    "id"=>"1",
  #    "name"=>"Stanley Park Group",
  #    "description"=>"Stanley Park Chat Group",
  #    "created_at"=>"2020-12-01T20:03:11.762Z",
  #    "updated_at"=>"2020-12-01T20:03:11.762Z",
  #  },
  #  {
  #    "id"=>"1",
  #    "name"=>"Stanley Park Group",
  #    "description"=>"Stanley Park Chat Group",
  #    "created_at"=>"2020-12-01T20:03:11.762Z",
  #    "updated_at"=>"2020-12-01T20:03:11.762Z",
  #  }]
  def self.groups
    Group.all
  end
end
