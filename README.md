# hash_generator

The hash_generator builds a path for each file within a directory and generates the file's SHA256. This can be used to detect if the file contents have been updated.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     hash_generator:
       github: hostari/hash_generator
   ```

2. Run `shards install`

## Usage

```crystal
require "hash_generator"
```

To generate the SHA256 for each files within a directory, pass in the path of the folder that you need to `walk` through:

```crystal
path = "./spec/support/sample_servers_list/sample_server2"
HashGenerator::DirectoryFile.new(path).get_hash
```

## Contributing

1. Fork it (<https://github.com/your-github-user/hash_generator/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [paula4230](https://github.com/paula4230) - creator
- [xaviablaza](https://github.com/xaviablaza) - maintainer
