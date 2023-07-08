/*
  Warnings:

  - You are about to drop the `_Order_ProductsToOrders` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Order_ProductsToProducts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `total` on the `Orders` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Orders` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `Order_Products` table. All the data in the column will be lost.
  - Added the required column `status` to the `Orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderId` to the `Order_Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productId` to the `Order_Products` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "_Order_ProductsToOrders_B_index";

-- DropIndex
DROP INDEX "_Order_ProductsToOrders_AB_unique";

-- DropIndex
DROP INDEX "_Order_ProductsToProducts_B_index";

-- DropIndex
DROP INDEX "_Order_ProductsToProducts_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_Order_ProductsToOrders";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_Order_ProductsToProducts";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Orders" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL
);
INSERT INTO "new_Orders" ("createdAt", "id") SELECT "createdAt", "id" FROM "Orders";
DROP TABLE "Orders";
ALTER TABLE "new_Orders" RENAME TO "Orders";
CREATE TABLE "new_Order_Products" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quantity" INTEGER NOT NULL,
    "orderId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    CONSTRAINT "Order_Products_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Orders" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_Products_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Order_Products" ("id", "quantity") SELECT "id", "quantity" FROM "Order_Products";
DROP TABLE "Order_Products";
ALTER TABLE "new_Order_Products" RENAME TO "Order_Products";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
