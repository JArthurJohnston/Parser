class SourceNavigator
  attr_reader :source_code,
              :index

  def initialize source_code
    @source_code = source_code
    @index = 0
    @last_index = 0
  end

  def parse_until token
    @last_index = @index
    begin
      @index += 1
    end until @source_code[@index].eql? token
    # use eql?, not equal? or ==
    return current_token
  end

  def current_token
    return sub_string.strip
  end

  private

    def sub_string
      substring_length = @index - @last_index
      @source_code.slice @last_index, substring_length
    end

end