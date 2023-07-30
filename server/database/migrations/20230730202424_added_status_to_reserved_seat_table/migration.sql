/*
  Warnings:

  - Added the required column `status` to the `ReservedSeat` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `reservedseat` ADD COLUMN `status` VARCHAR(191) NOT NULL;
