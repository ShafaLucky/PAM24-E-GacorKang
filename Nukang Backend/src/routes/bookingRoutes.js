const express = require('express');
const router = express.Router();
const bookingController = require('../controllers/bookingController');
const { authenticate } = require('../middlewares/authMiddleware');

router.post('/', authenticate, bookingController.createBooking);

module.exports = router;
