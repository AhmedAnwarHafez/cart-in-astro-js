import { Prisma } from '@prisma/client'

export type Product = Prisma.ProductsCreateInput & {
  id: number
}
