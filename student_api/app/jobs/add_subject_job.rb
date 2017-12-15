class AddSubjectJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    logger.debug "inside perform"
    puts "hi"
   
  end
end


AddSubjectJob.perform