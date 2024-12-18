const app = require('./app');
const { connectDB, sequelize } = require('./config/database');
require('dotenv').config();

const PORT = process.env.PORT || 8080;

connectDB();

(async () => {
  try {
    await sequelize.sync({ force: false }); // `force: true` untuk reset database
    console.log('All models were synchronized successfully.');
    app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
  } catch (error) {
    console.error('Unable to synchronize models:', error.message);
  }
})();
