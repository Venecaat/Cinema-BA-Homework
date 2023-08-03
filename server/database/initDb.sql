-- Drop Tables
DROP TABLE IF EXISTS `ReservedSeat`;
DROP TABLE IF EXISTS `Reservation`;
DROP TABLE IF EXISTS `Seat`;
DROP TABLE IF EXISTS `Room`;

-- CreateTable
CREATE TABLE `Room` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Room_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Seat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `row_number` INTEGER NOT NULL,
    `seat_number` INTEGER NOT NULL,
    `room_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reservation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer` VARCHAR(191) NOT NULL,
    `reserved_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReservedSeat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reservation_id` INTEGER NULL,
    `seat_id` INTEGER NOT NULL,
    `sold` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Seat` ADD CONSTRAINT `Seat_room_id_fkey` FOREIGN KEY (`room_id`) REFERENCES `Room`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReservedSeat` ADD CONSTRAINT `ReservedSeat_reservation_id_fkey` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReservedSeat` ADD CONSTRAINT `ReservedSeat_seat_id_fkey` FOREIGN KEY (`seat_id`) REFERENCES `Seat`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- Add Values

INSERT INTO `Room` VALUES (1, "ZEUS");

INSERT INTO `Seat`
VALUES
	-- Row 1
	(1, 1, 1, 1),
    (2, 1, 2, 1),
    (3, 1, 3, 1),
    (4, 1, 4, 1),
    (5, 1, 5, 1),
    (6, 1, 6, 1),
    (7, 1, 7, 1),
    (8, 1, 8, 1),
	-- Row 2
    (9, 2, 1, 1),
    (10, 2, 2, 1),
    (11, 2, 3, 1),
    (12, 2, 4, 1),
    (13, 2, 5, 1),
    (14, 2, 6, 1),
    (15, 2, 7, 1),
    (16, 2, 8, 1),
    -- Row 3
    (17, 3, 1, 1),
    (18, 3, 2, 1),
    (19, 3, 3, 1),
    (20, 3, 4, 1),
    (21, 3, 5, 1),
    (22, 3, 6, 1),
    (23, 3, 7, 1),
    (24, 3, 8, 1),
    -- Row 4
    (25, 4, 1, 1),
    (26, 4, 2, 1),
    (27, 4, 3, 1),
    (28, 4, 4, 1),
    (29, 4, 5, 1),
    (30, 4, 6, 1),
    (31, 4, 7, 1),
    (32, 4, 8, 1),
    -- Row 5
    (33, 5, 1, 1),
    (34, 5, 2, 1),
    (35, 5, 3, 1),
    (36, 5, 4, 1),
    (37, 5, 5, 1),
    (38, 5, 6, 1),
    (39, 5, 7, 1),
    (40, 5, 8, 1),
    -- Row 6
    (41, 6, 1, 1),
    (42, 6, 2, 1),
    (43, 6, 3, 1),
    (44, 6, 4, 1),
    (45, 6, 5, 1),
    (46, 6, 6, 1),
    (47, 6, 7, 1),
    (48, 6, 8, 1),
    -- Row 7
    (49, 7, 1, 1),
    (50, 7, 2, 1),
    (51, 7, 3, 1),
    (52, 7, 4, 1),
    (53, 7, 5, 1),
    (54, 7, 6, 1),
    (55, 7, 7, 1),
    (56, 7, 8, 1),
    -- Row 8
    (57, 8, 1, 1),
    (58, 8, 2, 1),
    (59, 8, 3, 1),
    (60, 8, 4, 1),
    (61, 8, 5, 1),
    (62, 8, 6, 1),
    (63, 8, 7, 1),
    (64, 8, 8, 1);

INSERT INTO `Reservation`
VALUES
	(1, "test@test.hu", "2023-08-03 13:00:00"),
    (2, "lorem@ipsum.com", "2023-08-03 13:33:27"),
    (3, "ordinary@user.com", "2023-08-03 13:25:25");

INSERT INTO `ReservedSeat`
VALUES
	-- Reservation id - 1
	(1, 1, 3, true),
    (2, 1, 4, true),
    (3, 1, 5, true),
    (4, 1, 6, true),
    (5, 1, 7, true),
    (6, 1, 8, true),
    (7, 1, 9, true),
    (8, 1, 10, true),
    (9, 1, 11, true),
    (10, 1, 12, true),
    -- Reservation id - 2
    (11, 2, 13, true),
    (12, 2, 14, true),
    (13, 2, 15, true),
    (14, 2, 16, true),
    (15, 2, 17, true),
    (16, 2, 18, true),
    (17, 2, 19, true),
    (18, 2, 20, true),
    (19, 2, 21, true),
    (20, 2, 22, true),
    (21, 2, 23, true),
    (22, 2, 24, true),
    (23, 2, 25, true),
    (24, 2, 26, true),
    (25, 2, 27, true),
    (26, 2, 28, true),
    (27, 2, 29, true),
    (28, 2, 30, true),
    (29, 2, 31, true),
    (30, 2, 32, true),
    -- Reservation id - 3
    (31, 3, 33, true),
    (32, 3, 34, true),
    (33, 3, 35, true),
    (34, 3, 36, true),
    (35, 3, 37, true),
    (36, 3, 38, true),
    (37, 3, 39, true),
    (38, 3, 40, true),
    (39, 3, 41, true),
    (40, 3, 42, true),
    (41, 3, 43, true),
    (42, 3, 44, true),
    (43, 3, 45, true),
    (44, 3, 46, true),
    (45, 3, 47, true),
    (46, 3, 48, true),
    (47, 3, 49, true),
    (48, 3, 50, true),
    (49, 3, 51, true),
    (50, 3, 52, true),
    (51, 3, 53, true),
    (52, 3, 54, true),
    (53, 3, 55, true),
    (54, 3, 56, true),
    (55, 3, 57, true),
    (56, 3, 58, true),
    (57, 3, 59, true),
    (58, 3, 60, true),
    (59, 3, 61, true),
    (60, 3, 62, true),
    (61, 3, 63, true),
    (62, 3, 64, true);