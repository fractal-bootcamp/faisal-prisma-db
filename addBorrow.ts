import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({})

const main = async (memberId: string, bookId: string) => {
    const newBorrow = await prisma.borrow.create({
        data: {
            member: {
                connect: {
                    id: memberId,
                }
            },
            book: {
                connect: {
                    id: bookId,
                }
            }
        }
    })

    console.log(newBorrow);
}

main("memberId", "bookId")