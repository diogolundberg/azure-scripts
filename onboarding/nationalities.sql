INSERT INTO Nationalities (CreatedAt, Name, CheckForeign, CheckNative) VALUES
(getdate(), 'Brasileira', 0, 1),
(getdate(), 'Brasileira – nascido no exterior ou naturalizado', 0, 1),
(getdate(), 'Estrangeira', 1, 0);