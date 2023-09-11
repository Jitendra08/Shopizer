
--Mechant [MERCHANT ID 1]


INSERT INTO MERCHANT_USER_INFORMATION (MERCHANT_USER_ID, ADMIN_NAME, ADMIN_EMAIL, ADMIN_PASS,
 TOKEN, USERFNAME, USERLNAME, USERADDRESS, USERCITY, USERPOSTALCODE,
  USERSTATE, USERCOUNTRYCODE, USERPHONE, USERLANG, STATUS, LAST_MODIFIED,
   MERCHANTID) VALUES
(1, 'admin', 'merchant@acme.com', 'dac2822a01faa094ae7a8741469a7b02', '', 'First Name', 'Last Name', '123 Street Address', 'Quebec', 'H0H0H0', 0, 38, '444-555-6666', 'en', 0, '2010-01-01 00:00:00', 1);


insert into MERCHANT_REGISTRATION (
  MERCHANTID,
  MERCHANT_REGISTRATION_DEF_CODE,
  LAST_MODIFIED,
  DATE_ADDED
) values (
1,
2,
'2010-01-01 00:00:00',
'2010-01-01 00:00:00'
);

insert into MERCHANT_USER_ROLE (
  MERCHANT_USER_ROLE_ID,
  ADMIN_NAME,
  ROLE_CODE
) values (
1,
'admin',
'superuser'
);

insert into MERCHANT_USER_ROLE (
  MERCHANT_USER_ROLE_ID,
  ADMIN_NAME,
  ROLE_CODE
) values (
2,
'admin',
'admin'
);


