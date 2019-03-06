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

### Loading JSON with webpack

Install React.
```
npm install --save react react-dom
npm list --depth=0
```

Remove React script tags from `dist/index.html`
```html
  <script src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
  <script src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
```

and add React to `src/index.js` as import instead.
```javascript
import React from 'react';
import { render } from 'react-dom';
```

dist/index.html
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hello World with React</title>
</head>
<body>
  <div id="react-container"></div>
  <script type="text/javascript" src="assets/bundle.js"></script>
</body>
</html>
```

src/index.js
```javascript
import React from 'react';
import { render } from 'react-dom';
import { hello, goodbye } from './lib';

render(
  <div>
    {hello}
    {goodbye}
  </div>,
  document.getElementById('react-container')
);
```

src/lib.js
```javascript
import React from 'react';
import text from './titles.json';

export const hello = (
  <h1 id='title'
      className='header'
      style={{backgroundColor: 'purple', color: 'yellow'}}>
    {text.hello}
  </h1>
);

export const goodbye = (
  <h1 id='title'
      className='header'
      style={{backgroundColor: 'yellow', color: 'purple'}}>
    {text.goodbye}
  </h1>
);
```

src/title.json
```json
{
  "hello": "Bonjour!",
  "goodbye": "Au Revoir"
}
```

![Loading JSON with webpack](/images/02-06-loading-json-with-webpack.png)

`Optional` If you get an error message like below.
```
ERROR in ./src/titles.json
Module parse failed: Unexpected token m in JSON at position 0 while parsing near ...
```

![json-loader error message](/images/02-06-json-loader-error-message.png)

`Optional` Because webpack will automatically load JSON files with the built-in `json-loader`

[![json-loader is not required anymore](/images/02-06-json-loader-is-not-required-anymore.png)](https://webpack.js.org/migrate/3/#json-loader-is-not-required-anymore)

### Adding CSS to webpack build

Install CSS & SCSS Loaders.
```
npm install --save-dev style-loader css-loader postcss-loader autoprefixer cssnano node-sass sass-loader
npm list --depth=0
```

Add CSS & SCSS rules to `webpack.config.js`
```
    {
      test: /\.css$/,
      use: ['style-loader', 'css-loader', 'postcss-loader']
    },{
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
    }
```

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
    },{
      test: /\.css$/,
      use: ['style-loader', 'css-loader', 'postcss-loader']
    },{
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
    }]
  }
};
```

`cssnano` and `autoprefixer` become part of `postcss`.

|     Name     |   Type   |                 Property                |
|:------------:|:--------:|:---------------------------------------:|
| [autoprefixer](https://github.com/postcss/autoprefixer#autoprefixer-) | [Fallback](https://www.postcss.parts/tag/fallbacks) | CSS Autoprefixer - To add CSS prefixes. |
| [cssnano](http://cssnano.co) | [Pack](https://www.postcss.parts/tag/pack) | CSS Minify - To compress CSS. |

Create new directories and new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── webpack.config.js
  ├── postcss.config.js     (Create new file)
  └── src
      ├── titles.json       (Create new file)
      ├── lib.js            (Create new file)
      ├── index.js
      └── stylesheets       (Create new directory)
          ├── goodbye.scss    (Create new file)
          └── hello.css       (Create new file)
```

postcss.config.js
```javascript
module.exports = {
  plugins: {
    'autoprefixer': {},
    'cssnano': {}
  }
};
```

src/titles.json
```json
{
  "hello": "Bonjour!",
  "goodbye": "Au Revoir"
}
```

src/lib.js
```javascript
import React from 'react';
import text from './titles.json';
import './stylesheets/goodbye.scss'
import './stylesheets/hello.css'

export const hello = (
  <h1 id='title'
      className='hello'>
    {text.hello}
  </h1>
);

export const goodbye = (
  <h1 id='title'
      className='goodbye'>
    {text.goodbye}
  </h1>
);
```

src/index.js
```javascript
import React from 'react';
import { render } from 'react-dom';
import { hello, goodbye } from './lib';

render(
  <div>
    {hello}
    {goodbye}
  </div>,
  document.getElementById('react-container')
);
```

stylesheets/goodbye.scss
```scss
$bg-color: turquoise;
$text-color: indigo;

.goodbye {
  background-color: $bg-color;
  color: $text-color;
}
```

stylesheets/hello.css
```css
.hello {
  background-color: indigo;
  color: turquoise;
}
```

![Adding CSS to webpack build](/images/02-07-adding-css-to-webpack-build.png)

## 03 React Components
### Creating components with createClass()

Create a new directory and new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── src
  │   ├── index.js
  │   ├── stylesheets
  │   │   ├── globals.scss      (Create new file)
  │   │   ├── index.scss        (Create new file)
  │   │   └── ui.scss           (Create new file)
  │   └── components          (Create new directory)
  │       └── SkiDayCount.js    (Create new file)
  ├── postcss.config.js
  └── webpack.config.js
```

Please find [`globals.scss`](../a0d8314c6b005c82e59882a13af513515b21e7c4/src/stylesheets/globals.scss), [`index.scss`](../a0d8314c6b005c82e59882a13af513515b21e7c4/src/stylesheets/index.scss) and [`ui.scss`](../a0d8314c6b005c82e59882a13af513515b21e7c4/src/stylesheets/ui.scss)

src/components/SkiDayCount.js
```javascript
import React from 'react'
import '../stylesheets/ui.scss'

export const SkiDayCount = React.createClass({
  render() {
    return (
      <div className="ski-day-count">
        <div className="total-days">
          <span>5 days</span>
        </div>
        <div className="powder-days">
          <span>2 days</span>
        </div>
        <div className="backcountry-days">
          <span>1 hiking day</span>
        </div>
      </div>
    )
  }
});
```

src/index.js
```javascript
import React from 'react'
import { render } from 'react-dom'
import { SkiDayCount } from './components/SkiDayCount'

window.React = React;

render(
  <SkiDayCount />,
  document.getElementById('react-container')
);
```

![Creating components with createClass()](/images/03-02-creating-components-with-create-class.png)

**Webpack Server Https** `Optional`

![Webpack Server Https](/images/03-02-webpack-server-https.png)

Add devServer https configuration inside `webpack.config.js`
```
    https: true,
    headers: {
      'Access-Control-Allow-Origin': '*'
    }
```

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
    port: 3000,
    https: true,
    headers: {
      'Access-Control-Allow-Origin': '*'
    }
  },
  module: {
    rules: [{
      test: /\.js$/,
      exclude: /(node_modules)/,
      loader: "babel-loader",
      options: {
        presets: ["latest", "react", "stage-0"]
      }
    },{
      test: /\.css$/,
      use: ['style-loader', 'css-loader', 'postcss-loader']
    },{
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
    }]
  }
};
```

Display application on web browser using the url below.
```
https://localhost:3000/
```

![Display application on web browser](/images/03-02-display-on-web-browser.png)

More about [`devServer.https`](https://webpack.js.org/configuration/dev-server/#devserver-https).

**Coffeescript** `Optional`

Use `.coffee` instead of `.js`

![Coffeescript](/images/03-02-coffeescript.png)

Install Coffee Script Loader.
```
npm install --save-dev coffee-loader coffeescript react-dom-factories
npm list --depth=0
```

Change `index.js` to `index.coffee` inside `webpack.config.js`
```
  entry: "./src/index.coffee",
```

Remove `js` configuration inside `webpack.config.js`
```
    {
      test: /\.js$/,
      exclude: /(node_modules)/,
      loader: "babel-loader",
      options: {
        presets: ["latest", "react", "stage-0"]
      }
    }
```

Set `babel presets` inside `transpile presets` instead. please see `coffee` configuration below.

| Name | Description |
|:----:|:-----------:|
|[**`transpile`**](https://github.com/webpack-contrib/coffee-loader#transpile)|Provide Babel presets and plugins|

More about [coffee-loader options](https://github.com/webpack-contrib/coffee-loader#options).

Add `coffee` configuration inside `webpack.config.js`
```
    {
      test: /\.coffee$/,
      use: [
        {
          loader: 'coffee-loader',
          options: {
            transpile: {
              presets: ["latest", "react", "stage-0"]
            }
          }
        }
      ]
    }
```

webpack.config.js
```javascript
var path = require("path");

module.exports = {
  mode: "development",
  entry: "./src/index.coffee",
  output: {
    path: path.resolve(__dirname, "dist/assets"),
    publicPath: "/assets/",
    filename: "bundle.js"
  },
  devServer: {
    inline: true,
    contentBase: "./dist",
    port: 3000,
    https: true,
    headers: {
      'Access-Control-Allow-Origin': '*'
    }
  },
  module: {
    rules: [{
      test: /\.coffee$/,
      use: [
        {
          loader: 'coffee-loader',
          options: {
            transpile: {
              presets: ["latest", "react", "stage-0"]
            }
          }
        }
      ]
    },{
      test: /\.css$/,
      use: ['style-loader', 'css-loader', 'postcss-loader']
    },{
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
    }]
  }
};
```

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── src
  │   ├── index.coffee            (Create new file)
  │   ├── stylesheets
  │   │   ├── globals.scss
  │   │   ├── index.scss
  │   │   └── ui.scss
  │   └── components
  │       └── SkiDayCount.coffee    (Create new file)
  ├── postcss.config.js
  └── webpack.config.js
```

src/index.coffee
```coffeescript
import React from 'react'
import { render } from 'react-dom'
import { SkiDayCount } from './components/SkiDayCount.coffee'

render <SkiDayCount />, document.getElementById('react-container')
```

Install [ReactDOMFactories](https://www.npmjs.com/package/react-dom-factories).
```
npm install --save-dev react-dom-factories
npm list --depth=0
```

src/components/SkiDayCount.coffee
```coffeescript
import {div, span} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import '../stylesheets/ui.scss'

export SkiDayCount = CreateReactClass
  displayName: 'SkiDayCount'
  render: ->
    div {className: 'ski-day-count'},
      div {className: 'total-days'},
        span null, '5 days'
      div {className: 'powder-days'},
        span null, '2 days'
      div {className: 'backcountry-days'},
        span null, '1 hiking day'
```

Restart `npm` and display application on web browser.

![Restart and display application on web browser](/images/03-02-restart-and-display-on-web-browser.png)

### Adding component properties

Add properties to `src/index.coffee`
```
total=50 powder=20 backcountry=10 goal=100
```

src/index.coffee (Using `JSX`)
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount.coffee'

render <SkiDayCount total={50} powder={20} backcountry={10} goal={100} />,
  document.getElementById('react-container')
```

src/index.coffee (Using `React.createElement()` instead of `JSX`)
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount.coffee'

SkiDayCountProps = { total: 50, powder: 20, backcountry: 10, goal: 100 }

render React.createElement(SkiDayCount, SkiDayCountProps),
  document.getElementById('react-container')
```

More about [`JSX In Depth`](https://reactjs.org/docs/jsx-in-depth.html).

src/components/SkiDayCount.coffee
```coffeescript
import {div, span} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import '../stylesheets/ui.scss'

export SkiDayCount = CreateReactClass
  displayName: 'SkiDayCount'
  render: ->
    div {className: 'ski-day-count'},
      div {className: 'total-days'},
        span null, this.props.total
        span null, 'days'
      div {className: 'powder-days'},
        span null, this.props.powder
        span null, 'days'
      div {className: 'backcountry-days'},
        span null, this.props.backcountry
        span null, 'days'
      div null,
        span null, this.props.goal
```

![Adding component properties](/images/03-03-adding-component-properties.png)

### Adding component methods

src/components/SkiDayCount.coffee
```coffeescript
import {div, span} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import '../stylesheets/ui.scss'

export SkiDayCount = CreateReactClass

  displayName: 'SkiDayCount'

  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total/goal)

  render: ->
    div {className: 'ski-day-count'},
      div {className: 'total-days'},
        span null, this.props.total
        span null, 'days'
      div {className: 'powder-days'},
        span null, this.props.powder
        span null, 'days'
      div {className: 'backcountry-days'},
        span null, this.props.backcountry
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)
```

![Adding component methods](/images/03-04-adding-component-methods.png)

### Creating components with ES6 class syntax

src/components/SkiDayCount.coffee
```coffeescript
import {Component} from 'react'
import {div, span} from 'react-dom-factories'
import '../stylesheets/ui.scss'

export class SkiDayCount extends Component
  
  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total / goal)

  render: ->
    div { className: 'ski-day-count' },
      div { className: 'total-days' },
        span null, this.props.total
        span null, 'days'
      div { className: 'powder-days' },
        span null, this.props.powder
        span null, 'days'
      div { className: 'backcountry-days' },
        span null, this.props.backcountry
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)
```

![Creating components with ES6 class syntax](/images/03-05-creating-components-with-es6-class-syntax.png)

### Creating stateless functional components

src/components/SkiDayCount.coffee
```coffeescript
import {div, span} from 'react-dom-factories'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({total, powder, backcountry, goal}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)
```

![Creating stateless functional components](/images/03-06-creating-stateless-functional-components.png)

### Adding react-icons

![React Icons](/images/03-07-react-icons.png)

Install React Icons.
```
npm install react-icons --save
npm list --depth=0
```

Import React Icons as `icon name` from `react-icons directory` inside `SkiDayCount.coffee`
```coffeescript
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
```

Use `icon name` as `tag element` inside `SkiDayCount.coffee`
```coffeescript
      FaRegCalendarAlt null
      TiWeatherSnow null
      MdTerrain null
```

src/components/SkiDayCount.coffee
```coffeescript
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({total, powder, backcountry, goal}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      FaRegCalendarAlt null
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      TiWeatherSnow null
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      MdTerrain null
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)
```

![Adding react-icons](/images/03-07-adding-react-icons.png)

Find more `icon name` and `react-icons directory`.

| icon directory | description |
|:--------------:|:-----------:|
| [`Font Awesome`](http://react-icons.github.io/react-icons/fa.html) | The web's most popular icon set. |
| [`Material`](http://react-icons.github.io/react-icons/md.html) | Material Design icons by Google. |
| [`Typicons`](http://react-icons.github.io/react-icons/ti.html) | A Free Icon Font by Stephen Hutchings kit. |
| [`Github Octicons`](http://react-icons.github.io/react-icons/go.html) | Octicons are a scalable set of icons handcrafted with <3 by GitHub. |
| [`Ionicons `](http://react-icons.github.io/react-icons/io.html) | The premium icon font for Ionic Framework. |

## 04 Props and State
### Composing components & Displaying child components

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── src
  │   ├── index.coffee
  │   ├── stylesheets
  │   │   ├── globals.scss
  │   │   ├── index.scss
  │   │   └── ui.scss
  │   └── components
  │       ├── SkiDayCount.coffee
  │       ├── SkiDayList.coffee   (Create new file)
  │       └── SkiDayRow.coffee    (Create new file)
  ├── postcss.config.js
  └── webpack.config.js
```

Change import component inside `index.coffee`
```
import {SkiDayList} from './components/SkiDayList.coffee'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayList} from './components/SkiDayList.coffee'

SkiDayListProps =
  days: [
    {
      resort: "Squaw Valley"
      date: new Date("1/2/2016")
      powder: true
      backcountry: false
    }
    {
      resort: "Kirkwood"
      date: new Date("3/28/2016")
      powder: false
      backcountry: false
    }
    {
      resort: "Mt. Tallac"
      date: new Date("4/2/2016")
      powder: false
      backcountry: true
    }
  ]

render React.createElement(SkiDayList, SkiDayListProps),
  document.getElementById('react-container')
```

src/components/SkiDayList.coffee
```coffeescript
import React from 'react'
import {table, thead, tbody, tr, th} from 'react-dom-factories'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days}) ->
  table null,
    thead null,
      tr null,
        th null, 'Date'
        th null, 'Resort'
        th null, 'Powder'
        th null, 'Backcountry'
    tbody null,
      days.map (day, i) ->
        day.key = i
        React.createElement(SkiDayRow, day)
```

src/components/SkiDayRow.coffee
```coffeescript
import {tr, td} from 'react-dom-factories'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'

export SkiDayRow = ({resort, date, powder, backcountry}) ->
  tr null,
    td null,
      "#{date.getMonth() + 1}/#{date.getDate()}/#{date.getFullYear()}"
    td null,
      resort
    td null,
      if powder then TiWeatherSnow null else null
    td null,
      if backcountry then MdTerrain null else null
```

![Composing components & Displaying child components](/images/04-01-composing-components-and-displaying-child-components.png)

### Default props

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── src
  │   ├── index.coffee
  │   ├── stylesheets
  │   │   ├── globals.scss
  │   │   ├── index.scss
  │   │   └── ui.scss
  │   └── components
  │       ├── SkiDayCount.coffee
  │       ├── SkiDayCount-createClass.coffee    (Create new file)
  │       ├── SkiDayCount-ES6.coffee            (Create new file)
  │       ├── SkiDayList.coffee
  │       └── SkiDayRow.coffee
  ├── postcss.config.js
  └── webpack.config.js
```

**Add default props with create class.**

Change import `SkiDayCount` inside `index.coffee`
```coffeescript
import {SkiDayCount} from './components/SkiDayCount-createClass.coffee'
```

Create react element without `props` inside `index.coffee`
```coffeescript
React.createElement(SkiDayCount)
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount-createClass.coffee'

render React.createElement(SkiDayCount),
  document.getElementById('react-container')
```

Add default props using `getDefaultProps` inside `SkiDayCount-createClass.coffee`
```coffeescript
getDefaultProps: () -> { total: 50, powder: 50, backcountry: 15, goal: 100 }
```

src/components/SkiDayCount-createClass.coffee
```coffeescript
import {div, span} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

export SkiDayCount = CreateReactClass

  displayName: 'SkiDayCount'

  getDefaultProps: () -> { total: 50, powder: 50, backcountry: 15, goal: 100 }

  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total / goal)

  render: ->
    div { className: 'ski-day-count' },
      div { className: 'total-days' },
        span null, this.props.total
        FaRegCalendarAlt null
        span null, 'days'
      div { className: 'powder-days' },
        span null, this.props.powder
        TiWeatherSnow null
        span null, 'days'
      div { className: 'backcountry-days' },
        span null, this.props.backcountry
        MdTerrain null
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)
```

![Add default props with create class](/images/04-03-add-default-props-with-create-class.png)

**Add default props with ES6 class syntax.**

Change import `SkiDayCount` inside `index.coffee`
```coffeescript
import {SkiDayCount} from './components/SkiDayCount-ES6.coffee'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount-ES6.coffee'

render React.createElement(SkiDayCount),
  document.getElementById('react-container')
```

Add default props using `SkiDayCount.defaultProps` inside `SkiDayCount-ES6.coffee`
```coffeescript
SkiDayCount.defaultProps = { total: 50, powder: 10, backcountry: 15, goal: 75 }
```

src/components/SkiDayCount-ES6.coffee
```coffeescript
import {Component} from 'react'
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

export class SkiDayCount extends Component

  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total / goal)

  render: ->
    div { className: 'ski-day-count' },
      div { className: 'total-days' },
        span null, this.props.total
        FaRegCalendarAlt null
        span null, 'days'
      div { className: 'powder-days' },
        span null, this.props.powder
        TiWeatherSnow null
        span null, 'days'
      div { className: 'backcountry-days' },
        span null, this.props.backcountry
        MdTerrain null
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)

SkiDayCount.defaultProps = { total: 50, powder: 10, backcountry: 15, goal: 75 }
```

![Add default props with ES6 class syntax](/images/04-03-add-default-props-with-es6-class-syntax.png)

**Add default props with stateless functional components.**

Change import `SkiDayCount` inside `index.coffee`
```coffeescript
import {SkiDayCount} from './components/SkiDayCount.coffee'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount.coffee'

render React.createElement(SkiDayCount),
  document.getElementById('react-container')
```

Add default props as `function arguments` inside `SkiDayCount-ES6.coffee`
```coffeescript
export SkiDayCount = ({total=70, powder=20, backcountry=10, goal=100}) ->
```

src/components/SkiDayCount.coffee
```coffeescript
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({total=70, powder=20, backcountry=10, goal=100}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      FaRegCalendarAlt null
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      TiWeatherSnow null
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      MdTerrain null
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)
```

![Add default props with stateless functional components](/images/04-03-add-default-props-with-stateless-functional-components.png)

### Validating with React.PropTypes

Don't need to install `PropTypes` because it's included in [React package](https://github.com/facebook/react/blob/v16.2.0/packages/react/package.json#L27).

**React.PropTypes with create class.**

Change import `SkiDayCount` inside `index.coffee`
```coffeescript
import {SkiDayCount} from './components/SkiDayCount-createClass.coffee'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount-createClass.coffee'

render React.createElement(SkiDayCount),
  document.getElementById('react-container')
```

Add prop types as object inside `SkiDayCount-createClass.coffee`
```coffeescript
  propTypes:
    total: PropTypes.string
    powder: PropTypes.number
    backcountry: PropTypes.number
```

Test `string validation` by assigning propTypes as string inside `SkiDayCount-createClass.coffee`
```coffeescript
    total: PropTypes.string
```

src/components/SkiDayCount-createClass.coffee
```coffeescript
import PropTypes from 'prop-types'
import {div, span} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

export SkiDayCount = CreateReactClass

  displayName: 'SkiDayCount'

  propTypes:
    total: PropTypes.string
    powder: PropTypes.number
    backcountry: PropTypes.number

  getDefaultProps: () -> { total: 50, powder: 50, backcountry: 15, goal: 100 }

  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total / goal)

  render: ->
    div { className: 'ski-day-count' },
      div { className: 'total-days' },
        span null, this.props.total
        FaRegCalendarAlt null
        span null, 'days'
      div { className: 'powder-days' },
        span null, this.props.powder
        TiWeatherSnow null
        span null, 'days'
      div { className: 'backcountry-days' },
        span null, this.props.backcountry
        MdTerrain null
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)
```

![React.PropTypes with create class](/images/04-04-react-proptypes-with-create-class.png)

**React.PropTypes with ES6 class syntax.**

Change import `SkiDayCount` inside `index.coffee`
```coffeescript
import {SkiDayCount} from './components/SkiDayCount-ES6.coffee'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount-ES6.coffee'

render React.createElement(SkiDayCount),
  document.getElementById('react-container')
```

Add prop types as object inside `SkiDayCount-ES6.coffee`
```coffeescript
SkiDayCount.propTypes =
  total: PropTypes.number
  powder: PropTypes.number
  backcountry: PropTypes.number
```

Test `numerical validation` by changing `total` to string inside `SkiDayCount-ES6.coffee`
```coffeescript
SkiDayCount.defaultProps = { total: 'text', powder: 10, backcountry: 15, goal: 75 }
```

src/components/SkiDayCount-ES6.coffee
```coffeescript
import {Component} from 'react'
import PropTypes from 'prop-types'
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

export class SkiDayCount extends Component

  percentToDecimal: (decimal) -> ((decimal * 100) + '%')

  calcGoalProgress: (total, goal) -> this.percentToDecimal(total / goal)

  render: ->
    div { className: 'ski-day-count' },
      div { className: 'total-days' },
        span null, this.props.total
        FaRegCalendarAlt null
        span null, 'days'
      div { className: 'powder-days' },
        span null, this.props.powder
        TiWeatherSnow null
        span null, 'days'
      div { className: 'backcountry-days' },
        span null, this.props.backcountry
        MdTerrain null
        span null, 'days'
      div null,
        span null, this.calcGoalProgress(this.props.total, this.props.goal)

SkiDayCount.defaultProps = { total: 'text', powder: 10, backcountry: 15, goal: 75 }

SkiDayCount.propTypes =
  total: PropTypes.number
  powder: PropTypes.number
  backcountry: PropTypes.number
```

![React.PropTypes with ES6 class syntax](/images/04-04-react-proptypes-with-es6-class-syntax.png)

**React.PropTypes with stateless functional components.**

Change import `SkiDayCount` inside `index.coffee`
```coffeescript
import {SkiDayCount} from './components/SkiDayCount.coffee'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayCount} from './components/SkiDayCount.coffee'

render React.createElement(SkiDayCount),
  document.getElementById('react-container')
```

Add prop types as object inside `SkiDayCount.coffee`
```coffeescript
SkiDayCount.propTypes =
  total: PropTypes.number.isRequired
  powder: PropTypes.number
  backcountry: PropTypes.number
```

Test `required attribute validation` by removing `total=70` inside `SkiDayCount.coffee`
```coffeescript
export SkiDayCount = ({powder=20, backcountry=10, goal=100}) ->
```

src/components/SkiDayCount.coffee
```coffeescript
import PropTypes from 'prop-types'
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({powder=20, backcountry=10, goal=100}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      FaRegCalendarAlt null
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      TiWeatherSnow null
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      MdTerrain null
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)

SkiDayCount.propTypes =
  total: PropTypes.number.isRequired
  powder: PropTypes.number
  backcountry: PropTypes.number
```

![React.PropTypes with stateless functional components](/images/04-04-react-proptypes-with-stateless-functional-components.png)

### Custom validation

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayList} from './components/SkiDayList.coffee'
import './stylesheets/ui.scss'

SkiDayListProps =
  days: [
    {
      resort: "Squaw Valley"
      date: new Date("1/2/2016")
      powder: true
      backcountry: false
    }
    {
      resort: "Kirkwood"
      date: new Date("3/28/2016")
      powder: false
      backcountry: false
    }
    {
      resort: "Mt. Tallac"
      date: new Date("4/2/2016")
      powder: false
      backcountry: true
    }
  ]

render React.createElement(SkiDayList, SkiDayListProps),
  document.getElementById('react-container')
```

Add a conditional prop type as object inside `SkiDayList.coffee`
```coffeescript
SkiDayList.propTypes =
  days: (props) ->
    if !Array.isArray(props.days)
      new Error('SkiDayList should be an array')
    else if !props.days.length
      new Error('SkiDayList must have at least one record')
    else
      null
```

src/components/SkiDayList.coffee
```coffeescript
import React from 'react'
import {table, thead, tbody, tr, th} from 'react-dom-factories'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days}) ->
  table null,
    thead null,
      tr null,
        th null, 'Date'
        th null, 'Resort'
        th null, 'Powder'
        th null, 'Backcountry'
    tbody null,
      days.map (day, i) ->
        day.key = i
        React.createElement(SkiDayRow, day)

SkiDayList.propTypes =
  days: (props) ->
    if !Array.isArray(props.days)
      new Error('SkiDayList should be an array')
    else if !props.days.length
      new Error('SkiDayList must have at least one record')
    else
      null
```

**Test conditional validation with string.**

Test `SkiDayList` conditional validation by changing array to string inside `index.coffee`
```
SkiDayListProps =
  days: 'lots of days'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayList} from './components/SkiDayList.coffee'
import './stylesheets/ui.scss'

SkiDayListProps =
  days: 'lots of days'

render React.createElement(SkiDayList, SkiDayListProps),
  document.getElementById('react-container')
```

![Test conditional validation with string](/images/04-05-test-conditional-validation-with-string.png)

**Test conditional validation with empty array.**

Test `SkiDayList` conditional validation by changing to empty array inside `index.coffee`
```
SkiDayListProps =
  days: []
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {SkiDayList} from './components/SkiDayList.coffee'
import './stylesheets/ui.scss'

SkiDayListProps =
  days: []

render React.createElement(SkiDayList, SkiDayListProps),
  document.getElementById('react-container')
```

![Test conditional validation with empty array](/images/04-05-test-conditional-validation-with-empty-array.png)

Add prop types as object inside `SkiDayCount.coffee`
```coffeescript
SkiDayCount.propTypes =
  total: PropTypes.number
  powder: PropTypes.number
  backcountry: PropTypes.number
  goal: PropTypes.number
```

src/components/SkiDayCount.coffee
```coffeescript
import PropTypes from 'prop-types'
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({total=70, powder=20, backcountry=10, goal=100}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      FaRegCalendarAlt null
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      TiWeatherSnow null
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      MdTerrain null
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)

SkiDayCount.propTypes =
  total: PropTypes.number
  powder: PropTypes.number
  backcountry: PropTypes.number
  goal: PropTypes.number
```

Add prop types as object inside `SkiDayRow.coffee`
```coffeescript
SkiDayRow.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.instanceOf(Date).isRequired
  powder: PropTypes.bool
  backcountry: PropTypes.bool
```

src/components/SkiDayRow.coffee
```coffeescript
import PropTypes from 'prop-types'
import {tr, td} from 'react-dom-factories'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'

export SkiDayRow = ({resort, date, powder, backcountry}) ->
  tr null,
    td null,
      "#{date.getMonth() + 1}/#{date.getDate()}/#{date.getFullYear()}"
    td null,
      resort
    td null,
      if powder then TiWeatherSnow null else null
    td null,
      if backcountry then MdTerrain null else null

SkiDayRow.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.instanceOf(Date).isRequired
  powder: PropTypes.bool
  backcountry: PropTypes.bool
```

### Working with state

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── src
  │   ├── index.coffee
  │   ├── stylesheets
  │   │   ├── globals.scss
  │   │   ├── index.scss
  │   │   └── ui.scss
  │   └── components
  │       ├── App.coffee    (Create new file)
  │       ├── SkiDayCount.coffee
  │       ├── SkiDayList.coffee
  │       └── SkiDayRow.coffee
  ├── postcss.config.js
  └── webpack.config.js
```

Change import component inside `index.coffee`
```
import {App} from './components/App.coffee'
```

Create react element inside `index.coffee`
```coffeescript
React.createElement(App)
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {App} from './components/App.coffee'

render React.createElement(App),
  document.getElementById('react-container')
```

Add `getInitialState` includes `allSkiDays` inside `App.coffee`
```coffeescript
  getInitialState: ->
    allSkiDays: [
      {
        resort: 'Squaw Valley'
        date: new Date('1/2/2016')
        powder: true
        backcountry: false
      }
      {
        resort: 'Kirkwood'
        date: new Date('3/28/2016')
        powder: false
        backcountry: false
      }
      {
        resort: 'Mt. Tallac'
        date: new Date('4/2/2016')
        powder: false
        backcountry: true
      }
    ]
```

src/components/App.coffee
```coffeescript
import {div} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'

export App = CreateReactClass
  displayName: 'App'

  getInitialState: ->
    allSkiDays: [
      {
        resort: 'Squaw Valley'
        date: new Date('1/2/2016')
        powder: true
        backcountry: false
      }
      {
        resort: 'Kirkwood'
        date: new Date('3/28/2016')
        powder: false
        backcountry: false
      }
      {
        resort: 'Mt. Tallac'
        date: new Date('4/2/2016')
        powder: false
        backcountry: true
      }
    ]

  render: ->
    div { className: 'app' },
      this.state.allSkiDays[0]['resort']
```

![Working with state](/images/04-06-working-with-state.png)

### Passing state as props

Add import style inside `index.coffee`
```coffeescript
import './stylesheets/ui.scss'
```

src/index.coffee
```coffeescript
import React from 'react'
import {render} from 'react-dom'
import {App} from './components/App.coffee'
import './stylesheets/ui.scss'

render React.createElement(App),
  document.getElementById('react-container')
```

Add import components inside `App.coffee`
```coffeescript
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'
```

Create `countDays` function inside `App.coffee`
```coffeescript
  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length
```

Insert components with props inside `App.coffee`
```coffeescript
  render: ->
    div { className: 'app' },
      React.createElement(SkiDayList, { days: this.state.allSkiDays })
      React.createElement(SkiDayCount, {
        total: this.countDays()
        powder: this.countDays('powder')
        backcountry: this.countDays('backcountry')
      })
```

src/components/App.coffee
```coffeescript
import React from 'react'
import {div} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export App = CreateReactClass
  displayName: 'App'

  getInitialState: ->
    allSkiDays: [
      {
        resort: 'Squaw Valley'
        date: new Date('1/2/2016')
        powder: true
        backcountry: false
      }
      {
        resort: 'Kirkwood'
        date: new Date('3/28/2016')
        powder: false
        backcountry: false
      }
      {
        resort: 'Mt. Tallac'
        date: new Date('4/2/2016')
        powder: false
        backcountry: true
      }
    ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      React.createElement(SkiDayList, { days: this.state.allSkiDays })
      React.createElement(SkiDayCount, {
        total: this.countDays()
        powder: this.countDays('powder')
        backcountry: this.countDays('backcountry')
      })
```

![Passing state as props](/images/04-07-passing-state-as-props.png)

### State with ES6 classes

Add import React and components inside `App.coffee`
```coffeescript
import React, {Component} from 'react'
```

Add `constructor` instead of `getInitialState` inside `App.coffee`
```coffeescript
  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: new Date('1/2/2016')
          powder: true
          backcountry: false
        }
        {
          resort: 'Kirkwood'
          date: new Date('3/28/2016')
          powder: false
          backcountry: false
        }
        {
          resort: 'Mt. Tallac'
          date: new Date('4/2/2016')
          powder: false
          backcountry: true
        }
      ]
```

src/components/App.coffee
```coffeescript
import React, {Component} from 'react'
import {div} from 'react-dom-factories'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: new Date('1/2/2016')
          powder: true
          backcountry: false
        }
        {
          resort: 'Kirkwood'
          date: new Date('3/28/2016')
          powder: false
          backcountry: false
        }
        {
          resort: 'Mt. Tallac'
          date: new Date('4/2/2016')
          powder: false
          backcountry: true
        }
      ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      React.createElement(SkiDayList, { days: this.state.allSkiDays })
      React.createElement(SkiDayCount, {
        total: this.countDays()
        powder: this.countDays('powder')
        backcountry: this.countDays('backcountry')
      })
```

## 05 Using the React Router
### Incorporating the router

![React Router](/images/05-01-react-router.png)

Install React Router.
```
npm install --save react-router-dom
npm list --depth=0
```

**BrowserRouter**

Import `createElement` as `ele` inside `index.coffee`
```coffeescript
import React, {createElement as ele} from 'react'
```

Import `react-dom-factories` inside `index.coffee`
```coffeescript
import {div, ul, li, h1} from 'react-dom-factories'
```

Import `react-router-dom` as `BrowserRouter` inside `index.coffee`
```coffeescript
import {BrowserRouter, Switch, Route, Link } from 'react-router-dom'
```

Add React components inside `index.coffee`
```coffeescript
Home = ->
  h1 null,
    'Welcome to Home Page.'

About = ->
  h1 null,
    'About Page.'

NotFound = ->
  h1 null,
    'Not Found!'
```

Add route elements inside `index.coffee`
```coffeescript
routes =
  ele BrowserRouter, null,
    div null,
      ul null,
        li null,
          ele Link, {to: '/'}, 'Home'
        li null,
          ele Link, {to: '/about'}, 'About'
        li null,
          ele Link, {to: '/test-a'}, 'Test A'
        li null,
          ele Link, {to: '/test-b'}, 'Test B'
        li null,
          ele Link, {to: '/test-c'}, 'Test C'
      ele Switch, null,
        ele Route, { path: '/', exact: true, component: Home }
        ele Route, { path: '/about', exact: true, component: About }
        ele Route, { component: NotFound }
```

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {div, ul, li, h1} from 'react-dom-factories'
import {BrowserRouter, Switch, Route, Link } from 'react-router-dom'

Home = ->
  h1 null,
    'Welcome to Home Page.'

About = ->
  h1 null,
    'About Page.'

NotFound = ->
  h1 null,
    'Not Found!'

routes =
  ele BrowserRouter, null,
    div null,
      ul null,
        li null,
          ele Link, {to: '/'}, 'Home'
        li null,
          ele Link, {to: '/about'}, 'About'
        li null,
          ele Link, {to: '/test-a'}, 'Test A'
        li null,
          ele Link, {to: '/test-b'}, 'Test B'
        li null,
          ele Link, {to: '/test-c'}, 'Test C'
      ele Switch, null,
        ele Route, { path: '/', exact: true, component: Home }
        ele Route, { path: '/about', exact: true, component: About }
        ele Route, { component: NotFound }

render routes, document.getElementById('react-container')
```

Will render components without reload the browser<br>
and when clicking on `Test A`, `Test B` & `Test C` will render the `NotFound` component.

![BrowserRouter](/images/05-01-browser-router.gif)

`BrowserRouter` will not render components when reload the browser.

![BrowserRouter not working after reload browser](/images/05-01-browser-router-not-working-after-reload-browser.gif)

More about [`BrowserRouter`](https://reacttraining.com/react-router/web/api/BrowserRouter)

**HashRouter**

Import `react-dom-factories` inside `index.coffee`
```coffeescript
import {h1} from 'react-dom-factories'
```

Import `react-router-dom` as `HashRouter` inside `index.coffee`
```coffeescript
import {HashRouter, Route, Switch} from 'react-router-dom'
```

Add route elements inside `index.coffee`
```coffeescript
routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: Home }
      ele Route, { path: '/about', exact: true, component: About }
      ele Route, { component: NotFound }
```

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {h1} from 'react-dom-factories'
import {HashRouter, Route, Switch} from 'react-router-dom'

Home = ->
  h1 null,
    'Welcome to Home Page.'

About = ->
  h1 null,
    'About Page.'

NotFound = ->
  h1 null,
    'Not Found!'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: Home }
      ele Route, { path: '/about', exact: true, component: About }
      ele Route, { component: NotFound }

render routes, document.getElementById('react-container')
```

HashRouter will append URL with `/#/`

![HashRouter](/images/05-01-hash-router.gif)

`HashRouter` will render components when reload the browser.

![HashRouter not working after reload browser](/images/05-01-hash-router-working-after-reload-browser.gif)

More about [`HashRouter`](https://reacttraining.com/react-router/web/api/HashRouter)

**Create 404 not found page using HashRouter.**

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── src
  │   ├── index.coffee
  │   ├── stylesheets
  │   │   ├── globals.scss
  │   │   ├── index.scss
  │   │   └── ui.scss
  │   └── components
  │       ├── App.coffee
  │       ├── SkiDayCount.coffee
  │       ├── SkiDayList.coffee
  │       ├── SkiDayRow.coffee
  │       └── Whoops404.coffee    (Create new file)
  ├── postcss.config.js
  └── webpack.config.js
```

Import `App` and `Whoops404` components inside `index.coffee`
```coffeescript
import {App} from './components/App.coffee'
import {Whoops404} from './components/Whoops404.coffee'
```

Add import style inside `index.coffee`
```coffeescript
import './stylesheets/ui.scss'
```

Add route elements inside `index.coffee`
```coffeescript
routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { component: Whoops404 }
```

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {HashRouter, Route, Switch} from 'react-router-dom'
import {App} from './components/App.coffee'
import {Whoops404} from './components/Whoops404.coffee'
import './stylesheets/ui.scss'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { component: Whoops404 }

render routes, document.getElementById('react-container')
```

src/components/Whoops404.coffee
```coffeescript
import {div, h1} from 'react-dom-factories'

export Whoops404 = ->
  div null,
    h1 null, 'Whoops, route not found'
```

![Incorporating the router](/images/05-01-incorporating-the-router.gif)

### Setting up routes

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── node_modules
  ├── src
  │   ├── index.coffee
  │   ├── stylesheets
  │   │   ├── globals.scss
  │   │   ├── index.scss
  │   │   └── ui.scss
  │   └── components
  │       ├── AddDayForm.coffee    (Create new file)
  │       ├── App.coffee
  │       ├── SkiDayCount.coffee
  │       ├── SkiDayList.coffee
  │       ├── SkiDayRow.coffee
  │       └── Whoops404.coffee
  ├── postcss.config.js
  └── webpack.config.js
```

Import `AddDayForm` component inside `index.coffee`
```coffeescript
import {AddDayForm} from './components/AddDayForm.coffee'
```

Add route elements inside `index.coffee`
```coffeescript
routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { path: '/list-days', exact: true, component: App }
      ele Route, { path: '/add-day', exact: true, component: AddDayForm }
      ele Route, { component: Whoops404 }
```

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {HashRouter, Route, Switch} from 'react-router-dom'
import {App} from './components/App.coffee'
import {AddDayForm} from './components/AddDayForm.coffee'
import {Whoops404} from './components/Whoops404.coffee'
import './stylesheets/ui.scss'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { path: '/list-days', exact: true, component: App }
      ele Route, { path: '/add-day', exact: true, component: AddDayForm }
      ele Route, { component: Whoops404 }

render routes, document.getElementById('react-container')
```
`/` and `/list-days` paths use the same component (`App`)<br>
will add `pathname condition` to render `App` components.


Import `createElement` as `ele` inside `App.coffee`
```coffeescript
import React, {Component, createElement as ele} from 'react'
```

Change the render method by adding `pathname condition` inside `App.coffee`
```coffeescript
  render: ->
    div { className: 'app' },
      if this.props.location.pathname == '/'
        ele SkiDayCount, {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else
        ele SkiDayList, { days: this.state.allSkiDays }
```

src/components/App.coffee
```coffeescript
import React, {Component, createElement as ele} from 'react'
import {div} from 'react-dom-factories'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: new Date('1/2/2016')
          powder: true
          backcountry: false
        }
        {
          resort: 'Kirkwood'
          date: new Date('3/28/2016')
          powder: false
          backcountry: false
        }
        {
          resort: 'Mt. Tallac'
          date: new Date('4/2/2016')
          powder: false
          backcountry: true
        }
      ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      if this.props.location.pathname == '/'
        ele SkiDayCount, {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else
        ele SkiDayList, { days: this.state.allSkiDays }
```

src/components/AddDayForm.coffee
```coffeescript
import {h1} from 'react-dom-factories'

export AddDayForm = ->
  h1 null, 'Add A Day.'
```

![Setting up routes](/images/05-02-setting-up-routes.gif)

### Navigating with the link component

Remove import `AddDayForm` inside `index.coffee`
```coffeescript
import {AddDayForm} from './components/AddDayForm.coffee'
```

Change the component of `/add-day` to render `App` instead of `AddDayForm` inside `index.coffee`
```coffeescript
      ele Route, { path: '/add-day', exact: true, component: App }
```

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {HashRouter, Route, Switch} from 'react-router-dom'
import {App} from './components/App.coffee'
import {Whoops404} from './components/Whoops404.coffee'
import './stylesheets/ui.scss'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { path: '/list-days', exact: true, component: App }
      ele Route, { path: '/add-day', exact: true, component: App }
      ele Route, { component: Whoops404 }

render routes, document.getElementById('react-container')
```

Add import `Menu` component inside `App.coffee`
```coffeescript
import {Menu} from './Menu.coffee'
```

Add the `Menu` component as an element inside `App.coffee`.
```coffeescript
      Menu null
```

Change `pathname condition` inside `App.coffee`.
```coffeescript
      if this.props.location.pathname == '/'
        SkiDayCount {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else if this.props.location.pathname == '/list-days'
        SkiDayList { days: this.state.allSkiDays }
      else
        AddDayForm null
```

src/components/App.coffee
```coffeescript
import React, {Component} from 'react'
import {div} from 'react-dom-factories'
import {AddDayForm} from './AddDayForm.coffee'
import {Menu} from './Menu.coffee'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: new Date('1/2/2016')
          powder: true
          backcountry: false
        }
        {
          resort: 'Kirkwood'
          date: new Date('3/28/2016')
          powder: false
          backcountry: false
        }
        {
          resort: 'Mt. Tallac'
          date: new Date('4/2/2016')
          powder: false
          backcountry: true
        }
      ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      Menu null
      if this.props.location.pathname == '/'
        SkiDayCount {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else if this.props.location.pathname == '/list-days'
        SkiDayList { days: this.state.allSkiDays }
      else
        AddDayForm null
```

Import `NavLink` instead of `Link` to use `activeClassName` inside `Menu.coffee`.
```coffeescript
import {NavLink} from 'react-router-dom'
```

src/components/Menu.coffee
```coffeescript
import {createElement as ele} from 'react'
import {nav} from 'react-dom-factories'
import {NavLink} from 'react-router-dom'
import {FaHome, FaCalendarPlus, FaTable} from 'react-icons/fa'

export Menu = ->
  nav { className: 'menu' },
    ele NavLink, { to: '/', activeClassName: 'selected' },
      FaHome null
    ele NavLink, { to: '/add-day', activeClassName: 'selected' },
      FaCalendarPlus null
    ele NavLink, { to: '/list-days', activeClassName: 'selected' },
      FaTable null
```

![Navigating with the link component](/images/05-03-navigating-with-the-link-component.gif)

### Using route parameters

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {HashRouter, Route, Switch} from 'react-router-dom'
import {App} from './components/App.coffee'
import {Whoops404} from './components/Whoops404.coffee'
import './stylesheets/ui.scss'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { path: '/list-days', exact: true, component: App }
      ele Route, { path: '/list-days/:filter(powder|backcountry)', component: App }
      ele Route, { path: '/add-day', exact: true, component: App }
      ele Route, { component: Whoops404 }

render routes, document.getElementById('react-container')
```

src/components/App.coffee
```coffeescript
import React, {Component} from 'react'
import {div} from 'react-dom-factories'
import {AddDayForm} from './AddDayForm.coffee'
import {Menu} from './Menu.coffee'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: new Date('1/2/2016')
          powder: true
          backcountry: false
        }
        {
          resort: 'Kirkwood'
          date: new Date('3/28/2016')
          powder: false
          backcountry: false
        }
        {
          resort: 'Mt. Tallac'
          date: new Date('4/2/2016')
          powder: false
          backcountry: true
        }
      ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      Menu null
      if this.props.location.pathname == '/'
        SkiDayCount {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else if this.props.location.pathname == '/add-day'
        AddDayForm null
      else
        SkiDayList { days: this.state.allSkiDays, filter: this.props.match.params.filter }
```

src/components/SkiDayList.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {table, thead, tbody, tr, th, td} from 'react-dom-factories'
import {Link} from 'react-router-dom'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days, filter}) ->

  filteredDays = if !filter then days else days.filter (day) -> day[filter]

  table null,
    thead null,
      tr null,
        th null, 'Date'
        th null, 'Resort'
        th null, 'Powder'
        th null, 'Backcountry'
      tr null,
        td { colSpan: 4 },
          ele Link, { to: '/list-days' }, 'All Days'
          ele Link, { to: '/list-days/powder' }, 'Powder Days'
          ele Link, { to: '/list-days/backcountry' }, 'Backcountry Days'
    tbody null,
      filteredDays.map (day, i) ->
        day.key = i
        ele SkiDayRow, day

SkiDayList.propTypes =
  days: (props) ->
    if !Array.isArray(props.days)
      new Error('SkiDayList should be an array')
    else if !props.days.length
      new Error('SkiDayList must have at least one record')
    else
      null
```

![Using route parameters](/images/05-04-using-route-parameters.gif)

### Nesting routes

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── package-lock.json
  ├── package.json
  ├── postcss.config.js
  ├── src
  │   ├── index.coffee
  │   ├── routes.coffee           (Create new file)
  │   ├── components
  │   │   ├── index.coffee          (Create new file)
  │   │   └── ui                    (Create new directory)
  │   │       ├── MainMenu.coffee     (Create new file)
  │   │       ├── Home.coffee         (Create new file)
  │   │       ├── About.coffee        (Create new file)
  │   │       └── MemberList.coffee   (Create new file)
  │   └── stylesheets
  │       └── style.scss            (Create new file)
  └── webpack.config.js
```

src/index.coffee
```coffeescript
import {render} from 'react-dom'
import {Routes} from './routes.coffee'

render Routes, document.getElementById('react-container')
```

src/routes.coffee
```coffeescript
import {createElement as ele} from 'react'
import {HashRouter, Switch, Route} from 'react-router-dom'
import {Home} from './components/ui/Home.coffee'
import {Index, Whoops404} from './components/index.coffee'
import './stylesheets/style.scss'

export Routes =
  ele HashRouter, null,
      ele Switch, null,
        ele Route, { path: '/', exact: true, component: Home }
        ele Route, { path: '/(about|members)', component: Index }
        ele Route, { component: Whoops404 }
```

src/components/ui/MainMenu.coffee
```coffeescript
import {createElement as ele} from 'react'
import {nav} from 'react-dom-factories'
import {NavLink} from 'react-router-dom'
import {FaHome} from 'react-icons/fa'

export MainMenu = ->
  nav null,
    ele NavLink, { to: '/' },
      FaHome null
    ele NavLink, { to: '/about', activeStyle: {
      backgroundColor: "white",
      color: "slategray"
    } }, 'About'
    ele NavLink, { to: '/members', activeStyle: {
      backgroundColor: "white",
      color: "slategray"
    } }, 'Members'
```

![Main Menu](/images/05-05-main-menu.png)

src/components/ui/Home.coffee
```coffeescript
import {createElement as ele} from 'react'
import {div, h1} from 'react-dom-factories'
import {MainMenu} from './MainMenu.coffee'

export Home = ->
  div { className: 'home' },
    ele MainMenu, { className: 'main-menu' }
    div { id: 'homebox' },
      h1 null, 'Rock Appreciation Society'
```

![Home](/images/05-05-home.png)

src/components/index.coffee
```coffeescript
import {createElement as ele} from 'react'
import {div, h1, p} from 'react-dom-factories'
import {Switch, Route} from 'react-router-dom'
import {MainMenu} from './ui/MainMenu.coffee'
import {About} from './ui/About.coffee'
import {MemberList} from './ui/MemberList.coffee'

export Index = ->
  div { className: 'page' },
    ele MainMenu, { className: 'main-menu' }
    ele Switch, null,
      ele Route, { path: '/about', component: About }
      ele Route, { path: '/members', component: MemberList }

export Whoops404 = ({location}) ->
  div null,
    h1 null, 'Whoops, resource not found'
    p null, "Could not find #{location.pathname}"
```

src/components/ui/About.coffee
```coffeescript
import {div, h1, p} from 'react-dom-factories'

export About = ->
  div { className: 'about' },
    h1 null, 'About'
    p null, '''
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque iaculis erat non dignissim malesuada.
      Mauris in elit quis lectus auctor pharetra. Cras fermentum leo est, a aliquet ligula cursus a. Ut vitae leo
      mollis, scelerisque enim nec, euismod turpis. Praesent ut turpis non justo lacinia varius sed eu mauris.
      Nullam hendrerit aliquet sapien varius faucibus. Nulla varius magna ex, nec ornare massa interdum sed.
      Aliquam consequat lacus nec felis scelerisque, tempus maximus sapien venenatis. Sed quis ornare purus.
      Vestibulum tempor id diam vel ultrices. Aenean neque nibh, tempor in tincidunt nec, ullamcorper in erat.
      Aliquam erat volutpat. Aenean vitae sapien at nibh lacinia accumsan maximus sit amet risus.
      '''
    p null, '''
      Vestibulum laoreet condimentum sem quis convallis. Nullam quis tortor mauris. Pellentesque orci sapien,
      fermentum non porta a, lobortis vitae mi. Integer quis enim at nunc commodo egestas. Maecenas et tortor ut
      diam consectetur malesuada. Curabitur posuere, diam at pulvinar cursus, diam diam imperdiet risus, vel
      ullamcorper sapien lectus vitae turpis. Sed posuere lectus at dictum ultrices. Nulla in congue ipsum.
      Praesent commodo venenatis arcu non lacinia. Integer placerat odio eget metus posuere, id placerat orci
      tristique. Nulla nec lorem sit amet diam luctus tempor ac sit amet mi. Vivamus tortor tortor, ornare a risus
      eget, efficitur vestibulum augue. Nunc vulputate faucibus purus, eget convallis urna porta eget. In faucibus
      tristique mauris eu gravida.
      '''
    p null, '''
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque iaculis erat non dignissim malesuada.
      Mauris in elit quis lectus auctor pharetra. Cras fermentum leo est, a aliquet ligula cursus a. Ut vitae leo
      mollis, scelerisque enim nec, euismod turpis. Praesent ut turpis non justo lacinia varius sed eu mauris.
      Nullam hendrerit aliquet sapien varius faucibus. Nulla varius magna ex, nec ornare massa interdum sed.
      Aliquam consequat lacus nec felis scelerisque, tempus maximus sapien venenatis. Sed quis ornare purus.
      Vestibulum tempor id diam vel ultrices. Aenean neque nibh, tempor in tincidunt nec, ullamcorper in erat.
      Aliquam erat volutpat. Aenean vitae sapien at nibh lacinia accumsan maximus sit amet risus.
      '''
    p null, '''
      Vestibulum laoreet condimentum sem quis convallis. Nullam quis tortor mauris. Pellentesque orci sapien,
      fermentum non porta a, lobortis vitae mi. Integer quis enim at nunc commodo egestas. Maecenas et tortor ut
      diam consectetur malesuada. Curabitur posuere, diam at pulvinar cursus, diam diam imperdiet risus, vel
      ullamcorper sapien lectus vitae turpis. Sed posuere lectus at dictum ultrices. Nulla in congue ipsum.
      Praesent commodo venenatis arcu non lacinia. Integer placerat odio eget metus posuere, id placerat orci
      tristique. Nulla nec lorem sit amet diam luctus tempor ac sit amet mi. Vivamus tortor tortor, ornare a risus
      eget, efficitur vestibulum augue. Nunc vulputate faucibus purus, eget convallis urna porta eget. In faucibus
      tristique mauris eu gravida.
      '''
```

![About](/images/05-05-about.png)

`Optional` Use `'''` or `"""` to contain `CoffeeScript multiline strings`. 
```coffeescript
'''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque iaculis erat non dignissim malesuada.
Mauris in elit quis lectus auctor pharetra. Cras fermentum leo est, a aliquet ligula cursus a. Ut vitae leo
mollis, scelerisque enim nec, euismod turpis. Praesent ut turpis non justo lacinia varius sed eu mauris.
'''

"""
Vestibulum laoreet condimentum sem quis convallis. Nullam quis tortor mauris. Pellentesque orci sapien,
fermentum non porta a, lobortis vitae mi. Integer quis enim at nunc commodo egestas. Maecenas et tortor ut
diam consectetur malesuada. Curabitur posuere, diam at pulvinar cursus, diam diam imperdiet risus, vel
ullamcorper sapien lectus vitae turpis. Sed posuere lectus at dictum ultrices. Nulla in congue ipsum.
"""
```

More about [`CoffeeScript strings`](https://coffeescript.org/#strings).

[![About](/images/05-05-coffee-script-strings.png)](https://coffeescript.org/#strings)

src/components/ui/MemberList.coffee
```coffeescript
import {div, h1} from 'react-dom-factories'

export MemberList = ->
  div { className: 'member-list' },
    h1 null, 'Society Members'
```

![Members](/images/05-05-members.png)

Please find [`style.scss`](../18c58ea9d2e8478253de311c51afbbe9ea8c284f/src/stylesheets/style.scss)

![Using route parameters](/images/05-05-using-route-parameters.gif)

## 06 Forms and Refs
### Creating a form component

Create new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── package-lock.json
  ├── package.json
  ├── postcss.config.js
  ├── src
  │   ├── index.coffee
  │   ├── components
  │   │   ├── AddDayForm.coffee     (Create new file)
  │   │   ├── App.coffee            (Create new file)
  │   │   ├── Menu.coffee           (Create new file)
  │   │   ├── SkiDayCount.coffee    (Create new file)
  │   │   ├── SkiDayList.coffee     (Create new file)
  │   │   ├── SkiDayRow.coffee      (Create new file)
  │   │   └── Whoops404.coffee      (Create new file)
  │   └── stylesheets
  │       ├── globals.scss          (Create new file)
  │       ├── index.scss            (Create new file)
  │       └── ui.scss               (Create new file)
  └── webpack.config.js
```

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {HashRouter, Route, Switch} from 'react-router-dom'
import {App} from './components/App.coffee'
import {Whoops404} from './components/Whoops404.coffee'
import './stylesheets/ui.scss'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { path: '/list-days', exact: true, component: App }
      ele Route, { path: '/list-days/:filter(powder|backcountry)', component: App }
      ele Route, { path: '/add-day', exact: true, component: App }
      ele Route, { component: Whoops404 }

render routes, document.getElementById('react-container')
```

src/components/AddDayForm.coffee
```coffeescript
import PropTypes from 'prop-types'
import {div, form, label, input} from 'react-dom-factories'

export AddDayForm = ({resort = 'Kirkwood', date = '2017-02-12', powder = true, backcountry = false}) ->
  form { className: 'add-day-form' },
    label { htmlFor: 'resort' }, 'Resort Name'
    input { id: 'resort', type: 'text', defaultValue: resort, required: true }

    label { htmlFor: 'date' }, 'Date'
    input { id: 'date', type: 'date', defaultValue: date, required: true }

    div null,
      input { id: 'powder', type: 'checkbox', defaultChecked: powder }
      label { htmlFor: 'powder' }, 'Powder Day'

    div null,
      input { id: 'backcountry', type: 'checkbox', defaultChecked: backcountry }
      label { htmlFor: 'backcountry' }, 'Backcountry Day'

AddDayForm.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.string.isRequired
  powder: PropTypes.bool.isRequired
  backcountry: PropTypes.bool.isRequired
```

![AddDayForm](/images/06-01-add-day-form.png)

src/components/App.coffee
```coffeescript
import {Component} from 'react'
import {div} from 'react-dom-factories'
import {AddDayForm} from './AddDayForm.coffee'
import {Menu} from './Menu.coffee'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: new Date('1/2/2016')
          powder: true
          backcountry: false
        }
        {
          resort: 'Kirkwood'
          date: new Date('3/28/2016')
          powder: false
          backcountry: false
        }
        {
          resort: 'Mt. Tallac'
          date: new Date('4/2/2016')
          powder: false
          backcountry: true
        }
      ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      Menu null
      if this.props.location.pathname == '/'
        SkiDayCount {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else if this.props.location.pathname == '/add-day'
        AddDayForm {}
      else
        SkiDayList { days: this.state.allSkiDays, filter: this.props.match.params.filter }
```

src/components/Menu.coffee
```coffeescript
import {createElement as ele} from 'react'
import {nav} from 'react-dom-factories'
import {NavLink} from 'react-router-dom'
import {FaHome, FaCalendarPlus, FaTable} from 'react-icons/fa'

export Menu = ->
  nav { className: 'menu' },
    ele NavLink, { to: '/', activeClassName: 'selected' },
      FaHome null
    ele NavLink, { to: '/add-day', activeClassName: 'selected' },
      FaCalendarPlus null
    ele NavLink, { to: '/list-days', activeClassName: 'selected' },
      FaTable null
```

src/components/SkiDayCount.coffee
```coffeescript
import PropTypes from 'prop-types'
import {div, span} from 'react-dom-factories'
import {FaRegCalendarAlt} from 'react-icons/fa'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'
import '../stylesheets/ui.scss'

percentToDecimal = (decimal) -> ((decimal * 100) + '%')
calcGoalProgress = (total, goal) -> percentToDecimal(total / goal)

export SkiDayCount = ({total=70, powder=20, backcountry=10, goal=100}) ->
  div { className: 'ski-day-count' },
    div { className: 'total-days' },
      span null, total
      FaRegCalendarAlt null
      span null, 'days'
    div { className: 'powder-days' },
      span null, powder
      TiWeatherSnow null
      span null, 'days'
    div { className: 'backcountry-days' },
      span null, backcountry
      MdTerrain null
      span null, 'days'
    div null,
      span null, calcGoalProgress(total, goal)

SkiDayCount.propTypes =
  total: PropTypes.number
  powder: PropTypes.number
  backcountry: PropTypes.number
  goal: PropTypes.number
```

src/components/SkiDayList.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {table, thead, tbody, tr, th, td} from 'react-dom-factories'
import {Link} from 'react-router-dom'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days, filter}) ->

  filteredDays = if !filter then days else days.filter (day) -> day[filter]

  table null,
    thead null,
      tr null,
        th null, 'Date'
        th null, 'Resort'
        th null, 'Powder'
        th null, 'Backcountry'
      tr null,
        td { colSpan: 4 },
          ele Link, { to: '/list-days' }, 'All Days'
          ele Link, { to: '/list-days/powder' }, 'Powder Days'
          ele Link, { to: '/list-days/backcountry' }, 'Backcountry Days'
    tbody null,
      filteredDays.map (day, i) ->
        day.key = i
        ele SkiDayRow, day

SkiDayList.propTypes =
  days: (props) ->
    if !Array.isArray(props.days)
      new Error('SkiDayList should be an array')
    else if !props.days.length
      new Error('SkiDayList must have at least one record')
    else
      null
```

src/components/SkiDayRow.coffee
```coffeescript
import PropTypes from 'prop-types'
import {tr, td} from 'react-dom-factories'
import {TiWeatherSnow} from 'react-icons/ti'
import {MdTerrain} from 'react-icons/md'

export SkiDayRow = ({resort, date, powder, backcountry}) ->
  tr null,
    td null,
      "#{date.getMonth() + 1}/#{date.getDate()}/#{date.getFullYear()}"
    td null,
      resort
    td null,
      if powder then TiWeatherSnow null else null
    td null,
      if backcountry then MdTerrain null else null

SkiDayRow.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.instanceOf(Date).isRequired
  powder: PropTypes.bool
  backcountry: PropTypes.bool
```

src/components/Whoops404.coffee
```coffeescript
import {div, h1} from 'react-dom-factories'

export Whoops404 = ->
  div null,
    h1 null, 'Whoops, route not found'
```

Please find [`globals.scss`](../f100947afa51af3be6db3a034981ebc3a9af46fe/src/stylesheets/globals.scss), [`index.scss`](../f100947afa51af3be6db3a034981ebc3a9af46fe/src/stylesheets/index.scss) and [`ui.scss`](../f100947afa51af3be6db3a034981ebc3a9af46fe/src/stylesheets/ui.scss)

![Creating a form component](/images/06-01-creating-a-form-component.gif)

### Using refs in class components

Import `createElement` as `ele` inside `App.coffee`
```coffeescript
import {Component, createElement as ele} from 'react'
```

Add the `AddDayForm` component as an element inside `App.coffee`.
```coffeescript
        ele AddDayForm, null
```

src/components/App.coffee
```coffeescript
import {Component, createElement as ele} from 'react'
import {div} from 'react-dom-factories'
import {AddDayForm} from './AddDayForm.coffee'
import {Menu} from './Menu.coffee'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: new Date('1/2/2016')
          powder: true
          backcountry: false
        }
        {
          resort: 'Kirkwood'
          date: new Date('3/28/2016')
          powder: false
          backcountry: false
        }
        {
          resort: 'Mt. Tallac'
          date: new Date('4/2/2016')
          powder: false
          backcountry: true
        }
      ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      Menu null
      if this.props.location.pathname == '/'
        SkiDayCount {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else if this.props.location.pathname == '/add-day'
        ele AddDayForm, null
      else
        SkiDayList { days: this.state.allSkiDays, filter: this.props.match.params.filter }
```

src/components/AddDayForm.coffee
```coffeescript
import {Component} from 'react'
import PropTypes from 'prop-types'
import {div, form, label, input, button} from 'react-dom-factories'

export class AddDayForm extends Component

  constructor: (props) ->
    super(props)
    this.submit = this.submit.bind(this)

  submit: ->
    {resort, date, powder, backcountry} = this.refs

    console.log('resort', resort.value)
    console.log('date', date.value)
    console.log('powder', powder.checked)
    console.log('backcountry', backcountry.checked)

  render: ->
    {resort, date, powder, backcountry} = this.props

    form { onSubmit: this.submit, className: 'add-day-form' },
      label { htmlFor: 'resort' }, 'Resort Name'
      input { id: 'resort', ref: 'resort', type: 'text', defaultValue: resort, required: true}

      label { htmlFor: 'date' }, 'Date'
      input { id: 'date', ref: 'date', type: 'date', defaultValue: date, required: true }

      div null,
        input { id: 'powder', ref: 'powder', type: 'checkbox', defaultChecked: powder }
        label { htmlFor: 'powder' }, 'Powder Day'

      div null,
        input { id: 'backcountry', ref: 'backcountry', type: 'checkbox', defaultChecked: backcountry }
        label { htmlFor: 'backcountry' }, 'Backcountry Day'

      button null, 'Add Day'

AddDayForm.defaultProps =
  resort: 'Kirkwood'
  date: '2017-02-12'
  powder: true
  backcountry: false

AddDayForm.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.string.isRequired
  powder: PropTypes.bool.isRequired
  backcountry: PropTypes.bool.isRequired
```

![Using refs in class components](/images/06-02-using-refs-in-class-components.gif)

### Using refs in stateless components

src/components/AddDayForm.coffee
```coffeescript
import PropTypes from 'prop-types'
import {div, form, label, input, button} from 'react-dom-factories'

export AddDayForm = ({resort, date, powder, backcountry}) ->

  submit = (e) ->
    {resort, date, powder, backcountry} = e.target.elements

    console.log('resort', resort.value)
    console.log('date', date.value)
    console.log('powder', powder.checked)
    console.log('backcountry', backcountry.checked)

  form { onSubmit: submit, className: 'add-day-form' },
    label { htmlFor: 'resort' }, 'Resort Name'
    input { id: 'resort', type: 'text', defaultValue: resort, required: true}

    label { htmlFor: 'date' }, 'Date'
    input { id: 'date', type: 'date', defaultValue: date, required: true }

    div null,
      input { id: 'powder', type: 'checkbox', defaultChecked: powder }
      label { htmlFor: 'powder' }, 'Powder Day'

    div null,
      input { id: 'backcountry', type: 'checkbox', defaultChecked: backcountry }
      label { htmlFor: 'backcountry' }, 'Backcountry Day'

    button null, 'Add Day'

AddDayForm.defaultProps =
  resort: 'Kirkwood'
  date: '2017-02-12'
  powder: true
  backcountry: false

AddDayForm.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.string.isRequired
  powder: PropTypes.bool.isRequired
  backcountry: PropTypes.bool.isRequired
```

![Using refs in stateless components](/images/06-03-using-refs-in-stateless-components.gif)

### Two-way function binding

Bind `addDay` method inside component’s constructor of `App.coffee`
```coffeescript
    this.addDay = this.addDay.bind(this)
```

Create `addDay` function to add `newDay` record to `allSkiDays` inside `App.coffee`
```coffeescript
  addDay: (newDay) ->
    this.state.allSkiDays.push newDay
    this.setState(this.state.allSkiDays)
```

Add `AddDayForm` element to bind `addDay` method as `onNewDay` attribute inside `App.coffee`
```coffeescript
        ele AddDayForm, { onNewDay: this.addDay }
```

src/components/App.coffee
```coffeescript
import {Component, createElement as ele} from 'react'
import {div} from 'react-dom-factories'
import {AddDayForm} from './AddDayForm.coffee'
import {Menu} from './Menu.coffee'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export class App extends Component

  constructor: (props) ->
    super(props)
    this.state =
      allSkiDays: [
        {
          resort: 'Squaw Valley'
          date: '2016-01-02'
          powder: true
          backcountry: false
        }
      ]
    this.addDay = this.addDay.bind(this)

  addDay: (newDay) ->
    this.state.allSkiDays.push newDay
    this.setState(this.state.allSkiDays)

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      Menu null
      if this.props.location.pathname == '/'
        SkiDayCount {
          total: this.countDays()
          powder: this.countDays('powder')
          backcountry: this.countDays('backcountry')
        }
      else if this.props.location.pathname == '/add-day'
        ele AddDayForm, { onNewDay: this.addDay }
      else
        SkiDayList { days: this.state.allSkiDays, filter: this.props.match.params.filter }
```

Assign attributes to `onNewDay` function inside `AddDayForm.coffee`
```coffeescript
    {resort, date, powder, backcountry} = e.target.elements

    onNewDay({
      resort: resort.value
      date: date.value
      powder: powder.checked
      backcountry: backcountry.checked
    })
```

To reset attributes inside `AddDayForm.coffee`
```coffeescript
    resort.value = ''
    date.value = ''
    powder.checked = false
    backcountry.checked = false
```

src/components/AddDayForm.coffee
```coffeescript
import PropTypes from 'prop-types'
import {div, form, label, input, button} from 'react-dom-factories'

export AddDayForm = ({resort, date, powder, backcountry, onNewDay}) ->

  submit = (e) ->
    {resort, date, powder, backcountry} = e.target.elements

    onNewDay({
      resort: resort.value
      date: date.value
      powder: powder.checked
      backcountry: backcountry.checked
    })

    resort.value = ''
    date.value = ''
    powder.checked = false
    backcountry.checked = false

  form { onSubmit: submit, className: 'add-day-form' },
    label { htmlFor: 'resort' }, 'Resort Name'
    input { id: 'resort', type: 'text', defaultValue: resort, required: true}

    label { htmlFor: 'date' }, 'Date'
    input { id: 'date', type: 'date', defaultValue: date, required: true }

    div null,
      input { id: 'powder', type: 'checkbox', defaultChecked: powder }
      label { htmlFor: 'powder' }, 'Powder Day'

    div null,
      input { id: 'backcountry', type: 'checkbox', defaultChecked: backcountry }
      label { htmlFor: 'backcountry' }, 'Backcountry Day'

    button null, 'Add Day'

AddDayForm.defaultProps =
  resort: 'Kirkwood'
  date: '2017-02-12'
  powder: true
  backcountry: false

AddDayForm.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.string.isRequired
  powder: PropTypes.bool.isRequired
  backcountry: PropTypes.bool.isRequired
```

src/components/SkiDayList.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {table, thead, tbody, tr, th, td} from 'react-dom-factories'
import {Link} from 'react-router-dom'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days, filter}) ->

  filteredDays = if !filter then days else days.filter (day) -> day[filter]

  table null,
    thead null,
      tr null,
        th null, 'Date'
        th null, 'Resort'
        th null, 'Powder'
        th null, 'Backcountry'
      tr null,
        td { colSpan: 4 },
          ele Link, { to: '/list-days' }, 'All Days'
          ele Link, { to: '/list-days/powder' }, 'Powder Days'
          ele Link, { to: '/list-days/backcountry' }, 'Backcountry Days'
    tbody null,
      filteredDays.map (day, i) ->
        day.key = i
        ele SkiDayRow, day

SkiDayList.propTypes =
  days: (props) ->
    if !Array.isArray(props.days)
      new Error('SkiDayList should be an array')
    else if !props.days.length
      new Error('SkiDayList must have at least one record')
    else
      null
```

![Two-way function binding](/images/06-04-two-way-function-binding.gif)

### Adding an autocomplete component

Add a new directory and a new image.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   ├── bundle.js
  │   │   └── img                (Create a new directory)
  │   │       └── rowdy.jpg        (Add a new image)
  │   └── index.html
  ├── package-lock.json
  ├── package.json
  ├── postcss.config.js
  ├── src
  │   ├── components
  │   │   ├── AddDayForm.coffee
  │   │   ├── App.coffee
  │   │   ├── Menu.coffee
  │   │   ├── SkiDayCount.coffee
  │   │   ├── SkiDayList.coffee
  │   │   ├── SkiDayRow.coffee
  │   │   └── Whoops404.coffee
  │   ├── index.coffee
  │   └── stylesheets
  │       ├── globals.scss
  │       ├── index.scss
  │       └── ui.scss
  └── webpack.config.js
```

Please find [`rowdy.jpg`](../34ab79dff472f510335134f55524dea054762d0a/dist/assets/img/rowdy.jpg)

Add import style inside `index.coffee`
```coffeescript
import './stylesheets/index.scss'
```

Please find [`index.scss`](../34ab79dff472f510335134f55524dea054762d0a/src/stylesheets/index.scss)

src/index.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {render} from 'react-dom'
import {HashRouter, Route, Switch} from 'react-router-dom'
import {App} from './components/App.coffee'
import {Whoops404} from './components/Whoops404.coffee'
import './stylesheets/ui.scss'
import './stylesheets/index.scss'

routes =
  ele HashRouter, null,
    ele Switch, null,
      ele Route, { path: '/', exact: true, component: App }
      ele Route, { path: '/list-days', exact: true, component: App }
      ele Route, { path: '/list-days/:filter(powder|backcountry)', component: App }
      ele Route, { path: '/add-day', exact: true, component: App }
      ele Route, { component: Whoops404 }

render routes, document.getElementById('react-container')
```

Add resort name list as an array inside `AddDayForm.coffee`
```coffeescript
tahoeResorts = [
  "Alpine Meadows"
  "Boreal"
  "Diamond Peak"
  "Donner Ski Ranch"
  "Heavenly"
  "Homewood"
  "Kirkwood"
  "Mt. Rose"
  "Northstar"
  "Squaw Valley"
  "Sugar Bowl"
]
```

Add `Autocomplete` as a class inside `AddDayForm.coffee`
```coffeescript
export class Autocomplete extends Component
  get: ->
    this.refs.inputResort.value

  set: (inputValue) ->
    this.refs.inputResort.value = inputValue

  render: ->
    div null,
      input { id: 'resort', type: 'text', list: 'tahoe-resorts', defaultValue: this.refs.inputResort, required: true }
      datalist { id: 'tahoe-resorts' },
        this.props.options.map((opt, i) -> option { key: i }, opt)
```

Add the `Autocomplete` component as an element inside `AddDayForm.coffee`
```coffeescript
    ele Autocomplete, { options: tahoeResorts }
```

src/components/AddDayForm.coffee
```coffeescript
import {Component, createElement as ele} from 'react'
import PropTypes from 'prop-types'
import {div, form, label, input, button, datalist, option} from 'react-dom-factories'

tahoeResorts = [
  "Alpine Meadows"
  "Boreal"
  "Diamond Peak"
  "Donner Ski Ranch"
  "Heavenly"
  "Homewood"
  "Kirkwood"
  "Mt. Rose"
  "Northstar"
  "Squaw Valley"
  "Sugar Bowl"
]

export class Autocomplete extends Component
  get: ->
    this.refs.inputResort.value

  set: (inputValue) ->
    this.refs.inputResort.value = inputValue

  render: ->
    div null,
      input { id: 'resort', type: 'text', list: 'tahoe-resorts', defaultValue: this.refs.inputResort, required: true }
      datalist { id: 'tahoe-resorts' },
        this.props.options.map((opt, i) -> option { key: i }, opt)

export AddDayForm = ({resort, date, powder, backcountry, onNewDay}) ->

  submit = (e) ->
    {resort, date, powder, backcountry} = e.target.elements

    onNewDay({
      resort: resort.value
      date: date.value
      powder: powder.checked
      backcountry: backcountry.checked
    })

    resort.value = ''
    date.value = ''
    powder.checked = false
    backcountry.checked = false

  form { onSubmit: submit, className: 'add-day-form' },
    label { htmlFor: 'resort' }, 'Resort Name'
    ele Autocomplete, { options: tahoeResorts }

    label { htmlFor: 'date' }, 'Date'
    input { id: 'date', type: 'date', defaultValue: date, required: true }

    div null,
      input { id: 'powder', type: 'checkbox', defaultChecked: powder }
      label { htmlFor: 'powder' }, 'Powder Day'

    div null,
      input { id: 'backcountry', type: 'checkbox', defaultChecked: backcountry }
      label { htmlFor: 'backcountry' }, 'Backcountry Day'

    button null, 'Add Day'

AddDayForm.defaultProps =
  resort: 'Kirkwood'
  date: '2017-02-12'
  powder: true
  backcountry: false

AddDayForm.propTypes =
  resort: PropTypes.string.isRequired
  date: PropTypes.string.isRequired
  powder: PropTypes.bool.isRequired
  backcountry: PropTypes.bool.isRequired
```

src/components/SkiDayList.coffee
```coffeescript
import React, {createElement as ele} from 'react'
import {div, table, thead, tbody, tr, th, td} from 'react-dom-factories'
import {Link} from 'react-router-dom'
import {SkiDayRow} from './SkiDayRow.coffee'

export SkiDayList = ({days, filter}) ->

  filteredDays = if !filter then days else days.filter (day) -> day[filter]

  div { className: 'ski-day-list' },
    table null,
      thead null,
        tr null,
          th null, 'Date'
          th null, 'Resort'
          th null, 'Powder'
          th null, 'Backcountry'
        tr null,
          td { colSpan: 4 },
            ele Link, { to: '/list-days' }, 'All Days'
            ele Link, { to: '/list-days/powder' }, 'Powder Days'
            ele Link, { to: '/list-days/backcountry' }, 'Backcountry Days'
      tbody null,
        filteredDays.map (day, i) ->
          day.key = i
          ele SkiDayRow, day

SkiDayList.propTypes =
  days: (props) ->
    if !Array.isArray(props.days)
      new Error('SkiDayList should be an array')
    else if !props.days.length
      new Error('SkiDayList must have at least one record')
    else
      null
```

![Adding an autocomplete component](/images/06-05-adding-an-autocomplete-component.gif)

## 07 The Component Lifecycle
### Challenge Building the Member component

Add a new directory and new files.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── package-lock.json
  ├── package.json
  ├── postcss.config.js
  ├── src
  │   ├── components
  │   │   └── ui                    (Create new directory)
  │   │       └── Member.coffee       (Create new file)
  │   ├── index.coffee
  │   └── stylesheets
  │       └── style.scss            (Create new file)
  └── webpack.config.js
```

Add import style inside `index.coffee`
```coffeescript
import './stylesheets/style.scss'
```

src/index.coffee
```coffeescript
import {createElement as ele} from 'react'
import {render} from 'react-dom'
import {Member} from './components/ui/Member.coffee'
import './stylesheets/style.scss'

member =
  ele Member, {
    admin: true,
    name: 'Edna Welch',
    email: 'edna.welch88@example.com',
    thumbnail: 'https://randomuser.me/api/portraits/women/90.jpg',
    makeAdmin: (email) -> console.log(email)
  }

render member, document.getElementById('react-container')
```

Please find [`style.scss`](../ae36dd961760db7561e1fe74c9c32249f5739a31/src/stylesheets/style.scss)

Assign the `makeAdmin` function as the `onClick` attribute and pass `email` as a bind parameter inside `Member.coffee`
```coffeescript
    a { onClick: makeAdmin.bind(this, email) },
```

src/components/ui/Member.coffee
```coffeescript
import {div, h1, p, a, img} from 'react-dom-factories'
import {FaShieldAlt} from 'react-icons/fa'

export Member = ({name, thumbnail, email, admin, makeAdmin}) ->
  div { className: 'member' },
    h1 null,
      name
      if admin then FaShieldAlt null else null
    a { onClick: makeAdmin.bind(this, email) },
      'Make Admin'
    img { src: thumbnail, alt: 'profile picture' }
    p null,
      a { href: "mailto:#{email}" }, email
```

![Challenge Building the Member component](/images/07-01-challenge-building-the-member-component.gif)

### Challenge Building the MemberList component

Add a new file.
```
▶ react-js-essential-training
  ├── dist
  │   ├── assets
  │   │   └── bundle.js
  │   └── index.html
  ├── package-lock.json
  ├── package.json
  ├── postcss.config.js
  ├── src
  │   ├── components
  │   │   └── ui
  │   │       ├── Member.coffee
  │   │       └── MemberList.coffee       (Create a new file)
  │   ├── index.coffee
  │   └── stylesheets
  │       └── style.scss
  └── webpack.config.js
```

src/index.coffee
```coffeescript
import {createElement as ele} from 'react'
import {render} from 'react-dom'
import {MemberList} from './components/ui/MemberList.coffee'
import './stylesheets/style.scss'

member =
  ele MemberList, null

render member, document.getElementById('react-container')
```

src/components/ui/MemberList.coffee
```coffeescript
import {createElement as ele} from 'react'
import {div, h1} from 'react-dom-factories'
import {Member} from './Member.coffee'

members = [
  {
    name: "Joe Wilson",
    email: "joe.wilson@example.com",
    thumbnail: "https://randomuser.me/api/portraits/men/53.jpg"
  }
  {
    name: "Stacy Gardner",
    email: "stacy.gardner@example.com",
    thumbnail: "https://randomuser.me/api/portraits/women/74.jpg"
  }
  {
    name: "Billy Young",
    email: "billy.young@example.com",
    thumbnail: "https://randomuser.me/api/portraits/men/34.jpg"
  }
]

export MemberList = ->
  div { className: 'member-list' },
    h1 null,
      'Society Members'
    members.map((data, i) ->
      ele Member, { key: i, data..., makeAdmin: (email) -> console.log(email) })
```

![Challenge Building the MemberList component](/images/07-02-challenge-building-the-memberList-component.gif)

### Understanding the mounting lifecycle

Define `self` as to access `this` across the scope inside `fetch` function inside `MemberList.coffee`
```coffeescript
    self = this
```

Use `fetch` function to get members as json from the [`randomuser`](https://randomuser.me/) api inside `MemberList.coffee`
```coffeescript
    fetch 'https://api.randomuser.me/?nat=US&results=12'
      .then (response) -> response.json()
      .then (json) -> json.results
      .then (members) ->
        self.setState {
          members,
          loading: false
        }
```

[![Random User API](/images/07-03-random-user-api.png)](https://api.randomuser.me/?nat=US&results=12)

src/components/ui/MemberList.coffee
```coffeescript
import {Component, createElement as ele} from 'react'
import {div, h1, span} from 'react-dom-factories'
import {Member} from './Member.coffee'

export class MemberList extends Component

  constructor: (props) ->
    super(props)
    this.state = {
      members: []
      loading: false
    }

  componentDidMount: ->
    self = this

    self.setState {
      loading: true
    }

    fetch 'https://api.randomuser.me/?nat=US&results=12'
      .then (response) -> response.json()
      .then (json) -> json.results
      .then (members) ->
        self.setState {
          members,
          loading: false
        }

  render: ->
    {members, loading} = this.state
    div { className: 'member-list' },
      h1 null,
        'Society Members'

      if loading
        span null, 'loading...'
      else
        span null, "#{members.length} members"

      if members.length
        members.map((member, i) ->
          ele Member, {
            key: i
            name: "#{member.name.first} #{member.name.last}"
            email: member.email
            thumbnail: member.picture.thumbnail
            makeAdmin: (email) -> console.log(email)
          })
      else
        span null, 'Currently 0 Members'
```

![Understanding the mounting lifecycle](/images/07-03-understanding-the-mounting-lifecycle.gif)

### Understanding the updating lifecycle

src/components/ui/MemberList.coffee
```coffeescript
import {Component, createElement as ele} from 'react'
import {div, h1, span} from 'react-dom-factories'
import {Member} from './Member.coffee'

export class MemberList extends Component

  constructor: (props) ->
    super(props)
    this.state = {
      members: []
      loading: false
      administrators: []
    }

    this.makeAdmin = this.makeAdmin.bind(this)
    this.removeAdmin = this.removeAdmin.bind(this)

  componentDidMount: ->
    self = this

    self.setState {
      loading: true
    }

    fetch 'https://api.randomuser.me/?nat=US&results=12'
      .then (response) -> response.json()
      .then (json) -> json.results
      .then (members) ->
        self.setState {
          members,
          loading: false
        }

  makeAdmin: (email) ->
    unless this.state.administrators.includes(email)
      this.setState {
        administrators: [this.state.administrators..., email]
      }

  removeAdmin: (email) ->
    this.setState {
      administrators: this.state.administrators.filter((adminEmail) -> adminEmail != email)
    }

  render: ->
    {makeAdmin, removeAdmin} = this
    {administrators, members, loading} = this.state

    div { className: 'member-list' },
      h1 null,
        'Society Members'

      if loading
        span null, 'loading...'
      else
        span null, "#{members.length} members"

      if members.length
        members.map((member, i) ->
          ele Member, {
            key: i
            admin: administrators.some((adminEmail) -> adminEmail == member.email)
            name: "#{member.name.first} #{member.name.last}"
            email: member.email
            thumbnail: member.picture.thumbnail
            makeAdmin: makeAdmin
            removeAdmin: removeAdmin
          })
      else
        span null, 'Currently 0 Members'
```

src/components/ui/Member.coffee
```coffeescript
import {Component} from 'react'
import {div, h1, p, a, img} from 'react-dom-factories'
import {FaShieldAlt} from 'react-icons/fa'

export class Member extends Component

  componentWillUpdate: (nextProps) ->
    this.style = { backgroundColor: if nextProps.admin then 'deepskyblue' else null }

  render: ->
    {name, thumbnail, email, admin, makeAdmin, removeAdmin} = this.props

    div { className: 'member', style: this.style },
      h1 null,
        name
        if admin then FaShieldAlt null else null

      if admin
        a { onClick: () -> removeAdmin(email) }, 'Remove Admin'
      else
        a { onClick: () -> makeAdmin(email) }, 'Make Admin'

      img { src: thumbnail, alt: 'profile picture' }
      p null,
        a { href: "mailto:#{email}" }, email
```

![Understanding the updating lifecycle](/images/07-04-understanding-the-updating-lifecycle.gif)
