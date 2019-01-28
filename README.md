# Lynda - React.js Essential Training (macOS)
Among all other JavaScript libraries, React.js stands out. It relies on reusable components, not templates, for UI development, allowing developers to render views where data changes over time. React applications are more scalable and more maintainable, making developers more efficient and users more satisfied.

`Eve Porcello`

## 01 What is React.js
### Setting up React Developer Tools

Firefox Extensions

```
react developer tools
```

![React Developer Tools](/images/01-react-developer-tools.png)

## 02 Intro to JSX and Babel
### Pure React

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hello World with React</title>
  <script crossorigin src="https://unpkg.com/react@16/umd/react.development.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
</head>
<body>
  <div id="react-container"></div>
  <script src="index.js"></script>
</body>
</html>
```

index.js
```javascript
const Title = React.createElement(
  'h1',
  {id: 'title', className: 'header'},
  'Hello World'
);

ReactDOM.render(Title, document.getElementById('react-container'));
```

![Pure React](/images/02-01-pure-react.png)

**ES6 Style**

index.js (ES6)
```javascript
const { createElement } = React;
const { render } = ReactDOM;

const Title = createElement(
  'h1',
  {id: 'title', className: 'header'},
  'Hello World'
);

render(Title, document.getElementById('react-container'));
```

### Refactoring elements using JSX

**Style Element**

index.js (ES6)
```javascript
const { createElement } = React;
const { render } = ReactDOM;

const style = {
  backgroundColor: 'orange',
  color: 'white',
  fontFamily: 'verdana'
};

const Title = createElement(
  'h1',
  {id: 'title', className: 'header', style: style},
  'Hello World'
);

render(Title, document.getElementById('react-container'));
```

**JSX Style**

React can either render HTML tags (strings) or React components (classes). To render an HTML tag, just use lower-case tag names in JSX.

index.js (JSX)
```javascript
const {render} = ReactDOM;

render(
  <h1 id='title'
      className='header'
      style={{backgroundColor: 'orange', color: 'white', fontFamily: 'verdana'}}>
    Hello World
  </h1>,
  document.getElementById('react-container')
);
```

![ES6 and JSX](/images/02-02-es6-and-jsx.png)

We will get an error message below on browser's console. Because our browser can't read the HTML tags in javascript.

```
SyntaxError: expected expression, got '<'
```

![JSX Error Message](/images/02-02-jsx-error-message.png)

So we need to **Transform JSX to JS** using **Babel**.

![Transform JSX to JS using Babel](/images/02-02-transform-jsx-to-js-using-babel.png)

### Babel inline transpiling

**babel-core**

A compiler for writing next generation JavaScript
```
https://unpkg.com/@babel/standalone/babel.min.js
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hello World with React</title>
  <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
  <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body>
  <div id="react-container"></div>
  <script type="text/babel" src="index.js"></script>
</body>
</html>
```

![Babel inline transpiling](/images/02-03-babel-inline-transpiling.png)

### Babel static transpiling with babel-cli

**Setting up NodeJS**

![Setting up NodeJS](/images/02-04-setting-up-node-js.png)

install NodeJS
```
brew install node
```

Node JS Version
```
node -v
▶ v11.7.0
```

NPM Version
```
npm -v
▶ 6.7.0
```

**Setting up Babel**

![Setting up Babel](/images/02-04-setting-up-babel.png)

Install Babel CLI
```
sudo npm install babel-cli -g
npm list -g --depth=0
```

.babelrc
```json
{
  "presets": ["latest", "react", "stage-0"]
}
```

Install Babel preset
```
npm install babel-preset-latest babel-preset-react babel-preset-stage-0 --save-dev
npm list --depth=0
```

**Using Babel to compile JSX**

![Using Babel to compile JSX](/images/02-04-using-babel-to-compile-jsx.png)

index.js (JSX)
```javascript
const {render} = ReactDOM;

render(
  <h1 id='title'
      className='header'
      style={{backgroundColor: 'orange', color: 'white', fontFamily: 'verdana'}}>
    Hello World
  </h1>,
  document.getElementById('react-container')
);
```

Compile Directories
```
babel index.js --out-file bundle.js
▶ index.js -> bundle.js
```

bundle.js (ES6)
```javascript
'use strict';

var _ReactDOM = ReactDOM,
    render = _ReactDOM.render;

render(React.createElement(
  'h1',
  { id: 'title',
    className: 'header',
    style: { backgroundColor: 'orange', color: 'white', fontFamily: 'verdana' } },
  'Hello World'
), document.getElementById('react-container'));
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hello World with React</title>
  <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
  <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
</head>
<body>
  <div id="react-container"></div>
  <script type="text/javascript" src="bundle.js"></script>
</body>
</html>
```

### Building with webpack

Directory and file before organization.
```
react-js-essential-training
├── index.html
└── index.js
```

Create new directories, move `index.html`, `index.js` and create `package.json`, `webpack.config.js`.
```
react-js-essential-training
├── dist                (Create new directory)
│   ├── assets            (Create new directory)
│   └── index.html        (Move)
├── src                 (Create new directory)
│   └── index.js          (Move)
├── package.json        (Create new file)
└── webpack.config.js   (Create new file)
```

**Install Packages**

package.json
```json
{
  "name": "react-js-essential-training",
  "version": "1.0.0",
  "main": "index.js",
  "devDependencies": {
    "babel-cli": "^6.26.0",
    "babel-loader": "^7.1.5",
    "babel-preset-latest": "^6.24.1",
    "babel-preset-react": "^6.24.1",
    "babel-preset-stage-0": "^6.24.1",
    "webpack": "^4.29.0",
    "webpack-cli": "^3.2.1",
    "webpack-dev-server": "^3.1.14"
  },
  "dependencies": {
    "react": "^15.3.2",
    "react-dom": "^15.3.2"
  }
}
```

Install Packages using NPM.
```
npm install
```

Display installed packages.
```
npm list --depth=0
▶ react-essential@1.0.0
  ├── babel-cli@6.26.0
  ├── babel-loader@7.1.5
  ├── babel-preset-latest@6.24.1
  ├── babel-preset-react@6.24.1
  ├── babel-preset-stage-0@6.24.1
  ├── react@15.6.2
  ├── react-dom@15.6.2
  ├── webpack@4.29.0
  ├── webpack-cli@3.2.1
  └── webpack-dev-server@3.1.14
```

Directory and file after install packages.
```
react-js-essential-training
├── dist
│   ├── assets
│   └── index.html
├── node_modules        (Added by NPM)
├── src
│   └── index.js
├── package.json
└── webpack.config.js
```

`Optional` Display tree directory on Mac.
```
cd ~projects/react-js-essential-training
tree
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   └── index.html
  ├── node_modules
  ├── src
  │   └── index.js
  ├── package.json
  └── webpack.config.js
```

`Optional` Install tree on Mac using Brew.
```
brew install tree
```

`Optional` Display tree directory with maximum depth.
```
tree -L 1
▶ react-js-essential-training
  ├── dist
  ├── node_modules
  ├── src
  ├── package.json
  └── webpack.config.js
```

**Setup Webpack**

![Setup Webpack](/images/02-05-setup-webpack.png)

webpack.config.js
```javascript
var path = require("path");

module.exports = {
  mode: "development",
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, "dist/assets"),
    publicPath: "/assets/",
    filename: "bundle.js"
  },
  devServer: {
    inline: true,
    contentBase: "./dist",
    port: 3000
  },
  module: {
    rules: [{
      test: /\.js$/,
      exclude: /(node_modules)/,
      loader: "babel-loader",
      options: {
        presets: ["latest", "react", "stage-0"]
      }
    }]
  }
};
```

Run Webpack
```
./node_modules/.bin/webpack
▶ Hash: 46499d9a5f69a24f52cf
  Version: webpack 4.29.0
  Time: 357ms
  Built at: 01/01/2019 12:00:00 PM
      Asset     Size  Chunks             Chunk Names
  bundle.js  4.1 KiB    main  [emitted]  main
  Entrypoint main = bundle.js
  [./src/index.js] 298 bytes {main} [built]
```

`Optional` In case webpack be installed as global.
```
webpack
▶ Hash: 46499d9a5f69a24f52cf
  Version: webpack 4.29.0
  Time: 387ms
  Built at: 01/01/2019 12:00:00 PM
      Asset     Size  Chunks             Chunk Names
  bundle.js  4.1 KiB    main  [emitted]  main
  Entrypoint main = bundle.js
  [./src/index.js] 298 bytes {main} [built]
```

`Optional` Install webpack as global.
```
sudo npm install webpack webpack-cli -g
```

`Optional` Display global packages.
```
npm list -g --depth=0
▶ /usr/local/lib
  ├── npm@6.7.0
  ├── webpack@4.29.0
  └── webpack-cli@3.2.1
```

`Optional` Uninstall global webpack.
```
sudo npm uninstall webpack webpack-cli -g
```

Directory and file run `webpack`
```
react-js-essential-training
├── dist
│   ├── assets
│   │   └── bundle.js   (Generated by Webpack)
│   └── index.html
├── node_modules
├── src
│   └── index.js
├── package.json
└── webpack.config.js
```

Add custom script to `package.json`
```json
"scripts": {
  "start": "./node_modules/.bin/webpack-dev-server"
}
```

package.json
```json
{
  "name": "react-js-essential-training",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "start": "./node_modules/.bin/webpack-dev-server"
  },
  "devDependencies": {
    "babel-cli": "^6.26.0",
    "babel-loader": "^7.1.5",
    "babel-preset-latest": "^6.24.1",
    "babel-preset-react": "^6.24.1",
    "babel-preset-stage-0": "^6.24.1",
    "webpack": "^4.29.0",
    "webpack-cli": "^3.2.1",
    "webpack-dev-server": "^3.1.14"
  },
  "dependencies": {
    "react": "^15.3.2",
    "react-dom": "^15.3.2"
  }
}
```

Run Webpack Server.

![Webpack Server](/images/02-05-webpack-server.png)

```
npm start
```

![Run Webpack Server](/images/02-05-run-webpack-server.png)

Display application on web browser using the url below.
```
http://localhost:3000/
```

![Display application on web browser](/images/02-05-display-on-web-browser.png)

Stop Server.
```
Ctrl + C
```

`Optional` Hard Stop Server.
```
killall -9 node
```
