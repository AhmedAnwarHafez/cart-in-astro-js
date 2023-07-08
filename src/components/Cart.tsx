import { useStore } from '@nanostores/react'
import { cartItems } from '../CartStore'

export default function CartFlyout() {
  const $cartItems = useStore(cartItems)

  return (
    <aside>
      {Object.values($cartItems).length ? (
        <ul>
          {Object.values($cartItems).map((cartItem) => (
            <li key={cartItem.id}>
              <h3>{cartItem.name}</h3>
              <p>Quantity: {cartItem.quantity}</p>
            </li>
          ))}
        </ul>
      ) : (
        <p>Your cart is empty!</p>
      )}
    </aside>
  )
}
