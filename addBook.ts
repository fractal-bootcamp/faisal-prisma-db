import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({})

const main = async () => {
    const newBook = await prisma.book.create({
        data: {
            title: "The Great Gatsby",
            author: "F. Scott Fitzgerald",
            isbn: "978-0743273565"
        }
    })

    console.log(newBook);
}

main()