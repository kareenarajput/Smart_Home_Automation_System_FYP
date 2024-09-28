const app = require('./app');
const db = require('./config/db');
const userModel = require('./model/user.model');

const port = 3000;
const host = '0.0.0.0';  // Bind to all network interfaces

app.get('/', (req, res) => {
    res.send("Hello world! Hiiiiiiiii, OK!");
});

app.listen(port, host, () => {
    console.log(`Server listening on http://${host}:${port}`);
});
