INSERT INTO `cfandb`.`user` (`Userid`, `Username`, `Email`, `Password`, `Firstname`, `Lastname`, `DoB`, `Gender`, `Weight`, `Height`, `Status`) VALUES ('101', 'Ho', 'Ho@gmail.com', 'holycrab', 'Jo', 'Nathan', '1980-03-21', 'M', '90', '200', 'ADMIN');
INSERT INTO `cfandb`.`user` (`Userid`, `Username`, `Email`, `Password`, `Firstname`, `Lastname`, `DoB`, `Gender`, `Weight`, `Height`, `Status`) VALUES ('102', 'Ly', 'Ly@gmail.com', 'holycrab', 'Jo', 'Seph', '1968-06-15', 'F', '85', '195', 'NORMAL');

INSERT INTO `cfandb`.`ingredians` (`Ingradiansid`, `Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`) VALUES ('201', 'Tomato', '50', 'Piece', 'Red vegetable', 'Vegetable');
INSERT INTO `cfandb`.`ingredians` (`Ingradiansid`, `Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`) VALUES ('202', 'Potato', '100', 'Piece', 'Brown vegetable', 'Vegetable');

INSERT INTO `cfandb`.`foodtype` (`Foodtypeid`, `Typename`) VALUES ('301', 'Solid');
INSERT INTO `cfandb`.`foodtype` (`Foodtypeid`, `Typename`) VALUES ('302', 'Liquid');

INSERT INTO `cfandb`.`foodmenu` (`Foodmenuid`, `Foodname`, `Totalkcal`, `Image`, `Description`, `Foodmenustatus`, `Foodtype_Foodtypeid`, `User_Userid`) VALUES ('401', 'pasta', '212', 'Double...', 'Italian Food', 'PUBLISH', '301', '101');
INSERT INTO `cfandb`.`foodmenu` (`Foodmenuid`, `Foodname`, `Totalkcal`, `Image`, `Description`, `Foodmenustatus`, `Foodtype_Foodtypeid`, `User_Userid`) VALUES ('402', 'pizza', '309', 'Triple...', 'Italian Food', 'PERSONAL', '302', '102');

INSERT INTO `cfandb`.`meal` (`Mealid`, `Mealtime`, `Datemeal`, `Totalkcal`, `User_Userid`) VALUES ('501', 'Lunch', '2021-03-21', '212', '101');
INSERT INTO `cfandb`.`meal` (`Mealid`, `Mealtime`, `Datemeal`, `Totalkcal`, `User_Userid`) VALUES ('502', 'Dinner', '2021-03-22', '309', '102');

INSERT INTO `cfandb`.`foodmenu_has_ingredians` (`Foodmenu_Foodmenuid`, `Ingredians_Ingradiansid`, `Totalunit`, `Totalkcal`) VALUES ('401', '201', '5', '212');
INSERT INTO `cfandb`.`foodmenu_has_ingredians` (`Foodmenu_Foodmenuid`, `Ingredians_Ingradiansid`, `Totalunit`, `Totalkcal`) VALUES ('402', '202', '10', '309');

INSERT INTO `cfandb`.`meal_has_foodmenu` (`Meal_Mealid`, `Foodmenu_Foodmenuid`, `Totaldish`, `Totalkcal`) VALUES ('501', '401', '7', '1500');
INSERT INTO `cfandb`.`meal_has_foodmenu` (`Meal_Mealid`, `Foodmenu_Foodmenuid`, `Totaldish`, `Totalkcal`) VALUES ('502', '402', '14', '4200');

INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('601', 'WAIT', '101');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('602', 'WAIT', '102');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('604', 'WAIT', '101');
INSERT INTO `cfandb`.`request` (`Requestid`, `Status`, `User_Userid`) VALUES ('605', 'WAIT', '102');

INSERT INTO `cfandb`.`ingrediansreq` (`Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`, `Request_Requestid`) VALUES ('Tomato', '212', '1', 'piece', 'Vegetable', '601');
INSERT INTO `cfandb`.`ingrediansreq` (`Ingradianname`, `kcalpunit`, `Unit`, `Descriptionunit`, `Ingrediantype`, `Request_Requestid`) VALUES ('Potato', '309', '1', 'piece', 'Vegetable', '602');

INSERT INTO `cfandb`.`foodtypereq` (`Typename`, `Request_Requestid`) VALUES ('Solid', '604');
INSERT INTO `cfandb`.`foodtypereq` (`Typename`, `Request_Requestid`) VALUES ('Liquid', '605');
