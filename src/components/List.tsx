function List() {
  const fruits = [
    { id: 1, name: 'Apple' },
    { id: 2, name: 'Banana' },
    { id: 3, name: 'Orange' },
  ]

  return (
    <>
      <ul>
        {fruits.map((fruit) => (
          <li key={fruit.id}>{fruit.name}</li>
        ))}
      </ul>
      <button hx-post="/clicked" hx-swap="outerHTML">
        Click Me
      </button>
    </>
  )
}

export default List
