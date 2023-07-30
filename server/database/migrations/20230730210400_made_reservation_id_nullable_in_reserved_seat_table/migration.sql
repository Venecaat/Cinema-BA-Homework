-- DropForeignKey
ALTER TABLE `reservedseat` DROP FOREIGN KEY `ReservedSeat_reservation_id_fkey`;

-- AlterTable
ALTER TABLE `reservedseat` MODIFY `reservation_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `ReservedSeat` ADD CONSTRAINT `ReservedSeat_reservation_id_fkey` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
