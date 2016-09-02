class ChangeLog
  directory = ENV['RAILS_ENV'] == 'production' ? "#{ENV['OPENSHIFT_LOG_DIR']}/cgbc_change.log" : "#{Rails.root}/log/change.log"
  def self.write(message)
    @change_logger ||= Logger.new("#{Rails.root}/log/change.log")
    @change_logger.info(message) unless message.nil?
  end
end
