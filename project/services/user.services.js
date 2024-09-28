const UserModel = require('../model/user.model'); 
const jwt = require('jsonwebtoken');

class UserService {
    static async registerUser(firstName, lastName, email, password, phoneNumber, address) {
        const existingUser = await UserModel.findOne({ email });
        if (existingUser) {
            throw new Error('Email already exists.');
        }

        const newUser = new UserModel({
            firstName,
            lastName,
            email,
            password,
            phoneNumber,
            address
        });

        await newUser.save();
        return newUser;
    }

    static async checkUser(email) {
        return await UserModel.findOne({ email });
    }

    static async generateToken(payload, secretKey, expiresIn) {
        return jwt.sign(payload, secretKey, { expiresIn });
    }

    static async updateUserProfile(userId, updateData) {
        const updatedUser = await UserModel.findByIdAndUpdate(userId, updateData, { new: true });
        return updatedUser;
    }

    static async updateUserPassword(userId, oldPassword, newPassword) {
        const user = await UserModel.findById(userId);
        if (!user) {
            throw new Error('User not found.');
        }

        const isMatch = await user.comparePassword(oldPassword);
        if (!isMatch) {
            throw new Error('Old password is incorrect.');
        }

        user.password = newPassword;
        await user.save();
        return user;
    }
}

module.exports = UserService;
