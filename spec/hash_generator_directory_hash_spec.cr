require "./spec_helper"

describe HashGenerator::DirectoryHash do
  describe "#get_hash" do
    it "returns an object containing the file path String and its SHA256 hash" do
      path1 = "./spec/support/sample_servers_list/sample_server"
      directory_hash1 = HashGenerator::DirectoryHash.new(path1).get_hash
      directory_hash1.keys.size.should eq(6)

      path2 = "./spec/support/sample_servers_list/sample_server2"
      directory_hash2 = HashGenerator::DirectoryHash.new(path2).get_hash
      file = directory_hash2.keys.first
      directory_hash2[file].bytesize.should eq(64)       # should have 64 bytes
      directory_hash2[file].hexbytes?.should_not eq(nil) # should not just be any other string, but a set of hexadecimal values
    end
  end
end
