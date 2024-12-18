const Booking = require('../models/Booking');

exports.createBooking = async (userId, bookingData) => {
  const booking = new Booking({ ...bookingData, user: userId });
  return await booking.save();
};
