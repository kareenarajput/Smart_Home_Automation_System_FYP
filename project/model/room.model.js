const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const roomSchema = new Schema({
    roomName: {
        type: String,
        required: true,
    },
    roomIcon: {
        type: String,
        required: true,
    },
    devices: {
        type: String,
        required:false,
        default: 0,
    },
    userId: {
        type: String,
        required: true,
    },
});

const RoomModel = db.model('room', roomSchema);

module.exports = RoomModel;