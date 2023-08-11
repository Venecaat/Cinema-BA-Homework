import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const { id } = getQuery(event);

    return prisma.ReservedSeat.findMany({
        where: {
            seat: {
                room_id: +id
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