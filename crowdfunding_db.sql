CREATE TABLE Category (
  category_id varchar(200) NOT NULL PRIMARY KEY,
  Category varchar(200) UNIQUE
);

CREATE TABLE Subcategory (
  category_id varchar(200) PRIMARY KEY,
  category varchar(200) UNIQUE
);

CREATE TABLE Contacts (
  contact_id integer PRIMARY KEY,
  first_name varchar(200),
  last_name varchar(200),
  email varchar(200)
);


CREATE TABLE Campaign (
  cf_id int PRIMARY KEY,
  contact_id int REFERENCES Contacts(contact_id),
  company_name varchar(200),
  description varchar(200),
  goal float,
  pledged float,
  outcome varchar(200),
  backers_count int,
  country varchar(200),
  currency varchar(200),
  launched_date date,
  end_date date,
  category_id varchar(200) REFERENCES Category(category_id),
  sub_category_id varchar(200) REFERENCES Subcategory(category_id)
);
	
SELECT * FROM Category;
SELECT * FROM Subcategory;
SELECT * FROM Contacts;
SELECT * FROM Campaign;

COPY Category(category_id, category)
FROM 'D:\Git\GitHub-Desktop\Crowdfunding_ETL\Resources\category.csv'
DELIMITER ','
CSV HEADER;

COPY Subcategory(category_id, category)
FROM 'D:\Git\GitHub-Desktop\Crowdfunding_ETL\Resources\subcategory.csv'
DELIMITER ','
CSV HEADER;

COPY Contacts(contact_id, first_name, last_name, email)
FROM 'D:\Git\GitHub-Desktop\Crowdfunding_ETL\Resources\contacts.csv'
DELIMITER ','
CSV HEADER;

COPY Campaign(cf_id, contact_id, company_name, description, goal, pledged, outcome, backers_count, country, currency, launched_date, end_date, category_id, sub_category_id)
FROM 'D:\Git\GitHub-Desktop\Crowdfunding_ETL\Resources\campaign.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Category;
SELECT * FROM Subcategory;
SELECT * FROM Contacts;
SELECT * FROM Campaign;
