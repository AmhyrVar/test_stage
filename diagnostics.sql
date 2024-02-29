WITH dossier AS (
    SELECT * FROM public.dossier
),
activite_recente AS (
    SELECT
        dossier_id
        , max(date_activite) DATE_DERNIERE_ACTIVITE
    FROM public.activite
    group by 1
),
diagnostic AS (
    SELECT * FROM public.diagnostic
)

SELECT
    doss.patient_id
    ,diag.code_orpha AS diagnostic
    ,diag.statut
    ,doss.DATE_INCLUSION
    ,acti.DATE_DERNIERE_ACTIVITE
FROM diagnostic diag
JOIN dossier doss
    ON doss.dossier_id = diag.dossier_id
JOIN activite_recente acti
    ON acti.dossier_id = doss.dossier_id
;