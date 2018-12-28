use movieking;

SELECT
	t.theater_nm,
    s.screen_nm,
    si.movie_cd,
    si.movie_stdt,
    COUNT(seat.seat_cd) AS seat_cnt,
    COUNT(seat.seat_cd) - (SELECT COUNT(seat_cd) FROM seat) AS seat_remain
FROM screening_info AS si
LEFT JOIN screen AS s ON si.screen_cd = s.screen_cd
LEFT JOIN theater AS t ON s.theater_cd = t.theater_cd
LEFT JOIN seat ON seat.screen_cd = s.screen_cd
WHERE si.movie_cd = 20168773
AND t.theater_cd = 1
AND si.movie_stdt >= DATE('2018-12-27')
GROUP BY t.theater_nm, s.screen_nm, si.movie_cd, si.movie_stdt
ORDER BY s.screen_cd ASC;