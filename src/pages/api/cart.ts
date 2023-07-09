import type { APIRoute } from 'astro'
import { PrismaClient } from '@prisma/client'

export const post: APIRoute = async ({ request, redirect }) => {
  const prisma = new PrismaClient()

  const form = await request.formData()
  const productId = form.get('productId')?.valueOf()

  if (productId) {
    await prisma.cart.create({
      data: {
        productId: Number(productId),
        quantity: 1,
      },
    })
  }

  return redirect('/cart', 301)
}
