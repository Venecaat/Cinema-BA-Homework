import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async(event) => {
    const { customer, seatIds } = await readBody(event);

    const reservation = await prisma.Reservation.create({
      data: {
        customer: customer
      }
    });

    const createdReservation = await prisma.ReservedSeat.updateMany({
        where: {
            id: {
                in: seatIds
            }
        },
        data: {
            reservation_id: reservation.id,
            status: "elkelt"
        }
    });

    return {
        reservation: createdReservation
    }
})