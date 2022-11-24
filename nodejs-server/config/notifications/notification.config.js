const admin = require("firebase-admin");

//Creating a firebase admin
const serviceAccount = require("./solaro-47272-firebase-adminsdk-ef3y5-bf7d87b5ca.json");

//Initializing firebase admin
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: process.env.DATABASE_URL,
});

module.exports = { admin };
