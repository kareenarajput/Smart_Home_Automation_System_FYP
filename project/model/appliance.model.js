const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const applianceSchema = new Schema({
    roomId: {
        type: String,
        required: true,
    },
    applianceName: {
        type: String,
        required: true,
    },
    status: {
        type: Boolean,
        required: true,
    },
});

const ApplianceModel = db.model('appliance', applianceSchema);

module.exports = ApplianceModel;