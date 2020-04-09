
class RedcaseExecJournal < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    create_table :execution_journals do |t|
      t.integer :test_case_id, :null => false
      t.integer :result_id, :null => false
      t.integer :version_id
      t.string :comment
      t.datetime :created_on, :null => false
    end
  end
  
  def self.down
    drop_table :execution_journals
  end
  
end
