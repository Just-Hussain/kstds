# KSTDS
KFUPM Soccer Tournament Database System
## Project setup
From both **client** and **server** folders:
```
npm install
```
Also, it needs a **config.js** file under **clients/src** which holds:
```
export default {
  fb: {
    // firebase project config
  }
}
```
Taken from the Firebase console after creating an account and a project.



### Compiles and hot-reloads for development
From **client** folder for the front-end:
```
npm run serve 
```

From **server** folder for back-end:
```
npm start
```


### Compiles and minifies for production (client)
```
npm run build
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
