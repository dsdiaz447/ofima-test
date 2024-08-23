SELECT
    M.IdMenu,
    (
        SELECT
            MVM.Idmenu
        FROM
            MvGrupo MVG,
            MtGrupo G,
            MVMenu MVM
        WHERE
            MVG.CodGrupo = G.CodGrupo
            AND MVM.CodGrupo = G.CodGrupo
            AND MVG.Codusuario = 'SUPER'
            AND MVM.IdMenu = M.IdMenu
        GROUP BY
            MVM.IdMenu
    ) AS TienePermiso,
    M.Ejecuta AS Ejec,
    M.CodProgram,
    M.PosMenu AS Codigo,
    M.NombreOpc AS NomOpc,
    M.NomBrePrg AS NomProc,
    M.Detalle,
    M.Pais,
    M.Boton,
    M.PosBoton,
    M.TitulBoton AS Titulo,
    M.BarraH,
    M.TeclaRapid,
    M.Icono,
    M.Grupo,
    M.Parametro
FROM
    MtMenu M
WHERE
    M.CodProgram = 'FACTU'
    AND (
        M.Pais = '(Todos)'
        OR M.Pais = 'CO'
    )
    AND (
        EXISTS (
            SELECT
                1
            FROM
                MTMENU sub
            WHERE
                sub.NombreOpc LIKE '%' + 'Facturas' + '%'
                AND M.POSMENU LIKE sub.POSMENU + '%'
                AND M.CodProgram = 'FACTU'
                AND (
                    M.Pais = '(Todos)'
                    OR M.Pais = 'CO'
                )
        )
        OR EXISTS (
            SELECT
                1
            FROM
                MTMENU sub
            WHERE
                sub.NombreOpc LIKE '%' + 'Facturas' + '%'
                AND sub.POSMENU LIKE M.POSMENU + '%' 
                AND M.CodProgram = 'FACTU'
                AND (
                    M.Pais = '(Todos)'
                    OR M.Pais = 'CO'
                )
        )
    )
ORDER BY
    M.PosMenu,
    M.Pais