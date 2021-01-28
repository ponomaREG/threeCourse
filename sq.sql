BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Корзина" (
	"user_id"	INTEGER NOT NULL,
	"product_id"	INTEGER NOT NULL,
	"count"	INTEGER NOT NULL,
	FOREIGN KEY("product_id") REFERENCES "Товар"("id"),
	FOREIGN KEY("user_id") REFERENCES "Покупатель"("id")
);
CREATE TABLE IF NOT EXISTS "Поставщик" (
	"id"	INTEGER NOT NULL UNIQUE,
	"company_name"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Заказ" (
	"id"	INTEGER NOT NULL UNIQUE,
	"user_id"	INTEGER NOT NULL,
	"date"	DATE NOT NULL DEFAULT (datetime('now', 'localtime')),
	"status"	INTEGER NOT NULL,
	"total"	FLOAT NOT NULL,
	"address_id"	INTEGER,
	FOREIGN KEY("address_id") REFERENCES "Адрес"("id"),
	FOREIGN KEY("user_id") REFERENCES "Покупатель"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Адрес" (
	"id"	INTEGER NOT NULL UNIQUE,
	"district"	TEXT,
	"street"	TEXT,
	"flat"	TEXT,
	"floor"	TEXT,
	"porch"	TEXT,
	"house"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Админ" (
	"user_id"	INTEGER NOT NULL,
	"vacancy"	TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "Персонал" (
	"id"	INTEGER NOT NULL UNIQUE,
	"last_name"	TEXT NOT NULL,
	"first_name"	TEXT NOT NULL,
	"birthdate"	DATE,
	"email"	TEXT,
	"phone"	TEXT NOT NULL,
	"vacancy"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Забронированная_книга" (
	"product_id"	INTEGER NOT NULL,
	"count"	INTEGER NOT NULL,
	"order_id"	INTEGER NOT NULL,
	"price"	INTEGER,
	FOREIGN KEY("product_id") REFERENCES "Товар"("id"),
	FOREIGN KEY("order_id") REFERENCES "Заказ"("id")
);
CREATE TABLE IF NOT EXISTS "Покупатель" (
	"id"	INTEGER NOT NULL UNIQUE,
	"last_name"	TEXT NOT NULL,
	"first_name"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"birthdate"	DATE NOT NULL,
	"password_hash"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Рейтинг" (
	"product_id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	"mark"	INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS "Товар" (
	"id"	INTEGER NOT NULL UNIQUE,
	"title"	TEXT NOT NULL,
	"desc"	TEXT,
	"cost_purchase"	FLOAT NOT NULL,
	"cost_sale"	FLOAT NOT NULL,
	"quantity"	INTEGER NOT NULL,
	"tags"	TEXT,
	"imageLink"	TEXT,
	"author"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "Корзина" ("user_id","product_id","count") VALUES (20,1,2);
INSERT INTO "Корзина" ("user_id","product_id","count") VALUES (20,2,1);
INSERT INTO "Корзина" ("user_id","product_id","count") VALUES (16,2,1);
INSERT INTO "Корзина" ("user_id","product_id","count") VALUES (18,9,1);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (19,18,'2020-09-30 13:26:33',0,2200.0,14);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (20,18,'2020-09-30 14:29:56',0,2450.0,15);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (21,16,'2020-10-01 17:07:25',0,5150.0,19);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (22,16,'2020-10-01 20:37:19',0,2900.0,20);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (23,21,'2020-10-02 19:56:26',0,2200.0,21);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (24,18,'2020-10-02 20:00:00',0,6450.0,22);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (25,18,'2020-10-02 20:05:54',0,3400.0,23);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (26,18,'2020-10-03 20:12:28',0,500.0,24);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (27,18,'2020-10-03 20:18:40',0,4350.0,25);
INSERT INTO "Заказ" ("id","user_id","date","status","total","address_id") VALUES (28,18,'2020-10-03 20:29:25',0,500.0,26);
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (1,'None','None','','','','None');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (2,'None','None','','','','None');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (3,'None','None','','','','None');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (4,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (5,'asd','asd','asd','asd','asd','asd');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (6,'321','321','321','321','321','321');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (7,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (8,'asd','asd','asd','asd','asd','asd');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (9,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (10,'asd','asd','asd','asd','asd','asd');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (11,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (12,'VO','12 liniya','320','3','1','51');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (13,'VO','12 linya','320','3','1','51');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (14,'12 LINIYA VO , 51','123','','','','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (15,'asd','asd','asd','asd','asd','asd');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (16,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (17,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (18,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (19,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (20,'321','123321','321','3','2','123321321');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (21,'Vasileostrovskyi','12 liniya','320','3','1','51');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (22,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (23,'VO','12 liniya','320','3','1','51');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (24,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (25,'123','123','123','123','123','123');
INSERT INTO "Адрес" ("id","district","street","flat","floor","porch","house") VALUES (26,'123','123','123','123','123','123');
INSERT INTO "Админ" ("user_id","vacancy") VALUES (18,'Администратор');
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,2,19,500);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (4,1,19,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,1,20,500);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (3,1,20,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (1,1,20,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (7,2,20,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,4,21,500);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (3,1,21,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (1,2,21,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (7,2,21,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (1,2,22,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (3,1,22,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (7,1,22,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (7,1,23,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (1,1,23,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,1,23,500);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (3,1,23,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (46,3,24,350);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (7,1,24,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (3,1,24,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (4,1,24,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (5,1,24,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (6,3,24,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (8,1,24,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (9,3,24,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (10,3,24,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,1,25,500);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (1,1,25,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (3,1,25,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (7,1,25,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (4,1,25,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,1,26,500);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,1,27,500);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (1,1,27,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (3,1,27,250);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (4,2,27,1200);
INSERT INTO "Забронированная_книга" ("product_id","count","order_id","price") VALUES (2,1,28,500);
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (1,'ТЕст','Тест','фыв','01.01.2000','фывфывфыв');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (2,'test','testest','test','01.01.2000','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (3,'asd','asd','dsa','01.01.2000','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (4,'zxc','zxc','asd','01.01.2000','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (5,'123123','asdasd','asd','dasdsa','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (6,'123123','asdasd','asd','dasdsa','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (7,'123123','asdasd','asd','dasdsa','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (8,'123123','asdasd','asd','dasdsa','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (9,'123123','asdasd','zxccxz','dasdsa','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (10,'123123','asdasd','zx','dasdsa','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (11,'123123','asdasd','zx324','dasdsa','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (12,'321','321','321','None','caf1a3dfb505ffed0d024130f58c5cfa');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (13,'123','123','123321','None','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (14,'123','asd','asd@asd@asdzx','2020-09-01','7815696ecbf1c96e6894b779456d330e');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (15,'asd','asd','asddsa','2020-09-01','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (16,'123','123','123','2020-09-30','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (17,'qwerty','qwerty','qwerty','2020-09-01','d8578edf8458ce06fbc5bb76a58c5ca4');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (18,'test','test','admin','2020-09-01','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (19,'123321','123321','admin@test.ru','2020-10-20','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (20,'Жмышенко','Валерий','zmyh@cumzone.com','2020-10-01','202cb962ac59075b964b07152d234b70');
INSERT INTO "Покупатель" ("id","last_name","first_name","email","birthdate","password_hash") VALUES (21,'Навальный','Роберт','navalny@fbk.com','1985-07-18','827ccb0eea8a706c4c34a16891f84e7b');
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,0,1);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (2,0,2);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,0,3);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,0,4);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,0,5);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,0,2);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,0,1);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,0,2);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (2,0,2);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (3,0,3);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,2,3);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (46,18,5);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (1,18,1);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (10,18,4);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (46,17,1);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (9,18,5);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (8,18,3);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (7,18,4);
INSERT INTO "Рейтинг" ("product_id","user_id","mark") VALUES (5,18,5);
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (1,'Театральный роман',NULL,1000.0,1200.0,100,'классика,ужасы','1.jpg','Михаил Булгаков');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (2,'Собачье Сердце',NULL,300.0,500.0,15,'повесть,о войне','2.jpg','Михаил Булгаков');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (3,'Вьюга','123',125.0,250.0,1,'о войне,философия','3.jpg','Михаил Булгаков');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (4,'Любовь во время чумы',NULL,300.0,1200.0,20,'о войне,философия','4.jpg','Габриель Гарсиа Маркес');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (5,'Осень патриарха',NULL,300.0,1200.0,15,'о войне,философия','5.jpg','Габриель Гарсиа Маркес');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (6,'С++',NULL,300.0,250.0,16,'о войне,философия','6.jpg','Герберт Шилдт');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (7,'Утраченные иллюзии',NULL,300.0,250.0,17,'о войне,философия','7.jpg','Оноре де Бальзак');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (8,'Шагреневая Кожа',NULL,300.0,250.0,21,'о войне,философия','8.jpg','Оноре де Бальзак');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (9,'Неведомый Шедевр',NULL,300.0,250.0,23,'о войне,философия','9.jpg','Оноре де Бальзак');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (10,'Происхождение видов',NULL,300.0,250.0,3,'о войне,философия','10.jpg','Чарльз Дарвин');
INSERT INTO "Товар" ("id","title","desc","cost_purchase","cost_sale","quantity","tags","imageLink","author") VALUES (46,'История Западной Философии. Том 1','описание',315.0,350.0,120,'наука,философия,история,социология','2582225_detail.jpg','Бертран Рассел');
COMMIT;
