module Iterator = Js_iterator

let iterator = (_x): Iterator.t<'a> => %raw(`_x[Symbol.iterator]()`)

open Ava

test("[functions] Iterate string", t => {
  let value = "hi"
  let iterator = iterator(value)

  let current = iterator->Iterator.next

  t->false_(current->Iterator.done, ())
  t->is(current->Iterator.value, Some("h"), ())

  let current = iterator->Iterator.next

  t->false_(current->Iterator.done, ())
  t->is(current->Iterator.value, Some("i"), ())

  let current = iterator->Iterator.next

  t->true_(current->Iterator.done, ())
  t->is(current->Iterator.value, None, ())
})

test("[functions] Iterate array", t => {
  let value = [1, 2, 3]
  let iterator = iterator(value)

  let current = iterator->Iterator.next

  t->false_(current->Iterator.done, ())
  t->is(current->Iterator.value, Some(1), ())

  let current = iterator->Iterator.next

  t->false_(current->Iterator.done, ())
  t->is(current->Iterator.value, Some(2), ())

  let current = iterator->Iterator.next

  t->false_(current->Iterator.done, ())
  t->is(current->Iterator.value, Some(3), ())

  let current = iterator->Iterator.next

  t->true_(current->Iterator.done, ())
  t->is(current->Iterator.value, None, ())
})

test("[properties] Iterate string", t => {
  let value = "hi"
  let iterator = iterator(value)

  let current = iterator->Iterator.next

  t->false_(current.done, ())
  t->is(current.value, Some("h"), ())

  let current = iterator->Iterator.next

  t->false_(current.done, ())
  t->is(current.value, Some("i"), ())

  let current = iterator->Iterator.next

  t->true_(current.done, ())
  t->is(current.value, None, ())
})

test("[properties] Iterate array", t => {
  let value = [1, 2, 3]
  let iterator = iterator(value)

  let current = iterator->Iterator.next

  t->false_(current.done, ())
  t->is(current.value, Some(1), ())

  let current = iterator->Iterator.next

  t->false_(current.done, ())
  t->is(current.value, Some(2), ())

  let current = iterator->Iterator.next

  t->false_(current.done, ())
  t->is(current.value, Some(3), ())

  let current = iterator->Iterator.next

  t->true_(current.done, ())
  t->is(current.value, None, ())
})
