const express = require("express");
const { io } = require("socket.io-client");

const system = "6384f63bdac1519f127bc2c9";
const item = "6384fea629314b574fc87751";

const socket = io("http://192.168.44.106:3000", { cors: true });
const app = express();

app.listen(8002, err => {
    if (err) console.log(err);
    else console.log("Server is running on PORT 8002");
});

socket.on("connection", message => {
    console.log(message);
    socket.emit("connected", "hello from client");
});

socket.on("toFlutter", data => {
    console.log(data);
});

socket.on("message", message => {
    console.log(message);
    // socket.emit("data", { data: { name: "item", consummption: 5 } });
    let i = 1;
    const myLoop = () => {
        setTimeout(() => {
            socket.emit(`reading ${item}`, {
                item_id: item,
                consumption: 4.6,
            });
            socket.emit(`reading ${system}`, {
                system_id: system,
                charging: 5.1,
                consumption: 7.6,
            });
            i++;
            // if (i < 100) myLoop();
        }, 100);
        setTimeout(() => {
            socket.emit(`reading ${item}`, {
                item_id: item,
                consumption: 4.8,
            });
            socket.emit(`reading ${system}`, {
                system_id: system,
                charging: 4.5,
                consumption: 4.1,
            });
            i++;
        }, 200);
        setTimeout(() => {
            socket.emit(`reading ${item}`, {
                item_id: item,
                consumption: 4.7,
            });
            socket.emit(`reading ${system}`, {
                system_id: system,
                charging: 4.1,
                consumption: 5.8,
            });
            i++;
        }, 300);
        setTimeout(() => {
            socket.emit(`reading ${item}`, {
                item_id: item,
                consumption: 4.9,
            });
            socket.emit(`reading ${system}`, {
                system_id: system,
                charging: 3.2,
                consumption: 5.7,
            });
            i++;
        }, 400);
        setTimeout(() => {
            socket.emit(`reading ${item}`, {
                item_id: item,
                consumption: 4.3,
            });
            socket.emit(`reading ${system}`, {
                system_id: system,
                charging: 4.3,
                consumption: 3.2,
            });
            i++;
        }, 500);
        setTimeout(() => {
            socket.emit(`reading ${item}`, {
                item_id: item,
                consumption: 4.7,
            });
            socket.emit(`reading ${system}`, {
                system_id: system,
                charging: 3.4,
                consumption: 5.3,
            });
            i++;
            if (i < 10000) myLoop();
        }, 600);
    };
    myLoop();
});
