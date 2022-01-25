const dynamicsNav = Microsoft.Dynamics.NAV; 
//const environment = dynamicsNav.GetEnvironment(); 
const domContainer = document.querySelector('#controlAddIn');
function navEventDeligate(data) {
    dynamicsNav.InvokeExtensibilityMethod('MyEvent',[data])
}
//ReactDOM.render(App({ callNavEvent: navEventDeligate, messageFromNav:"init" }), domContainer);
ReactDOM.render(<App callNavEvent = {navEventDeligate} />, domContainer);

//React
function App(props) {
    const [messageFromNav, setMessageFromNav] = React.useState('...');

    //Nav Handlers
    window.MyProcedure = function(data) {
        console.log(data);
        setMessageFromNav(data);
        //ReactDOM.render(App({ callNavEvent: navEventDeligate, messageFromNav:data }), domContainer);
    }

    return (
        <div>
            <button onClick={() => props.callNavEvent('called from react app') }>
                Call Nav
            </button>
            <div>{messageFromNav}</div>
        </div>
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