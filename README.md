# Entities

Crystal html entities decoder

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  entities:
    github: kostya/entities
```

And run `crystal deps`

## Usage

```crystal
require "entities"

puts Entities.new("Christoph G&auml;rtner").decode 
# => "Christoph Gärtner"
```
