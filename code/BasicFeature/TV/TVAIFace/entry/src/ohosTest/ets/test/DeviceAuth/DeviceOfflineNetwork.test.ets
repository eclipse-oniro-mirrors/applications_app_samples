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
import RemoteDeviceModel from '../../../../main/ets/models/RemoteDeviceModel';

export default function deviceOfflineNetworkTest(): void {
  describe('deviceOfflineNetwork_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('DeviceOfflineNetwork_unknown_device_22', 0, () => {
      const trusted: boolean = RemoteDeviceModel.isDeviceIdInTrustList('synthetic-22');
      const untrusted: boolean = RemoteDeviceModel.isDeviceIdInUnTrustList('synthetic-22');
      expect(trusted).assertFalse();
      expect(untrusted).assertFalse();
    });


    it('DeviceOfflineNetwork_delete_unknown_22', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('synthetic-delete-22');
      const after: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      expect(after).assertEqual(before);
    });


    /* Business case 2285-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2285', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2285-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2284-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2284', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2284-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2283-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2283', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2282-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2282', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2281-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2281', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2281-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2280-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2280', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2280-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2280-0')).assertFalse();
    });

    /* Business case 2279-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2279', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2279-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2278-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2278', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2278-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2277-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2277', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2277-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2276-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2276', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2276-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2275-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2275', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2275-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2274-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2274', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2274-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2273-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2273', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2272-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2272', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2271-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2271', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2271-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2270-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2270', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2270-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2270-0')).assertFalse();
    });

    /* Business case 2269-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2269', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2269-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2268-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2268', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2268-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2267-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2267', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2267-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2266-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2266', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2266-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2265-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2265', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2265-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2264-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2264', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2264-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2263-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2263', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2262-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2262', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2261-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2261', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2261-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2260-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2260', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2260-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2260-0')).assertFalse();
    });

    /* Business case 2259-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2259', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2259-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2258-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2258', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2258-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2257-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2257', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2257-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2256-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2256', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2256-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2255-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2255', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2255-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2254-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2254', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2254-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2253-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2253', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2252-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2252', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2251-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2251', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2251-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2250-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2250', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2250-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2250-0')).assertFalse();
    });

    /* Business case 2249-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2249', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2249-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2248-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2248', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2248-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2247-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2247', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2247-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2246-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2246', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2246-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2245-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2245', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2245-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2244-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2244', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2244-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2243-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2243', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2242-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2242', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2241-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2241', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2241-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2240-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2240', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2240-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2240-0')).assertFalse();
    });

    /* Business case 2239-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2239', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2239-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2238-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2238', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2238-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2237-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2237', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2237-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2236-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2236', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2236-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2235-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2235', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2235-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2234-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2234', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2234-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2233-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2233', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2232-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2232', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2231-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2231', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2231-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2230-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2230', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2230-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2230-0')).assertFalse();
    });

    /* Business case 2229-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2229', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2229-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2228-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2228', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2228-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2227-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2227', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2227-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2226-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2226', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2226-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2225-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2225', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2225-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2224-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2224', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2224-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2223-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2223', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2222-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2222', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2221-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2221', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2221-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2220-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2220', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2220-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2220-0')).assertFalse();
    });

    /* Business case 2219-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2219', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2219-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2218-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2218', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2218-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2217-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2217', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2217-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2216-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2216', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2216-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2215-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2215', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2215-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2214-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2214', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2214-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2213-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2213', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2212-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2212', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2211-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2211', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2211-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2210-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2210', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2210-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2210-0')).assertFalse();
    });

    /* Business case 2209-9 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2209', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2209-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2208-8 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2208', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2208-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2207-7 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2207', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2207-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2206-6 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2206', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2206-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2205-5 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2205', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2205-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2204-4 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2204', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2204-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2203-3 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2203', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2202-2 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2202', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2201-1 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2201', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2201-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2200-0 for DeviceOfflineNetwork */
    it('DeviceOfflineNetwork_case_2200', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2200-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2200-0')).assertFalse();
    });

  });
}
