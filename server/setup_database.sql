CREATE TABLE IF NOT EXISTS `wallet` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL,
  `type` TEXT NOT NULL,
  `balance` INTEGER NOT NULL,
  `create_at` TEXT DEFAULT NULL,
  `update_at` TEXT DEFAULT NULL,
  `delete_at` TEXT DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `category` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL,
  `description` TEXT DEFAULT NULL,
  `type` TEXT NOT NULL,
  `create_at` TEXT DEFAULT NULL,
  `update_at` TEXT DEFAULT NULL,
  `delete_at` TEXT DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `source_wallet_id` INTEGER NOT NULL,
  `amount` INTEGER NOT NULL,
  `description` TEXT DEFAULT NULL,
  `type` TEXT NOT NULL,
  `create_at` TEXT DEFAULT NULL,
  `update_at` TEXT DEFAULT NULL,
  FOREIGN KEY (`source_wallet_id`) REFERENCES `wallet` (`id`)
);

CREATE TABLE IF NOT EXISTS `transfer_detail` (
  `id` INTEGER PRIMARY KEY,
  `target_wallet_id` INTEGER NOT NULL,
  FOREIGN KEY (`id`) REFERENCES `transaction` (`id`),
  FOREIGN KEY (`target_wallet_id`) REFERENCES `wallet` (`id`)
);

CREATE TABLE IF NOT EXISTS `income_detail` (
  `id` INTEGER PRIMARY KEY,
  `category_id` INTEGER NOT NULL,
  FOREIGN KEY (`id`) REFERENCES `transaction` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
);

CREATE TABLE IF NOT EXISTS `expense_detail` (
  `id` INTEGER PRIMARY KEY,
  `category_id` INTEGER NOT NULL,
  FOREIGN KEY (`id`) REFERENCES `transaction` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
);