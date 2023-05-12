class HashTable {
  final List<List<_KeyValuePair>> _buckets;
  final int _numBuckets;

  HashTable(this._numBuckets)
      : _buckets = List<List<_KeyValuePair>>.filled(_numBuckets, []);

  void put(dynamic key, dynamic value) {
    final hash = _hash(key);
    print(hash);

    final bucket = _buckets[hash];

    for (var i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket[i] = _KeyValuePair(key, value);
        return;
      }
    }
    bucket.add(_KeyValuePair(key, value));
  }

  void delete(dynamic key) {
    final hash = _hash(key);
    final bucket = _buckets[hash];
    for (var i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        bucket.removeAt(i);
        return;
      }
    }
  }

  dynamic get(dynamic key) {
    final hash = _hash(key);
    final bucket = _buckets[hash];
    for (var i = 0; i < bucket.length; i++) {
      if (bucket[i].key == key) {
        return bucket[i].value;
      }
    }
    return null;
  }

  int _hash(dynamic key) {
    return key.toString().codeUnitAt(0) % _numBuckets;
  }
}

class _KeyValuePair {
  final dynamic key;
  final dynamic value;

  _KeyValuePair(this.key, this.value);
}

void main() {
  final table = HashTable(10);

  // Add some key-value pairs
  table.put('foo', 42);
  table.put('bar', 'hello');
  table.put('baz', true);
  table.delete('foo');
  // Retrieve some values by key
  final value1 = table.get('foo');
  final value2 = table.get('bar');
  final value3 = table.get('baz');
  final value4 = table.get('qux');

  // Print the values
  print('Value 1: $value1'); // Value 1: 42
  print('Value 2: $value2'); // Value 2: hello
  print('Value 3: $value3'); // Value 3: true
  print('Value 4: $value4'); // Value 4: null
}
