const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.startsWith('Bearer ') ? authHeader.split(' ')[1] : null;

    if (!token) {
        return res.status(403).json({ message: 'No token provided!' });
    }

    jwt.verify(token, 'SZABIST2024', (err, decoded) => {
        if (err !== null) {
            return res.status(401).json({ message: 'Unauthorized!' });
        }
        req.userId = decoded._id; 
        next();
    });
};

module.exports = authMiddleware;
