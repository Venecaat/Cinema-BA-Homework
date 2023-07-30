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

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReservedSeat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reservation_id` INTEGER NULL,
    `seat_id` INTEGER NOT NULL,
    `status` VARCHAR(191) NOT NULL,

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
	(1, "test@test.hu"),
    (2, "lorem@ipsum.com"),
    (3, "ordinary@user.com");

INSERT INTO `ReservedSeat`
VALUES
	-- Reservation id - 1
	(1, 1, 3, "elkelt"),
    (2, 1, 4, "elkelt"),
    (3, 1, 5, "elkelt"),
    (4, 1, 6, "elkelt"),
    (5, 1, 7, "elkelt"),
    (6, 1, 8, "elkelt"),
    (7, 1, 9, "elkelt"),
    (8, 1, 10, "elkelt"),
    (9, 1, 11, "elkelt"),
    (10, 1, 12, "elkelt"),
    -- Reservation id - 2
    (11, 2, 13, "elkelt"),
    (12, 2, 14, "elkelt"),
    (13, 2, 15, "elkelt"),
    (14, 2, 16, "elkelt"),
    (15, 2, 17, "elkelt"),
    (16, 2, 18, "elkelt"),
    (17, 2, 19, "elkelt"),
    (18, 2, 20, "elkelt"),
    (19, 2, 21, "elkelt"),
    (20, 2, 22, "elkelt"),
    (21, 2, 23, "elkelt"),
    (22, 2, 24, "elkelt"),
    (23, 2, 25, "elkelt"),
    (24, 2, 26, "elkelt"),
    (25, 2, 27, "elkelt"),
    (26, 2, 28, "elkelt"),
    (27, 2, 29, "elkelt"),
    (28, 2, 30, "elkelt"),
    (29, 2, 31, "elkelt"),
    (30, 2, 32, "elkelt"),
    -- Reservation id - 3
    (31, 3, 33, "elkelt"),
    (32, 3, 34, "elkelt"),
    (33, 3, 35, "elkelt"),
    (34, 3, 36, "elkelt"),
    (35, 3, 37, "elkelt"),
    (36, 3, 38, "elkelt"),
    (37, 3, 39, "elkelt"),
    (38, 3, 40, "elkelt"),
    (39, 3, 41, "elkelt"),
    (40, 3, 42, "elkelt"),
    (41, 3, 43, "elkelt"),
    (42, 3, 44, "elkelt"),
    (43, 3, 45, "elkelt"),
    (44, 3, 46, "elkelt"),
    (45, 3, 47, "elkelt"),
    (46, 3, 48, "elkelt"),
    (47, 3, 49, "elkelt"),
    (48, 3, 50, "elkelt"),
    (49, 3, 51, "elkelt"),
    (50, 3, 52, "elkelt"),
    (51, 3, 53, "elkelt"),
    (52, 3, 54, "elkelt"),
    (53, 3, 55, "elkelt"),
    (54, 3, 56, "elkelt"),
    (55, 3, 57, "elkelt"),
    (56, 3, 58, "elkelt"),
    (57, 3, 59, "elkelt"),
    (58, 3, 60, "elkelt"),
    (59, 3, 61, "elkelt"),
    (60, 3, 62, "elkelt"),
    (61, 3, 63, "elkelt"),
    (62, 3, 64, "elkelt");