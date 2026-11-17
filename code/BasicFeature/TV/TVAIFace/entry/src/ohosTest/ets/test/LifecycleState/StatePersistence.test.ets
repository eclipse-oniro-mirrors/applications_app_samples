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


export default function statePersistenceTest(): void {
  describe('statePersistence_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('StatePersistence_store_value_63', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'state-63' };
      store.setObject('dedupe-state-63', value);
      expect(store.getObject('dedupe-state-63') === value).assertTrue();
    });


    it('StatePersistence_store_apply_63', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('dedupe-callback-63', (value: number) => {
        received = value;
      });
      store.apply1('dedupe-callback-63', 163);
      expect(received).assertEqual(163);
    });


    /* Business case 6324-4 for StatePersistence */
    it('StatePersistence_case_6324', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6324-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6324-4', 6424);
      expect(received).assertEqual(6424);
    });

    /* Business case 6323-3 for StatePersistence */
    it('StatePersistence_case_6323', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-6323-3', () => {
        invoked = true;
      });
      store.apply('callback-node-6323-3');
      expect(invoked).assertTrue();
    });

    /* Business case 6322-2 for StatePersistence */
    it('StatePersistence_case_6322', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-6322-2') === undefined).assertTrue();
    });

    /* Business case 6321-1 for StatePersistence */
    it('StatePersistence_case_6321', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-6321-1' };
      const second: StoredValue = { name: 'second-node-6321-1' };
      store.setObject('overwrite-node-6321-1', first);
      store.setObject('overwrite-node-6321-1', second);
      expect(store.getObject('overwrite-node-6321-1') === second).assertTrue();
    });

    /* Business case 6320-0 for StatePersistence */
    it('StatePersistence_case_6320', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-6320-0' };
      store.setObject('key-node-6320-0', value);
      expect(store.getObject('key-node-6320-0') === value).assertTrue();
    });

    /* Business case 6319-9 for StatePersistence */
    it('StatePersistence_case_6319', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6319-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6319-9', 6419);
      expect(received).assertEqual(6419);
    });

    /* Business case 6318-8 for StatePersistence */
    it('StatePersistence_case_6318', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6318-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6318-8', 6418);
      expect(received).assertEqual(6418);
    });

    /* Business case 6317-7 for StatePersistence */
    it('StatePersistence_case_6317', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6317-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6317-7', 6417);
      expect(received).assertEqual(6417);
    });

    /* Business case 6316-6 for StatePersistence */
    it('StatePersistence_case_6316', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6316-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6316-6', 6416);
      expect(received).assertEqual(6416);
    });

    /* Business case 6315-5 for StatePersistence */
    it('StatePersistence_case_6315', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6315-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6315-5', 6415);
      expect(received).assertEqual(6415);
    });

    /* Business case 6314-4 for StatePersistence */
    it('StatePersistence_case_6314', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6314-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6314-4', 6414);
      expect(received).assertEqual(6414);
    });

    /* Business case 6313-3 for StatePersistence */
    it('StatePersistence_case_6313', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-6313-3', () => {
        invoked = true;
      });
      store.apply('callback-node-6313-3');
      expect(invoked).assertTrue();
    });

    /* Business case 6312-2 for StatePersistence */
    it('StatePersistence_case_6312', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-6312-2') === undefined).assertTrue();
    });

    /* Business case 6311-1 for StatePersistence */
    it('StatePersistence_case_6311', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-6311-1' };
      const second: StoredValue = { name: 'second-node-6311-1' };
      store.setObject('overwrite-node-6311-1', first);
      store.setObject('overwrite-node-6311-1', second);
      expect(store.getObject('overwrite-node-6311-1') === second).assertTrue();
    });

    /* Business case 6310-0 for StatePersistence */
    it('StatePersistence_case_6310', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-6310-0' };
      store.setObject('key-node-6310-0', value);
      expect(store.getObject('key-node-6310-0') === value).assertTrue();
    });

    /* Business case 6309-9 for StatePersistence */
    it('StatePersistence_case_6309', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6309-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6309-9', 6409);
      expect(received).assertEqual(6409);
    });

    /* Business case 6308-8 for StatePersistence */
    it('StatePersistence_case_6308', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6308-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6308-8', 6408);
      expect(received).assertEqual(6408);
    });

    /* Business case 6307-7 for StatePersistence */
    it('StatePersistence_case_6307', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6307-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6307-7', 6407);
      expect(received).assertEqual(6407);
    });

    /* Business case 6306-6 for StatePersistence */
    it('StatePersistence_case_6306', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6306-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6306-6', 6406);
      expect(received).assertEqual(6406);
    });

    /* Business case 6305-5 for StatePersistence */
    it('StatePersistence_case_6305', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6305-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6305-5', 6405);
      expect(received).assertEqual(6405);
    });

    /* Business case 6304-4 for StatePersistence */
    it('StatePersistence_case_6304', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-6304-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-6304-4', 6404);
      expect(received).assertEqual(6404);
    });

    /* Business case 6303-3 for StatePersistence */
    it('StatePersistence_case_6303', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-6303-3', () => {
        invoked = true;
      });
      store.apply('callback-node-6303-3');
      expect(invoked).assertTrue();
    });

    /* Business case 6302-2 for StatePersistence */
    it('StatePersistence_case_6302', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-6302-2') === undefined).assertTrue();
    });

    /* Business case 6301-1 for StatePersistence */
    it('StatePersistence_case_6301', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-6301-1' };
      const second: StoredValue = { name: 'second-node-6301-1' };
      store.setObject('overwrite-node-6301-1', first);
      store.setObject('overwrite-node-6301-1', second);
      expect(store.getObject('overwrite-node-6301-1') === second).assertTrue();
    });

    /* Business case 6300-0 for StatePersistence */
    it('StatePersistence_case_6300', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-6300-0' };
      store.setObject('key-node-6300-0', value);
      expect(store.getObject('key-node-6300-0') === value).assertTrue();
    });

  });
}
