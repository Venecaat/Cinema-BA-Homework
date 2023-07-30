import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default defineEventHandler(async(event) => {
    const { seats } = await readBody(event);

    const data = Array.from(seats, seat => ({
        seat_id: seat.seat_id,
        status: "foglalt"
    }));

    const createdReservation = await prisma.ReservedSeat.createMany({
        data
    })

    return {
        reservation: createdReservation
    }
})