
class RedcaseResultOrderBug < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    rename_column :execution_results, :order, :order_num
  end

  def self.down
    rename_column :execution_results, :order_num, :order
  end

end
