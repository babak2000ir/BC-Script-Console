const dynamicsNav = Microsoft.Dynamics.NAV; 
//const environment = dynamicsNav.GetEnvironment(); 

const domContainer = document.querySelector('#controlAddIn');
ReactDOM.render(e(App), domContainer);
 
  
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