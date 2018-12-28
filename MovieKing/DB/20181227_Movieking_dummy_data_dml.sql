use movieking;
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM user;
SELECT CONCAT('user',MAX(user_cd) + 1, '@movieking.com') FROM (SELECT a.user_cd FROM user AS a) b;

INSERT INTO user
(id, pw, auth_cd)
VALUES
('admin@movieking', '1234', 1);

/* 유저 생성기 */
DELIMITER $$
DROP PROCEDURE IF EXISTS create_dummy_user$$
CREATE PROCEDURE create_dummy_user(IN cnt INT)
BEGIN
	DECLARE i INT DEFAULT 0;
    loop_user:LOOP
		IF (i >= cnt) THEN
			LEAVE loop_user;
        END IF;
        
        INSERT INTO user
        (id, pw, auth_cd)
        VALUES
        ((SELECT CONCAT('user',MAX(user_cd) + 1, '@movieking.com') FROM (SELECT a.user_cd FROM user AS a) b), '1234', (SELECT auth_cd FROM auth WHERE auth_nm = 'USER'));
        
        SET i = i + 1;
    END LOOP;
END$$
DELIMITER ;

CALL create_dummy_user(5);

/* 영화관 생성 (영화관 : 상영관 : 좌석 = 1 : 3 : 120) */
DELIMITER $$
DROP PROCEDURE IF EXISTS create_dummy_theater$$
CREATE PROCEDURE create_dummy_theater(IN nm VARCHAR(45))
create_dummy_theater:BEGIN    
	DECLARE screen_i INT DEFAULT 1;
    DECLARE screenCd INT DEFAULT 0;
    
    DECLARE seat_i INT DEFAULT 1;
    DECLARE seat_j INT DEFAULT 1;
    DECLARE seat_alpha VARCHAR(1) DEFAULT 'A';
    
    IF (SELECT true FROM theater WHERE theater_nm = nm) THEN
		LEAVE create_dummy_theater;
	ELSE 
		INSERT INTO theater (theater_nm) VALUES (nm);
        
        /* 상영관 생성 */
        loop_screen:LOOP
			IF (screen_i >= (3 + 1)) THEN
				LEAVE loop_screen;
            END IF;
			
            INSERT INTO screen 
            (screen_nm, theater_cd)
            VALUES 
            (screen_i, (SELECT theater_cd FROM theater WHERE theater_nm = nm));
            
            SET screenCd = (
				SELECT
					s.screen_cd
				FROM screen AS s
                LEFT JOIN theater AS t
                ON s.theater_cd = t.theater_cd
                WHERE t.theater_nm = nm
                AND screen_nm = screen_i
            );
            
            /* 좌석 생성 */
            SET seat_i = 1;
            loop_seat:LOOP
				IF (seat_i >= (4 + 1)) THEN
					LEAVE loop_seat;
                END IF;
                
                SET seat_alpha = (
					SELECT
						CASE
							WHEN seat_i = 1 THEN 'A'
							WHEN seat_i = 2 THEN 'B'
							WHEN seat_i = 3 THEN 'C'
							WHEN seat_i = 4 THEN 'D'
						END
					FROM DUAL
                );
                
                SET seat_j = 1;
                loop_seat_depth2:LOOP
					IF (seat_j >= (10 + 1)) THEN
						LEAVE loop_seat_depth2;
					END IF;
                    
                    INSERT INTO seat
                    (seat_nm, screen_cd)
                    VALUES
                    (CONCAT(seat_alpha, seat_j), screenCd);
                    
                
					SET seat_j = seat_j + 1;
				END LOOP;
                
                SET seat_i = seat_i + 1;
            END LOOP;
            
            SET screen_i = screen_i + 1;
        END LOOP;
	END IF;
END$$

/* 영화관 전체 삭제 */
DROP PROCEDURE IF EXISTS delete_dummy_theater$$
CREATE PROCEDURE delete_dummy_theater()
BEGIN
	ALTER TABLE seat AUTO_INCREMENT=1;
	DELETE FROM seat;
    
    ALTER TABLE screen AUTO_INCREMENT=1;
	DELETE FROM screen;
    
    ALTER TABLE theater AUTO_INCREMENT=1;
	DELETE FROM theater;
END$$
DELIMITER ;


CALL create_dummy_theater('CGV 성민점');
CALL delete_dummy_theater();

/* 상영 정보 추가 */
INSERT INTO screening_info
(movie_cd, movie_stdt, movie_edt, screen_cd)
VALUES
(20168773, now(), date_add(now(), interval + 136 minute), 1),
(20180290, now(), date_add(now(), interval + 143 minute), 2),
(20180290, now(), date_add(now(), interval + 143 minute), 3);


/* 무한 반복 쿼리 취소. SHOW PROCESSLIST 로 검색 후 KILL ID번호 입력 */
SHOW PROCESSLIST;
KILL 101;
















