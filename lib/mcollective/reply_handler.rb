module MCollective
  
  # Responsible for handling two types of replies from the server
  #
  #   - replies
  #
  #       these are normal replies. it means the server has finished the request
  # 
  #   - progress
  # 
  #       these are update replies - execution is still in progress
  #
  # it is used inside the server and inside the client
  
  class ReplyHandler

    def initialize(&block)      
      @handle_replies, @handle_progress = nil, nil
      
      if block_given?      
        begin
          yield self 
        rescue => e
          raise "ReplyHandler block threw #{e.class.name}: #{e.message} \n" +  e.backtrace.join("\n")
        end
      end
    end

    def replies(&block)
      if block_given?
        @handle_replies = block
      else
        @handle_replies
      end
    end

    def progress(&block)
      if block_given?
        @handle_progress = block
      else
        @handle_progress
      end
    end

  end

end