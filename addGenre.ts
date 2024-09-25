import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({})

const main = async () => {
    const newGenre = await prisma.genre.create({
        data: {
            name: "Novel",
        }
    })

    console.log(newGenre);
}

main()