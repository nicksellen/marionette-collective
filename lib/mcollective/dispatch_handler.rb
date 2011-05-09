module MCollective
  
  class DispatchHandler

    def initialize(&block)      
      @handle_replies, @handle_progress = nil, nil
      yield self
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