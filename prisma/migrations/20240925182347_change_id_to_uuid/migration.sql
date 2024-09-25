/*
  Warnings:

  - The primary key for the `Author` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Book` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Genre` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Member` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Changed the type of `id` on the `Author` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Book` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Genre` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Member` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_AuthorToBook` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_AuthorToBook` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_BookToGenre` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_BookToGenre` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `A` on the `_BookToMember` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_BookToMember` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "_AuthorToBook" DROP CONSTRAINT "_AuthorToBook_A_fkey";

-- DropForeignKey
ALTER TABLE "_AuthorToBook" DROP CONSTRAINT "_AuthorToBook_B_fkey";

-- DropForeignKey
ALTER TABLE "_BookToGenre" DROP CONSTRAINT "_BookToGenre_A_fkey";

-- DropForeignKey
ALTER TABLE "_BookToGenre" DROP CONSTRAINT "_BookToGenre_B_fkey";

-- DropForeignKey
ALTER TABLE "_BookToMember" DROP CONSTRAINT "_BookToMember_A_fkey";

-- DropForeignKey
ALTER TABLE "_BookToMember" DROP CONSTRAINT "_BookToMember_B_fkey";

-- AlterTable
ALTER TABLE "Author" DROP CONSTRAINT "Author_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ADD CONSTRAINT "Author_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Book" DROP CONSTRAINT "Book_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ADD CONSTRAINT "Book_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Genre" DROP CONSTRAINT "Genre_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ADD CONSTRAINT "Genre_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Member" DROP CONSTRAINT "Member_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ADD CONSTRAINT "Member_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "_AuthorToBook" DROP COLUMN "A",
ADD COLUMN     "A" UUID NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" UUID NOT NULL;

-- AlterTable
ALTER TABLE "_BookToGenre" DROP COLUMN "A",
ADD COLUMN     "A" UUID NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" UUID NOT NULL;

-- AlterTable
ALTER TABLE "_BookToMember" DROP COLUMN "A",
ADD COLUMN     "A" UUID NOT NULL,
DROP COLUMN "B",
ADD COLUMN     "B" UUID NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "_AuthorToBook_AB_unique" ON "_AuthorToBook"("A", "B");

-- CreateIndex
CREATE INDEX "_AuthorToBook_B_index" ON "_AuthorToBook"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BookToGenre_AB_unique" ON "_BookToGenre"("A", "B");

-- CreateIndex
CREATE INDEX "_BookToGenre_B_index" ON "_BookToGenre"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BookToMember_AB_unique" ON "_BookToMember"("A", "B");

-- CreateIndex
CREATE INDEX "_BookToMember_B_index" ON "_BookToMember"("B");

-- AddForeignKey
ALTER TABLE "_BookToGenre" ADD CONSTRAINT "_BookToGenre_A_fkey" FOREIGN KEY ("A") REFERENCES "Book"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookToGenre" ADD CONSTRAINT "_BookToGenre_B_fkey" FOREIGN KEY ("B") REFERENCES "Genre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookToMember" ADD CONSTRAINT "_BookToMember_A_fkey" FOREIGN KEY ("A") REFERENCES "Book"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookToMember" ADD CONSTRAINT "_BookToMember_B_fkey" FOREIGN KEY ("B") REFERENCES "Member"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AuthorToBook" ADD CONSTRAINT "_AuthorToBook_A_fkey" FOREIGN KEY ("A") REFERENCES "Author"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AuthorToBook" ADD CONSTRAINT "_AuthorToBook_B_fkey" FOREIGN KEY ("B") REFERENCES "Book"("id") ON DELETE CASCADE ON UPDATE CASCADE;
