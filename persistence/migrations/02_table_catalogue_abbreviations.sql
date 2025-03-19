DROP TABLE IF EXISTS state_abbreviations;
DROP TABLE IF EXISTS colony_type_abbreviations;
DROP TABLE IF EXISTS street_type_abbreviations;
DROP TABLE IF EXISTS catalogue_common_terms;


CREATE TABLE IF NOT EXISTS state_abbreviations (
    'state' VARCHAR(25),
    abbreviation VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS colony_type_abbreviations (
    colony_type VARCHAR(25),
    abbreviation VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS street_type_abbreviations (
    street_type VARCHAR(25),
    abbreviation VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS common_terms (
    term VARCHAR(128) PRIMARY KEY
);


--------------------
-- INITIAL VALUES --
--------------------
-- RENAPO --
INSERT INTO state_abbreviations (state, abbreviation) values ('Aguascalientes','AS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Baja California','BC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Baja California Sur','BS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Campeche','CC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Chiapas','CS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Chihuahua','CH');
INSERT INTO state_abbreviations (state, abbreviation) values ('Coahuila','CL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Colima','CM');
INSERT INTO state_abbreviations (state, abbreviation) values ('Ciudad de México','DF');
INSERT INTO state_abbreviations (state, abbreviation) values ('Durango','DG');
INSERT INTO state_abbreviations (state, abbreviation) values ('Guanajuato','GT');
INSERT INTO state_abbreviations (state, abbreviation) values ('Guerrero','GR');
INSERT INTO state_abbreviations (state, abbreviation) values ('Hidalgo','HG');
INSERT INTO state_abbreviations (state, abbreviation) values ('Jalisco','JC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Estado de México','MC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Michoacán','MN');
INSERT INTO state_abbreviations (state, abbreviation) values ('Morelos','MS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Nayarit','NT');
INSERT INTO state_abbreviations (state, abbreviation) values ('Nuevo León','NL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Oaxaca','OC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Puebla','PL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Querétaro','QO');
INSERT INTO state_abbreviations (state, abbreviation) values ('Quintana Roo','QR');
INSERT INTO state_abbreviations (state, abbreviation) values ('San Luis Potosí','SP');
INSERT INTO state_abbreviations (state, abbreviation) values ('Sinaloa','SL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Sonora','SR');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tabasco','TC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tamaulipas','TS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tlaxcala','TL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Veracruz','VZ');
INSERT INTO state_abbreviations (state, abbreviation) values ('Yucatán','YN');
INSERT INTO state_abbreviations (state, abbreviation) values ('Zacatecas','ZS');


-- ISO 2 --
INSERT INTO state_abbreviations (state, abbreviation) values ('Aguascalientes','AG');
INSERT INTO state_abbreviations (state, abbreviation) values ('Baja California','BC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Baja California Sur','BS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Campeche','CM');
INSERT INTO state_abbreviations (state, abbreviation) values ('Chiapas','CS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Chihuahua','CH');
INSERT INTO state_abbreviations (state, abbreviation) values ('Coahuila','CO');
INSERT INTO state_abbreviations (state, abbreviation) values ('Colima','CL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Ciudad de México','CX');
INSERT INTO state_abbreviations (state, abbreviation) values ('Durango','DG');
INSERT INTO state_abbreviations (state, abbreviation) values ('Guanajuato','GT');
INSERT INTO state_abbreviations (state, abbreviation) values ('Guerrero','GR');
INSERT INTO state_abbreviations (state, abbreviation) values ('Hidalgo','HG');
INSERT INTO state_abbreviations (state, abbreviation) values ('Jalisco','JC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Estado de México','EM');
INSERT INTO state_abbreviations (state, abbreviation) values ('Michoacán','MI');
INSERT INTO state_abbreviations (state, abbreviation) values ('Morelos','MO');
INSERT INTO state_abbreviations (state, abbreviation) values ('Nayarit','NA');
INSERT INTO state_abbreviations (state, abbreviation) values ('Nuevo León','NL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Oaxaca','OA');
INSERT INTO state_abbreviations (state, abbreviation) values ('Puebla','PU');
INSERT INTO state_abbreviations (state, abbreviation) values ('Querétaro','QT');
INSERT INTO state_abbreviations (state, abbreviation) values ('Quintana Roo','QR');
INSERT INTO state_abbreviations (state, abbreviation) values ('San Luis Potosí','SL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Sinaloa','SI');
INSERT INTO state_abbreviations (state, abbreviation) values ('Sonora','SO');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tabasco','TB');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tamaulipas','TM');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tlaxcala','TL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Veracruz','VE');
INSERT INTO state_abbreviations (state, abbreviation) values ('Yucatán','YU');
INSERT INTO state_abbreviations (state, abbreviation) values ('Zacatecas','ZA');


-- ISO 3611:MX 3 --
INSERT INTO state_abbreviations (state, abbreviation) values ('Aguascalientes','AGU');
INSERT INTO state_abbreviations (state, abbreviation) values ('Baja California','BCN');
INSERT INTO state_abbreviations (state, abbreviation) values ('Baja California Sur','BCS');
INSERT INTO state_abbreviations (state, abbreviation) values ('Campeche','CAM');
INSERT INTO state_abbreviations (state, abbreviation) values ('Chiapas','CHP');
INSERT INTO state_abbreviations (state, abbreviation) values ('Chihuahua','CHH');
INSERT INTO state_abbreviations (state, abbreviation) values ('Coahuila','COA');
INSERT INTO state_abbreviations (state, abbreviation) values ('Colima','COL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Ciudad de México','CMX');
INSERT INTO state_abbreviations (state, abbreviation) values ('Durango','DUR');
INSERT INTO state_abbreviations (state, abbreviation) values ('Guanajuato','GUA');
INSERT INTO state_abbreviations (state, abbreviation) values ('Guerrero','GRO');
INSERT INTO state_abbreviations (state, abbreviation) values ('Hidalgo','HID');
INSERT INTO state_abbreviations (state, abbreviation) values ('Jalisco','JAL');
INSERT INTO state_abbreviations (state, abbreviation) values ('Estado de México','MEX');
INSERT INTO state_abbreviations (state, abbreviation) values ('Michoacán','MIC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Morelos','MOR');
INSERT INTO state_abbreviations (state, abbreviation) values ('Nayarit','NAY');
INSERT INTO state_abbreviations (state, abbreviation) values ('Nuevo León','NLE');
INSERT INTO state_abbreviations (state, abbreviation) values ('Oaxaca','OAX');
INSERT INTO state_abbreviations (state, abbreviation) values ('Puebla','PUE');
INSERT INTO state_abbreviations (state, abbreviation) values ('Querétaro','QUE');
INSERT INTO state_abbreviations (state, abbreviation) values ('Quintana Roo','ROO');
INSERT INTO state_abbreviations (state, abbreviation) values ('San Luis Potosí','SLP');
INSERT INTO state_abbreviations (state, abbreviation) values ('Sinaloa','SIN');
INSERT INTO state_abbreviations (state, abbreviation) values ('Sonora','SON');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tabasco','TAB');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tamaulipas','TAM');
INSERT INTO state_abbreviations (state, abbreviation) values ('Tlaxcala','TLA');
INSERT INTO state_abbreviations (state, abbreviation) values ('Veracruz','VER');
INSERT INTO state_abbreviations (state, abbreviation) values ('Yucatán','YUC');
INSERT INTO state_abbreviations (state, abbreviation) values ('Zacatecas','ZAC');


INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Aeropuerto', 'APTO');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Granja', 'GRNJA');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Barrio', 'BO');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Hacienda', 'HDA');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Campamento', 'CAMP');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Ingenio', 'INGNO');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Colonia', 'COL');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Parque Industrial', 'PQIND');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Condominio', 'COND');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Pueblo', 'PBO');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Ejido', 'EJ');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Rancho', 'RCHO');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Equipamiento', 'EQPTO');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Unidad Habitacional', 'UH');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Exhacienda', 'EXHDA');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Zona Comercial', 'ZCOM');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Fraccionamiento', 'FRACC');
INSERT INTO colony_type_abbreviations (colony_type, abbreviation) values ('Zona Industrial', 'ZIND');


INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Ampliación', 'AMP');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Diagonal', 'DIAG');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Andador', 'AND');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Glorieta', 'GTA');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Autopista', 'AUT');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Jardín', 'JDN');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Avenida', 'AV');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Libramiento', 'LIB');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Bajada', 'BJD');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Paraje', 'PRJ');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Boulevard', 'BLV');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Boulevard', 'BLVR');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Pasaje', 'PSJ');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Calzada', 'CALZ');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Paseo', 'PSO');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Calle', 'C');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Periférico', 'PERIF');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Callejón', 'CJON');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Plaza', 'PZA');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Camino', 'CAM');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Camino', 'CMNO');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Plazuela', 'PZLA');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Carretera', 'CARR');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Privada', 'PRIV');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Cerrada', 'CDA');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Prolongación', 'PROL');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Circuito', 'CTO');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Ramal', 'RML');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Circunvalación', 'CVLN');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Circunvalación', 'CIRCUN');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Retorno', 'RET');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Crucero', 'CRO');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Rinconada', 'RCDA');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Cuchilla', 'CUCH');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Vereda', 'VDA');
INSERT INTO street_type_abbreviations (street_type, abbreviation) values ('Viaducto', 'VDTO');


INSERT INTO common_terms (term) values ('cp');
INSERT INTO common_terms (term) values ('codigo postal');
INSERT INTO common_terms (term) values ('c-p');
INSERT INTO common_terms (term) values ('numero');
INSERT INTO common_terms (term) values ('no');
INSERT INTO common_terms (term) values ('kilometro');
INSERT INTO common_terms (term) values ('km');
