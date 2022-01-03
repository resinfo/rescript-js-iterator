# Rescript JS Iterator

Rescript JS Iterator is a [ReScript](https://rescript-lang.org/) library that provides bindings to the JavaScript [iterator protocol](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol).

## Installation

Using `yarn` or `npm`:

```bash
yarn add rescript-js-iterator
npm install --save rescript-js-iterator
```

In your `bsconfig.json`, add:

```json
{
  "bs-dependencies": ["rescript-js-iterator"]
}
```

## Usage

```rescript
let myIterable = getIterator() // previously defined function.

let current = myIterable->Iterator.next

let isDone = current->Iterator.done
let value = current->Iterator.value

/*
 * `done` and `value` are also available as properties of the object itself.
 */
current.done == current->Iterator.done
current.value == current->Iterator.value
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
