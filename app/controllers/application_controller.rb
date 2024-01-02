class ApplicationController < ActionController::Base
    def log_messages
        Rails.logger.debug("[DEBUG] This is a debug message from the controller.")
        Rails.logger.info("[INFO] This is an info message from the controller.")
        Rails.logger.warn("[WARN] This is a warning message from the controller.")
        Rails.logger.error("[ERROR] This is an error message from the controller.")
        Rails.logger.fatal("[FATAL] This is a fatal error message from the controller.")
        Rails.logger.info("This is an info message from the controller.")
    
    
        render plain: "Log messages have been generated. Check the logs for details."
end
