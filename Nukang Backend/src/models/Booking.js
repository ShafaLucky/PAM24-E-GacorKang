const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/database');
const User = require('./User');

const Booking = sequelize.define('Booking', {
  id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  userId: { type: DataTypes.INTEGER, references: { model: User, key: 'id' } },
  workerId: { type: DataTypes.INTEGER, references: { model: User, key: 'id' } },
  date: { type: DataTypes.DATE, allowNull: false },
  status: { type: DataTypes.ENUM('pending', 'completed', 'cancelled'), defaultValue: 'pending' },
}, {
  timestamps: true,
});

User.hasMany(Booking, { as: 'Bookings', foreignKey: 'userId' });
Booking.belongsTo(User, { as: 'User', foreignKey: 'userId' });

module.exports = Booking;
