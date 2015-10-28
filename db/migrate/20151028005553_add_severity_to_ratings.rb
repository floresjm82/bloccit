class AddSeverityToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :role, :integer
  end
end
