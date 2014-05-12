class CreateDiagnosticsQuestions < ActiveRecord::Migration
  def change
    create_table :diagnostics_questions do |t|
      t.references :diagnostic, index: true
      t.references :question, index: true
    end
  end
end
