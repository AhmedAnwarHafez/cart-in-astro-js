import type { Product } from '../types/Product'
import * as store from '../CartStore'

interface Props {
  product: Product
}

function ProductItem({ product }: Props) {
  function handleAdd() {
    store.addCartItem(product)
  }

  return (
    <div className="flex border p-4 shadow shadow-black m-2 justify-between">
      <div className="flex flex-col">
        <h3 className="font-medium">{product.name}</h3>
        <p className="italic">{product.description}</p>
      </div>
      <button
        onClick={handleAdd}
        className="self-baseline text-blue-300 underline hover:text-blue-500 focus:cursor-pointer"
      >
        Add to Cart
      </button>
    </div>
  )
}

export default ProductItem
