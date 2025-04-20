
-- Ugyfél tábla másolása
CREATE TABLE UGYFEL (
    LOGIN VARCHAR(32) NOT NULL,
    EMAIL VARCHAR(64) MASKED WITH (FUNCTION = 'email()') NOT NULL,
    NEV VARCHAR(64) MASKED WITH (FUNCTION = 'partial(1,"XXX",0)') NOT NULL,
    SZULEV NUMERIC(4) MASKED WITH (FUNCTION = 'random(1900, 2020)'),
    NEM CHAR(1),
    CIM VARCHAR(128)
);

-- Adatok beszúrása - érdemes elolvasni őket
INSERT INTO UGYFEL (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) VALUES
('zoldharcos', 'zold.sziv@fradi.hu', 'Fradista Ferenc', 1988, 'F', 'Budapest, Üllői út 129. – ahol a bajnokok élnek'),
('elkeseredett', 'szurkol@ujpestvesztes.hu', 'Ujpesti Ubul', 1974, 'F', 'Budapest, Megint kikaptunk utca 1.'),
('boldinagy', 'boldi.nagy0518@gnail.com', 'Nagy Boldizsár', 2005, 'F', 'Budapest, Dózsa György út 29.'), -- saját, valós adatok
('cr7legend', 'ronaldo@bajnokok.hu', 'Cristiano Ronaldo', 1985, 'F', 'Madeira, GOAT Boulevard 7.'),
('kisbolha', 'messike@barcavolt.hu', 'Lionel Messi', 1987, 'F', 'Rosario, Árnyékában Ronaldo utca 10.'),
('bobetheultra', 'bobe@zoldfeherfanclub.hu', 'Szurkoló Böbe', 1992, 'N', 'Budapest, SálatFel utca 3/b, 12. sor, közép');

-- Vendeg létrehozása
CREATE USER webshop_vendeg WITHOUT LOGIN;

-- Select biztosítása de "Unmask" jog nem
GRANT SELECT ON UGYFEL TO webshop_vendeg;

-- Alap tábla kinézete
SELECT * FROM UGYFEL;

-- vendeg felhasználóval való belépés utáni kinézete (maszkolt)
EXECUTE AS USER = 'webshop_vendeg';

SELECT * FROM UGYFEL;

REVERT;
