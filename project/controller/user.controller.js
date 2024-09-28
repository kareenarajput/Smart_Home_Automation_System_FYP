const UserService = require('../services/user.services');

exports.register = async (req, res, next) => {
    try {

        const { firstName, lastName, email, password, phoneNumber, address } = req.body;

        const newUser = await UserService.registerUser(firstName, lastName, email, password, phoneNumber, address);
        
        const tokenData = { _id: newUser._id, email: newUser.email };
        const token = await UserService.generateToken(tokenData, 'SZABIST2024', '1h');

        res.status(201).json({ 
            success: true, 
            message: "User registered successfully", 
            token: token,
            user: {
                id: newUser._id,
                firstName: newUser.firstName,
                lastName: newUser.lastName,
                email: newUser.email,
                phoneNumber: newUser.phoneNumber,
                address: newUser.address
            }
        });
    } catch (error) {
        console.error(error);
        res.status(400).json({ success: false, error: error.message });
    }
};

exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        const user = await UserService.checkUser(email);

        if (!user) {
            return res.status(404).json({ success: false, error: 'User does not exist.' });
        }

        const isMatch = await user.comparePassword(password);
        if (!isMatch) {
            return res.status(401).json({ success: false, error: 'Invalid password.' });
        }

        const tokenData = { _id: user._id, email: user.email };
        const token = await UserService.generateToken(tokenData, 'SZABIST2024', '1h');

        res.status(200).json({ 
            success: true, 
            token: token,
            user: {
                id: user._id,
                firstName: user.firstName,
                lastName: user.lastName,
                email: user.email,
                phoneNumber: user.phoneNumber,
                address: user.address
            } 
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ success: false, error: "Login failed." });
    }
};

exports.updateProfile = async (req, res, next) => {
    try {
        const userId = req.user._id;
        const { firstName, lastName, phoneNumber, address } = req.body;

        const updatedUser = await UserService.updateUserProfile(userId, { firstName, lastName, phoneNumber, address });
        res.status(200).json({ success: true, message: "Profile updated successfully", user: updatedUser });
    } catch (error) {
        console.error(error);
        res.status(400).json({ success: false, error: error.message });
    }
};

exports.updatePassword = async (req, res, next) => {
    try {
        const userId = req.user._id;
        const { oldPassword, newPassword } = req.body;

        const updatedUser = await UserService.updateUserPassword(userId, oldPassword, newPassword);
        res.status(200).json({ success: true, message: "Password updated successfully", user: updatedUser });
    } catch (error) {
        console.error(error);
        res.status(400).json({ success: false, error: error.message });
    }
};
