--Datos del cursor realizado en Postgres

do $$
declare 
precio_servicio int =0;
ndatos record;
num int;
--creacion del cursor 
c_nsolicitud cursor for select * from cliente, solicitud, servicio where 
cliente.id_cliente = solicitud_servicio.id_servicio and solicitud.id_solicitud = servicio.id_servicio and
 numero_solicitud='1';
begin
	for num in c_nsolicitud
	loop
	precio_servicio =precio_servicio + count (num.id_servicio);
	end loop;
open  c_nsolicitud;
fetch c_nsolicitud into ndatos;
raise notice 'Nombre: %, Apellido: %, solicitud: %, precio_servicio: %, Tipo_servicio: %, fecha_servicio: %', ndatos.nombre_cliente,
ndatos.apellido_cliente,ndatos.numero_solicitud,ndatos.precio_servicio,ndatos.tipo_servicio,ndatos.fecha_servicio;
end $$
language 'plpgsql';