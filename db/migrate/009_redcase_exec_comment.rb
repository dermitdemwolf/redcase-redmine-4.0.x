
class RedcaseExecComment < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    change_table :execution_journals do |t|
      t.change :comment, :text
    end
  end
  
  def self.down
    change_table :execution_journals do |t|
      t.change :comment, :string
    end
  end
  
end
