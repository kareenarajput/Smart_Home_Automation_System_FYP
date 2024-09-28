const RoomModel = require('../model/room.model');

class RoomService {
    static async createRoom(userId, roomName, roomIcon) {
        const newRoom = new RoomModel({ userId, roomName, roomIcon });
        await newRoom.save();
        return newRoom;
    }

    static async getRoomsByUserId(userId) {
        return await RoomModel.find({ userId });
    }
}

module.exports = RoomService;
