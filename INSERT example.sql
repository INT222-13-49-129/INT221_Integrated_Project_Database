INSERT INTO `cfandb`.`user` (`Userid`, `Username`, `Email`, `Password`, `Firstname`, `Lastname`, `DoB`, `Gender`, `Weight`, `Height`, `Status`, `Image`) VALUES ('101', 'Ho', 'Ho@gmail.com', 'holycrab', 'Jo', 'Nathan', '1980-03-21', 'M', '90', '200', 'ADMIN', 'aaa.jpg');
INSERT INTO `cfandb`.`user` (`Userid`, `Username`, `Email`, `Password`, `Firstname`, `Lastname`, `DoB`, `Gender`, `Weight`, `Height`, `Status`, `Image`) VALUES ('102', 'Ly', 'Ly@gmail.com', 'holycrab', 'Jo', 'Seph', '1968-06-15', 'F', '85', '195', 'NORMAL', 'aaa.jpg');
INSERT INTO `cfandb`.`user` (`Userid`, `Username`, `Email`, `Password`, `Firstname`, `Lastname`, `DoB`, `Gender`, `Weight`, `Height`, `Status`, `Image`) VALUES ('103', 'Crab', 'Crag@gmail.com', 'holycrab', 'Jo', 'Taro', '1991-09-13', 'M', '80', '190', 'NORMAL', 'aaa.jpg');

INSERT INTO `cfandb`.`ingredians` (`Ingradiansid`, `Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`) VALUES ('201', 'Tomato', '50', 'gram', 'Red vegetable', 'Vegetable');
INSERT INTO `cfandb`.`ingredians` (`Ingradiansid`, `Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`) VALUES ('202', 'Potato', '100', 'gram', 'Brown vegetable', 'Vegetable');
INSERT INTO `cfandb`.`ingredians` (`Ingradiansid`, `Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`) VALUES ('203', 'Onion', '50', 'gram', 'Cream vegetable', 'Vegetable');

INSERT INTO `cfandb`.`foodtype` (`Foodtypeid`, `Typename`) VALUES ('301', 'boiled');
INSERT INTO `cfandb`.`foodtype` (`Foodtypeid`, `Typename`) VALUES ('302', 'fried');
INSERT INTO `cfandb`.`foodtype` (`Foodtypeid`, `Typename`) VALUES ('303', 'puff');

INSERT INTO `cfandb`.`foodmenu` (`Foodmenuid`, `Foodname`, `Totalkcal`, `Image`, `Description`, `Foodmenustatus`, `Foodtype_Foodtypeid`, `User_Userid`) VALUES ('401', 'Pasta', '212', 'Double...', 'Italian food', 'PUBLISH', '301', '101');
INSERT INTO `cfandb`.`foodmenu` (`Foodmenuid`, `Foodname`, `Totalkcal`, `Image`, `Description`, `Foodmenustatus`, `Foodtype_Foodtypeid`, `User_Userid`) VALUES ('402', 'Pizza', '309', 'Triple...', 'Italian food', 'PERSONAL', '302', '102');
INSERT INTO `cfandb`.`foodmenu` (`Foodmenuid`, `Foodname`, `Totalkcal`, `Image`, `Description`, `Foodmenustatus`, `Foodtype_Foodtypeid`, `User_Userid`) VALUES ('403', 'Panzenella', '150', 'Quad...', 'Italian food', 'PUBLISH', '303', '103');

INSERT INTO `cfandb`.`meal` (`Mealid`, `Mealtime`, `Datemeal`, `Totalkcal`, `User_Userid`) VALUES ('501', 'Lunch', '2021-03-21', '550', '101');
INSERT INTO `cfandb`.`meal` (`Mealid`, `Mealtime`, `Datemeal`, `Totalkcal`, `User_Userid`) VALUES ('502', 'Dinner', '2021-03-22', '600', '102');
INSERT INTO `cfandb`.`meal` (`Mealid`, `Mealtime`, `Datemeal`, `Totalkcal`, `User_Userid`) VALUES ('503', 'Dinner', '2021-03-23', '450', '103');

INSERT INTO `cfandb`.`foodmenu_has_ingredians` (`Foodmenu_Foodmenuid`, `Ingredians_Ingradiansid`, `Totalunit`, `Totalkcal`) VALUES ('401', '201', '5', '212');
INSERT INTO `cfandb`.`foodmenu_has_ingredians` (`Foodmenu_Foodmenuid`, `Ingredians_Ingradiansid`, `Totalunit`, `Totalkcal`) VALUES ('402', '202', '10', '309');
INSERT INTO `cfandb`.`foodmenu_has_ingredians` (`Foodmenu_Foodmenuid`, `Ingredians_Ingradiansid`, `Totalunit`, `Totalkcal`) VALUES ('403', '203', '15', '150');

INSERT INTO `cfandb`.`meal_has_foodmenu` (`Meal_Mealid`, `Foodmenu_Foodmenuid`, `Totaldish`, `Totalkcal`) VALUES ('501', '401', '2', '3500');
INSERT INTO `cfandb`.`meal_has_foodmenu` (`Meal_Mealid`, `Foodmenu_Foodmenuid`, `Totaldish`, `Totalkcal`) VALUES ('502', '402', '2', '4200');
INSERT INTO `cfandb`.`meal_has_foodmenu` (`Meal_Mealid`, `Foodmenu_Foodmenuid`, `Totaldish`, `Totalkcal`) VALUES ('503', '403', '2', '2500');

INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('601', 'WAIT', '101');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('602', 'WAIT', '102');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('603', 'WAIT', '101');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('604', 'WAIT', '102');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('605', 'WAIT', '101');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('606', 'WAIT', '102');

INSERT INTO `cfandb`.`ingrediansreq` (`Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`, `Request_Requestid`) VALUES ('Tomato', '212', 'g', 'gram', 'Vegetable', '601');
INSERT INTO `cfandb`.`ingrediansreq` (`Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`, `Request_Requestid`) VALUES ('Potato', '309', 'g', 'gram', 'Vegetable', '602');
INSERT INTO `cfandb`.`ingrediansreq` (`Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`, `Request_Requestid`) VALUES ('Onion', '150', 'g', 'gram', 'Vegetable', '603');

INSERT INTO `cfandb`.`foodtypereq` (`Typename`, `Request_Requestid`) VALUES ('fried', '604');
INSERT INTO `cfandb`.`foodtypereq` (`Typename`, `Request_Requestid`) VALUES ('boiled', '605');
INSERT INTO `cfandb`.`foodtypereq` (`Typename`, `Request_Requestid`) VALUES ('puff', '606');

INSERT INTO `cfandb`.`jwtblacklist` (`Jwtblacklistid`, `token`, `exp`, `User_Userid`) VALUES ('701', 'aaaaaaaaaa', '2021-08-28 23:59:59', '101');
INSERT INTO `cfandb`.`jwtblacklist` (`Jwtblacklistid`, `token`, `exp`, `User_Userid`) VALUES ('702', 'aaaaaaaaaa', '2021-08-29 23:59:59', '102');
INSERT INTO `cfandb`.`jwtblacklist` (`Jwtblacklistid`, `token`, `exp`, `User_Userid`) VALUES ('703', 'aaaaaaaaaa', '2021-08-30 23:59:59', '103');
