import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
    const { customer } = await readBody(event);

    return prisma.Reservation.create({
        data: {
            customer: customer
        }
    });
})