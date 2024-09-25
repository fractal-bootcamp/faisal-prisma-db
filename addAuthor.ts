import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({})

const main = async () => {
    const newAuthor = await prisma.author.create({
        data: {
            name: "F. Scott Fitzgerald",
            biography: "F. Scott Fitzgerald was a short story writer and novelist considered one of the pre-eminent authors in the history of American literature due almost entirely to the enormous posthumous success of his third book, The Great Gatsby."
        }

    })
    console.log(newAuthor);

}

main()