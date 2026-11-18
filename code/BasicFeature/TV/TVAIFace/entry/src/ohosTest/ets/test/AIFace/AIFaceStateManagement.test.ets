/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { globalThis } from '../../../../main/ets/common/globalThis';

interface StoredValue {
  name: string;
}


export default function aifaceStateManagementTest(): void {
  describe('aifaceStateManagement_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('AIFaceStateManagement_store_value_13', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'state-13' };
      store.setObject('dedupe-state-13', value);
      expect(store.getObject('dedupe-state-13') === value).assertTrue();
    });


    it('AIFaceStateManagement_store_apply_13', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('dedupe-callback-13', (value: number) => {
        received = value;
      });
      store.apply1('dedupe-callback-13', 113);
      expect(received).assertEqual(113);
    });


    /* Business case 1346-6 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1346', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1346-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1346-6', 1446);
      expect(received).assertEqual(1446);
    });

    /* Business case 1345-5 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1345', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1345-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1345-5', 1445);
      expect(received).assertEqual(1445);
    });

    /* Business case 1344-4 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1344', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1344-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1344-4', 1444);
      expect(received).assertEqual(1444);
    });

    /* Business case 1343-3 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1343', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-1343-3', () => {
        invoked = true;
      });
      store.apply('callback-node-1343-3');
      expect(invoked).assertTrue();
    });

    /* Business case 1342-2 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1342', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-1342-2') === undefined).assertTrue();
    });

    /* Business case 1341-1 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1341', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-1341-1' };
      const second: StoredValue = { name: 'second-node-1341-1' };
      store.setObject('overwrite-node-1341-1', first);
      store.setObject('overwrite-node-1341-1', second);
      expect(store.getObject('overwrite-node-1341-1') === second).assertTrue();
    });

    /* Business case 1340-0 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1340', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-1340-0' };
      store.setObject('key-node-1340-0', value);
      expect(store.getObject('key-node-1340-0') === value).assertTrue();
    });

    /* Business case 1339-9 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1339', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1339-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1339-9', 1439);
      expect(received).assertEqual(1439);
    });

    /* Business case 1338-8 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1338', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1338-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1338-8', 1438);
      expect(received).assertEqual(1438);
    });

    /* Business case 1337-7 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1337', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1337-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1337-7', 1437);
      expect(received).assertEqual(1437);
    });

    /* Business case 1336-6 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1336', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1336-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1336-6', 1436);
      expect(received).assertEqual(1436);
    });

    /* Business case 1335-5 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1335', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1335-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1335-5', 1435);
      expect(received).assertEqual(1435);
    });

    /* Business case 1334-4 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1334', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1334-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1334-4', 1434);
      expect(received).assertEqual(1434);
    });

    /* Business case 1333-3 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1333', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-1333-3', () => {
        invoked = true;
      });
      store.apply('callback-node-1333-3');
      expect(invoked).assertTrue();
    });

    /* Business case 1332-2 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1332', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-1332-2') === undefined).assertTrue();
    });

    /* Business case 1331-1 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1331', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-1331-1' };
      const second: StoredValue = { name: 'second-node-1331-1' };
      store.setObject('overwrite-node-1331-1', first);
      store.setObject('overwrite-node-1331-1', second);
      expect(store.getObject('overwrite-node-1331-1') === second).assertTrue();
    });

    /* Business case 1330-0 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1330', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-1330-0' };
      store.setObject('key-node-1330-0', value);
      expect(store.getObject('key-node-1330-0') === value).assertTrue();
    });

    /* Business case 1329-9 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1329', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1329-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1329-9', 1429);
      expect(received).assertEqual(1429);
    });

    /* Business case 1328-8 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1328', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1328-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1328-8', 1428);
      expect(received).assertEqual(1428);
    });

    /* Business case 1327-7 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1327', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1327-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1327-7', 1427);
      expect(received).assertEqual(1427);
    });

    /* Business case 1326-6 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1326', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1326-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1326-6', 1426);
      expect(received).assertEqual(1426);
    });

    /* Business case 1325-5 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1325', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1325-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1325-5', 1425);
      expect(received).assertEqual(1425);
    });

    /* Business case 1324-4 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1324', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1324-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1324-4', 1424);
      expect(received).assertEqual(1424);
    });

    /* Business case 1323-3 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1323', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-1323-3', () => {
        invoked = true;
      });
      store.apply('callback-node-1323-3');
      expect(invoked).assertTrue();
    });

    /* Business case 1322-2 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1322', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-1322-2') === undefined).assertTrue();
    });

    /* Business case 1321-1 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1321', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-1321-1' };
      const second: StoredValue = { name: 'second-node-1321-1' };
      store.setObject('overwrite-node-1321-1', first);
      store.setObject('overwrite-node-1321-1', second);
      expect(store.getObject('overwrite-node-1321-1') === second).assertTrue();
    });

    /* Business case 1320-0 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1320', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-1320-0' };
      store.setObject('key-node-1320-0', value);
      expect(store.getObject('key-node-1320-0') === value).assertTrue();
    });

    /* Business case 1319-9 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1319', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1319-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1319-9', 1419);
      expect(received).assertEqual(1419);
    });

    /* Business case 1318-8 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1318', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1318-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1318-8', 1418);
      expect(received).assertEqual(1418);
    });

    /* Business case 1317-7 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1317', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1317-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1317-7', 1417);
      expect(received).assertEqual(1417);
    });

    /* Business case 1316-6 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1316', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1316-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1316-6', 1416);
      expect(received).assertEqual(1416);
    });

    /* Business case 1315-5 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1315', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1315-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1315-5', 1415);
      expect(received).assertEqual(1415);
    });

    /* Business case 1314-4 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1314', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1314-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1314-4', 1414);
      expect(received).assertEqual(1414);
    });

    /* Business case 1313-3 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1313', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-1313-3', () => {
        invoked = true;
      });
      store.apply('callback-node-1313-3');
      expect(invoked).assertTrue();
    });

    /* Business case 1312-2 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1312', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-1312-2') === undefined).assertTrue();
    });

    /* Business case 1311-1 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1311', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-1311-1' };
      const second: StoredValue = { name: 'second-node-1311-1' };
      store.setObject('overwrite-node-1311-1', first);
      store.setObject('overwrite-node-1311-1', second);
      expect(store.getObject('overwrite-node-1311-1') === second).assertTrue();
    });

    /* Business case 1310-0 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1310', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-1310-0' };
      store.setObject('key-node-1310-0', value);
      expect(store.getObject('key-node-1310-0') === value).assertTrue();
    });

    /* Business case 1309-9 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1309', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1309-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1309-9', 1409);
      expect(received).assertEqual(1409);
    });

    /* Business case 1308-8 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1308', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1308-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1308-8', 1408);
      expect(received).assertEqual(1408);
    });

    /* Business case 1307-7 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1307', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1307-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1307-7', 1407);
      expect(received).assertEqual(1407);
    });

    /* Business case 1306-6 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1306', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1306-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1306-6', 1406);
      expect(received).assertEqual(1406);
    });

    /* Business case 1305-5 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1305', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1305-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1305-5', 1405);
      expect(received).assertEqual(1405);
    });

    /* Business case 1304-4 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1304', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-1304-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-1304-4', 1404);
      expect(received).assertEqual(1404);
    });

    /* Business case 1303-3 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1303', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-1303-3', () => {
        invoked = true;
      });
      store.apply('callback-node-1303-3');
      expect(invoked).assertTrue();
    });

    /* Business case 1302-2 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1302', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-1302-2') === undefined).assertTrue();
    });

    /* Business case 1301-1 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1301', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-1301-1' };
      const second: StoredValue = { name: 'second-node-1301-1' };
      store.setObject('overwrite-node-1301-1', first);
      store.setObject('overwrite-node-1301-1', second);
      expect(store.getObject('overwrite-node-1301-1') === second).assertTrue();
    });

    /* Business case 1300-0 for AIFaceStateManagement */
    it('AIFaceStateManagement_case_1300', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-1300-0' };
      store.setObject('key-node-1300-0', value);
      expect(store.getObject('key-node-1300-0') === value).assertTrue();
    });

  });
}
