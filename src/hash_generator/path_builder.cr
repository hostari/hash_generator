# PathBuilder "walks" the directory top-down to build the path name of nested files.
module HashGenerator
  class PathBuilder
    def initialize
    end

    # `Pathbuilder.walk` is a recursive method that opens parent directories up to their children (nested files and folders).
    # It appends the names of the folders to the parent directory to give an initial path
    # that contains just the succeeding folders nested within the parent directory.
    # For example, if the file name "config.txt" is nested within the following directory:
    # `/home/servers/server200/BepInEx/plugins`, the directory path would be "home/servers/server200/BepInEx/plugins".
    # This method does not complete the path up to the filenames within the folder.
    # We would need to pass in a block to it that returns an array of nested directories,
    # then loop through each directory, and then get the entries of that directory and append the file name to the parent paths.
    #
    # Example:
    # ```
    # path_builder = PathBuilder.new
    # path_builder.walk(/home/servers) { |folder| puts folder }
    # => "/home/servers/blah"
    # ```
    def walk(path = @root, &block : String, Array(String), Array(String) ->)
      # returns a new directory object for the named directory
      directory = Dir.new(path) if path.is_a?(String)
      # returns two arrays, one containing the files and the other containing directories; and builds the complete path for each directory
      directory_children, files = directory.not_nil!.children.partition { |content| Dir.exists?(File.join(directory.not_nil!.path, content)) }
      block.call(directory.not_nil!.path, directory_children, files)
      directory_children.each do |directory_child_name|
        # builds the path name from the root directory to name of the file
        walk File.join(directory.not_nil!.path, directory_child_name), &block
      end
    end
  end
end
