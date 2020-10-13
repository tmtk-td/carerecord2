module CareRecordsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_care_records_path
    elsif action_name == 'edit'
      care_record_path
    end
  end
end
