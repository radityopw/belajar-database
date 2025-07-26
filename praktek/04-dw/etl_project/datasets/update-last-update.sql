UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM customer)
WHERE src_table = 'customer' AND (SELECT max(last_update) FROM customer) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM actor)
WHERE src_table = 'actor' AND (SELECT max(last_update) FROM actor) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM category)
WHERE src_table = 'category' AND (SELECT max(last_update) FROM category) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM film)
WHERE src_table = 'film' AND (SELECT max(last_update) FROM film) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM film_actor)
WHERE src_table = 'film_actor' AND (SELECT max(last_update) FROM film_actor) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM film_category)
WHERE src_table = 'film_category' AND (SELECT max(last_update) FROM film_category) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(payment_date) FROM payment)
WHERE src_table = 'payment' AND (SELECT max(payment_date) FROM payment) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM rental)
WHERE src_table = 'rental' AND (SELECT max(last_update) FROM rental) IS NOT NULL;

UPDATE _sys_run_log
SET src_last_sysdate = (SELECT max(last_update) FROM staff)
WHERE src_table = 'staff' AND (SELECT max(last_update) FROM staff) IS NOT NULL;
