CREATE SEQUENCE IF NOT EXISTS transferts_id_seq INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    START WITH 1
    NO CYCLE
    OWNED BY lendings.id_lending;