

/* Create Tables */

-- ツイッタを保存している場所
CREATE TABLE TWEETS
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	CONTENT VARCHAR(280) NOT NULL COMMENT 'コンテンツ',
	USERS_ID BIGINT NOT NULL COMMENT 'ユーザーID',
	CREATED_AT DATETIME NOT NULL COMMENT 'created_at',
	UPDATED_AT DATETIME NOT NULL COMMENT 'updated_at',
	PRIMARY KEY (ID)
) ENGINE = InnoDB COMMENT = 'ツイッタ : ツイッタを保存している場所';


-- Twitterのユーザーの情報を保存しているテーブル
CREATE TABLE USERS
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
	NAME VARCHAR(20) NOT NULL COMMENT 'ユーザーの名前',
	EMAIL VARCHAR(255) NOT NULL COMMENT 'ユーザーのメール',
	PASSWORD VARCHAR(255) NOT NULL COMMENT 'ユーザーのパスワード',
	DISPLAY_NAME VARCHAR(20) NOT NULL COMMENT '表示している名前',
	CREATED_AT DATETIME NOT NULL COMMENT 'created_at',
	UPDATED_AT DATETIME NOT NULL COMMENT 'updated_at',
	PRIMARY KEY (ID)
) ENGINE = InnoDB COMMENT = 'ユーザー : Twitterのユーザーの情報を保存しているテーブル';



/* Create Indexes */

CREATE UNIQUE INDEX UQ_USERS_NAME USING BTREE ON USERS (NAME ASC);
CREATE UNIQUE INDEX UQ_USERS_EMAIL USING BTREE ON USERS (EMAIL ASC);



/* Create Foreign Keys */

ALTER TABLE TWEETS
	ADD CONSTRAINT FK_TWEETS_USERS FOREIGN KEY (USERS_ID)
	REFERENCES USERS (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



