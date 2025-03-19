DROP TABLE IF EXISTS catalogue_postal_codes;

CREATE TABLE IF NOT EXISTS catalogue_postal_codes (
    d_codigo VARCHAR(5),
    d_asenta VARCHAR(100),
    d_tipo_asenta VARCHAR(50),
    D_mnpio VARCHAR(100),
    d_estado VARCHAR(50),
    d_ciudad VARCHAR(100)
);
