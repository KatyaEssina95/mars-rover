class FileReader
  attr_reader :file

  def initialize(file)
    @file = file
    validate!
  end

  def lines
    File.new(file).readlines
  end

  private

  def validate!
    validate_file_exists!
    validate_file_type!
    validate_file_not_empty!
  end

  def validate_file_exists!
    raise "No such file #{file}. Please provide a valid file path" unless File.exist?(file)
  end

  def validate_file_type!
    raise "File must have a .txt extension" unless File.extname(file) == ".txt"
  end

  def validate_file_not_empty!
    raise "File must not be empty" if File.empty?(file)
  end
end
