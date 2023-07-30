import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async(event) => {
    const { customer, seats } = await readBody(event);

    const reservation = await prisma.Reservation.create({
      data: {
        customer: customer
      }
    });

    const data = Array.from(seats, seat => ({
        reservation_id: reservation.id,
        seat_id: seat.seat_id
    }));

    const createdReservation = await prisma.ReservedSeat.createMany({
      data
    })

    return {
        reservation: createdReservation
    }
})