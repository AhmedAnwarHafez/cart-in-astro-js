import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  await insertProducts()
  console.log('done')
}

main()

async function insertProducts() {
  // we will insert 7 products about smoothies with name, price and description
  const products = [
    {
      name: 'Strawberry Smoothie',
      price: 4.99,
      description: 'A delicious smoothie made with strawberries',
    },
    {
      name: 'Blueberry Smoothie',
      price: 4.99,
      description: 'A delicious smoothie made with blueberries',
    },
    {
      name: 'Mango Smoothie',
      price: 4.99,
      description: 'A delicious smoothie made with mango',
    },
    {
      name: 'Chocolate Smoothie',
      price: 4.99,
      description: 'A delicious smoothie made with chocolate',
    },
    {
      name: 'Banana Smoothie',
      price: 4.99,
      description: 'A delicious smoothie made with bananas',
    },
    {
      name: 'Kiwi Smoothie',
      price: 4.99,
      description: 'A delicious smoothie made with kiwis',
    },
    {
      name: 'Pineapple Smoothie',
      price: 4.99,
      description: 'A delicious smoothie made with pineapples',
    },
  ]

  for (const product of products) {
    await prisma.products.create({
      data: product,
    })
  }
}
