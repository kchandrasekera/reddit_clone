class EditUserIdColumnInLinkTable < ActiveRecord::Migration
  def change
    rename_column :links, :user_id, :submitter_id
  end
end
