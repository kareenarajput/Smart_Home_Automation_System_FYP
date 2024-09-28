const router = require('express').Router();
const UserController = require("../controller/user.controller");
const RoomController = require("../controller/room.controller");
const AppliancesController = require("../controller/appliance.controller");
const authMiddleware = require('../middleware/auth.middleware'); // Import your middleware

router.post('/registration', UserController.register);
router.post('/login', UserController.login);

router.use(authMiddleware);

router.post('/add-room', RoomController.addRoom);
router.get('/get-room', RoomController.getRoomsByUser);

router.post('/add-appliances', AppliancesController.addAppliance);
router.get('/get-appliances/:roomId', AppliancesController.getAppliancesByRoom);

module.exports = router;
