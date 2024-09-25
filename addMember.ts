import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({})

const main = async () => {
    const newMember = await prisma.member.create({
        data: {
            name: "Faisal Owimer",
            email: "faisal@owimer.co",
            address: "1100 ave at port imperial"
        }
    })

    console.log(newMember);
}

main()