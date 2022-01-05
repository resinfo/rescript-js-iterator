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

test("Iterator.forEach(t, fn)", t => {
  let value = "hello"
  let i = iterator(value)

  let counter = ref(-1)

  i->Iterator.forEach((. x) => {
    counter := counter.contents + 1
    t->is(value->Js.String2.get(counter.contents), x, ())
  })

  let value = "9876543210"
  let i = iterator(value)

  let counter = ref(-1)

  i->Iterator.forEach((. x) => {
    counter := counter.contents + 1
    t->is(value->Js.String2.get(counter.contents), x, ())
  })

  let value = [{"a": "a"}, {"a": "b"}, {"a": "c"}]
  let i = iterator(value)

  let counter = ref(-1)

  i->Iterator.forEach((. x) => {
    counter := counter.contents + 1
    t->is(value->Js.Array2.unsafe_get(counter.contents), x, ())
  })

  let value = [None, Some(1), Some(0), None]
  let i = iterator(value)

  let counter = ref(-1)

  i->Iterator.forEach((. x) => {
    counter := counter.contents + 1
    t->is(value->Js.Array2.unsafe_get(counter.contents), x, ())
  })

  let value = [None, Some(1), Some(0), None]
  let i = iterator(value)

  let counter = ref(-1)

  i->Iterator.forEach((. x) => {
    counter := counter.contents + 1
    t->is(value->Js.Array2.unsafe_get(counter.contents), x, ())
  })

  let value = [
    None,
    Some(Some(Some([{"a": "a"}]))),
    Some(Some(Some([{"a": "b"}, {"a": "c"}]))),
    Some(Some(None)),
    Some(None),
  ]
  let i = iterator(value)

  let counter = ref(-1)

  i->Iterator.forEach((. x) => {
    counter := counter.contents + 1
    t->is(value->Js.Array2.unsafe_get(counter.contents), x, ())
  })
})
