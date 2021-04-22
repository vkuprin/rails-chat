# Chat Engine

Contains Rails functionality that allows Storns to manage `Group` and `GroupMessage` models/tables.

- [Chat Engine](#chat-engine)
  - [Design and Usage](#design-and-usage)
    - [Code Examples](#code-examples)
      - [Create message](#create-message)
      - [Create group](#create-group)
      - [Find group](#find-group)
      - [Retrieve groups](#retrieve-groups)

## Design and Usage

This component consists of two tables: `groups` and `group_messages`.

### Code Examples

#### Create message

Creates a message in a group.

```ruby
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
```

#### Create group

Creates a new group.

```ruby
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
```

#### Find group

Retrieve a specific group.

```ruby
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
```

#### Retrieve groups

Retrieves a list of groups.

```ruby
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
```
