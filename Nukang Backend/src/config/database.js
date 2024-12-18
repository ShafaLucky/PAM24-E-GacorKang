const { Sequelize } = require('sequelize');

const sequelize = new Sequelize("nukang", "root", "", {
  host: "localhost",
  dialect: 'mysql',
});

const connectDB = async () => {
  try {
    await sequelize.authenticate();
    console.log('MySQL connected successfully');
  } catch (error) {
    console.error('MySQL connection failed:', error.message);
    process.exit(1);
  }
};

module.exports = { sequelize, connectDB };
