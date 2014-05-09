class DropDiagnosticsQuestions < ActiveRecord::Migration
  def change
    drop_table :diagnostics_questions
  end
end
