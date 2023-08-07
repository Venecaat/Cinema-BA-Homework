import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async(event) => {
    const { reservationIds } = await readBody(event);

    return prisma.Reservation.deleteMany({
        where: {
            id: {
                in: reservationIds
            }
        }
    });
})