import { useState } from 'react';
import './App.css';

function App() {
  const [tableData, setTableData] = useState(null);

  window.ShowRecords = function (data) {
    console.log(data);
    setTableData(data);
  };

  return (
    <div className="table-responsive-sm">
      {tableData &&
        <table className="table table-sm table-bordered">
          <tr>
            {tableData.fields.map((f, i) =>
              <th key={i}>{f.fieldName}</th>
            )}
          </tr>
          {tableData.records.map((r, i) =>
            <tr key={i}>
              {Object.keys(r).map((key, i) => 
                <td key={i}>{r[key]}</td>
              )}
            </tr>
          )}
        </table>
      }
    </div>
  );
}

export default App;
