-- DropForeignKey
ALTER TABLE `reservedseat` DROP FOREIGN KEY `ReservedSeat_reservation_id_fkey`;

-- AddForeignKey
ALTER TABLE `ReservedSeat` ADD CONSTRAINT `ReservedSeat_reservation_id_fkey` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
