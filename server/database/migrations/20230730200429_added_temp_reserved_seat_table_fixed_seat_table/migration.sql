-- CreateTable
CREATE TABLE `TempReservedSeat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `seat_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `TempReservedSeat` ADD CONSTRAINT `TempReservedSeat_seat_id_fkey` FOREIGN KEY (`seat_id`) REFERENCES `Seat`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
