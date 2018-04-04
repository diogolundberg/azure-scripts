insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','CPF', '["Native"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','RNE', '["Foreigner"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Hist�rico Escolar do Ensino M�dio', '["GraduationYear"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Certid�o de Nascimento ou Casamento', null)
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Carteira de Identidade', null)
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','T�tulo de Eleitor e Comprovante de Vota��o', '["MinorAge"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Cart�o de Vacina��o (constanto 3 doses de vacina contra Hepatite B e vacina Dupla-adulto', null)
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Documento Militar','["MilitaryDraft"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Parecer da secretaria de educa��o e publica��o no di�rio oficial','["ForeignGraduation"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType', 'Declara��o de conclus�o do ensino m�dio', '["GraduationYear"]')


