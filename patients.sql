WITH patient AS (
    SELECT * FROM public.patient
),
dossier AS (
    SELECT * FROM public.dossier
),
hopital AS (
    SELECT * FROM public.hopital
)

SELECT
p.patient_id
,p.sexe
,p.annee_naissance
,h.ville AS ville_prise_en_charge
,p.statut_vital
FROM patient p
JOIN dossier AS d
    ON d.patient_id = p.patient_id
JOIN hopital AS h
    ON h.codep = d.hopital_codep
;