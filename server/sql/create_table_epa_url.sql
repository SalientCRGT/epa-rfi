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
('EPA State Combined CSV Download Files - Alabama',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','AL','state_combined_al.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Alaska',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','AK','state_combined_ak.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Arizona',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','AZ','state_combined_az.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Arkansas',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','AR','state_combined_ar.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - California',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','CA','state_combined_ca.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Colorado',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','CO','state_combined_co.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Connecticut',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','CT','state_combined_ct.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Delaware',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','DE','state_combined_de.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Florida',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','FL','state_combined_fl.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Georgia',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','GA','state_combined_ga.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Hawaii',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','HI','state_combined_hi.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Idaho',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','ID','state_combined_id.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Illinois',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','IL','state_combined_il.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Indiana',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','IN','state_combined_in.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Iowa',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','IA','state_combined_ia.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Kansas',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','KS','state_combined_ks.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Kentucky',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','KY','state_combined_ky.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Louisiana',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','LA','state_combined_la.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Maine',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','ME','state_combined_me.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Maryland',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MD','state_combined_md.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Massachusetts',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MA','state_combined_ma.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Michigan',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MI','state_combined_mi.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Minnesota',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MN','state_combined_mn.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Mississippi',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MS','state_combined_ms.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Missouri',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MO','state_combined_mo.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Montana',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MT','state_combined_mt.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Nebraska',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NE','state_combined_ne.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Nevada',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NV','state_combined_nv.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - New Hampshire',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NH','state_combined_nh.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - New Jersey',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NJ','state_combined_nj.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - New Mexico',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NM','state_combined_nm.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - New York',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NY','state_combined_ny.zip');
 
insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - North Carolina',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','NC','state_combined_nc.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - North Dakota',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','ND','state_combined_nd.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Ohio',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','OH','state_combined_oh.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Oklahoma',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','OK','state_combined_ok.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Oregon',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','OR','state_combined_or.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Pennsylvania',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','PA','state_combined_pa.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Rhode Island',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','RI','state_combined_ri.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - South Carolina',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','SC','state_combined_sc.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - South Dakota',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','SD','state_combined_sd.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Tennessee',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','TN','state_combined_tn.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Texas',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','TX','state_combined_tx.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Utah',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','UT','state_combined_ut.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Vermont',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','VT','state_combined_vt.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Virginia','To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',1,'FRS','VA','state_combined_va.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Washington',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','WA','state_combined_wa.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - West Virginia',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','WV','state_combined_wv.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Wisconsin',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','WI','state_combined_wi.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Wyoming',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','WY','state_combined_wy.zip');
 
insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Guam',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','GU','state_combined_gu.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Puerto Rico',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','PR','state_combined_pr.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Virgin Islands',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','VI','state_combined_vi.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - American Samoa',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','AS','state_combined_as.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Northern Marianna Islands',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','MP','state_combined_mp.zip');

insert into epa_url
(url_name, url_desc, url, url_status, url_default_fl, epa_category, epa_sub_category, epa_file_name)
values
('EPA State Combined CSV Download Files - Trust Territories',
'To improve public health and the environment, the EPA collects information about facilities or sites subject to environmental regulation. This page provides state comma separated value (CSV) files containing key information of all facilities and sites within the Facility Registry System (FRS). Each state zip file archive combines multiple CSV files of facility name and addresses, geospatial locations, facility interests, organizations, industrial classifications (SIC and NAICS), alternative facility names, contacts, and facility mailing addresses. Complete documentation of the CSV file is included within the zip archive.',
 'http://www3.epa.gov/enviro/html/fii/downloads/state_files/','A',0,'FRS','TT','state_combined_tt.zip');

COMMIT;

