import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const { roomName } = getQuery(event);
    const { id } = await $fetch(`/api/room/getRoomByName?roomName=${roomName}`);

    return prisma.Seat.aggregate({
        _max: {
            row_number: true,
            seat_number: true
        },
        where: {
            room_id: id
        }
    });
})