
INSERT INTO teacher VALUES (DEFAULT,"Ahmed Eltanahy" ,"123456","Proffessor",null,  "Tanta","3290206","prog_eng",DEFAULT,'2006-5-6');
INSERT INTO teacher VALUES (DEFAULT,"Abbas Adel" ,"123456","Proffessor",null,"Tanta","3290206","prog_eng",DEFAULT,'2006-5-6');

INSERT INTO course VALUES(1 , "Logic1",100,50);
INSERT INTO course VALUES(2 , "Logic2",100,50);
INSERT INTO course VALUES(3 , "Logic3",100,50);

INSERT INTO teach VALUES(1,1,DEFAULT);
INSERT INTO teach VALUES(2,1,DEFAULT);
INSERT INTO teach VALUES(3,1,DEFAULT);

INSERT INTO teach VALUES(1,2,DEFAULT);
INSERT INTO teach VALUES(2,2,DEFAULT);
INSERT INTO teach VALUES(3,2,DEFAULT);

#group#
INSERT INTO `group` VALUES(1,1,'G1',DEFAULT);
INSERT INTO `group` VALUES(2,1,'G2',DEFAULT);
INSERT INTO `group` VALUES(3,2,'G3',DEFAULT);

#student#
INSERT INTO `student` VALUES(1,'Student 1', '123456','biso@hotmail.com','1986-5-8', '3345432', 'Tanta', DEFAULT, '2006-5-6');
INSERT INTO `student` VALUES(2,'Student 2', '123456','biso@hotmail.com','1986-5-8', '3345432', 'Tanta', DEFAULT, '2006-5-6');
INSERT INTO `student` VALUES(3,'Student 3', '123456','biso@hotmail.com','1986-5-8', '3345432', 'Tanta', DEFAULT, '2006-5-6');

#ASSIGN#
INSERT INTO `assign` VALUES(1,1,NULL);
INSERT INTO `assign` VALUES(1,2,NULL);
INSERT INTO `assign` VALUES(2,3,NULL);
INSERT INTO `assign` VALUES(3,3,NULL);
INSERT INTO `assign` VALUES(3,2,NULL);

#exams#
insert into exam values(1,1,1,"Midterm",default,default,default);
insert into exam values(2,1,1,"Final Exam",default,default,default);
insert into exam values(3,2,2,"Midterm",default,default,default);
insert into exam values(4,2,2,"Final term",default,default,default);

#questions#
insert into question values(1,1,1,1,"which gate can do this [AB]",default);
insert into question values(2,1,3,1,"which gate can do this 
[A||B]",default);

insert into question values(3,2,2,2,"compute this [46%2] ",default);
insert into question values(4,3,3,1,"who produce the art of NAHOWW",default);


#option#
insert into `option` values(1,1,"A");
insert into `option` values(2,2,"A");
insert into `option` values(1,3,"A");
insert into `option` values(3,4,"A");

#takeexam#

INSERT INTO takeexam VALUES(1,1);
INSERT INTO takeexam VALUES(1,2);
INSERT INTO takeexam VALUES(2,2);

#result#
INSERT INTO `result` VALUES(1,1,"A+",90,DEFAULT);
INSERT INTO `result` VALUES(2,1,"B+",80,DEFAULT);
INSERT INTO `result` VALUES(3,1,"F",40,DEFAULT);

