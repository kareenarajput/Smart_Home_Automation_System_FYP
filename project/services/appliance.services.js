const ApplianceModel = require('../model/appliance.model'); 

class ApplianceService {
    static async createAppliance(roomId, applianceName, status) {
        const newAppliance = new ApplianceModel({ roomId, applianceName, status });
        await newAppliance.save();
        return newAppliance;
    }

    static async getAppliancesByRoomId(roomId) {
        return await ApplianceModel.find({ roomId });
    }

    static async updateApplianceStatus(applianceId, status) {
        return await ApplianceModel.findByIdAndUpdate(applianceId, { status }, { new: true });
    }
}

module.exports = ApplianceService;
