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


export default function stateRecoveryTest(): void {
  describe('stateRecovery_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('StateRecovery_store_value_64', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'state-64' };
      store.setObject('dedupe-state-64', value);
      expect(store.getObject('dedupe-state-64') === value).assertTrue();
    });


    it('StateRecovery_store_apply_64', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('dedupe-callback-64', (value: number) => {
        received = value;
      });
      store.apply1('dedupe-callback-64', 164);
      expect(received).assertEqual(164);
    });


    /* Business case 6424-4 for StateRecovery */
    it('StateRecovery_case_6424', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6424-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6424-4', 6524);
      expect(received).assertEqual(6524);
    });

    /* Business case 6423-3 for StateRecovery */
    it('StateRecovery_case_6423', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-6423-3', () => {
        invoked = true;
      });
      store.apply('callback-node-6423-3');
      expect(invoked).assertTrue();
    });

    /* Business case 6422-2 for StateRecovery */
    it('StateRecovery_case_6422', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-6422-2') === undefined).assertTrue();
    });

    /* Business case 6421-1 for StateRecovery */
    it('StateRecovery_case_6421', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-6421-1' };
      const second: StoredValue = { name: 'second-node-6421-1' };
      store.setObject('overwrite-node-6421-1', first);
      store.setObject('overwrite-node-6421-1', second);
      expect(store.getObject('overwrite-node-6421-1') === second).assertTrue();
    });

    /* Business case 6420-0 for StateRecovery */
    it('StateRecovery_case_6420', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-6420-0' };
      store.setObject('key-node-6420-0', value);
      expect(store.getObject('key-node-6420-0') === value).assertTrue();
    });

    /* Business case 6419-9 for StateRecovery */
    it('StateRecovery_case_6419', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6419-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6419-9', 6519);
      expect(received).assertEqual(6519);
    });

    /* Business case 6418-8 for StateRecovery */
    it('StateRecovery_case_6418', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6418-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6418-8', 6518);
      expect(received).assertEqual(6518);
    });

    /* Business case 6417-7 for StateRecovery */
    it('StateRecovery_case_6417', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6417-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6417-7', 6517);
      expect(received).assertEqual(6517);
    });

    /* Business case 6416-6 for StateRecovery */
    it('StateRecovery_case_6416', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6416-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6416-6', 6516);
      expect(received).assertEqual(6516);
    });

    /* Business case 6415-5 for StateRecovery */
    it('StateRecovery_case_6415', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6415-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6415-5', 6515);
      expect(received).assertEqual(6515);
    });

    /* Business case 6414-4 for StateRecovery */
    it('StateRecovery_case_6414', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6414-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6414-4', 6514);
      expect(received).assertEqual(6514);
    });

    /* Business case 6413-3 for StateRecovery */
    it('StateRecovery_case_6413', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-6413-3', () => {
        invoked = true;
      });
      store.apply('callback-node-6413-3');
      expect(invoked).assertTrue();
    });

    /* Business case 6412-2 for StateRecovery */
    it('StateRecovery_case_6412', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-6412-2') === undefined).assertTrue();
    });

    /* Business case 6411-1 for StateRecovery */
    it('StateRecovery_case_6411', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-6411-1' };
      const second: StoredValue = { name: 'second-node-6411-1' };
      store.setObject('overwrite-node-6411-1', first);
      store.setObject('overwrite-node-6411-1', second);
      expect(store.getObject('overwrite-node-6411-1') === second).assertTrue();
    });

    /* Business case 6410-0 for StateRecovery */
    it('StateRecovery_case_6410', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-6410-0' };
      store.setObject('key-node-6410-0', value);
      expect(store.getObject('key-node-6410-0') === value).assertTrue();
    });

    /* Business case 6409-9 for StateRecovery */
    it('StateRecovery_case_6409', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6409-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6409-9', 6509);
      expect(received).assertEqual(6509);
    });

    /* Business case 6408-8 for StateRecovery */
    it('StateRecovery_case_6408', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6408-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6408-8', 6508);
      expect(received).assertEqual(6508);
    });

    /* Business case 6407-7 for StateRecovery */
    it('StateRecovery_case_6407', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6407-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6407-7', 6507);
      expect(received).assertEqual(6507);
    });

    /* Business case 6406-6 for StateRecovery */
    it('StateRecovery_case_6406', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6406-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6406-6', 6506);
      expect(received).assertEqual(6506);
    });

    /* Business case 6405-5 for StateRecovery */
    it('StateRecovery_case_6405', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6405-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6405-5', 6505);
      expect(received).assertEqual(6505);
    });

    /* Business case 6404-4 for StateRecovery */
    it('StateRecovery_case_6404', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6404-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6404-4', 6504);
      expect(received).assertEqual(6504);
    });

    /* Business case 6403-3 for StateRecovery */
    it('StateRecovery_case_6403', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-6403-3', () => {
        invoked = true;
      });
      store.apply('callback-node-6403-3');
      expect(invoked).assertTrue();
    });

    /* Business case 6402-2 for StateRecovery */
    it('StateRecovery_case_6402', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-6402-2') === undefined).assertTrue();
    });

    /* Business case 6401-1 for StateRecovery */
    it('StateRecovery_case_6401', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-6401-1' };
      const second: StoredValue = { name: 'second-node-6401-1' };
      store.setObject('overwrite-node-6401-1', first);
      store.setObject('overwrite-node-6401-1', second);
      expect(store.getObject('overwrite-node-6401-1') === second).assertTrue();
    });

    /* Business case 6400-0 for StateRecovery */
    it('StateRecovery_case_6400', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-6400-0' };
      store.setObject('key-node-6400-0', value);
      expect(store.getObject('key-node-6400-0') === value).assertTrue();
    });

  });
}
