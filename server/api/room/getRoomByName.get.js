import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
export default defineEventHandler((event) => {
    const { roomName } = getQuery(event);
    return prisma.room.findUnique({
        where: {
            name: roomName
        }
    });
})