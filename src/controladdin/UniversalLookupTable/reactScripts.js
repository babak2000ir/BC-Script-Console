'use strict';

const e = React.createElement;

function App() {
    return e(
      'button',
      { onClick: () => console.log('Tricks!') },
      'Like'
    );

}