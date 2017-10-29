class ChangeLog
  @log_dir = ENV['RAILS_ENV'] == 'production' ? "#{ENV['LOG_DIR']}/cgbc_change.log" : "#{Rails.root}/log/change.log"
  def self.write(message)
    @change_logger ||= Logger.new(@log_dir)
    @change_logger.info(message) unless message.nil?
  end
end
