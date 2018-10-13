class AddTopicidToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :topic_id, :integer
  end
end
