import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const { roomName } = getQuery(event);
    const { id } = await $fetch(`/api/room/getRoomByName?roomName=${roomName}`);

    if (id === null) return null;

    return prisma.ReservedSeat.findMany({
        where: {
            seat: {
                room_id: id
            }
        },
        select: {
            seat_id: true,
            sold: true,
            seat: {
                select: {
                    row_number: true,
                    seat_number: true
                }
            },
            reservation: {
                select: {
                    id: true,
                    reserved_at: true
                }
            }
        }
    });
})