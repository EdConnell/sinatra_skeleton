class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.string :title
      t.string :file
      t.belongs_to :user
      t.timestamp :uploaded_at, :default => Time.now
    end
  end
end
