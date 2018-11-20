module Isochron
  VERSION = "0.1.0"

  def self.capture(&block)
    Procedure.new(block)
  end
  
  class Procedure
    def initialize(proc)
      @proc = proc
      @sem = Mutex.new
      @done = false
      @result = nil
    end

    def call
      return @result if @done

      @sem.synchronize do
        if !@done
          @result = @proc.call
          @done = true
        end
      end

      @result
    end
  end
end
