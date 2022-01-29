import { useState } from 'react';
import './App.css';

function App() {
  const [tableData, setTableData] = useState(null);

  window.ShowRecords = function (data) {
    setTableData(data);
  };

  return (
    // <div>
    //   {tableData &&
    //     <table>
    //       <thead>
    //         <tr>
    //           {tableData.fields.map((f, i) =>
    //             <th key={i}>{f.fieldName}</th>
    //           )}
    //         </tr>
    //       </thead>
    //       <tbody>
    //         {tableData.records.map((r, i) =>
    //           <tr key={i}>
    //             {Object.keys(r).map((key, i) =>
    //               <td key={i}>{r[key]}</td>
    //             )}
    //           </tr>
    //         )}
    //       </tbody>
    //     </table>
    //   }
    // </div>
    <div className="ms-nav-layout-content" >
      <div id="bf0" className="ms-nav-listform">
        <div className="ms-nav-grid-horizontal-container ms-nav-grid-container" id="bjz">
          <div role="grid" aria-labelledby="Caption_BusinessGrid_bjz" aria-describedby="Summary_BusinessGrid_bjz"
            aria-multiselectable="true" aria-readonly="true"
            className="ms-nav-grid-vertical-container thm-cont-g1-bgcolor" aria-rowcount="6">
            <div style={{ overflow: 'hidden' }}>
              {tableData &&
                <table className="ms-nav-grid ms-nav-grid-view ms-nav-grid-header-table" role="presentation"
                  data-focus-zone="true">
                  <thead>
                    <tr role="row" aria-selected="false">
                      <th className="icon-column" aria-label="Error" scope="col" role="columnheader"></th>
                      <th className="icon-column grid-selection-column" scope="col" role="presentation"
                        aria-hidden="true" aria-label="Selected" tabindex="-1">
                        <div tabindex="-1" role="checkbox" title="Select all rows"
                          className="grid-selection-column-checkbox-wrapper" aria-checked="false"><input
                            type="checkbox"
                            className="ms-nav-grid-rowselectioncheckbox thm-cont-s2-bgcolor-1--checked-label thm-cont-s2-color-1--medtint--checked-label--pseudo_before thm-cont-s2-color-1--medtint--checked-label--pseudo_after"
                            tabindex="-1" aria-hidden="true" id="gridSelectAllCheckBox-bjz" /><label
                              className="ms-nav-check-circle thm-cont-s2-subd-bgcolor-1 thm-cont-s2-subd-color-1--pseudo_before thm-cont-s2-subd-color-1--pseudo_after"
                              for="gridSelectAllCheckBox-bjz"></label></div>
                      </th>
                      {/* Headers for Key Columns */}
                      {tableData.keyFields.map((f, i) =>
                        <th key={i} className="thm-cont-h1-bgcolor--hover ms-nav-contextmenu-trigger" abbr="No." scope="col"
                          role="columnheader" style={{ width: '15ex' }} aria-haspopup="menu" aria-expanded="false"
                          aria-sort="Ascending">
                          <div className="columncaption columncaption-leftalign" style={{ minWidth: '68px' }}><a
                            draggable="false" href="#" role="button"
                            className="thm-cont-c5-font-size thm-cont-c5-font-stack thm-cont-c5-color--medflat"
                            id="column_header_bkb" data-sorting-column-link="true" title="Sort on 'No.'"
                            data-tabbable="true" data-prev-tabindex="-1" tabindex="0"
                            aria-label="No., sorted in Ascending order">{f.fieldName}</a><span
                              className="sorting-indicator ms-sortarrowup-iconouter"><img draggable="false"
                                alt="Ascending"
                                src="https://msweuukwas9245-5yjv1s0.appservices.weu.businesscentral.dynamics.com/tenant/msweua9310t43940225/tab/e8b5e5f3-a514-420d-8709-c60c88364eae/Resources/Images/sortingUpArrow.png?_v=19.0.32956.35344" /></span><span
                                  className="filteredIndicator ms-nav-hidden"><img draggable="false" alt=""
                                    src="https://msweuukwas9245-5yjv1s0.appservices.weu.businesscentral.dynamics.com/tenant/msweua9310t43940225/tab/e8b5e5f3-a514-420d-8709-c60c88364eae/Resources/Images/BLANK.GIF?_v=19.0.32956.35344" /></span>
                          </div>
                          <div className="ms-nav-grid-columncaption-ctxmenuarrow"><a draggable="false"
                            title="Open Menu" href="#"
                            className="ms-nav-grid-columncaption-ctxmenuarrowlink icon-DownCaretSmall"
                            role="button" aria-haspopup="true" aria-expanded="false"
                            aria-label="Open menu for No." data-tabbable="true" data-prev-tabindex="0"
                            tabindex="-1"></a></div><button type="button"
                              className="column-resize-bar thm-cont-s2-bgcolor-1--hover thm-cont-s2-bgcolor-1--focus"
                              tabindex="-1" aria-hidden="true"><span className="left-area"></span><span
                                className="right-area wide-hover-area"></span></button>
                        </th>
                      )}
                      <th className="contextmenu-column freeze-pane-border" scope="col" role="columnheader"
                        aria-label="More Options" draggable="false">
                        <div></div>
                      </th>
                      {/* Headers for Rest of the fields */}
                      {tableData.fields.map((f, i) =>
                        <th key={i} className="thm-cont-h1-bgcolor--hover ms-nav-contextmenu-trigger" abbr="Name"
                          scope="col" role="columnheader" style={{ width: '35ex' }} aria-haspopup="menu"
                          aria-expanded="false">
                          <div className="columncaption columncaption-leftalign" style={{ minWidth: '188px' }}><a
                            draggable="false" href="#" role="button"
                            className="thm-cont-c5-font-size thm-cont-c5-font-stack thm-cont-c5-color--medflat"
                            id="column_header_bka" data-sorting-column-link="true"
                            title="Sort on 'Name'" data-tabbable="true" data-prev-tabindex="-1"
                            tabindex="-1">{f.fieldName}</a><span className="filteredIndicator ms-nav-hidden"><img
                              draggable="false" alt=""
                              src="https://msweuukwas9245-5yjv1s0.appservices.weu.businesscentral.dynamics.com/tenant/msweua9310t43940225/tab/e8b5e5f3-a514-420d-8709-c60c88364eae/Resources/Images/BLANK.GIF?_v=19.0.32956.35344" /></span>
                          </div>
                          <div className="ms-nav-grid-columncaption-ctxmenuarrow"><a draggable="false"
                            title="Open Menu" href="#"
                            className="ms-nav-grid-columncaption-ctxmenuarrowlink icon-DownCaretSmall"
                            role="button" aria-haspopup="true" aria-expanded="false"
                            aria-label="Open menu for Name" data-tabbable="true" data-prev-tabindex="0"
                            tabindex="-1"></a></div><button type="button"
                              className="column-resize-bar thm-cont-s2-bgcolor-1--hover thm-cont-s2-bgcolor-1--focus"
                              tabindex="-1" aria-hidden="true"><span className="left-area"></span><span
                                className="right-area"></span></button>
                        </th>
                      )}

                      <th className="freeze-pane-padding show-freeze-pane-padding" style={{ width: '0px' }}
                        draggable="false">
                        <div></div>
                      </th>
                    </tr>
                  </thead>
                </table>
              }
            </div>
            <div className="ms-nav-scrollable thm-cont-g1-bgcolor">
              {tableData ?
                <table id="BusinessGrid_bjz" role="presentation"
                  className="ms-nav-grid ms-nav-grid-view ms-nav-grid-data-table ms-nav-grid-header-hide thm-cont-g1-bgcolor">
                  <caption id="Caption_BusinessGrid_bjz" className="ms-nav-hidden">Customer List</caption>
                  <div id="Summary_BusinessGrid_bjz" role="presentation" className="ms-nav-hidden">Press Ctrl+Enter to
                    move to the next element after the table.</div>
                  <thead aria-hidden="true" role="rowgroup">
                    <tr role="row">
                      <th className="icon-column" aria-label="Error" scope="col" role="columnheader"></th>
                      <th className="icon-column grid-selection-column" scope="col" role="presentation"
                        aria-hidden="true" aria-label="Selected" tabindex="-1">
                        <div tabindex="-1" role="checkbox" title="Select all rows"
                          className="grid-selection-column-checkbox-wrapper"><input type="checkbox"
                            className="ms-nav-grid-rowselectioncheckbox thm-cont-s2-bgcolor-1--checked-label thm-cont-s2-color-1--medtint--checked-label--pseudo_before thm-cont-s2-color-1--medtint--checked-label--pseudo_after"
                            tabindex="-1" aria-hidden="true" /><label
                              className="ms-nav-check-circle thm-cont-s2-subd-bgcolor-1 thm-cont-s2-subd-color-1--pseudo_before thm-cont-s2-subd-color-1--pseudo_after"
                              for="gridSelectAllCheckBox-bjz"></label></div>
                      </th>
                      <th className="thm-cont-h1-bgcolor--hover" abbr="No." scope="col" role="columnheader"
                        style={{ width: '15ex' }} aria-expanded="false" aria-sort="Ascending"></th>
                      <th className="contextmenu-column" scope="col" role="columnheader"
                        aria-label="More Options">
                        <div></div>
                      </th>
                      <th className="thm-cont-h1-bgcolor--hover" abbr="Name" scope="col" role="columnheader"
                        style={{ width: '35ex' }} aria-expanded="false"></th>
                      <th className="freeze-pane-padding show-freeze-pane-padding" style={{ width: '0px' }}></th>
                    </tr>
                    <tr className="ms-nav-hidden" style={{ height: '0px' }}>
                      <td colspan="13" style={{ border: '0px' }}></td>
                    </tr>
                  </thead>
                  <tbody data-focus-zone="true">
                    {tableData.records.map((r, i) =>
                      <tr key={i} rowkey="bmh" role="row" className="thm-cont-g0-bgcolor real-current" aria-selected="true"
                        aria-rowindex="1">
                        <td role="rowheader" tabindex="-1" scope="row"
                          className="thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-left--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid">
                        </td>
                        <td aria-hidden="true" role="presentation"
                          className="grid-selection-column thm-cont-g3-bdrcolor--border-top thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid"
                          tabindex="-1">
                          <div title="Select row" className="grid-selection-column-checkbox-wrapper" tabindex="-1"
                            role="checkbox" aria-checked="true"><input type="checkbox"
                              className="ms-nav-grid-rowselectioncheckbox" tabindex="-1" aria-hidden="true"
                              id="rowSelectCheckBox-bmh" /><label
                                className="ms-nav-check-circle thm-cont-s2-subd-bgcolor-1 thm-cont-s2-subd-color-1--pseudo_before thm-cont-s2-subd-color-1--pseudo_after thm-cont-s2-subd-bgcolor-1--grid-row-nosel-hovered thm-cont-s2-subd-color-1--grid-row-nosel-hovered--pseudo_before thm-cont-s2-subd-color-1--grid-row-nosel-hovered--pseudo_after thm-cont-s2-bgcolor-1--grid-row-selected thm-cont-s2-color-1--medtint--grid-row-selected--pseudo_before thm-cont-s2-color-1--medtint--grid-row-selected--pseudo_after"
                                data-focusable="true" data-prev-tabindex="-1" tabindex="-1"
                                for="rowSelectCheckBox-bmh"></label></div>
                        </td>
                        {Object.keys(r).map((key, i) =>
                          <td key={i} aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                            role="gridcell"
                            className="thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid edit-container edit-container-read"
                            controlname="No." aria-selected="true"><a draggable="false"
                              className="stringcontrol-read value thm-cont-u1-font-size-2--medflat thm-cont-u1-font-stack-2--medflat thm-cont-u1-color-3--medflat thm-cont-u1-color-3--medtint--grid-row-selected thm-cont-u1-color-3--mintint--grid-row-nosel-hovered thm-cont-g2-bgcolor-2 thm-cont-s1-bdrcolor--focus thm-cont-s1-outlinecolor--focus"
                              href="#" data-tabbable="true" data-prev-tabindex="-1" tabindex="0" id="bjnee"
                              role="button" title="Open record &quot;10000&quot;"
                              aria-labelledby="column_header_bkb bjnee">{r[key]}</a>
                          </td>
                        )}
                        <td role="gridcell"
                          className="ms-list-itemLink-td ms-cellstyle thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor--hover--grid-row-nosel-hovered thm-cont-g0-bgcolor-1--grid-row-nosel-hovered thm-cont-s1-bgcolor--grid-row-selected thm-cont-s2-bgcolor--hover--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid--multiselect-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-s1-bgcolor--grid-row-selected-current--multiselect-grid frozen-column-auto"
                          tabindex="-1"><a draggable="false" role="button" href="#" tabindex="-1"
                            className="ms-list-itemLink thm-cont-a2-icon-color--maxtint30--grid-row-current thm-glob-c0-icon-color thm-cont-s1-bdrcolor thm-cont-a2-icon-color--medtint30--grid-row-hovered icon-VertEllipsis thm-cont-s2-bgcolor--focus thm-cont-s2-bgcolor--states_opened ms-nav-contextmenu-trigger"
                            title="Show more options" data-tabbable="true" data-prev-tabindex="0"
                            aria-haspopup="menu" aria-expanded="false"></a></td>
                        <td aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                          role="gridcell"
                          className="thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid edit-container edit-container-read"
                          controlname="Name"><span
                            className="stringcontrol-read value thm-cont-u1-font-size-2--medflat thm-cont-u1-font-stack-2--medflat thm-cont-u1-color-2--medflat thm-cont-u1-color-2--medtint--grid-row-selected thm-cont-u1-color-2--mintint--grid-row-nosel-hovered thm-cont-g2-bgcolor-2 thm-cont-s1-bdrcolor--focus thm-cont-s1-outlinecolor--focus"
                            data-tabbable="true" data-prev-tabindex="-1" tabindex="-1" id="bjoee"
                            role="textbox" aria-readonly="true" title="Adatum Corporation"
                            aria-labelledby="column_header_bka">Adatum Corporation</span></td>

                        <td className="ms-nav-hidden thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid"
                          aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                          role="gridcell"></td>
                        <td className="ms-nav-hidden thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid thm-cont-g3-bdrcolor--border-bottom--edit-mode-grid"
                          aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                          role="gridcell"></td>
                        <td className="freeze-pane-padding-border" tabindex="-1" aria-hidden="true"
                          style={{ width: '0px' }}></td>
                      </tr>
                    )}
                    {/* <tr rowkey="bmu" role="row" className="thm-cont-g0-bgcolor" aria-selected="false"
                      aria-rowindex="2">
                      <td role="rowheader" tabindex="-1" scope="row"
                        className="thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-left--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid">
                      </td>
                      <td aria-hidden="true" role="presentation"
                        className="grid-selection-column thm-cont-g3-bdrcolor--border-top thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid"
                        tabindex="-1">
                        <div title="Select row" className="grid-selection-column-checkbox-wrapper" tabindex="-1"
                          role="checkbox" aria-checked="false"><input type="checkbox"
                            className="ms-nav-grid-rowselectioncheckbox" tabindex="-1" aria-hidden="true"
                            id="rowSelectCheckBox-bmu" /><label
                              className="ms-nav-check-circle thm-cont-s2-subd-bgcolor-1 thm-cont-s2-subd-color-1--pseudo_before thm-cont-s2-subd-color-1--pseudo_after thm-cont-s2-subd-bgcolor-1--grid-row-nosel-hovered thm-cont-s2-subd-color-1--grid-row-nosel-hovered--pseudo_before thm-cont-s2-subd-color-1--grid-row-nosel-hovered--pseudo_after thm-cont-s2-bgcolor-1--grid-row-selected thm-cont-s2-color-1--medtint--grid-row-selected--pseudo_before thm-cont-s2-color-1--medtint--grid-row-selected--pseudo_after"
                              data-focusable="true" data-prev-tabindex="-1" tabindex="-1"
                              for="rowSelectCheckBox-bmu"></label></div>
                      </td>
                      <td aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"
                        className="thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid edit-container edit-container-read">
                        <a draggable="false"
                          className="stringcontrol-read value thm-cont-u1-font-size-2--medflat thm-cont-u1-font-stack-2--medflat thm-cont-u1-color-3--medflat thm-cont-u1-color-3--medtint--grid-row-selected thm-cont-u1-color-3--mintint--grid-row-nosel-hovered thm-cont-g2-bgcolor-2 thm-cont-s1-bdrcolor--focus thm-cont-s1-outlinecolor--focus"
                          href="#" data-tabbable="true" data-prev-tabindex="0" tabindex="-1" id="bmvee"
                          role="button" title="Open record &quot;20000&quot;"
                          aria-labelledby="column_header_bkb bmvee">20000</a></td>

                      <td className="ms-nav-hidden thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid"
                        aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"></td>
                      <td className="ms-nav-hidden thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid thm-cont-g3-bdrcolor--border-bottom--edit-mode-grid"
                        aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"></td>
                      <td className="freeze-pane-padding-border" tabindex="-1" aria-hidden="true"
                        style={{ width: '0px' }}></td>
                    </tr>
                    <tr rowkey="bn7" role="row" className="thm-cont-g0-bgcolor" aria-selected="false"
                      aria-rowindex="3">
                      <td role="rowheader" tabindex="-1" scope="row"
                        className="thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-left--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid">
                      </td>
                      <td aria-hidden="true" role="presentation"
                        className="grid-selection-column thm-cont-g3-bdrcolor--border-top thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid"
                        tabindex="-1">
                        <div title="Select row" className="grid-selection-column-checkbox-wrapper" tabindex="-1"
                          role="checkbox" aria-checked="false"><input type="checkbox"
                            className="ms-nav-grid-rowselectioncheckbox" tabindex="-1" aria-hidden="true"
                            id="rowSelectCheckBox-bn7" /><label
                              className="ms-nav-check-circle thm-cont-s2-subd-bgcolor-1 thm-cont-s2-subd-color-1--pseudo_before thm-cont-s2-subd-color-1--pseudo_after thm-cont-s2-subd-bgcolor-1--grid-row-nosel-hovered thm-cont-s2-subd-color-1--grid-row-nosel-hovered--pseudo_before thm-cont-s2-subd-color-1--grid-row-nosel-hovered--pseudo_after thm-cont-s2-bgcolor-1--grid-row-selected thm-cont-s2-color-1--medtint--grid-row-selected--pseudo_before thm-cont-s2-color-1--medtint--grid-row-selected--pseudo_after"
                              data-focusable="true" data-prev-tabindex="-1" tabindex="-1"
                              for="rowSelectCheckBox-bn7"></label></div>
                      </td>
                      <td aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"
                        className="thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid edit-container edit-container-read">
                        <a draggable="false"
                          className="stringcontrol-read value thm-cont-u1-font-size-2--medflat thm-cont-u1-font-stack-2--medflat thm-cont-u1-color-3--medflat thm-cont-u1-color-3--medtint--grid-row-selected thm-cont-u1-color-3--mintint--grid-row-nosel-hovered thm-cont-g2-bgcolor-2 thm-cont-s1-bdrcolor--focus thm-cont-s1-outlinecolor--focus"
                          href="#" data-tabbable="true" data-prev-tabindex="0" tabindex="-1" id="bn8ee"
                          role="button" title="Open record &quot;30000&quot;"
                          aria-labelledby="column_header_bkb bn8ee">30000</a></td>
                      <td role="gridcell"
                        className="ms-list-itemLink-td ms-cellstyle thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor--hover--grid-row-nosel-hovered thm-cont-g0-bgcolor-1--grid-row-nosel-hovered thm-cont-s1-bgcolor--grid-row-selected thm-cont-s2-bgcolor--hover--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid--multiselect-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-s1-bgcolor--grid-row-selected-current--multiselect-grid frozen-column-auto"
                        tabindex="-1"><a draggable="false" role="button" href="#" tabindex="-1"
                          className="ms-list-itemLink thm-cont-a2-icon-color--maxtint30--grid-row-current thm-glob-c0-icon-color thm-cont-s1-bdrcolor thm-cont-a2-icon-color--medtint30--grid-row-hovered icon-VertEllipsis thm-cont-s2-bgcolor--focus thm-cont-s2-bgcolor--states_opened"
                          title="Show more options" data-tabbable="true" data-prev-tabindex="0"></a></td>
                      <td aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"
                        className="thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid edit-container edit-container-read">
                        <span
                          className="stringcontrol-read value thm-cont-u1-font-size-2--medflat thm-cont-u1-font-stack-2--medflat thm-cont-u1-color-2--medflat thm-cont-u1-color-2--medtint--grid-row-selected thm-cont-u1-color-2--mintint--grid-row-nosel-hovered thm-cont-g2-bgcolor-2 thm-cont-s1-bdrcolor--focus thm-cont-s1-outlinecolor--focus"
                          data-tabbable="true" data-prev-tabindex="-1" tabindex="-1" id="bn9ee"
                          role="textbox" aria-readonly="true" title="School of Fine Art"
                          aria-labelledby="column_header_bka">School of Fine Art</span></td>

                      <td aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"
                        className="thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid edit-container right edit-container-read">
                        <a draggable="false"
                          className="stringcontrol-read value thm-cont-u1-font-size-2--medflat thm-cont-u1-font-stack-2--medflat thm-cont-u1-color-3--medflat thm-cont-u1-color-3--medtint--grid-row-selected thm-cont-u1-color-3--mintint--grid-row-nosel-hovered thm-cont-g2-bgcolor-2 thm-cont-s1-bdrcolor--focus thm-cont-s1-outlinecolor--focus"
                          href="#" data-tabbable="true" data-prev-tabindex="0" tabindex="-1" id="bnhee"
                          role="button" title="Open record &quot;112,250.30&quot;"
                          aria-labelledby="column_header_bk2 bnhee">112,250.30</a></td>
                      <td className="ms-nav-hidden thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid"
                        aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"></td>
                      <td className="ms-nav-hidden thm-cont-g3-bdrcolor--border-top thm-cont-g3-bdrcolor--border-right--edit-mode-grid thm-cont-h1-bgcolor-1--safe-sel-l1-hover--view-mode-grid thm-cont-h1-bgcolor--hover--edit-mode-grid thm-cont-s1-bgcolor--grid-row-selected thm-cont-g0-bgcolor--grid-row-selected--edit-mode-grid thm-cont-s1-bgcolor--grid-row-current--multiselect-grid thm-cont-g0-bgcolor--grid-row-current--edit-mode-grid thm-cont-g3-bdrcolor--border-bottom--edit-mode-grid"
                        aria-readonly="true" tabindex="-1" data-focusable="true" data-prev-tabindex="-1"
                        role="gridcell"></td>
                      <td className="freeze-pane-padding-border" tabindex="-1" aria-hidden="true"
                        style={{ width: '0px' }}></td>
                    </tr> */}
                  </tbody>
                  <tfoot>
                    <tr className="ms-nav-hidden" style={{ height: '0px' }}>
                      <td colspan="13" style={{ border: '0px' }}></td>
                    </tr>
                  </tfoot>
                </table> :
                <div className="grid-emptyrowmessage" style={{ display: 'none' }}><span>(There is nothing to show in this view)</span>
                </div>
              }
            </div>
            <div className="freeze-pane-scrollbar">
              <div className="freeze-pane-scrollbar-div" style={{ width: '1357px' }}></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
