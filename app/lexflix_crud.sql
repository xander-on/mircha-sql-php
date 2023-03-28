-- Listado de operaciones CRUD de lexflix

--moviesseries
  -- Crear movieseries
  INSERT INTO movieseries SET 
    imdb_id = 'tt3749900',
    title = 'Gotam',
    plot = '',
    author = '',
    actors = '',
    country = '',
    premier = '2014',
    trailer = '',
    poster = '',
    rating = 8.0,
    genres = 'Crime, Drama, Thriller',
    category = 'Serie',
    status = 3;

  -- Actualizar movieseries
  UPDATE movieseries SET 
    title = 'Gotham', 
    plot = 'In crime ridden Gotham City, Thomas and Martha Wayne are murdered before young Bruce Wayne\'s eyes. Although the idealistic Gotham City Police Dept. detective James Gordon, and his cynical partner, Harvey Bullock, seem to solve the case quickly, things are not so simple. Inspired by Bruce\'s traumatized desire for justice, Gordon vows to find it amid Gotham\'s corruption. Thus begins Gordon\'s lonely quest that would set him against his own comrades and the underworld with their own deadly rivalries and mysteries. In the coming wars, innocence will be lost and compromises will be made as some criminals will fall as casualties while others will rise as supervillains. All the while, young Bruce observes this war with a growing obsession that would one day drive him to seek his own revenge as The Batman.', 
    genres = 'Crime, Drama, Thriller', 
    author = 'Bruno Heller', 
    actors = 'Zabryna Guevara, Ben McKenzie, Donal Logue, David Mazouz', 
    country = 'USA', 
    premiere = '2014', 
    trailer = 'https://www.youtube.com/watch?v=_axxvmMBgQk', 
    poster = 'http://ia.media-imdb.com/images/M/MV5BMTQ1ODk3NDczNF5BMl5BanBnXkFtZTgwODE5MDQ4NjE@._V1_SX300.jpg', 
    rating = 8.0, 
    category = 'Serie', 
    status  = 3 
		WHERE imdb_id = 'tt3749900';

  -- Eliminar movieseries
  DELETE FROM movieseries WHERE imdb_id = 'tt3749900';

  -- Buscar todas las movieseries
  SELECT ms.imdb_id, 
    ms.title, 
    ms.plot, 
    ms.author, 
    ms.actors,
    ms.country,
    ms.premier,
    ms.poster,
    ms.trailer,
    ms.rating,
    ms.genres,
    ms.category,
    s.status
    FROM movieseries AS ms
    INNER JOIN status AS s
    ON ms.status = s.status_id;


  -- Buscar una movieseries por titulos, personas (actores, autores), generos
  SELECT ms.imdb_id, 
    ms.title, 
    ms.plot, 
    ms.author, 
    ms.actors,
    ms.country,
    ms.premier,
    ms.poster,
    ms.trailer,
    ms.rating,
    ms.genres,
    ms.category,
    s.status
    FROM movieseries AS ms
    INNER JOIN status AS s
    ON ms.status = s.status_id
    WHERE MATCH(ms.title, ms.author, ms.actors, ms.genres)
    AGAINST('drama' IN BOOLEAN MODE);


  -- Buscar una movieseries por categoria
  SELECT ms.imdb_id, 
    ms.title, 
    ms.plot, 
    ms.author, 
    ms.actors,
    ms.country,
    ms.premier,
    ms.poster,
    ms.trailer,
    ms.rating,
    ms.genres,
    ms.category,
    s.status
    FROM movieseries AS ms
    INNER JOIN status AS s
    ON ms.status = s.status_id
    WHERE ms.category = 'Movie';


  -- Buscar una movieseries por status
  SELECT ms.imdb_id, 
    ms.title, 
    ms.plot, 
    ms.author, 
    ms.actors,
    ms.country,
    ms.premier,
    ms.poster,
    ms.trailer,
    ms.rating,
    ms.genres,
    ms.category,
    s.status
    FROM movieseries AS ms
    INNER JOIN status AS s
    ON ms.status = s.status_id
    WHERE ms.status = 1;


---------------------------------------------
-- status
-- Crear status
INSERT INTO status SET status_id = 0, status = 'Otro status';

--Actualizar status
UPDATE status SET status = 'Other Status' WHERE status_id = 6;

-- Eliminar status
DELETE FROM status WHERE status_id = 6;

-- Buscar todos los status
SELECT * FROM status;

-- Buscar un status por status_id
SELECT * FROM status WHERE status_id = 3;



-------------------------------------------------------
--Usuarios
--Crear usuarios
INSERT INTO users SET 
  user = '@usuario',
  email = 'usuario@midominio.com',
  name = 'soy un usuario',
  birthday = '1988-10-09',
  pass = MD5('un_password'),
  role = 'Admin';

--Actualizar
  -- DatosGenerales
  UPDATE users SET 
    name = 'Soy un Usuario', 
    birthday = '1984-10-09',
    role = 'User'
  WHERE user = '@usuario' AND email = 'usuario@midominio.com';

  --Password
  UPDATE users SET pass = MD5('un_nuevo_password')
  WHERE user = '@usuario' AND email = 'usuario@midominio.com';

  --Buscar todos los usuarios
  SELECT * FROM users;

  --Buscar un usuario por:
  --user
    SELECT * FROM users WHERE user = '@usuario';
  --email
    SELECT * FROM users WHERE email = 'usuario@midominio.com';
  --role
    SELECT * FROM users WHERE role = 'User';