import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export default defineEventHandler((event) => {
    const { roomName } = getQuery(event);
    const roomId = prisma.room.findUnique({
        where: {
            name: roomName
        }
    });

    return prisma.ReservedSeat.findMany({
        select: {
            seat_id: true,
            sold: true,
            seat: {
                select: {
                    row_number: true,
                    seat_number: true
                }
            }
        }
    });
})