class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column_default :users, :balance, nil
    end

    def down
      change_column_default :users, :balance, 0
    end

    def up
      change_column_default :users, :point, nil
    end

    def down
      change_column_default :users, :point, 0
    end

    def up
      change_column_default :users, :value, nil
    end

    def down
      change_column_default :users, :value, 0
    end

    def up
      change_column_default :users, :payment, nil
    end

    def down
      change_column_default :users, :payment, ""
    end

  end
end
