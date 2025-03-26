#Creacion del procedimiento para agregar una nueva reserva
delimiter //
create procedure sp_new_reserva (
    in p_fechaArribo date,
    in p_fechaSalida date, 
	in p_numNoches int, 
	in p_vueloArribo date, 
	in p_vueloSalida date,
	IN p_early_check_in varchar(45),
	in p_id_cliente int,
	in p_id_tarjeta int,
	in p_id_habitacion int
)
begin

	# Declaración de variables 
	declare v_fechaArribo date;
	declare v_fechaSalida date;
	declare v_numNoches int;
	declare v_vueloArribo date;
	declare v_vueloSalida date;
	declare v_early_check_in varchar(45);
	declare v_id_cliente int;
	declare v_id_tarjeta int;
	declare v_id_habitacion int;
    
    # Asignación de los parámetros de entrada
    set v_fechaArribo = p_fechaArribo;
    set v_fechaSalida = p_fechaSalida;
    set v_numNoches = p_numNoches;
    set v_vueloArribo = p_vueloArribo;
    set v_vueloSalida = p_vueloSalida;
    set v_early_check_in = p_early_check_in;
    set v_id_cliente = p_id_cliente;
    set v_id_tarjeta = p_id_tarjeta;
    set v_id_habitacion = p_id_habitacion;

	# Inserción de datos en la tabla reserva
	insert into proyecto2.reserva 
		(fechaArribo, fechaSalida, numNoches, vueloArribo, vueloSalida, 
         early_check_in, id_cliente, id_tarjeta, id_habitacion)
		 values 
			(v_fechaArribo, v_fechaSalida, v_numNoches, v_vueloArribo, v_vueloSalida, 
            v_early_check_in, v_id_cliente, v_id_tarjeta, v_id_habitacion);

end // DELIMITER ;

# Llamada al procedimiento para agregar datos a la tabla reserva
call sp_new_reserva (
					 "2023-10-5", #fechaArrivo
					 "2023-10-20", #fechaSalida
                     15, #numNoches
                     "2023-10-4", #vueloArrivo
                     "2023-10-21", #vueloSalida
                     "Si", #early_check_in
                     1, #id_cliente
                     1, #id_tarjeta
                     1 #id_habitacion
                     );

select * from reserva;

/* truncate table reserva; */

#Creacion de la tabla para las inserciones
create table logInsercion (
	id_log int auto_increment primary key, 
	fecha date, 
	evento varchar (45),
    datos varchar (4500)
);

/*
delimiter //
drop trigger tgr_logInsercion // DELIMITER ; 
*/

#Creacion del trigger
delimiter //
create trigger tgr_logInsercion after insert on reserva
for each row
begin 
	declare v_datos varchar (4500);
    
    set v_datos = concat(
		new.id_reserva, ", ", 
		new.fechaArribo, ", ",
		new.fechaSalida, ", ",
		new.numNoches, ", ",
		new.vueloArribo, ", ",
		new.vueloSalida, ", ",
		new.early_check_in, ", ",
		new.id_cliente, ", ",
		new.id_tarjeta, ", ",
		new.id_habitacion
        );

	insert into logInsercion (fecha, evento, datos)
		values (now(), "Insercion", v_datos);

end // DELIMITER ;

select * from logInsercion; 

/* truncate table logInsercion; */
