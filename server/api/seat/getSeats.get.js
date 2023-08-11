import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const { id } = getQuery(event);

    return prisma.Seat.findMany({
        where: {
            room_id: +id
        },
        select: {
            id: true,
            row_number: true,
            seat_number: true
        }
    });
})