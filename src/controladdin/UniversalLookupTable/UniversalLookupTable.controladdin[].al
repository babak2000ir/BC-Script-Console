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
    Scripts =
        'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js';
    //Dev
    //'https://unpkg.com/react@17/umd/react.development.js',
    //'https://unpkg.com/react-dom@17/umd/react-dom.development.js';
    //Production
    //'https://unpkg.com/react@17/umd/react.production.min.js',
    //'https://unpkg.com/react-dom@17/umd/react-dom.production.min.js';

    StyleSheets =
        'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css',
        'src\controladdin\UniversalLookupTable\style.css';
    StartupScript = 'src\controladdin\UniversalLookupTable\startupScript.js';

    event IsReady()
    procedure ShowRecords(pData: JsonObject)
}