
class RedcasePatchJournal2 < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    change_table :execution_journals do |t|
      t.change :executor_id, :integer, :null => true
    end
  end
  
  def self.down
    change_table :execution_journals do |t|
      t.change :executor_id, :integer, :null => false
    end
  end
  
end
