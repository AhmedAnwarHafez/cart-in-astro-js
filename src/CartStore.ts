import { atom, map } from 'nanostores'
import type { Product } from './types/Product'

export const isCartOpen = atom(false)

type CartItem = Product & { quantity: number }
export const cartItems = map<Record<number, CartItem>>({})

export function addCartItem({ id, name, ...rest }: Product) {
  const existingEntry = cartItems.get()[id]
  if (existingEntry) {
    cartItems.setKey(id, {
      ...existingEntry,
      quantity: existingEntry.quantity + 1,
    })
  } else {
    cartItems.setKey(id, { id, name, quantity: 1, ...rest })
  }
}
