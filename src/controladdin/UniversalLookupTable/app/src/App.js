import { useState } from 'react';
import './App.css';
import Table from 'react-bootstrap/Table';
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
  const [tableData, setTableData] = useState(null);

  window.ShowRecords = function (data) {
    setTableData(data);
  };

  return (
    <div>
      {tableData &&
        <Table responsive striped bordered hover size="sm">
          <thead>
            <tr>
              {tableData.fields.map((f, i) =>
                <th key={i}>{f.fieldName}</th>
              )}
            </tr>
          </thead>
          <tbody>
            {tableData.records.map((r, i) =>
              <tr key={i}>
                {Object.keys(r).map((key, i) =>
                  <td key={i}>{r[key]}</td>
                )}
              </tr>
            )}
          </tbody>
        </Table>
      }
    </div>
  );
}

export default App;
