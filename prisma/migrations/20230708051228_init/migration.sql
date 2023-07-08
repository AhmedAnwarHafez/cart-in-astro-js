-- CreateTable
CREATE TABLE "Orders" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "total" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "Products" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "name" TEXT NOT NULL,
    "price" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "Order_Products" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "quantity" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_Order_ProductsToOrders" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_Order_ProductsToOrders_A_fkey" FOREIGN KEY ("A") REFERENCES "Order_Products" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_Order_ProductsToOrders_B_fkey" FOREIGN KEY ("B") REFERENCES "Orders" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_Order_ProductsToProducts" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_Order_ProductsToProducts_A_fkey" FOREIGN KEY ("A") REFERENCES "Order_Products" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_Order_ProductsToProducts_B_fkey" FOREIGN KEY ("B") REFERENCES "Products" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_Order_ProductsToOrders_AB_unique" ON "_Order_ProductsToOrders"("A", "B");

-- CreateIndex
CREATE INDEX "_Order_ProductsToOrders_B_index" ON "_Order_ProductsToOrders"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Order_ProductsToProducts_AB_unique" ON "_Order_ProductsToProducts"("A", "B");

-- CreateIndex
CREATE INDEX "_Order_ProductsToProducts_B_index" ON "_Order_ProductsToProducts"("B");
