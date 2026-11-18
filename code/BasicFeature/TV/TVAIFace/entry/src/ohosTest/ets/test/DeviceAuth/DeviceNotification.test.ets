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

export default function deviceNotificationTest(): void {
  describe('deviceNotification_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('DeviceNotification_unknown_device_21', 0, () => {
      const trusted: boolean = RemoteDeviceModel.isDeviceIdInTrustList('synthetic-21');
      const untrusted: boolean = RemoteDeviceModel.isDeviceIdInUnTrustList('synthetic-21');
      expect(trusted).assertFalse();
      expect(untrusted).assertFalse();
    });


    it('DeviceNotification_delete_unknown_21', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('synthetic-delete-21');
      const after: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      expect(after).assertEqual(before);
    });


    /* Business case 2187-7 for DeviceNotification */
    it('DeviceNotification_case_2187', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2187-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2186-6 for DeviceNotification */
    it('DeviceNotification_case_2186', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2186-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2185-5 for DeviceNotification */
    it('DeviceNotification_case_2185', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2185-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2184-4 for DeviceNotification */
    it('DeviceNotification_case_2184', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2184-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2183-3 for DeviceNotification */
    it('DeviceNotification_case_2183', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2182-2 for DeviceNotification */
    it('DeviceNotification_case_2182', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2181-1 for DeviceNotification */
    it('DeviceNotification_case_2181', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2181-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2180-0 for DeviceNotification */
    it('DeviceNotification_case_2180', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2180-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2180-0')).assertFalse();
    });

    /* Business case 2179-9 for DeviceNotification */
    it('DeviceNotification_case_2179', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2179-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2178-8 for DeviceNotification */
    it('DeviceNotification_case_2178', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2178-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2177-7 for DeviceNotification */
    it('DeviceNotification_case_2177', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2177-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2176-6 for DeviceNotification */
    it('DeviceNotification_case_2176', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2176-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2175-5 for DeviceNotification */
    it('DeviceNotification_case_2175', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2175-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2174-4 for DeviceNotification */
    it('DeviceNotification_case_2174', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2174-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2173-3 for DeviceNotification */
    it('DeviceNotification_case_2173', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2172-2 for DeviceNotification */
    it('DeviceNotification_case_2172', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2171-1 for DeviceNotification */
    it('DeviceNotification_case_2171', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2171-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2170-0 for DeviceNotification */
    it('DeviceNotification_case_2170', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2170-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2170-0')).assertFalse();
    });

    /* Business case 2169-9 for DeviceNotification */
    it('DeviceNotification_case_2169', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2169-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2168-8 for DeviceNotification */
    it('DeviceNotification_case_2168', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2168-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2167-7 for DeviceNotification */
    it('DeviceNotification_case_2167', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2167-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2166-6 for DeviceNotification */
    it('DeviceNotification_case_2166', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2166-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2165-5 for DeviceNotification */
    it('DeviceNotification_case_2165', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2165-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2164-4 for DeviceNotification */
    it('DeviceNotification_case_2164', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2164-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2163-3 for DeviceNotification */
    it('DeviceNotification_case_2163', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2162-2 for DeviceNotification */
    it('DeviceNotification_case_2162', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2161-1 for DeviceNotification */
    it('DeviceNotification_case_2161', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2161-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2160-0 for DeviceNotification */
    it('DeviceNotification_case_2160', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2160-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2160-0')).assertFalse();
    });

    /* Business case 2159-9 for DeviceNotification */
    it('DeviceNotification_case_2159', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2159-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2158-8 for DeviceNotification */
    it('DeviceNotification_case_2158', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2158-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2157-7 for DeviceNotification */
    it('DeviceNotification_case_2157', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2157-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2156-6 for DeviceNotification */
    it('DeviceNotification_case_2156', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2156-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2155-5 for DeviceNotification */
    it('DeviceNotification_case_2155', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2155-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2154-4 for DeviceNotification */
    it('DeviceNotification_case_2154', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2154-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2153-3 for DeviceNotification */
    it('DeviceNotification_case_2153', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2152-2 for DeviceNotification */
    it('DeviceNotification_case_2152', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2151-1 for DeviceNotification */
    it('DeviceNotification_case_2151', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2151-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2150-0 for DeviceNotification */
    it('DeviceNotification_case_2150', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2150-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2150-0')).assertFalse();
    });

    /* Business case 2149-9 for DeviceNotification */
    it('DeviceNotification_case_2149', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2149-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2148-8 for DeviceNotification */
    it('DeviceNotification_case_2148', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2148-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2147-7 for DeviceNotification */
    it('DeviceNotification_case_2147', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2147-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2146-6 for DeviceNotification */
    it('DeviceNotification_case_2146', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2146-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2145-5 for DeviceNotification */
    it('DeviceNotification_case_2145', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2145-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2144-4 for DeviceNotification */
    it('DeviceNotification_case_2144', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2144-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2143-3 for DeviceNotification */
    it('DeviceNotification_case_2143', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2142-2 for DeviceNotification */
    it('DeviceNotification_case_2142', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2141-1 for DeviceNotification */
    it('DeviceNotification_case_2141', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2141-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2140-0 for DeviceNotification */
    it('DeviceNotification_case_2140', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2140-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2140-0')).assertFalse();
    });

    /* Business case 2139-9 for DeviceNotification */
    it('DeviceNotification_case_2139', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2139-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2138-8 for DeviceNotification */
    it('DeviceNotification_case_2138', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2138-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2137-7 for DeviceNotification */
    it('DeviceNotification_case_2137', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2137-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2136-6 for DeviceNotification */
    it('DeviceNotification_case_2136', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2136-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2135-5 for DeviceNotification */
    it('DeviceNotification_case_2135', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2135-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2134-4 for DeviceNotification */
    it('DeviceNotification_case_2134', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2134-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2133-3 for DeviceNotification */
    it('DeviceNotification_case_2133', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2132-2 for DeviceNotification */
    it('DeviceNotification_case_2132', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2131-1 for DeviceNotification */
    it('DeviceNotification_case_2131', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2131-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2130-0 for DeviceNotification */
    it('DeviceNotification_case_2130', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2130-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2130-0')).assertFalse();
    });

    /* Business case 2129-9 for DeviceNotification */
    it('DeviceNotification_case_2129', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2129-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2128-8 for DeviceNotification */
    it('DeviceNotification_case_2128', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2128-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2127-7 for DeviceNotification */
    it('DeviceNotification_case_2127', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2127-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2126-6 for DeviceNotification */
    it('DeviceNotification_case_2126', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2126-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2125-5 for DeviceNotification */
    it('DeviceNotification_case_2125', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2125-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2124-4 for DeviceNotification */
    it('DeviceNotification_case_2124', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2124-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2123-3 for DeviceNotification */
    it('DeviceNotification_case_2123', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2122-2 for DeviceNotification */
    it('DeviceNotification_case_2122', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2121-1 for DeviceNotification */
    it('DeviceNotification_case_2121', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2121-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2120-0 for DeviceNotification */
    it('DeviceNotification_case_2120', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2120-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2120-0')).assertFalse();
    });

    /* Business case 2119-9 for DeviceNotification */
    it('DeviceNotification_case_2119', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2119-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2118-8 for DeviceNotification */
    it('DeviceNotification_case_2118', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2118-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2117-7 for DeviceNotification */
    it('DeviceNotification_case_2117', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2117-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2116-6 for DeviceNotification */
    it('DeviceNotification_case_2116', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2116-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2115-5 for DeviceNotification */
    it('DeviceNotification_case_2115', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2115-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2114-4 for DeviceNotification */
    it('DeviceNotification_case_2114', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2114-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2113-3 for DeviceNotification */
    it('DeviceNotification_case_2113', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2112-2 for DeviceNotification */
    it('DeviceNotification_case_2112', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2111-1 for DeviceNotification */
    it('DeviceNotification_case_2111', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2111-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2110-0 for DeviceNotification */
    it('DeviceNotification_case_2110', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2110-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2110-0')).assertFalse();
    });

    /* Business case 2109-9 for DeviceNotification */
    it('DeviceNotification_case_2109', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2109-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2108-8 for DeviceNotification */
    it('DeviceNotification_case_2108', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2108-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2107-7 for DeviceNotification */
    it('DeviceNotification_case_2107', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2107-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2106-6 for DeviceNotification */
    it('DeviceNotification_case_2106', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2106-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2105-5 for DeviceNotification */
    it('DeviceNotification_case_2105', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2105-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2104-4 for DeviceNotification */
    it('DeviceNotification_case_2104', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2104-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2103-3 for DeviceNotification */
    it('DeviceNotification_case_2103', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2102-2 for DeviceNotification */
    it('DeviceNotification_case_2102', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2101-1 for DeviceNotification */
    it('DeviceNotification_case_2101', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2101-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2100-0 for DeviceNotification */
    it('DeviceNotification_case_2100', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2100-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2100-0')).assertFalse();
    });

  });
}
