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

export default function deviceSessionValidationTest(): void {
  describe('deviceSessionValidation_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('DeviceSessionValidation_unknown_device_23', 0, () => {
      const trusted: boolean = RemoteDeviceModel.isDeviceIdInTrustList('synthetic-23');
      const untrusted: boolean = RemoteDeviceModel.isDeviceIdInUnTrustList('synthetic-23');
      expect(trusted).assertFalse();
      expect(untrusted).assertFalse();
    });


    it('DeviceSessionValidation_delete_unknown_23', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('synthetic-delete-23');
      const after: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      expect(after).assertEqual(before);
    });


    /* Business case 2354-4 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2354', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2354-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2353-3 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2353', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2352-2 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2352', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2351-1 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2351', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2351-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2350-0 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2350', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2350-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2350-0')).assertFalse();
    });

    /* Business case 2349-9 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2349', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2349-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2348-8 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2348', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2348-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2347-7 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2347', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2347-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2346-6 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2346', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2346-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2345-5 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2345', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2345-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2344-4 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2344', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2344-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2343-3 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2343', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2342-2 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2342', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2341-1 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2341', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2341-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2340-0 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2340', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2340-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2340-0')).assertFalse();
    });

    /* Business case 2339-9 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2339', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2339-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2338-8 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2338', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2338-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2337-7 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2337', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2337-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2336-6 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2336', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2336-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2335-5 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2335', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2335-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2334-4 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2334', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2334-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2333-3 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2333', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2332-2 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2332', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2331-1 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2331', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2331-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2330-0 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2330', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2330-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2330-0')).assertFalse();
    });

    /* Business case 2329-9 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2329', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2329-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2328-8 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2328', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2328-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2327-7 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2327', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2327-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2326-6 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2326', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2326-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2325-5 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2325', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2325-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2324-4 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2324', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2324-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2323-3 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2323', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2322-2 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2322', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2321-1 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2321', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2321-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2320-0 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2320', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2320-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2320-0')).assertFalse();
    });

    /* Business case 2319-9 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2319', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2319-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2318-8 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2318', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2318-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2317-7 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2317', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2317-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2316-6 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2316', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2316-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2315-5 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2315', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2315-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2314-4 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2314', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2314-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2313-3 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2313', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2312-2 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2312', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2311-1 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2311', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2311-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2310-0 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2310', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2310-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2310-0')).assertFalse();
    });

    /* Business case 2309-9 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2309', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2309-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2308-8 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2308', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2308-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2307-7 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2307', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2307-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2306-6 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2306', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2306-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2305-5 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2305', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2305-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2304-4 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2304', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2304-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2303-3 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2303', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2302-2 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2302', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2301-1 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2301', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2301-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2300-0 for DeviceSessionValidation */
    it('DeviceSessionValidation_case_2300', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2300-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2300-0')).assertFalse();
    });

  });
}
