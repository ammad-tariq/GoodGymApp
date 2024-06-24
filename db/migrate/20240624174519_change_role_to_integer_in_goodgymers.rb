class ChangeRoleToIntegerInGoodgymers < ActiveRecord::Migration[6.1]
  def up
    add_column :goodgymers, :role_integer, :integer, default: 0

    Goodgymer.reset_column_information
    Goodgymer.find_each do |goodgymer|
      case goodgymer.role
      when 'Regular'
        goodgymer.update_column(:role_integer, 0)
      when 'TaskForce'
        goodgymer.update_column(:role_integer, 1)
      end
    end

    remove_column :goodgymers, :role
    rename_column :goodgymers, :role_integer, :role
  end

  def down
    add_column :goodgymers, :role_string, :string

    Goodgymer.reset_column_information
    Goodgymer.find_each do |goodgymer|
      case goodgymer.role
      when 0
        goodgymer.update_column(:role_string, 'Regular')
      when 1
        goodgymer.update_column(:role_string, 'TaskForce')
      end
    end

    remove_column :goodgymers, :role
    rename_column :goodgymers, :role_string, :role
  end
end
