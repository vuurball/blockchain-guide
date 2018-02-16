```bash
npm init -y
#installing yarn to use instead of npm
npm i -g yarn
#importing express.js
yarn add express
```
update package.json to add a script
```js
 "scripts": {
    "start": "node app.js"
  },
```

*  create app.js file
```bash
#run the app
yarn start
```

* setting up gulp
```bash

npm install gulp --save
(OR)
yarn add gulp

npm i gulp -g
npm i gulp-nodemon --save
touch gulpfile.js
```

modify gulpfile.js content:
```js
var gulp = require('gulp'),
    nodemon = require('gulp-nodemon');

gulp.task('default', function(){
  nodemon({
    script: 'app.js',
    ext: 'js html css',
    ignore: ['./node_modules/**']
  })
  .on('restart', function(){
    console.log("restarting.....");
  });
});

```

and run :
```bash

gulp
```
