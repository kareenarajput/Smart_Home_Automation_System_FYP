const ApplianceService = require('../services/appliance.services');

exports.addAppliance = async (req, res, next) => {
    try {
        const { roomId, applianceName, status } = req.body;
        const appliance = await ApplianceService.createAppliance(roomId, applianceName, status);
        res.status(201).json({ status: true, appliance });
    } catch (error) {
        console.error(error);
        res.status(500).json({ status: false, error: "Failed to add appliance." });
    }
}

exports.getAppliancesByRoom = async (req, res, next) => {
    try {
        const { roomId } = req.params;
        const appliances = await ApplianceService.getAppliancesByRoomId(roomId);
        res.status(200).json({ status: true, appliances });
    } catch (error) {
        console.error(error);
        res.status(500).json({ status: false, error: "Failed to retrieve appliances." });
    }
}

exports.updateApplianceStatus = async (req, res, next) => {
    try {
        const { applianceId, status } = req.body;
        const updatedAppliance = await ApplianceService.updateApplianceStatus(applianceId, status);
        res.status(200).json({ status: true, updatedAppliance });
    } catch (error) {
        console.error(error);
        res.status(500).json({ status: false, error: "Failed to update appliance status." });
    }
}
