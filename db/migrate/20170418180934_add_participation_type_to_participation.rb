class AddParticipationTypeToParticipation < ActiveRecord::Migration[5.0]
  def change
    add_column :participations, :participation_type, :integer
  end
end
