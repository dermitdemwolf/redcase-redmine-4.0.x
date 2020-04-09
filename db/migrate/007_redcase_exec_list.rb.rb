
class RedcaseExecList < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    remove_index :execution_suite_project, :column => [:project_id]
  end
  
  def self.down
    add_index :execution_suite_project, [:project_id], :unique => true
  end

end
