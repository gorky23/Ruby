# frozen_string_literal: true

require_relative '../tasks/items_manager'

namespace :items do
  task fix_users_associations: :environment do
    p 'Fixing items associations'
    user = User.find_by(email: 'k.szafranska@wp.pl')
    ItemsManager.new.fix_items_and_users_associations(user:)
    p 'Finished'
  end
end
