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


export default function pageStateManagementTest(): void {
  describe('pageStateManagement_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('PageStateManagement_store_value_57', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'state-57' };
      store.setObject('dedupe-state-57', value);
      expect(store.getObject('dedupe-state-57') === value).assertTrue();
    });


    it('PageStateManagement_store_apply_57', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('dedupe-callback-57', (value: number) => {
        received = value;
      });
      store.apply1('dedupe-callback-57', 157);
      expect(received).assertEqual(157);
    });


    /* Business case 5795-5 for PageStateManagement */
    it('PageStateManagement_case_5795', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5795-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5795-5', 5895);
      expect(received).assertEqual(5895);
    });

    /* Business case 5794-4 for PageStateManagement */
    it('PageStateManagement_case_5794', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5794-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5794-4', 5894);
      expect(received).assertEqual(5894);
    });

    /* Business case 5793-3 for PageStateManagement */
    it('PageStateManagement_case_5793', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5793-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5793-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5792-2 for PageStateManagement */
    it('PageStateManagement_case_5792', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5792-2') === undefined).assertTrue();
    });

    /* Business case 5791-1 for PageStateManagement */
    it('PageStateManagement_case_5791', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5791-1' };
      const second: StoredValue = { name: 'second-node-5791-1' };
      store.setObject('overwrite-node-5791-1', first);
      store.setObject('overwrite-node-5791-1', second);
      expect(store.getObject('overwrite-node-5791-1') === second).assertTrue();
    });

    /* Business case 5790-0 for PageStateManagement */
    it('PageStateManagement_case_5790', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5790-0' };
      store.setObject('key-node-5790-0', value);
      expect(store.getObject('key-node-5790-0') === value).assertTrue();
    });

    /* Business case 5789-9 for PageStateManagement */
    it('PageStateManagement_case_5789', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5789-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5789-9', 5889);
      expect(received).assertEqual(5889);
    });

    /* Business case 5788-8 for PageStateManagement */
    it('PageStateManagement_case_5788', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5788-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5788-8', 5888);
      expect(received).assertEqual(5888);
    });

    /* Business case 5787-7 for PageStateManagement */
    it('PageStateManagement_case_5787', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5787-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5787-7', 5887);
      expect(received).assertEqual(5887);
    });

    /* Business case 5786-6 for PageStateManagement */
    it('PageStateManagement_case_5786', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5786-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5786-6', 5886);
      expect(received).assertEqual(5886);
    });

    /* Business case 5785-5 for PageStateManagement */
    it('PageStateManagement_case_5785', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5785-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5785-5', 5885);
      expect(received).assertEqual(5885);
    });

    /* Business case 5784-4 for PageStateManagement */
    it('PageStateManagement_case_5784', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5784-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5784-4', 5884);
      expect(received).assertEqual(5884);
    });

    /* Business case 5783-3 for PageStateManagement */
    it('PageStateManagement_case_5783', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5783-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5783-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5782-2 for PageStateManagement */
    it('PageStateManagement_case_5782', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5782-2') === undefined).assertTrue();
    });

    /* Business case 5781-1 for PageStateManagement */
    it('PageStateManagement_case_5781', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5781-1' };
      const second: StoredValue = { name: 'second-node-5781-1' };
      store.setObject('overwrite-node-5781-1', first);
      store.setObject('overwrite-node-5781-1', second);
      expect(store.getObject('overwrite-node-5781-1') === second).assertTrue();
    });

    /* Business case 5780-0 for PageStateManagement */
    it('PageStateManagement_case_5780', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5780-0' };
      store.setObject('key-node-5780-0', value);
      expect(store.getObject('key-node-5780-0') === value).assertTrue();
    });

    /* Business case 5779-9 for PageStateManagement */
    it('PageStateManagement_case_5779', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5779-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5779-9', 5879);
      expect(received).assertEqual(5879);
    });

    /* Business case 5778-8 for PageStateManagement */
    it('PageStateManagement_case_5778', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5778-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5778-8', 5878);
      expect(received).assertEqual(5878);
    });

    /* Business case 5777-7 for PageStateManagement */
    it('PageStateManagement_case_5777', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5777-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5777-7', 5877);
      expect(received).assertEqual(5877);
    });

    /* Business case 5776-6 for PageStateManagement */
    it('PageStateManagement_case_5776', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5776-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5776-6', 5876);
      expect(received).assertEqual(5876);
    });

    /* Business case 5775-5 for PageStateManagement */
    it('PageStateManagement_case_5775', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5775-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5775-5', 5875);
      expect(received).assertEqual(5875);
    });

    /* Business case 5774-4 for PageStateManagement */
    it('PageStateManagement_case_5774', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5774-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5774-4', 5874);
      expect(received).assertEqual(5874);
    });

    /* Business case 5773-3 for PageStateManagement */
    it('PageStateManagement_case_5773', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5773-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5773-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5772-2 for PageStateManagement */
    it('PageStateManagement_case_5772', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5772-2') === undefined).assertTrue();
    });

    /* Business case 5771-1 for PageStateManagement */
    it('PageStateManagement_case_5771', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5771-1' };
      const second: StoredValue = { name: 'second-node-5771-1' };
      store.setObject('overwrite-node-5771-1', first);
      store.setObject('overwrite-node-5771-1', second);
      expect(store.getObject('overwrite-node-5771-1') === second).assertTrue();
    });

    /* Business case 5770-0 for PageStateManagement */
    it('PageStateManagement_case_5770', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5770-0' };
      store.setObject('key-node-5770-0', value);
      expect(store.getObject('key-node-5770-0') === value).assertTrue();
    });

    /* Business case 5769-9 for PageStateManagement */
    it('PageStateManagement_case_5769', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5769-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5769-9', 5869);
      expect(received).assertEqual(5869);
    });

    /* Business case 5768-8 for PageStateManagement */
    it('PageStateManagement_case_5768', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5768-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5768-8', 5868);
      expect(received).assertEqual(5868);
    });

    /* Business case 5767-7 for PageStateManagement */
    it('PageStateManagement_case_5767', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5767-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5767-7', 5867);
      expect(received).assertEqual(5867);
    });

    /* Business case 5766-6 for PageStateManagement */
    it('PageStateManagement_case_5766', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5766-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5766-6', 5866);
      expect(received).assertEqual(5866);
    });

    /* Business case 5765-5 for PageStateManagement */
    it('PageStateManagement_case_5765', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5765-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5765-5', 5865);
      expect(received).assertEqual(5865);
    });

    /* Business case 5764-4 for PageStateManagement */
    it('PageStateManagement_case_5764', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5764-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5764-4', 5864);
      expect(received).assertEqual(5864);
    });

    /* Business case 5763-3 for PageStateManagement */
    it('PageStateManagement_case_5763', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5763-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5763-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5762-2 for PageStateManagement */
    it('PageStateManagement_case_5762', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5762-2') === undefined).assertTrue();
    });

    /* Business case 5761-1 for PageStateManagement */
    it('PageStateManagement_case_5761', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5761-1' };
      const second: StoredValue = { name: 'second-node-5761-1' };
      store.setObject('overwrite-node-5761-1', first);
      store.setObject('overwrite-node-5761-1', second);
      expect(store.getObject('overwrite-node-5761-1') === second).assertTrue();
    });

    /* Business case 5760-0 for PageStateManagement */
    it('PageStateManagement_case_5760', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5760-0' };
      store.setObject('key-node-5760-0', value);
      expect(store.getObject('key-node-5760-0') === value).assertTrue();
    });

    /* Business case 5759-9 for PageStateManagement */
    it('PageStateManagement_case_5759', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5759-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5759-9', 5859);
      expect(received).assertEqual(5859);
    });

    /* Business case 5758-8 for PageStateManagement */
    it('PageStateManagement_case_5758', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5758-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5758-8', 5858);
      expect(received).assertEqual(5858);
    });

    /* Business case 5757-7 for PageStateManagement */
    it('PageStateManagement_case_5757', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5757-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5757-7', 5857);
      expect(received).assertEqual(5857);
    });

    /* Business case 5756-6 for PageStateManagement */
    it('PageStateManagement_case_5756', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5756-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5756-6', 5856);
      expect(received).assertEqual(5856);
    });

    /* Business case 5755-5 for PageStateManagement */
    it('PageStateManagement_case_5755', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5755-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5755-5', 5855);
      expect(received).assertEqual(5855);
    });

    /* Business case 5754-4 for PageStateManagement */
    it('PageStateManagement_case_5754', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5754-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5754-4', 5854);
      expect(received).assertEqual(5854);
    });

    /* Business case 5753-3 for PageStateManagement */
    it('PageStateManagement_case_5753', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5753-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5753-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5752-2 for PageStateManagement */
    it('PageStateManagement_case_5752', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5752-2') === undefined).assertTrue();
    });

    /* Business case 5751-1 for PageStateManagement */
    it('PageStateManagement_case_5751', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5751-1' };
      const second: StoredValue = { name: 'second-node-5751-1' };
      store.setObject('overwrite-node-5751-1', first);
      store.setObject('overwrite-node-5751-1', second);
      expect(store.getObject('overwrite-node-5751-1') === second).assertTrue();
    });

    /* Business case 5750-0 for PageStateManagement */
    it('PageStateManagement_case_5750', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5750-0' };
      store.setObject('key-node-5750-0', value);
      expect(store.getObject('key-node-5750-0') === value).assertTrue();
    });

    /* Business case 5749-9 for PageStateManagement */
    it('PageStateManagement_case_5749', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5749-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5749-9', 5849);
      expect(received).assertEqual(5849);
    });

    /* Business case 5748-8 for PageStateManagement */
    it('PageStateManagement_case_5748', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5748-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5748-8', 5848);
      expect(received).assertEqual(5848);
    });

    /* Business case 5747-7 for PageStateManagement */
    it('PageStateManagement_case_5747', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5747-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5747-7', 5847);
      expect(received).assertEqual(5847);
    });

    /* Business case 5746-6 for PageStateManagement */
    it('PageStateManagement_case_5746', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5746-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5746-6', 5846);
      expect(received).assertEqual(5846);
    });

    /* Business case 5745-5 for PageStateManagement */
    it('PageStateManagement_case_5745', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5745-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5745-5', 5845);
      expect(received).assertEqual(5845);
    });

    /* Business case 5744-4 for PageStateManagement */
    it('PageStateManagement_case_5744', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5744-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5744-4', 5844);
      expect(received).assertEqual(5844);
    });

    /* Business case 5743-3 for PageStateManagement */
    it('PageStateManagement_case_5743', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5743-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5743-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5742-2 for PageStateManagement */
    it('PageStateManagement_case_5742', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5742-2') === undefined).assertTrue();
    });

    /* Business case 5741-1 for PageStateManagement */
    it('PageStateManagement_case_5741', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5741-1' };
      const second: StoredValue = { name: 'second-node-5741-1' };
      store.setObject('overwrite-node-5741-1', first);
      store.setObject('overwrite-node-5741-1', second);
      expect(store.getObject('overwrite-node-5741-1') === second).assertTrue();
    });

    /* Business case 5740-0 for PageStateManagement */
    it('PageStateManagement_case_5740', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5740-0' };
      store.setObject('key-node-5740-0', value);
      expect(store.getObject('key-node-5740-0') === value).assertTrue();
    });

    /* Business case 5739-9 for PageStateManagement */
    it('PageStateManagement_case_5739', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5739-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5739-9', 5839);
      expect(received).assertEqual(5839);
    });

    /* Business case 5738-8 for PageStateManagement */
    it('PageStateManagement_case_5738', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5738-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5738-8', 5838);
      expect(received).assertEqual(5838);
    });

    /* Business case 5737-7 for PageStateManagement */
    it('PageStateManagement_case_5737', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5737-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5737-7', 5837);
      expect(received).assertEqual(5837);
    });

    /* Business case 5736-6 for PageStateManagement */
    it('PageStateManagement_case_5736', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5736-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5736-6', 5836);
      expect(received).assertEqual(5836);
    });

    /* Business case 5735-5 for PageStateManagement */
    it('PageStateManagement_case_5735', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5735-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5735-5', 5835);
      expect(received).assertEqual(5835);
    });

    /* Business case 5734-4 for PageStateManagement */
    it('PageStateManagement_case_5734', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5734-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5734-4', 5834);
      expect(received).assertEqual(5834);
    });

    /* Business case 5733-3 for PageStateManagement */
    it('PageStateManagement_case_5733', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5733-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5733-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5732-2 for PageStateManagement */
    it('PageStateManagement_case_5732', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5732-2') === undefined).assertTrue();
    });

    /* Business case 5731-1 for PageStateManagement */
    it('PageStateManagement_case_5731', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5731-1' };
      const second: StoredValue = { name: 'second-node-5731-1' };
      store.setObject('overwrite-node-5731-1', first);
      store.setObject('overwrite-node-5731-1', second);
      expect(store.getObject('overwrite-node-5731-1') === second).assertTrue();
    });

    /* Business case 5730-0 for PageStateManagement */
    it('PageStateManagement_case_5730', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5730-0' };
      store.setObject('key-node-5730-0', value);
      expect(store.getObject('key-node-5730-0') === value).assertTrue();
    });

    /* Business case 5729-9 for PageStateManagement */
    it('PageStateManagement_case_5729', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5729-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5729-9', 5829);
      expect(received).assertEqual(5829);
    });

    /* Business case 5728-8 for PageStateManagement */
    it('PageStateManagement_case_5728', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5728-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5728-8', 5828);
      expect(received).assertEqual(5828);
    });

    /* Business case 5727-7 for PageStateManagement */
    it('PageStateManagement_case_5727', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5727-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5727-7', 5827);
      expect(received).assertEqual(5827);
    });

    /* Business case 5726-6 for PageStateManagement */
    it('PageStateManagement_case_5726', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5726-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5726-6', 5826);
      expect(received).assertEqual(5826);
    });

    /* Business case 5725-5 for PageStateManagement */
    it('PageStateManagement_case_5725', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5725-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5725-5', 5825);
      expect(received).assertEqual(5825);
    });

    /* Business case 5724-4 for PageStateManagement */
    it('PageStateManagement_case_5724', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5724-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5724-4', 5824);
      expect(received).assertEqual(5824);
    });

    /* Business case 5723-3 for PageStateManagement */
    it('PageStateManagement_case_5723', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5723-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5723-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5722-2 for PageStateManagement */
    it('PageStateManagement_case_5722', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5722-2') === undefined).assertTrue();
    });

    /* Business case 5721-1 for PageStateManagement */
    it('PageStateManagement_case_5721', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5721-1' };
      const second: StoredValue = { name: 'second-node-5721-1' };
      store.setObject('overwrite-node-5721-1', first);
      store.setObject('overwrite-node-5721-1', second);
      expect(store.getObject('overwrite-node-5721-1') === second).assertTrue();
    });

    /* Business case 5720-0 for PageStateManagement */
    it('PageStateManagement_case_5720', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5720-0' };
      store.setObject('key-node-5720-0', value);
      expect(store.getObject('key-node-5720-0') === value).assertTrue();
    });

    /* Business case 5719-9 for PageStateManagement */
    it('PageStateManagement_case_5719', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5719-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5719-9', 5819);
      expect(received).assertEqual(5819);
    });

    /* Business case 5718-8 for PageStateManagement */
    it('PageStateManagement_case_5718', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5718-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5718-8', 5818);
      expect(received).assertEqual(5818);
    });

    /* Business case 5717-7 for PageStateManagement */
    it('PageStateManagement_case_5717', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5717-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5717-7', 5817);
      expect(received).assertEqual(5817);
    });

    /* Business case 5716-6 for PageStateManagement */
    it('PageStateManagement_case_5716', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5716-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5716-6', 5816);
      expect(received).assertEqual(5816);
    });

    /* Business case 5715-5 for PageStateManagement */
    it('PageStateManagement_case_5715', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5715-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5715-5', 5815);
      expect(received).assertEqual(5815);
    });

    /* Business case 5714-4 for PageStateManagement */
    it('PageStateManagement_case_5714', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5714-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5714-4', 5814);
      expect(received).assertEqual(5814);
    });

    /* Business case 5713-3 for PageStateManagement */
    it('PageStateManagement_case_5713', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5713-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5713-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5712-2 for PageStateManagement */
    it('PageStateManagement_case_5712', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5712-2') === undefined).assertTrue();
    });

    /* Business case 5711-1 for PageStateManagement */
    it('PageStateManagement_case_5711', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5711-1' };
      const second: StoredValue = { name: 'second-node-5711-1' };
      store.setObject('overwrite-node-5711-1', first);
      store.setObject('overwrite-node-5711-1', second);
      expect(store.getObject('overwrite-node-5711-1') === second).assertTrue();
    });

    /* Business case 5710-0 for PageStateManagement */
    it('PageStateManagement_case_5710', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5710-0' };
      store.setObject('key-node-5710-0', value);
      expect(store.getObject('key-node-5710-0') === value).assertTrue();
    });

    /* Business case 5709-9 for PageStateManagement */
    it('PageStateManagement_case_5709', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5709-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5709-9', 5809);
      expect(received).assertEqual(5809);
    });

    /* Business case 5708-8 for PageStateManagement */
    it('PageStateManagement_case_5708', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5708-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5708-8', 5808);
      expect(received).assertEqual(5808);
    });

    /* Business case 5707-7 for PageStateManagement */
    it('PageStateManagement_case_5707', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5707-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5707-7', 5807);
      expect(received).assertEqual(5807);
    });

    /* Business case 5706-6 for PageStateManagement */
    it('PageStateManagement_case_5706', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5706-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5706-6', 5806);
      expect(received).assertEqual(5806);
    });

    /* Business case 5705-5 for PageStateManagement */
    it('PageStateManagement_case_5705', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5705-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5705-5', 5805);
      expect(received).assertEqual(5805);
    });

    /* Business case 5704-4 for PageStateManagement */
    it('PageStateManagement_case_5704', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-5704-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-5704-4', 5804);
      expect(received).assertEqual(5804);
    });

    /* Business case 5703-3 for PageStateManagement */
    it('PageStateManagement_case_5703', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-5703-3', () => {
        invoked = true;
      });
      store.apply('callback-node-5703-3');
      expect(invoked).assertTrue();
    });

    /* Business case 5702-2 for PageStateManagement */
    it('PageStateManagement_case_5702', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-5702-2') === undefined).assertTrue();
    });

    /* Business case 5701-1 for PageStateManagement */
    it('PageStateManagement_case_5701', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-5701-1' };
      const second: StoredValue = { name: 'second-node-5701-1' };
      store.setObject('overwrite-node-5701-1', first);
      store.setObject('overwrite-node-5701-1', second);
      expect(store.getObject('overwrite-node-5701-1') === second).assertTrue();
    });

    /* Business case 5700-0 for PageStateManagement */
    it('PageStateManagement_case_5700', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-5700-0' };
      store.setObject('key-node-5700-0', value);
      expect(store.getObject('key-node-5700-0') === value).assertTrue();
    });

  });
}
