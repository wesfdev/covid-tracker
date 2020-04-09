SELECT * FROM covid_tracker.city;
SELECT * FROM covid_tracker.observations;
SELECT * FROM covid_tracker.symptom;
SELECT * FROM covid_tracker.symptom_response;
SELECT * FROM covid_tracker.value_list;

SELECT * FROM covid_tracker.person;
SELECT * FROM covid_tracker.diagnostic;
SELECT * FROM covid_tracker.diagnostic_detail;
SELECT * FROM covid_tracker.patient_condition;


SELECT * FROM covid_tracker.value_list where discriminator = 'status' order by name;
SELECT * FROM covid_tracker.value_list where discriminator = 'Category' order by description;
SELECT * FROM covid_tracker.value_list where discriminator = 'ObservationType' order by name;


select * from mysql.user;




-- observaciones --
-- medidas de precaucion
/*INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Lávate las manos frecuentemente, con agua y jabón, mínimo 20 segundos o utiliza gel con base de alcohol al 70%', 45, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Cúbrete la nariz y boca con el antebrazo o pañuelo desechable, al estornudar o toser.', 45, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Si está enfermo o cuida a alguien que está enfermo, use una mascarilla médica.', 45, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('No tocarse la cara, la nariz, la boca y los ojos con las manos sucias.', 45, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Limpia y desinfecta las superficies y objetos de uso común en: casas, oficinas, sitios cerrados, transporte, centros de reunión, etc.', 45, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Permanezca en casa si no se encuentra bien. Si tiene fiebre, tos y dificultad para respirar, busque atención médica y llame con antelación. Siga las instrucciones de las autoridades sanitarias locales.', 45, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Evite el contacto cercano con otras personas.', 45, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Use pañuelos desechables para eliminar secreciones respiratorias y tírelos tras su uso.', 45, 0, 0, 4);

-- enfermedades
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Debido a la afección médica que padece podría desarrollar un caso más grave de COVID-19, por favor tome todas las medidas de precaución.', 44, 0, 0, 5);

-- formas de comunicacion
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('1. Llame a su médico de cabecera o proveedor de atención médica.', 46, 7, 33, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('2. Si no están disponibles, llame a Ministerio de Salud Pública y Asistencia Social al 1517.', 46, 7, 3, 4);

-- Contagio
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('El virus se puede transmitir de persona a persona por contacto cercano. Se considera contacto cercano estar a menos de 2 metros de distancia.', 47, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Puede transmitirse de persona a persona a través el aire cuando alguien que tiene el virus tose o estornuda.', 47, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Se puede transmitir si tocan una superficie que ha sido previamente tocada por alguien con el virus.', 47, 0, 0, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Alguien sin síntomas aún puede tener el virus y transmitirlo a otras personas.', 47, 0, 0, 4);

-- resumen
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Probablemente solo se encuentre estresado. Por favor, siga las medidas de precaución. ', 43, 0, 2, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Hidrátese adecuadamente y siga las medidas de precaución y vuelva a hacer la evaluación después de dos días.', 43, 0, 6, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Los síntomas que informa se presentan en algunas personas con COVID-19, sin embargo los sintomas más comunes son fiebre, cansancio y tos seca.', 43, 7, 33, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Por favor, búsque atención médica.', 43, 13, 33, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Para saber si las pruebas de COVID-19 están disponibles en su área, llame a su médico de cabecera o a la línea de salud pública.', 43, 13, 33, 4);
INSERT INTO covid_tracker.observations(description, category, initial_probability, final_probability_range, status)
VALUES('Informe a su médico de su sospecha de tener COVID-19, si se le aconseja ir a un centro de emergencia o los centro establecidos, por favor utilice mascarilla para minimizar la probabilidad de contagiar a otros.', 43, 13, 33, 4);
*/

-- sintomas --
-- sintomas principales
/*INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Fiebre', 22, 5);
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Tos', 22, 5);
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Dificultad para respirar', 22, 5);
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Fatiga', 22, 4);

-- otros sintomas
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Dolor de garganta', 23, 3);
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Diarrea', 23, 2);
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Dolor de cabeza', 23, 1);

-- enfermedades
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Hipertensión arterial', 21, 0);
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Enfermedad cardiaca', 21, 0);
INSERT INTO covid_tracker.symptom(name, category, weighing)VALUES('Diabetes', 21, 0);
*/


-- respuestas de sintomas
-- sintomas principales

/*INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('NO', '', 0, 11);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Fiebre leve', '(38.0 - 38.5 ° C)', 5, 11);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Fiebre moderada', '(38.6 - 39.0 ° C)', 5, 11);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Fiebre alta', '(39.1 - 39.9 ° C)', 5, 11);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Fiebre muy alta ', '( > 40.0 ° C )', 5, 11);


INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('NO', '', 0, 12);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Tos débil sin dolor', '', 3, 12);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Tos con dolor leve', '', 4, 12);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Tos severa con dolor pulmonar', '', 5, 12);

INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('NO', '', 0, 13);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('SI', '', 5, 13);

INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('NO', '', 0, 14);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('SI', '', 4, 14);

-- otros sintomas

INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('NO', '', 0, 15);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Dolor de garganta', '', 1, 15);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Dificultad para tragar', '', 2, 15);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Apenas es posible tragar', '', 3, 15);

INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('NO', '', 0, 16);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Ligera', '(todo el día)', 1, 16);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Heces líquidas', '(todo el día)', 1.5, 16);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Heces acuosas', '(todo el día)', 2, 16);

INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('NO', '', 0, 17);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Por lapsos', '', 03, 17);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Todo el día', '', 0.6, 17);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES('Mareos al ponerse de pie', '', 1, 17);


-- enfermedades
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES ('SI', '', 0, 18);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES ('NO', '', 0, 18);

INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES ('SI', '', 0, 19);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES ('NO', '', 0, 19);

INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES ('SI', '', 0, 20);
INSERT INTO covid_tracker.symptom_response(response, complement, weighing, symptom)
VALUES ('NO', '', 0, 20);
*/




