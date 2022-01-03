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
