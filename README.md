# MERN-AUTH-DOCKER
created by: Patrick Stambaugh
Dockerized version of MERN-based authentication application.
This is one of my first projects so please be kind.
This isn't of much use other than that of practice for myself. 
Either way, I am open to positive or constructive criticism, please no trolls.

# Credits:
MERN Authentication app source code is courtesy of: Rishi Prasad (https://blog.bitsrc.io/@rishipr)
You can check out his original project with installation instructions at: https://blog.bitsrc.io/build-a-login-auth-app-with-mern-stack-part-1-c405048e3669 .
You can also directly view or download his code at: https://github.com/rishipr/mern-auth . 

## License

Created by Patrick Stambaugh. 
https://github.com/pstambaugh14/MERN-AUTH-DOCKER


## Configuration

Make sure to add your own `MONGOURI` from your [mLab](http://mlab.com) database in `config/keys.js`.

```javascript
module.exports = {
  mongoURI: "YOUR_MONGO_URI_HERE",
  secretOrKey: "secret"
};
```
## Starting MERN-AUTH-DOCKER using Docker Compose:
Start up your docker container with: "docker-compose up" in the directory where you cloned this.  And that should be it - enjoy!


## Quick Start Reference - Docker Container will run the following on build and execution automatically:

```javascript
// Install dependencies for server & client
npm install && npm run client-install

// Run client & server with concurrently
npm run dev

// Server runs on http://localhost:5000 and client on http://localhost:3000
```

For deploying to Heroku, please refer to [this](https://www.youtube.com/watch?v=71wSzpLyW9k) helpful video by TraversyMedia.
