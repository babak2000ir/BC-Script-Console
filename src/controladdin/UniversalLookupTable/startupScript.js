var _slicedToArray = function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"]) _i["return"](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError("Invalid attempt to destructure non-iterable instance"); } }; }();

var dynamicsNav = Microsoft.Dynamics.NAV;
//const environment = dynamicsNav.GetEnvironment(); 
var domContainer = document.querySelector('#controlAddIn');
function navEventDeligate(data) {
    dynamicsNav.InvokeExtensibilityMethod('MyEvent', [data]);
}
//ReactDOM.render(App({ callNavEvent: navEventDeligate, messageFromNav:"init" }), domContainer);
ReactDOM.render(React.createElement(App, { callNavEvent: navEventDeligate }), domContainer);

//React
function App(props) {
    var _React$useState = React.useState('...'),
        _React$useState2 = _slicedToArray(_React$useState, 2),
        messageFromNav = _React$useState2[0],
        setMessageFromNav = _React$useState2[1];

    //Nav Handlers


    window.MyProcedure = function (data) {
        console.log(data);
        setMessageFromNav(data);
        //ReactDOM.render(App({ callNavEvent: navEventDeligate, messageFromNav:data }), domContainer);
    };

    return React.createElement(
        'div',
        null,
        React.createElement(
            'button',
            { onClick: function onClick() {
                    return props.callNavEvent('called from react app');
                } },
            'Call Nav'
        ),
        React.createElement(
            'div',
            null,
            messageFromNav
        )
    );
}

//Load babel transpiler
/* let babelTranspilerContainer = document.createElement('script');
babelTranspilerContainer.setAttribute('src', 'https://unpkg.com/@babel/standalone/babel.min.js');
domContainer.appendChild(babelTranspilerContainer); */

//const userName = environment.UserName;  
//const companyName = environment.CompanyName;  

// environment.OnBusyChanged = function()   
// {  
//     if (environment.Busy) {  
//         // The client is now busy.  
//     }  
//     else {  
//         // The client is not busy anymore.  
//     }   
// }