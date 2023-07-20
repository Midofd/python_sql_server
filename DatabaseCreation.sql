create table repository(
id int primary key,
[date] date,
[name] varchar(max))

create table contributor(
id int primary key,
username varchar(max))

create table licence(
id int primary key,
[name] varchar(max))

create table [owner](
id int primary key,
[type] varchar(max))

create table technology(
id int primary key,
[name] varchar(max))

create table topics(
id int primary key,
[name] varchar(max))

create table affected_topic(
id_repository int,
id_topic int,
CONSTRAINT PK_One PRIMARY KEY (id_topic, id_repository),
foreign key(id_topic) references topics(id),
foreign key(id_repository) references repository(id))

create table [commit](
id_repository int,
id_contributor int,
[count] int,
PRIMARY KEY CLUSTERED (id_repository, id_contributor),
foreign key(id_repository) references repository(id),
foreign key(id_contributor) references contributor(id))

create table repository_details(
id_repository int primary key foreign key references repository(id),
id_technology int foreign key references technology(id),
[description] text,
stars int,
forks int,
id_owner int foreign key references [owner](id),
id_licence int foreign key references licence(id),
interset_index float)


--Creation des index

CREATE INDEX index_id_technology ON technology (ID);

CREATE INDEX index_id_owner ON [owner] (ID);

CREATE INDEX index_id_licence ON licence (ID);

CREATE INDEX index_id_contributor ON [contributor] (ID);

CREATE INDEX index_id_commit ON [commit] (ID_repository,ID_contributor);

CREATE INDEX index_id_repository ON repository (ID);

CREATE INDEX index_id_affected_topic ON [affected_topic] (ID_repository);
--
CREATE INDEX index_id_topics ON topics (ID);

CREATE INDEX index_id_repo_details ON repository_details (ID_repository);