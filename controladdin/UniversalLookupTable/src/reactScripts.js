'use strict';

var e = React.createElement;

function App() {
  var _this = this;

  return React.createElement(
    'button',
    { onClick: function onClick() {
        return _this.setState({ liked: true });
      } },
    'Like'
  );
}