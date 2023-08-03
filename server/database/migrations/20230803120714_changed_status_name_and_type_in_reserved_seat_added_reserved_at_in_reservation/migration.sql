/*
  Warnings:

  - You are about to drop the column `status` on the `reservedseat` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `reservation` ADD COLUMN `reserved_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `reservedseat` DROP COLUMN `status`,
    ADD COLUMN `sold` BOOLEAN NOT NULL DEFAULT false;
