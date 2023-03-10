SELECT CONVERT(VARCHAR, SPLANOAULA.DATA, 103) AS 'DATA',
    SHORARIO.HORAINICIAL,
    SHORARIO.HORAFINAL
FROM SMATRICULA (NOLOCK)
    JOIN SALUNO (NOLOCK)
    ON SALUNO.CODCOLIGADA = SMATRICULA.CODCOLIGADA
        AND SALUNO.RA = SMATRICULA.RA
    JOIN STURMADISC (NOLOCK)
    ON STURMADISC.CODCOLIGADA = SMATRICULA.CODCOLIGADA
        AND STURMADISC.IDTURMADISC = SMATRICULA.IDTURMADISC
    JOIN SPLANOAULA (NOLOCK)
    ON SPLANOAULA.CODCOLIGADA = STURMADISC.CODCOLIGADA
        AND SPLANOAULA.IDTURMADISC = STURMADISC.IDTURMADISC
    JOIN SHORARIOTURMA (NOLOCK)
    ON SHORARIOTURMA.CODCOLIGADA = SPLANOAULA.CODCOLIGADA
        AND SHORARIOTURMA.IDHORARIOTURMA = SPLANOAULA.IDHORARIOTURMA
        AND SHORARIOTURMA.CODCOLIGADA = STURMADISC.CODCOLIGADA
        AND SHORARIOTURMA.IDTURMADISC = STURMADISC.IDTURMADISC
    JOIN SHORARIO (NOLOCK)
    ON SHORARIO.CODCOLIGADA = SHORARIOTURMA.CODCOLIGADA
        AND SHORARIO.CODHOR = SHORARIOTURMA.CODHOR
    JOIN SPLETIVO (NOLOCK)
    ON SPLETIVO.CODCOLIGADA = STURMADISC.CODCOLIGADA
        AND SPLETIVO.IDPERLET = STURMADISC.IDPERLET
WHERE  SMATRICULA.RA =  '22-1-18177'
    AND SPLANOAULA.DATA <= Getdate()
    AND ( SHORARIOTURMA.CODSUBTURMA IS NULL
    OR SHORARIOTURMA.CODSUBTURMA = SMATRICULA.CODSUBTURMA )
    AND CONCAT(CONVERT(VARCHAR, DATA, 103), SPLANOAULA.IDHORARIOTURMA) NOT IN (SELECT CONCAT(CONVERT(VARCHAR, DATA, 103), SPLANOAULA.IDHORARIOTURMA)
    FROM SFREQUENCIA
    WHERE  RA = SMATRICULA.RA
        AND IDTURMADISC = SPLANOAULA.IDTURMADISC) 
