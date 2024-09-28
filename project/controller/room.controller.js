const RoomService = require('../services/room.services');

exports.addRoom = async (req, res, next) => {
    try {
        const { userId, roomName, roomIcon } = { userId: req.userId, ...req.body };
        const room = await RoomService.createRoom(userId, roomName, roomIcon);
        res.status(201).json({ success: true, room });
    } catch (error) {
        console.error(error);
        res.status(500).json({ success: false, error: "Failed to add room." });
    }
}

exports.getRoomsByUser = async (req, res, next) => {
    try {
        console.log(req.userId);
        const userId = req.userId;
        const rooms = await RoomService.getRoomsByUserId(userId);
        res.status(200).json({ success: true, rooms });
    } catch (error) {
        console.error(error);
        res.status(500).json({ success: false, error: "Failed to retrieve rooms." });
    }
}
