import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({})

const main = async (authorId: string) => {

    const newBook = await prisma.book.create({
        data: {
            title: "The Great Gatsby",
            author: {
                connect: {
                    id: authorId
                }
            }
        },
        isbn: "978-0743273565",
        genre: {
            connect: {
                id: 1,
            }
        },

    },
    )

    console.log(newBook);
}

main("authorId")