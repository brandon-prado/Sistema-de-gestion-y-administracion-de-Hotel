SELECT u.id_usuario, r.nombre_rol AS "ROL", u.nombre_usuario AS "NOMBRE", 
u.paterno_usuario AS "PATERNO", u.materno_usuario AS "MATERNO", g.nombre_genero AS "GÉNERO",
u.telefono_usuario AS "TELÉFONO", u.identificacion_usuario AS "IDENTIFICACIÓN", 
u.direccion_usuario AS "DIRECCIÓN", u.fecha_ingreso AS "FECHA INGRESO", u.estado_usuario AS "ESTADO"
FROM Usuario u, Genero g, Rol r
WHERE u.id_genero = g.id_genero
AND u.id_rol = r.id_rol
ORDER BY nombre_rol;



SELECT u.id_usuario AS "ID USUARIO", g.id_genero AS "ID GÉNERO", r.id_rol AS "ID ROL", 
r.nombre_rol AS "ROL", u.nombre_usuario AS "NOMBRE", u.paterno_usuario AS "APELLIDO PATERNO", 
u.materno_usuario AS "APELLIDO MATERNO", g.nombre_genero AS "GÉNERO", 
u.telefono_usuario AS "TELÉFONO", u.identificacion_usuario AS "IDENTIFICACIÓN", 
u.direccion_usuario AS "DIRECCIÓN", u.fecha_ingreso AS "FECHA DE INGRESO", 
u.tiene_acceso_sistema AS "¿TIENE ACCESO?", u.usuario AS "USUARIO", 
u.contrasena AS "CONTRASEÑA", u.estado_usuario AS "ESTADO"
FROM Usuario u, Rol r, Genero g
WHERE u.id_rol = r.id_rol
AND u.id_genero = g.id_genero
ORDER BY r.nombre_rol ASC;

SELECT u.id_usuario AS ""ID USUARIO"", g.id_genero AS ""ID GÉNERO"", r.id_rol AS ""ID ROL"", 
r.nombre_rol AS ""ROL"", u.nombre_usuario AS ""NOMBRE"", u.paterno_usuario AS ""APELLIDO PATERNO"", 
u.materno_usuario AS ""APELLIDO MATERNO"", g.nombre_genero AS ""GÉNERO"", 
u.telefono_usuario AS ""TELÉFONO"", u.identificacion_usuario AS ""IDENTIFICACIÓN"", 
u.direccion_usuario AS ""DIRECCIÓN"", u.fecha_ingreso AS ""FECHA DE INGRESO"", 
u.tiene_acceso_sistema AS ""¿TIENE ACCESO?"", u.usuario AS ""USUARIO"", 
u.contrasena AS ""CONTRASEÑA"", u.estado_usuario AS ""ESTADO""
FROM Usuario u, Rol r, Genero g
WHERE u.id_rol = r.id_rol
AND u.id_genero = g.id_genero
ORDER BY r.nombre_rol ASC;


SELECT c.id_cliente AS "ID CLIENTE", g.id_genero AS "ID GÉNERO", c.nombre_cliente AS "NOMBRE", 
c.paterno_cliente AS "APELLIDO PATERNO", c.materno_cliente AS "APELLIDO MATERNO", 
g.nombre_genero AS "GÉNERO", c.telefono_cliente AS "TELÉFONO", c.identificacion_cliente AS "IDENTIFICACIÓN",
c.estado_cliente AS "ESTADO", c.nota_cliente AS "NOTA"
FROM Cliente c, Genero g
WHERE c.id_genero = g.id_genero
ORDER BY c.nombre_cliente;

--MOSTRAR DATOS DEL CLIENTE CON SU CHECK OUT No importa fecha
SELECT c.id_cliente AS "ID CLIENTE", g.id_genero AS "ID GÉNERO", rh.check_in_real As "CHECK IN", rh.check_out_real AS "CHECK OUT",
c.nombre_cliente AS "NOMBRE", c.paterno_cliente AS "APELLIDO PATERNO", c.materno_cliente AS "APELLIDO MATERNO", 
g.nombre_genero AS "GÉNERO", c.telefono_cliente AS "TELÉFONO", c.identificacion_cliente AS "IDENTIFICACIÓN",
c.estado_cliente AS "ESTADO", c.nota_cliente AS "NOTA"
FROM Cliente c, Genero g, Reservacion r, Reservacion_has_Habitacion rh
WHERE c.id_genero = g.id_genero
AND c.id_cliente = r.id_cliente
AND r.id_reservacion = rh.id_reservacion
AND rh.check_out_real IS NOT NULL
ORDER BY c.nombre_cliente;

SELECT c.id_cliente AS ""ID CLIENTE"", g.id_genero AS ""ID GÉNERO"", rh.check_in_real As ""CHECK IN"", rh.check_out_real AS ""CHECK OUT"",
c.nombre_cliente AS ""NOMBRE"", c.paterno_cliente AS ""APELLIDO PATERNO"", c.materno_cliente AS ""APELLIDO MATERNO"", 
g.nombre_genero AS ""GÉNERO"", c.telefono_cliente AS ""TELÉFONO"", c.identificacion_cliente AS ""IDENTIFICACIÓN"",
c.estado_cliente AS ""ESTADO"", c.nota_cliente AS ""NOTA""
FROM Cliente c, Genero g, Reservacion r, Reservacion_has_Habitacion rh
WHERE c.id_genero = g.id_genero
AND c.id_cliente = r.id_cliente
AND r.id_reservacion = rh.id_reservacion
AND rh.check_out_real IS NOT NULL
ORDER BY c.nombre_cliente;

--MOSTRAR DATOS DEL CLIENTE activos
--SELECT c.id_cliente AS "ID CLIENTE", g.id_genero AS "ID GÉNERO", rh.check_in_real As "CHECK IN", rh.check_out_real AS "CHECK OUT",
--c.nombre_cliente AS "NOMBRE", c.paterno_cliente AS "APELLIDO PATERNO", c.materno_cliente AS "APELLIDO MATERNO", 
--g.nombre_genero AS "GÉNERO", c.telefono_cliente AS "TELÉFONO", c.identificacion_cliente AS "IDENTIFICACIÓN",
--c.estado_cliente AS "ESTADO", c.nota_cliente AS "NOTA"
--FROM Cliente c, Genero g, Reservacion r, Reservacion_has_Habitacion rh
--WHERE c.id_genero = g.id_genero
--AND c.id_cliente = r.id_cliente
--AND r.id_reservacion = rh.id_reservacion
--AND rh.check_out_real IS NULL OR c.estado_cliente = 'Activo'
--ORDER BY c.nombre_cliente;

SELECT c.id_cliente AS ""ID CLIENTE"", g.id_genero AS ""ID GÉNERO"", rh.check_in_real As ""CHECK IN"", rh.check_out_real AS ""CHECK OUT"",
c.nombre_cliente AS ""NOMBRE"", c.paterno_cliente AS ""APELLIDO PATERNO"", c.materno_cliente AS ""APELLIDO MATERNO"", 
g.nombre_genero AS ""GÉNERO"", c.telefono_cliente AS ""TELÉFONO"", c.identificacion_cliente AS ""IDENTIFICACIÓN"",
c.estado_cliente AS ""ESTADO"", c.nota_cliente AS ""NOTA""
FROM Cliente c, Genero g, Reservacion r, Reservacion_has_Habitacion rh
WHERE c.id_genero = g.id_genero
AND c.id_cliente = r.id_cliente
AND r.id_reservacion = rh.id_reservacion
AND rh.check_out_real IS NULL OR c.estado_cliente = 'Activo'
ORDER BY c.nombre_cliente;

--MOSTRAR DATOS DEL CLIENTE CON SU CHECK OUT DE UNA FECHA DETERMINADA
SELECT c.id_cliente AS "ID CLIENTE", g.id_genero AS "ID GÉNERO", rh.check_in_prog As "CHECK IN", rh.check_out_prog AS "CHECK OUT",
c.nombre_cliente AS "NOMBRE", c.paterno_cliente AS "APELLIDO PATERNO", c.materno_cliente AS "APELLIDO MATERNO", 
g.nombre_genero AS "GÉNERO", c.telefono_cliente AS "TELÉFONO", c.identificacion_cliente AS "IDENTIFICACIÓN",
c.estado_cliente AS "ESTADO", c.nota_cliente AS "NOTA"
FROM Cliente c, Genero g, Reservacion r, Reservacion_has_Habitacion rh
WHERE c.id_genero = g.id_genero
AND c.id_cliente = r.id_cliente
AND r.id_reservacion = rh.id_reservacion
AND rh.check_in_prog >= '05/10/22'
AND rh.check_out_prog <= '26/10/22'
ORDER BY c.nombre_cliente;

SELECT c.id_cliente AS ""ID CLIENTE"", g.id_genero AS ""ID GÉNERO"", rh.check_in_prog As ""CHECK IN"", rh.check_out_prog AS ""CHECK OUT"",
c.nombre_cliente AS ""NOMBRE"", c.paterno_cliente AS ""APELLIDO PATERNO"", c.materno_cliente AS ""APELLIDO MATERNO"", 
g.nombre_genero AS ""GÉNERO"", c.telefono_cliente AS ""TELÉFONO"", c.identificacion_cliente AS ""IDENTIFICACIÓN"",
c.estado_cliente AS ""ESTADO"", c.nota_cliente AS ""NOTA""
FROM Cliente c, Genero g, Reservacion r, Reservacion_has_Habitacion rh
WHERE c.id_genero = g.id_genero
AND c.id_cliente = r.id_cliente
AND r.id_reservacion = rh.id_reservacion
AND rh.check_in_prog >= '05/10/22'
AND rh.check_out_prog <= '26/10/22'
ORDER BY c.nombre_cliente;
 
 
--todo de turno
SELECT t.id_turno AS "ID TURNO", t.id_usuario AS "ID USUARIO", t.fecha_hora_apertura AS "APERTURA", t.fecha_hora_cierre AS "CIERRE", u.nombre_usuario AS "NOMBRE USUARIO",
u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS "ENCARGADO DE TURNO", t.cantidad_inicial_turno AS "CANTIDAD $ INICIAL", 
t.cantidad_actual_turno AS "CANTIDAD $ ACTUAL", t.cantidad_cierre_turno AS "CANTIDAD $ CIERRE", t.nota_turno AS "NOTA DE TURNO"
FROM Turno t, Usuario u
WHERE t.id_usuario = u.id_usuario
ORDER BY t.fecha_hora_apertura ASC;


--Buscar cliente por nombre
SELECT c.id_cliente AS "ID CLIENTE", g.id_genero AS "ID GÉNERO",
                    c.nombre_cliente AS "NOMBRE", c.paterno_cliente AS "APELLIDO PATERNO", c.materno_cliente AS "APELLIDO MATERNO", 
                    g.nombre_genero AS "GÉNERO", c.telefono_cliente AS "TELÉFONO", c.identificacion_cliente AS "IDENTIFICACIÓN",
                    c.estado_cliente AS "ESTADO", c.nota_cliente AS "NOTA"
                 FROM Cliente c, Genero g
                 WHERE c.id_genero = g.id_genero
                 AND lower(c.nombre_cliente) LIKE '%jua%'
				 
				 SELECT c.id_cliente AS ""ID CLIENTE"", g.id_genero AS ""ID GÉNERO"",
                    c.nombre_cliente AS ""NOMBRE"", c.paterno_cliente AS ""APELLIDO PATERNO"", c.materno_cliente AS ""APELLIDO MATERNO"", 
                    g.nombre_genero AS ""GÉNERO"", c.telefono_cliente AS ""TELÉFONO"", c.identificacion_cliente AS ""IDENTIFICACIÓN"",
                    c.estado_cliente AS ""ESTADO"", c.nota_cliente AS ""NOTA""
                 FROM Cliente c, Genero g
                 WHERE c.id_genero = g.id_genero
                 AND lower(c.nombre_cliente) LIKE '%jua%'
				 
--Buscar usuarios por mombre
SELECT u.id_usuario AS "ID USUARIO", g.id_genero AS "ID GÉNERO", r.id_rol AS "ID ROL", 
r.nombre_rol AS "ROL", u.nombre_usuario AS "NOMBRE", u.paterno_usuario AS "APELLIDO PATERNO", 
u.materno_usuario AS "APELLIDO MATERNO", g.nombre_genero AS "GÉNERO", 
u.telefono_usuario AS "TELÉFONO", u.identificacion_usuario AS "IDENTIFICACIÓN", 
u.direccion_usuario AS "DIRECCIÓN", u.fecha_ingreso AS "FECHA DE INGRESO", 
u.tiene_acceso_sistema AS "¿TIENE ACCESO?", u.usuario AS "USUARIO", 
u.contrasena AS "CONTRASEÑA", u.estado_usuario AS "ESTADO"
FROM Usuario u, Rol r, Genero g
WHERE u.id_rol = r.id_rol
AND u.id_genero = g.id_genero
AND lower(u.nombre_usuario) LIKE '%jua%'


--Ver todo de la tabla reservacion_has_habitacion
SELECT rh.id_reservacion AS "ID RESERVACION", rh.numero_habitacion AS "NÚMERO DE HABITACION", h.precio_habitacion AS "PRECIO DE HABITACIÓN X NOCHE", 
h.capacidad_habitacion AS "CAPACIDAD", th.nombre_tipo_hab AS "TIPO DE HABITACIÓN", rh.check_in_prog AS "CHECK IN PROGRAMADO",
rh.check_out_prog AS "CHECK OUT PROGRAMADO", rh.check_in_real AS "CHECK IN REAL", rh.check_out_real AS "CHECK OUT REAL", 
r.fecha_hora_reservacion AS "FECHA DE RESERVACIÓN", r.id_cliente AS "ID CLIENTE", c.nombre_cliente ||' '|| c.paterno_cliente 
||' '|| c.materno_cliente AS "NOMBRE DEL CLIENTE", u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario ||', con usuario: '|| 
u.usuario AS "ATENDIDO POR", r.estado_reservacion AS "ESTADO RESERVACIÓN", r.nota_reservacion AS "NOTA"
FROM Reservacion_has_Habitacion rh, Reservacion r, Usuario u, Cliente c, Habitacion h, Tipo_Habitacion th
WHERE rh.numero_habitacion = h.numero_habitacion
AND h.id_tipo_hab = th.id_tipo_hab
AND rh.id_reservacion = r.id_reservacion
AND r.id_usuario = u.id_usuario
AND r.id_cliente = c.id_cliente
ORDER BY rh.numero_habitacion ASC;


--ver toda la informacion de  habitaciones totoalmente disponibles
SELECT h.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN"
FROM Habitacion h, Tipo_Habitacion th
WHERE h.id_tipo_hab = th.id_tipo_hab
AND estado_habitacion = 'Disponible' 
ORDER BY h.numero_habitacion ASC;

--VER HABITACIONES PARCIALMENTE DISPONIBLES
SELECT h.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN",
rh.check_in_prog AS "CHECK IN PROGRAMADO", rh.check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Habitacion h, Tipo_Habitacion th, Reservacion_has_Habitacion rh
WHERE h.id_tipo_hab = th.id_tipo_hab
AND rh.numero_habitacion = h.numero_habitacion
AND rh.check_in_real IS NULL
AND rh.check_out_real IS NULL
ORDER BY h.numero_habitacion ASC;


--VER HABITACIONES ASIGNADAS A UNA RESERVACION EN PARTICULAR
SELECT h.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN",
rh.check_in_prog AS "CHECK IN PROGRAMADO", rh.check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Habitacion h, Tipo_Habitacion th, Reservacion_has_Habitacion rh
WHERE h.id_tipo_hab = th.id_tipo_hab
AND rh.numero_habitacion = h.numero_habitacion
AND rh.check_in_real IS NULL
AND rh.check_out_real IS NULL
AND rh.id_reservacion = 1
ORDER BY h.numero_habitacion ASC;

--CONSULTA QUE MUESTRA HABTACIONES PARCIALMENTE DISPONIBLES     no
SELECT h.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN",
rh.check_in_prog AS "CHECK IN PROGRAMADO", rh.check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Habitacion h, Tipo_Habitacion th, Reservacion_has_Habitacion rh
WHERE h.id_tipo_hab = th.id_tipo_hab
AND rh.numero_habitacion = h.numero_habitacion
AND rh.check_in_real IS NULL
AND rh.check_out_real IS NULL
AND '08/10/2022' <= rh.check_out_prog AND '08/10/2022' >= rh.check_in_prog OR '08/10/2022' >= rh.check_in_prog AND '08/10/2022' <= rh.check_out_prog
AND  rh.check_in_prog >= '08/10/2022' AND rh.check_in_prog <= '08/10/2022' OR rh.check_out_prog >= '08/10/2022' AND rh.check_out_prog <= '08/10/2022'
ORDER BY h.numero_habitacion ASC;



SELECT rh.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN",
rh.check_in_prog AS "CHECK In PROGRAMADO", rh.check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Habitacion h, Tipo_Habitacion th, Reservacion_has_Habitacion rh
WHERE h.id_tipo_hab = th.id_tipo_hab
AND rh.numero_habitacion = h.numero_habitacion
AND rh.check_in_real IS NULL
AND rh.check_out_real IS NULL
AND '" & fechaIngresoSeleccionada & "' <= rh.check_out_prog AND '" & fechaIngresoSeleccionada & "' >= rh.check_in_prog OR '" & fechaIngresoSeleccionada & "' >= rh.check_in_prog AND '" & fechaIngresoSeleccionada & "' <= rh.check_out_prog 
AND rh.check_in_prog >= '" & fechaIngresoSeleccionada & "' AND rh.check_in_prog <= '" & fechaSalidaSeleccionada & "' OR rh.check_out_prog >= '" & fechaIngresoSeleccionada & "' AND rh.check_out_prog <= '" & fechaSalidaSeleccionada & "'
 ORDER BY rh.numero_habitacion ASC
 
 
 SELECT rh.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN",
rh.check_in_prog AS "CHECK In PROGRAMADO", rh.check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Habitacion h, Tipo_Habitacion th, Reservacion_has_Habitacion rh
WHERE h.id_tipo_hab = th.id_tipo_hab
AND rh.numero_habitacion = h.numero_habitacion
AND rh.check_in_real IS NULL
AND rh.check_out_real IS NULL
ORDER BY rh.numero_habitacion ASC ;
AND rh.check_out_prog <= '22/10/2022' AND rh.check_in_prog >= '22/10/2022' OR rh.check_in_prog >= '22/10/2022' AND rh.check_out_prog <= '22/10/2022'       
AND '22/10/2022' >= rh.check_in_prog AND '24/10/2022' <= rh.check_in_prog OR '22/10/2022' >= rh.check_out_prog  AND '24/10/2022' <= rh.check_out_prog 
 
SELECT rh.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN",
rh.check_in_prog AS "CHECK In PROGRAMADO", rh.check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Habitacion h, Tipo_Habitacion th, Reservacion_has_Habitacion rh
WHERE h.id_tipo_hab = th.id_tipo_hab
AND rh.numero_habitacion = h.numero_habitacion
AND rh.check_in_real IS NULL
AND rh.check_out_real IS NULL
AND rh.check_in_prog > TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND rh.check_in_prog > TO_DATE ('28/10/2022', 'DD/MM/YYYY') AND  rh.check_out_prog > TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND rh.check_out_prog > TO_DATE ('28/10/2022', 'DD/MM/YYYY') OR rh.check_in_prog < TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND rh.check_in_prog < TO_DATE ('28/10/2022', 'DD/MM/YYYY') AND  rh.check_out_prog < TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND rh.check_out_prog < TO_DATE ('28/10/2022', 'DD/MM/YYYY');
--ORDER BY rh.numero_habitacion ASC
GROUP BY rh.numero_habitacion;

SELECT Reservacion_has_Habitacion.numero_habitacion AS "NÚMERO DE HABITACÓN", th.nombre_tipo_hab AS "TIPO HABITACIÓN",
h.precio_habitacion AS "PRECIO X NOCHE", h.capacidad_habitacion AS "CAPACIDAD", h.descripcion_habitacion AS "DESCRIPCIÓN",
check_in_prog AS "CHECK In PROGRAMADO", check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Habitacion h, Tipo_Habitacion th, Reservacion_has_Habitacion
WHERE h.id_tipo_hab = th.id_tipo_hab
AND Reservacion_has_Habitacion.numero_habitacion = h.numero_habitacion
AND check_in_real IS NULL
AND check_out_real IS NULL
AND check_in_prog > TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND check_in_prog > TO_DATE ('28/10/2022', 'DD/MM/YYYY') AND check_out_prog > TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND check_out_prog > TO_DATE ('28/10/2022', 'DD/MM/YYYY') OR check_in_prog < TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND check_in_prog < TO_DATE ('28/10/2022', 'DD/MM/YYYY') AND  check_out_prog < TO_DATE ('30/10/2022', 'DD/MM/YYYY') AND check_out_prog < TO_DATE ('28/10/2022', 'DD/MM/YYYY');
--ORDER BY rh.numero_habitacion ASC
GROUP BY rh.numero_habitacion;

SELECT numero_habitacion AS "NÚMERO DE HABITACÓN", 
check_in_prog AS "CHECK In PROGRAMADO", check_out_prog AS "CHECK OUT PROGRAMADO"
FROM Reservacion_has_Habitacion
where check_in_real IS NULL
AND check_out_real IS NULL
AND check_in_prog > TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_in_prog > TO_DATE ('01/11/2022', 'DD/MM/YYYY') AND  check_out_prog > TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_out_prog > TO_DATE ('01/11/2022', 'DD/MM/YYYY') OR check_in_prog < TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_in_prog < TO_DATE ('01/11/2022', 'DD/MM/YYYY') AND  check_out_prog < TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_out_prog < TO_DATE ('01/11/2022', 'DD/MM/YYYY') 
ORDER BY numero_habitacion ASC;

--esto funciona
SELECT numero_habitacion AS "NÚMERO DE HABITACÓN", MAX(check_out_real)
FROM Reservacion_has_Habitacion
where check_in_real IS NULL
AND check_out_real IS NULL
AND check_in_prog > TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_in_prog > TO_DATE ('01/11/2022', 'DD/MM/YYYY') AND  check_out_prog > TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_out_prog > TO_DATE ('01/11/2022', 'DD/MM/YYYY') OR check_in_prog < TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_in_prog < TO_DATE ('01/11/2022', 'DD/MM/YYYY') AND  check_out_prog < TO_DATE ('02/11/2022', 'DD/MM/YYYY') AND check_out_prog < TO_DATE ('01/11/2022', 'DD/MM/YYYY') 
GROUP BY numero_habitacion
ORDER BY numero_habitacion ASC ;

SELECT numero_habitacion AS ""NÚMERO DE HABITACÓN"", MAX(check_out_real)
                    FROM Reservacion_has_Habitacion
                    WHERE check_in_real IS NULL
                    AND check_out_real IS NULL
                    AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') OR TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') 
                    GROUP BY numero_habitacion
                    ORDER BY numero_habitacion ASC
					
SELECT numero_habitacion AS "NÚMERO DE HABITACÓN", MAX(check_out_real)
                    FROM Reservacion_has_Habitacion
                    WHERE check_in_real IS NULL
                    AND check_out_real IS NULL
                    AND TO_CHAR(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_CHAR('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_CHAR(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_CHAR ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_CHAR(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_CHAR ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_CHAR(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_CHAR ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') OR TO_CHAR(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_CHAR ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_CHAR(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_CHAR(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_CHAR ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_CHAR(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_CHAR ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') 
                    GROUP BY numero_habitacion
                    ORDER BY numero_habitacion ASC;
					
--ESTE FUNCIONA					
SELECT numero_habitacion AS "NÚMERO DE HABITACÓN", MAX(check_out_real)
                    FROM Reservacion_has_Habitacion
                    WHERE check_in_real IS NULL
                    AND check_out_real IS NULL
                    AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') OR TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') 
                    GROUP BY numero_habitacion
                    ORDER BY numero_habitacion ASC;
					
SELECT numero_habitacion AS ""NÚMERO DE HABITACÓN"", MAX(check_out_real)
                    FROM Reservacion_has_Habitacion
                    WHERE check_in_real IS NULL
                    AND check_out_real IS NULL
                    AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') OR TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('26/10/2022 10:00', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('24/10/2022 10:00', 'DD/MM/YYYY HH24:MI') 
                    GROUP BY numero_habitacion
                    ORDER BY numero_habitacion ASC;

SELECT numero_habitacion AS ""NÚMERO DE HABITACÓN"", MAX(check_out_real)
                    FROM Reservacion_has_Habitacion
                    WHERE check_in_real IS NULL
                    AND check_out_real IS NULL
                    AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') > TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') OR TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaSalida.Value & "', 'DD/MM/YYYY HH24:MI') AND TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI') < TO_DATE ('" & DateTimeFechaIngreso.Value & "', 'DD/MM/YYYY HH24:MI') 
                    GROUP BY numero_habitacion
                    ORDER BY numero_habitacion ASC
					
					
					
SELECT numero_habitacion AS "NÚMERO DE HABITACÓN", MAX(check_out_real)
                    FROM Reservacion_has_Habitacion
                    WHERE check_in_real IS NULL
                    AND check_out_real IS NULL
                    AND ((TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI')) > (TO_DATE('27/10/2022 22:15', 'DD/MM/YYYY HH24:MI')) AND (TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI')) > (TO_DATE ('24/10/2022 22:14', 'DD/MM/YYYY HH24:MI')) AND (TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI')) > (TO_DATE ('27/10/2022 22:15', 'DD/MM/YYYY HH24:MI')) AND (TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI')) > (TO_DATE ('24/10/2022 22:14', 'DD/MM/YYYY HH24:MI'))) OR ((TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI')) < (TO_DATE ('27/10/2022 22:15', 'DD/MM/YYYY HH24:MI')) AND (TO_DATE(check_in_prog, 'DD/MM/YYYY HH24:MI')) < (TO_DATE ('24/10/2022 22:14', 'DD/MM/YYYY HH24:MI')) AND (TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI')) < (TO_DATE ('27/10/2022 22:15', 'DD/MM/YYYY HH24:MI')) AND (TO_DATE(check_out_prog, 'DD/MM/YYYY HH24:MI')) < (TO_DATE ('24/10/2022 22:14', 'DD/MM/YYYY HH24:MI'))) 
                    GROUP BY numero_habitacion
                    ORDER BY numero_habitacion ASC;
					
	SELECT h.habitacion_numero
  FROM habitaciones h
 WHERE NOT EXISTS (
         SELECT NULL
           FROM reservas r
          WHERE r.habitacion = h.habitacion_numero
            AND @fecha1 <= r.fin_fecha
            AND @fecha2 >= r.inicio_fecha)
 ORDER BY h.habitacion_numero;				
					
SELECT h.numero_habitacion
  FROM Habitacion h
 WHERE NOT EXISTS (
         SELECT NULL
           FROM Reservacion_has_Habitacion rh
          WHERE rh.numero_habitacion = h.numero_habitacion
            AND @fecha1 <= rh.check_out_prog
            AND @fecha2 >= rh.check_in_prog)
 ORDER BY h.numero_habitacion;
 
SELECT 'La habitación '|| rh.numero_habitacion ||' está ocupada desde: '|| TO_DATE(rh.check_in_prog, 'DD/MM/YY HH24:MI') ||' 14:00 hrs hasta: '|| TO_DATE(rh.check_out_prog, 'DD/MM/YY HH24:MI') ||' 13:59 hrs, por el cliente: '|| c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente ||' ('|| c.telefono_cliente ||').'  AS "INFORMACIÓN DE LA HABITACIÓN"
FROM Reservacion_has_Habitacion rh, Reservacion r, Cliente c
WHERE rh.id_reservacion = r.id_reservacion
AND r.id_cliente = c.id_cliente
AND rh.check_in_real IS NULL
AND rh.check_out_real IS NULL
AND rh.numero_habitacion = 100
ORDER BY c.nombre_cliente ASC;
 
--esta es la que sirve
 strSql = "SELECT h.numero_habitacion
  FROM Habitacion h
 WHERE NOT EXISTS (
         SELECT NULL
           FROM Reservacion_has_Habitacion rh
          WHERE rh.numero_habitacion = h.numero_habitacion
            AND TO_DATE ('" & DateTimeFechaIngreso.Text & " 14:00', 'DD/MM/YY HH24:MI') <= rh.check_out_prog
            AND TO_DATE ('" & DateTimeFechaSalida.Text & " 13:59', 'DD/MM/YY HH24:MI') >= rh.check_in_prog)
 ORDER BY h.numero_habitacion"
 
 
 SELECT u.nombre_usuario, r.nombre_rol FROM Usuario u, Rol r WHERE u.id_rol = r.id_rol AND r.nombre_rol = 'Administrador' AND u.usuario = 'brandon'
 
--para buscar una reservacion por nombre
"SELECT rh.id_reservacion AS ""ID RESERVACIÓN"", r.id_cliente AS ""ID CLIENTE"", r.id_usuario AS ""ID USUARIO"", r.fecha_hora_reservacion AS ""FECHA DE LA RESERVACIÓN"", 
rh.numero_habitacion AS ""NÚMERO DE HABITACIÓN"", h.precio_habitacion AS ""PRECIO X NOCHE"", 
h.capacidad_habitacion AS ""CAPACIDAD"", th.nombre_tipo_hab AS ""TIPO DE HABITACIÓN"", rh.check_in_prog AS ""CHECK IN PROGRAMADO"",
rh.check_out_prog AS ""CHECK OUT PROGRAMADO"", rh.check_in_real AS ""CHECK IN REAL"", rh.check_out_real AS ""CHECK OUT REAL"", 
c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente AS ""NOMBRE DEL CLIENTE"", c.telefono_cliente AS ""TELÉFONO"", c.identificacion_cliente AS ""IDENTIFICACIÓN"", c.nombre_cliente AS ""NOMBRE"", 
u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS ""ATENDIDO POR"", 
rh.estado_reservacion AS ""ESTADO RESERVACIÓN"", r.nota_reservacion AS ""NOTA""
FROM Reservacion_has_Habitacion rh, Reservacion r, Usuario u, Cliente c, Habitacion h, Tipo_Habitacion th
WHERE rh.numero_habitacion = h.numero_habitacion
AND h.id_tipo_hab = th.id_tipo_hab
AND rh.id_reservacion = r.id_reservacion
AND r.id_usuario = u.id_usuario
AND r.id_cliente = c.id_cliente
AND lower(c.nombre_cliente) LIKE '%" & datoB & "%'
ORDER BY rh.check_in_prog DESC"


---datos de un folio para buscarlo
--este no porque pone los registros vacios
SELECT f.id_folio AS "ID FOLIO", f.id_usuario AS "ID USUARIO", f.id_reservacion AS "NÚMERO DE RESERVACIÓN",
c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente AS "NOMBRE DEL CLIENTE", c.telefono_cliente AS "TELÉFONO CLIENTE", c.identificacion_cliente AS "IDENTIFICACIÓN CLIENTE",
u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS "ATENDIDO POR"
FROM Folio f, Reservacion r, Usuario u, Cliente c
WHERE f.id_reservacion = r.id_reservacion
AND f.id_usuario = u.id_usuario
AND r.id_cliente = c.id_cliente
ORDER BY f.fecha_hora_folio DESC;

SELECT f.id_folio AS "ID FOLIO", f.id_usuario AS "ID USUARIO", f.id_reservacion AS "NÚMERO DE RESERVACIÓN",
c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente AS "NOMBRE DEL CLIENTE", c.telefono_cliente AS "TELÉFONO CLIENTE", c.identificacion_cliente AS "IDENTIFICACIÓN CLIENTE",
u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS "ATENDIDO POR"
FROM Folio f, Reservacion r, Usuario u, Cliente c, Reservacion_has_Habitacion rh
WHERE f.id_reservacion = r.id_reservacion
AND f.id_usuario = u.id_usuario
AND r.id_cliente = c.id_cliente
AND rh.id_reservacion = r.id_reservacion
ORDER BY f.fecha_hora_folio DESC;


SELECT id_cargo_extra AS "ID CARGO EXTRA", id_folio AS "ID FOLIO", fecha_hora AS "FECHA", concepto AS "CONCEPTO", precio_unitario AS "PRECIO UNITARIO",
cantidad AS "CANTIDAD", precio_total AS "PRECIO TOTAL"
FROM Cargo_extra
WHERE id_folio = 1
ORDER BY fecha_hora DESC;

SELECT rh.numero_habitacion AS "NÚMERO HABITACIÓN", rh.check_in_prog AS "CHECK IN PROG.", 
c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente AS "NOMBRE DEL CLIENTE"
FROM Folio f, Reservacion r, Cliente c, Reservacion_has_Habitacion rh
WHERE f.id_reservacion = r.id_reservacion
AND r.id_cliente = c.id_cliente
AND rh.id_reservacion = r.id_reservacion
AND rh.check_in_prog = '06/11/22'
ORDER BY rh.check_in_prog DESC;


--folio
SELECT r.fecha_hora_reservacion AS "FECHA RESERVACIÓN", f.fecha_hora_folio AS "FECHA FOLIO", r.id_cliente, c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente AS "NOMBRE DEL CLIENTE", 
c.telefono_cliente AS "TELÉFONO CLIENTE", c.identificacion_cliente AS "IDENTIFICACIÓN CLIENTE",
f.pago_parcial_o_completo AS "PAGO COMPLETO/PARCIAL", f.cantidad_cargo_extra AS "CANTIDAD CARGO/S EXTRA", f.cantidad_cargo_total AS "CANTIDAD TOTAL A PAGAR", f.cantidad_pagada AS "CANTIDAD PAGADA",
f.cantidad_sobrante AS "CANTIDAD SOBRANTE", f.cantidad_faltante AS "CANTIDAD FALTANTE", u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS "ATENDIDO POR", estado_folio AS "ESTADO",
f.nota_folio AS "NOTA"
FROM Folio f, Reservacion r, Cliente c, Usuario u
WHERE f.id_reservacion = r.id_reservacion
AND r.id_cliente = c.id_cliente
AND f.id_usuario = u.id_usuario
ORDER BY r.fecha_hora_reservacion;

--folio con rango de fecha
SELECT f.id_folio AS "ID FOLIO", f.id_reservacion AS "ID RESERVACIÓN", r.fecha_hora_reservacion AS "FECHA RESERVACIÓN", f.fecha_hora_folio AS "FECHA FOLIO", r.id_cliente, c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente AS "NOMBRE DEL CLIENTE", 
c.telefono_cliente AS "TELÉFONO CLIENTE", c.identificacion_cliente AS "IDENTIFICACIÓN CLIENTE",
f.pago_parcial_o_completo AS "PAGO COMPLETO/PARCIAL", f.cantidad_cargo_extra AS "CANTIDAD CARGO/S EXTRA", f.cantidad_cargo_total AS "CANTIDAD TOTAL A PAGAR", f.cantidad_pagada AS "CANTIDAD PAGADA",
f.cantidad_sobrante AS "CANTIDAD SOBRANTE", f.cantidad_faltante AS "CANTIDAD FALTANTE", u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS "ATENDIDO POR", estado_folio AS "ESTADO",
f.nota_folio AS "NOTA"
FROM Folio f, Reservacion r, Cliente c, Usuario u
WHERE f.id_reservacion = r.id_reservacion
AND r.id_cliente = c.id_cliente
AND f.id_usuario = u.id_usuario
AND r.fecha_hora_reservacion >= 
AND r.fecha_hora_reservacion <= 
ORDER BY r.fecha_hora_reservacion;


SELECT rh.id_reservacion AS "ID RESERVACIÓN", r.id_cliente AS "ID CLIENTE", r.id_usuario AS "ID USUARIO", r.fecha_hora_reservacion AS "FECHA DE LA RESERVACIÓN", 
                        c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente AS "NOMBRE DEL CLIENTE", c.telefono_cliente AS "TELÉFONO", c.identificacion_cliente AS "IDENTIFICACIÓN", c.nombre_cliente AS "NOMBRE",
                        rh.numero_habitacion AS "NÚMERO DE HABITACIÓN", h.precio_habitacion AS "PRECIO X NOCHE", 
                        h.capacidad_habitacion AS "CAPACIDAD", th.nombre_tipo_hab AS "TIPO DE HABITACIÓN", rh.check_in_prog AS "CHECK IN PROGRAMADO",
                        rh.check_out_prog AS "CHECK OUT PROGRAMADO", rh.check_in_real AS "CHECK IN REAL", rh.check_out_real AS "CHECK OUT REAL",  
                        u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS "ATENDIDO POR", 
                        rh.estado_reservacion AS "ESTADO RESERVACIÓN", r.nota_reservacion AS "NOTA"
                      FROM Reservacion_has_Habitacion rh, Reservacion r, Usuario u, Cliente c, Habitacion h, Tipo_Habitacion th
                      WHERE rh.numero_habitacion = h.numero_habitacion
                      AND h.id_tipo_hab = th.id_tipo_hab
                      AND rh.id_reservacion = r.id_reservacion
                      AND r.id_usuario = u.id_usuario
                      AND r.id_cliente = c.id_cliente
                      AND rh.check_in_prog >= TO_DATE ('09/11/2022 12:00:00', 'DD/MM/YYYY HH:MI:SS AM')
                      AND rh.check_out_prog <= TO_DATE ('15/11/2022 11:59:59', 'DD/MM/YYYY HH:MI:SS PM')
                      ORDER BY rh.check_in_prog DESC;
												

--datos basicos de un folio
SELECT f.fecha_hora_folio, f.estado_folio, f.nota_folio, u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario,
c.nombre_cliente ||' '|| c.paterno_cliente ||' '|| c.materno_cliente
FROM Folio f, Reservacion r, Usuario u, Cliente c
WHERE f.id_reservacion = r.id_reservacion
AND f.id_usuario = u.id_usuario
AND r.id_cliente = c.id_cliente;	

SELECT id_reservacion, SUM(ROUND((rh.check_out_prog - rh.check_in_prog), 2) * h.precio_habitacion) As "PRECIO TOTAL"	
FROM Reservacion_has_Habitacion rh, Habitacion h
WHERE rh.numero_habitacion = h.numero_habitacion
AND rh.id_reservacion = 5 
GROUP BY id_reservacion;

SELECT id_reservacion, SUM(ROUND((Sysdate- rh.check_in_prog), 2) * h.precio_habitacion) As "PRECIO TOTAL"	
FROM Reservacion_has_Habitacion rh, Habitacion h
WHERE rh.numero_habitacion = h.numero_habitacion
AND rh.id_reservacion = 5 
GROUP BY id_reservacion;


AND rh.numero_habitacion =	100;		

SELECT id_folio, SUM(precio_total) As "CARGO TOTAL"	
                                                    FROM Cargo_extra
                                                    WHERE id_folio = 4
                                                    GROUP BY id_folio;						
													
SELECT t.id_turno AS "ID TURNO", t.id_usuario AS "ID USUARIO", t.fecha_hora_apertura AS "APERTURA", t.fecha_hora_cierre AS "CIERRE",
u.nombre_usuario ||' '|| u.paterno_usuario ||' '|| u.materno_usuario AS "ENCARGADO DE TURNO", t.cantidad_inicial_turno AS "CANTIDAD $ INICIAL", 
t.cantidad_actual_turno AS "CANTIDAD ACTUAL $", t.cantidad_cierre_turno AS "CANTIDAD CIERRE $", (cantidad_cierre_turno - cantidad_actual_turno) AS "DIFERENCIA $",
t.nota_turno AS "NOTA DE TURNO"
FROM Turno t, Usuario u
WHERE t.id_usuario = u.id_usuario
ORDER BY t.fecha_hora_apertura ASC;

SELECT MAX(id_turno), fecha_hora_cierre from turno where fecha_hora_cierre IS NULL GROUP BY fecha_hora_cierre;