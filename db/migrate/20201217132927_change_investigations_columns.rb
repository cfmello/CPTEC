class ChangeInvestigationsColumns < ActiveRecord::Migration[6.0]
  def change
    Investigation.where(cost: nil).update(cost: 0)
    Investigation.where(status: nil).update(status: 'Pendente')
    change_column :investigations, :cost, :float, null: false, default: 0, from: nil, to: 0
    change_column :investigations, :status, :string, null: false, default: 'Pendente', from: nil, to: 'Pendente'
  end
end
