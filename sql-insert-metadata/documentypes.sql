insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','CPF', '["Native"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','RNE', '["Foreigner"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Histórico Escolar do Ensino Médio', '["GraduationYear"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Certidão de Nascimento ou Casamento', null)
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Carteira de Identidade', null)
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Título de Eleitor e Comprovante de Votação', '["MinorAge"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Cartão de Vacinação (constanto 3 doses de vacina contra Hepatite B e vacina Dupla-adulto', null)
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Documento Militar','["MilitaryDraft"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType','Parecer da secretaria de educação e publicação no diário oficial','["ForeignGraduation"]')
insert into documenttypes (Discriminator,Name,Validations) values ('PersonalDocumentType', 'Declaração de conclusão do ensino médio', '["GraduationYear"]')


