import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import ResponsiveRouterHome from "./Pages/Home/ResponsiveRouter";
import ResponsiveRouterMainPage from "./Pages/MainPage/ResponsiveRouter";
import {Provider} from 'react-redux';
import { createStore } from 'redux';
import rootReducers from './Reducers';

const store = createStore(rootReducers)

const Pages = () => {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <Routes>
            <Route exact path = "/" element = {<ResponsiveRouterHome/>} />
            <Route exact path = "/main_page" element = {<ResponsiveRouterMainPage/>} />
        </Routes>
      </BrowserRouter>
    </Provider>
  )
}

ReactDOM.render(
  <Pages/>
  ,
  document.querySelector('.root')
);