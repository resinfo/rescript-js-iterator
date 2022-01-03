module Iterator = Js_iterator

let iterator = (_x): Iterator.t<'a> => %raw(`_x[Symbol.iterator]()`)

open Ava

test("Iterate string", t => {
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

test("Iterate array", t => {
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
