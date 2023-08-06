import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async(event) => {
    const { customer, seatIds } = await readBody(event);

    const reservation = await prisma.Reservation.create({
      data: {
        customer: customer
      }
    });
    const chance = Math.floor(Math.random() * 100);

    const createdReservation = await prisma.ReservedSeat.updateMany({
        where: {
            id: {
                in: seatIds
            }
        },
        data: {
            reservation_id: reservation.id,
            sold: chance >= 50
        }
    });

    return {
        message: chance >= 50 ? "ok" : "error",
        reservation: createdReservation
    }
})