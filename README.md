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
