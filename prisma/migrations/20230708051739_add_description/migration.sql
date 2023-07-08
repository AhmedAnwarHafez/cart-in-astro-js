/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Order_Products` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Order_Products` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Products` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Products` table. All the data in the column will be lost.
  - Added the required column `status` to the `Order_Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order_Products" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quantity" INTEGER NOT NULL,
    "status" TEXT NOT NULL
);
INSERT INTO "new_Order_Products" ("id", "quantity") SELECT "id", "quantity" FROM "Order_Products";
DROP TABLE "Order_Products";
ALTER TABLE "new_Order_Products" RENAME TO "Order_Products";
CREATE TABLE "new_Products" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "description" TEXT NOT NULL
);
INSERT INTO "new_Products" ("id", "name", "price") SELECT "id", "name", "price" FROM "Products";
DROP TABLE "Products";
ALTER TABLE "new_Products" RENAME TO "Products";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
