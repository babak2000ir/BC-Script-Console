import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const dynamicsNav = window.Microsoft.Dynamics.NAV;

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.querySelector('#controlAddIn'),
  () => {
    dynamicsNav.InvokeExtensibilityMethod('IsReady', []);
  }
);

reportWebVitals();
