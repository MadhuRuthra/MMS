/*
This page is used to connect the database for all api process.

Version : 1.0
Author : Madhubala (YJ0009)
Date : 05-Jul-2023
*/
const env = process.env;

const config = {
  db: { 
     host: env.DB_HOST || 'localhost',
     user: env.DB_USER || 'root',
      password: env.DB_PASSWORD || '',
      database: env.DB_NAME || 'mms',
  },
  listPerPage: env.LIST_PER_PAGE || 10,
};
  
module.exports = config;
