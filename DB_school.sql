Create database School;
Use School;
-- tables
drop database school;
-- teacher
Create table if not exists teacher(
ID int auto_increment primary key not null,
NAME varchar(50) not null,
USERNAME varchar(20) not null,
PASSWORD varchar(10) not null
);

-- module
Create table if not exists module(
ID int auto_increment primary key not null,
NAME varchar(50) not null
);

-- student
Create table student(
ID int AUTO_INCREMENT primary key not null,
NAME varchar(50) not null,
USERNAME varchar(20) not null,
PASSWORD VARCHAR(10) not null
);

-- relacion student_module table Learn
Create table Learn(
ID_Student int,
ID_Module int, 
NOTA DECIMAL(4,2) ,
primary key (ID_Student, ID_Module),
constraint FK_student_module foreign key (ID_Student) REFERENCES student(ID),
constraint FK_module_student foreign key (ID_Module) REFERENCES module(ID)
);


-- history
Create table history(
ID int auto_increment primary key not null,
TYPE varchar(1) not null,
USER int not null,
DETAIL varchar(100) not null,
constraint FK_user_teacher Foreign key (user) references teacher(ID),
constraint FK_user_student Foreign key (user) references student(ID)
);

-- Foreign Keys
-- teacher
Alter table teacher add(
ID_Module int,
constraint FK_teacher_module FOREIGN KEY(ID_Module) references module(ID)
);

-- module
Alter table module add(
ID_Teacher int,
constraint FK_module_teacher Foreign key (ID_Teacher) references teacher(ID)
);