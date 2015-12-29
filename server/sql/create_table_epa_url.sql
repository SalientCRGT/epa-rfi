use 4840w;


DROP TABLE IF EXISTS epa_url;

CREATE TABLE epa_url (
url_id int(11) not null auto_increment,
url_name VARCHAR(255),
url_desc VARCHAR(4000),
url VARCHAR(255),
url_params VARCHAR(255),
url_status varchar(1),
url_default_fl int default 0,
epa_category varchar(255),
epa_sub_category varchar(255),
epa_file_name varchar(255),
primary key (url_id));    

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - National',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NAT','national_combined.zip');
insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - VA','To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',1,'FRS','VA','state_combined_va.zip');


COMMIT;

