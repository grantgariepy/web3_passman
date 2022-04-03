import React from 'react';
import ReactDOM from 'react-dom';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import App from './App';
import * as ReactDOMClient from 'react-dom/client';

const container = document.getElementById('root');

const root = ReactDOMClient.createRoot(container);

root.render(
  <App />
);
