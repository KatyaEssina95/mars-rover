require "test_helper"
require "file_reader"

class FileReaderTest < Minitest::Test
  def test_file_doesnt_exist
    file_path = "a_file_that_doesnt_exists.txt"

    exception = assert_raises { FileReader.new(file_path) }
    assert_equal "No such file #{file_path}. Please provide a valid file path", exception.message
  end

  def test_incorrect_file_extension
    file = Tempfile.new(["test", ".csv"])

    exception = assert_raises { FileReader.new(file.path) }
    assert_equal "File must have a .txt extension", exception.message
  end

  def test_empty_file
    file = Tempfile.new(["test", ".txt"])

    exception = assert_raises { FileReader.new(file) }
    assert_equal "File must not be empty", exception.message
  end

  def test_lines
    lines = ["line 1\n", "line 2\n", "line 3\n"]
    file = Tempfile.new(["test", ".txt"])
    file.write(lines.join)
    file.close

    file_reader = FileReader.new(file.path)

    assert_equal lines, file_reader.lines
  end
end
