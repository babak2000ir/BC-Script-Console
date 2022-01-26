controladdin "Universal Lookup Table"
{
    //RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 700;
    //RequestedWidth = 700;
    //MinimumWidth = 700;
    //MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    //Scripts =
    //Dev
    //'https://unpkg.com/react@17/umd/react.development.js',
    //'https://unpkg.com/react-dom@17/umd/react-dom.development.js';
    //Production
    //'https://unpkg.com/react@17/umd/react.production.min.js',
    //'https://unpkg.com/react-dom@17/umd/react-dom.production.min.js';

    StyleSheets = 'src\controladdin\UniversalLookupTable\style.css';
    StartupScript = 'src\controladdin\UniversalLookupTable\startupScript.js';

    event IsReady()
    procedure ShowRecords(pData: JsonObject)
}