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
