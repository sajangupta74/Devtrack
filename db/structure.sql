CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime, "provider" varchar(255), "uid" varchar(255), "is_admin" integer, "username" varchar(255), "address" varchar(255), "city" varchar(255));
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "price" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "devices" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "device_type" varchar(255), "slug" varchar(255), "status_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "statuses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "status_name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "device_queues" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "device_id" integer, "user_id" integer, "time" datetime, "return_time" datetime, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "device_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "device_type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "user_infos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "first_name" varchar(255), "last_name" varchar(255), "dob" date, "image" blob(10485760), "image_name" varchar(255), "department" varchar(255), "designation" varchar(255), "phone" integer, "gender" varchar(255), "city" varchar(255), "zipcode" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "notifications" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "sender_id" integer, "description" varchar(255), "activity_type" integer, "request_id" integer, "created_at" datetime, "updated_at" datetime, "seen" boolean, "open" boolean, "userdescription" varchar(255));
CREATE TABLE "activities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "requests" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`sender_id`	integer,
	`reciever_id`	integer,
	`is_success`	boolean,
	`is_reject`	boolean,
	`is_on_hold`	boolean,
	`device_id`	integer,
	`created_at`	datetime,
	`updated_at`	datetime
, "status" integer);
CREATE TABLE "request_statuses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "status" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO schema_migrations (version) VALUES ('20150317170032');

INSERT INTO schema_migrations (version) VALUES ('20150323172052');

INSERT INTO schema_migrations (version) VALUES ('20150516155104');

INSERT INTO schema_migrations (version) VALUES ('20150523140147');

INSERT INTO schema_migrations (version) VALUES ('20150524104301');

INSERT INTO schema_migrations (version) VALUES ('20150531044638');

INSERT INTO schema_migrations (version) VALUES ('20150628035950');

INSERT INTO schema_migrations (version) VALUES ('20150628125735');

INSERT INTO schema_migrations (version) VALUES ('20150707072508');

INSERT INTO schema_migrations (version) VALUES ('20150729063411');

INSERT INTO schema_migrations (version) VALUES ('20150814081200');

INSERT INTO schema_migrations (version) VALUES ('20150814081321');

INSERT INTO schema_migrations (version) VALUES ('20150814081703');

INSERT INTO schema_migrations (version) VALUES ('20150904103358');

INSERT INTO schema_migrations (version) VALUES ('20150904111229');

INSERT INTO schema_migrations (version) VALUES ('20150905080822');

INSERT INTO schema_migrations (version) VALUES ('20150905081852');

