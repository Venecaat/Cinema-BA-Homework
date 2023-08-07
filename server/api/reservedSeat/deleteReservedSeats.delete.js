import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async(event) => {
    const { reservedSeatIds } = await readBody(event);

    return prisma.ReservedSeat.deleteMany({
        where: {
            id: {
                in: reservedSeatIds
            }
        }
    });
})