import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async(event) => {
    const { customer, seats } = await readBody(event);

    await prisma.Reservation.create({
      data: {
        customer: customer
      }
    });

    return {
        message: "A foglalás sikeres volt!"
    }
})