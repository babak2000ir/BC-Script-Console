controladdin "Universal Lookup Table"
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 300;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =
        //Dev
        'https://unpkg.com/react@17/umd/react.development.js',
        'https://unpkg.com/react-dom@17/umd/react-dom.development.js',
        'src\controladdin\UniversalLookupTable\reactScripts.js';
    //Production
    //'https://unpkg.com/react@17/umd/react.production.min.js',
    //'https://unpkg.com/react-dom@17/umd/react-dom.production.min.js';
    //StyleSheets =
    //'style.css';
    StartupScript = 'src\controladdin\UniversalLookupTable\startupScript.js';
    //RecreateScript = 'src\controladdin\UniversalLookupTable\recreateScript.js';
    RefreshScript = 'src\controladdin\UniversalLookupTable\refreshScript.js';
    //Images =
    //'image1.png',
    //'image2.png';

    event MyEvent()

    procedure MyProcedure()
}