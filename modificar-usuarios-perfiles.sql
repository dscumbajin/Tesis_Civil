-- Agregamos la columna id como Primary Key y AUTO_INCREMENT.
-- Creamos un UNIQUE INDEX en la columna cuenta

ALTER TABLE `Usuarios` 
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `cuenta_UNIQUE` (`cuenta` ASC);


-- Agregamos la columna id como Primary Key y AUTO_INCREMENT.
-- Creamos un UNIQUE INDEX COMPOUND en las columnas cuenta y perfil

ALTER TABLE `Perfiles` 
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (`id`),
ADD UNIQUE INDEX `cuenta_perfil_UNIQUE` (`cuenta`,`perfil`);

