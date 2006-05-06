
INSERT INTO teacher VALUES (1,"Ahmed Eltanahy" ,"123456","Proffessor",null,"Tanta","3290206","prog_eng",DEFAULT);
INSERT INTO teacher VALUES (DEFAULT,"Abbas Adel" ,"123456","Proffessor",null,"Tanta","3290206","prog_eng",DEFAULT);

INSERT INTO course VALUES(1 , "Logic1",100,50);
INSERT INTO course VALUES(2 , "Logic2",100,50);
INSERT INTO course VALUES(3 , "Logic3",100,50);

INSERT INTO teach VALUES(1,1,DEFAULT);
INSERT INTO teach VALUES(2,1,DEFAULT);
INSERT INTO teach VALUES(3,1,DEFAULT);

INSERT INTO teach VALUES(1,2,DEFAULT);
INSERT INTO teach VALUES(2,2,DEFAULT);
INSERT INTO teach VALUES(3,2,DEFAULT);

#student#
INSERT INTO `student` VALUES(1,'Student 1', '123456','biso@hotmail.com','1986-5-8', '3345432', 'Tanta', DEFAULT);
INSERT INTO `student` VALUES(2,'Student 2', '123456','biso@hotmail.com','1986-5-8', '3345432', 'Tanta', DEFAULT);
INSERT INTO `student` VALUES(3,'Student 3', '123456','biso@hotmail.com','1986-5-8', '3345432', 'Tanta', DEFAULT);

#ASSIGN#
INSERT INTO `assign` VALUES(3,1,NULL);
INSERT INTO `assign` VALUES(3,2,NULL);
INSERT INTO `assign` VALUES(3,3,NULL);
INSERT INTO `assign` VALUES(10,3,NULL);
INSERT INTO `assign` VALUES(10,2,NULL);

INSERT INTO `result` VALUES(1,1,"A+",90,DEFAULT);
INSERT INTO `result` VALUES(2,1,"B+",80,DEFAULT);
INSERT INTO `result` VALUES(3,1,"F",40,DEFAULT);

