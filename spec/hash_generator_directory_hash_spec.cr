require "./spec_helper"

describe HashGenerator::DirectoryFile do
  describe "#get_hash" do
    it "returns an object containing the file path String and its SHA256 hash" do
      path1 = "./spec/support/sample_servers_list/sample_server"
      directory_file1 = HashGenerator::DirectoryFile.new(path1).get_hash
      directory_file1.keys.size.should eq(6)

      path2 = "./spec/support/sample_servers_list/sample_server2"
      directory_file2 = HashGenerator::DirectoryFile.new(path2).get_hash
      file = directory_file2.keys.first
      directory_file2[file].bytesize.should eq(64)       # should have 64 bytes
      directory_file2[file].hexbytes?.should_not eq(nil) # should not just be any other string, but a set of hexadecimal values
    end
  end
end
