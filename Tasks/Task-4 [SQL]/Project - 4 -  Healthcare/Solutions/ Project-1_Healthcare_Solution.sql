
--     	                      			PROJECT 1 HEALTHCARE 

-- Problem Statement 1:  Jimmy, from the healthcare department, has requested a report that shows how the number of treatments each age category of patients has gone through in the year 2022. 
-- The age category is as follows, Children (00-14 years), Youth (15-24 years), Adults (25-64 years), and Seniors (65 years and over).
-- Assist Jimmy in generating the report. 

SELECT
    CASE
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 0 AND 14 THEN 'Children (00-14 years)'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 15 AND 24 THEN 'Youth (15-24 years)'
        WHEN FLOOR(DATEDIFF(CURRENT_DATE, p.dob) / 365.25) BETWEEN 25 AND 64 THEN 'Adults (25-64 years)'
        ELSE 'Seniors (65 years and over)'
    END AS AgeCategory,
    COUNT(DISTINCT t.treatmentID) AS NumberOfTreatments
FROM
    Patient p
JOIN
    Treatment t ON p.patientID = t.patientID
WHERE
    YEAR(t.date) = 2022
GROUP BY
    AgeCategory;

-- Problem Statement 2:  Jimmy, from the healthcare department, wants to know which disease is infecting people of which gender more often.
-- Assist Jimmy with this purpose by generating a report that shows for each disease the male-to-female ratio. Sort the data in a way that is helpful for Jimmy.
SELECT
    a.city,
    d.diseaseName,
    COUNT(t.treatmentID) AS treatment_count
FROM
    Address a
JOIN
    Treatment t ON t.patientID IN (
        SELECT p.personID
        FROM Person p
        WHERE p.addressID = a.addressID
    )
JOIN
    Disease d ON t.diseaseID = d.diseaseID
WHERE
    a.state = 'AL'
GROUP BY
    a.city, d.diseaseName
ORDER BY
    treatment_count DESC;
    
-- Problem Statement 3: Jacob, from insurance management, has noticed that insurance claims are not made for all the treatments. He also wants to figure out if the gender of the patient has any impact on the insurance claim. Assist Jacob in this situation by generating a report that finds for each gender the number of treatments, number of claims, and treatment-to-claim ratio. And notice if there is a significant difference between the treatment-to-claim ratio of male and female patients.

SELECT
    d.diseaseName,
    (
        SELECT ip.planName
        FROM InsurancePlan ip
        JOIN Claim c ON ip.uin = c.uin
        JOIN Treatment t ON c.claimID = t.claimID
        JOIN Disease d2 ON t.diseaseID = d2.diseaseID
        WHERE d2.diseaseID = d.diseaseID
        GROUP BY ip.planName
        ORDER BY COUNT(c.claimID) DESC
        LIMIT 1
    ) AS max_claimed_plan,
    (
        SELECT ip.planName
        FROM InsurancePlan ip
        JOIN Claim c ON ip.uin = c.uin
        JOIN Treatment t ON c.claimID = t.claimID
        JOIN Disease d2 ON t.diseaseID = d2.diseaseID
        WHERE d2.diseaseID = d.diseaseID
        GROUP BY ip.planName
        ORDER BY COUNT(c.claimID) ASC
        LIMIT 1
    ) AS min_claimed_plan
FROM
    Disease d;

-- Problem Statement 4: The Healthcare department wants a report about the inventory of pharmacies. Generate a report on their behalf that shows how many units of medicine each pharmacy has in their inventory, the total maximum retail price of those medicines, and the total price of all the medicines after discount. 
-- Note: discount field in keep signifies the percentage of discount on the maximum price.

SELECT
    ph.pharmacyName AS PharmacyName,
    SUM(k.quantity) AS TotalQuantity,
    SUM(m.maxPrice * k.quantity) AS TotalMaxRetailPrice,
    SUM(m.maxPrice * (1 - k.discount / 100) * k.quantity) AS TotalPriceAfterDiscount
FROM
    Pharmacy ph
JOIN
    Keep k ON ph.pharmacyID = k.pharmacyID
JOIN
    Medicine m ON k.medicineID = m.medicineID
GROUP BY
    ph.pharmacyName;

-- Problem Statement 5:  The healthcare department suspects that some pharmacies prescribe more medicines than others in a single prescription, for them, generate a report that finds for each pharmacy the maximum, minimum and average number of medicines prescribed in their prescriptions. 
SELECT
    ph.pharmacyName AS PharmacyName,
    MAX(prescription_medicines.num_medicines) AS MaxMedicines,
    MIN(prescription_medicines.num_medicines) AS MinMedicines,
    AVG(prescription_medicines.num_medicines) AS AvgMedicines
FROM
    Pharmacy ph
LEFT JOIN (
    SELECT
        pr.pharmacyID,
        pr.prescriptionID,
        COUNT(*) AS num_medicines
    FROM
        Prescription pr
    JOIN
        Contain c ON pr.prescriptionID = c.prescriptionID
    GROUP BY
        pr.pharmacyID, pr.prescriptionID
) AS prescription_medicines ON ph.pharmacyID = prescription_medicines.pharmacyID
GROUP BY
    ph.pharmacyName;



