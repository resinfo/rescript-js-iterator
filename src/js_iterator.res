type value<'value> = {
  done: bool,
  value: option<'value>,
}

type t<'value>

@ocaml.doc(
  "A function, with either zero arguments or one argument, that returns an object with at least the following two properties. If the `next()` method is called with one argument, that argument will be available to the `next()` method being invoked."
)
@send
external next: t<'value> => value<'value> = "next"

@ocaml.doc("Has the value `false` if the iterator was able to produce the next value in the sequence. (This is equivalent to not specifying the `done` property altogether.).
  
  Has the `value` true if the iterator has completed its sequence. In this case, value optionally specifies the return value of the iterator.")
@get
external done: value<'value> => bool = "done"

@ocaml.doc("Any JavaScript value returned by the iterator. Can be omitted when `done` is `true`.")
@get
external value: value<'value> => option<'value> = "value"

@ocaml.doc("Convenience function to iterate in lieu of the native JavaScript `for (const x of iterable)` syntax.

Be aware that this must still be passed an `Iterator.t`, *not* a raw value; this is not a drop-in replacement for `for (const x of iterable)`")
let forEach = (t, fn) => {
  let rec loop = t => {
    let next = t->next

    if !(next->done) {
      fn(. next->value->Belt.Option.getUnsafe)
      loop(t)
    }
  }

  loop(t)
}
