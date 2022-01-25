var dynamicsNav = Microsoft.Dynamics.NAV;
//const environment = dynamicsNav.GetEnvironment(); 
var domContainer = document.querySelector('#controlAddIn');

//Add reactRoot div for react renderer
var reactRoot = document.createElement('div');
reactRoot.setAttribute('id', 'reactRoot');
domContainer.appendChild(reactRoot);

//Add a script tag to transpile JSX/Babel
var babelScriptContainer = document.createElement('script');
babelScriptContainer.setAttribute('type', 'text/babel');
babelScriptContainer.textContent = '\nReactDOM.render(<button onClick={() => console.log(\'Hump\') }>\nLike\n</button>, document.getElementById(\'reactRoot\'));';
domContainer.appendChild(babelScriptContainer);

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