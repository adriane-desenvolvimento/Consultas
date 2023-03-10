SELECT DISTINCT
    SPROFESSORTURMA.CODPROF AS 'Código do Professor'    
    /*PPESSOA.NOME AS 'Nome do Professor',*/
    /*STURMADISC.IDTURMADISC AS 'Turma/Disciplina'*/
    /*SDISCIPLINA.NOME AS 'Disciplina',
    SPLETIVO.CODPERLET AS 'Periódo Letivo'*/
FROM SPROFESSORTURMA
    JOIN SPROFESSOR ON  
        SPROFESSOR.CODPROF = SPROFESSORTURMA.CODPROF AND
        SPROFESSOR.CODCOLIGADA = SPROFESSORTURMA.CODCOLIGADA
    JOIN PPESSOA ON
        PPESSOA.CODIGO = SPROFESSOR.CODPESSOA
    JOIN PFUNC ON
        PFUNC.CODPESSOA = PPESSOA.CODIGO
    JOIN STURMADISC ON
        STURMADISC.IDTURMADISC = SPROFESSORTURMA.IDTURMADISC AND
        STURMADISC.CODCOLIGADA = STURMADISC.CODCOLIGADA
    JOIN SPLETIVO ON    
        SPLETIVO.IDPERLET = STURMADISC.IDPERLET AND
        SPLETIVO.CODCOLIGADA = STURMADISC.CODCOLIGADA
    JOIN SDISCIPLINA ON 
        SDISCIPLINA.CODDISC = STURMADISC.CODDISC AND 
        SDISCIPLINA.CODCOLIGADA = STURMADISC.CODCOLIGADA
WHERE 
    SPROFESSORTURMA.TIPOPROF = 'T'
    AND PFUNC.CODSITUACAO = 'A'
    AND SPLETIVO.CODPERLET = '2022/2'
