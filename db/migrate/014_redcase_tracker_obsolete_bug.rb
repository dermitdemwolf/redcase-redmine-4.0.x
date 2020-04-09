
class RedcaseTrackerObsoleteBug < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    obsoleted_state = IssueStatus.find_by_name('Obsoleted')
    obsoleted_state.name = 'Obsolete'
    obsoleted_state.save
  end
    
end
