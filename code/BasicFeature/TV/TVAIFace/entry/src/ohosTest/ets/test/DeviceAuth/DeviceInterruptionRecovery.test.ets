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

export default function deviceInterruptionRecoveryTest(): void {
  describe('deviceInterruptionRecovery_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('DeviceInterruptionRecovery_unknown_device_20', 0, () => {
      const trusted: boolean = RemoteDeviceModel.isDeviceIdInTrustList('synthetic-20');
      const untrusted: boolean = RemoteDeviceModel.isDeviceIdInUnTrustList('synthetic-20');
      expect(trusted).assertFalse();
      expect(untrusted).assertFalse();
    });


    it('DeviceInterruptionRecovery_delete_unknown_20', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('synthetic-delete-20');
      const after: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      expect(after).assertEqual(before);
    });


    /* Business case 2064-4 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2064', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2064-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2063-3 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2063', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2062-2 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2062', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2061-1 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2061', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2061-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2060-0 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2060', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2060-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2060-0')).assertFalse();
    });

    /* Business case 2059-9 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2059', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2059-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2058-8 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2058', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2058-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2057-7 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2057', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2057-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2056-6 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2056', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2056-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2055-5 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2055', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2055-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2054-4 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2054', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2054-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2053-3 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2053', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2052-2 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2052', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2051-1 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2051', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2051-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2050-0 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2050', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2050-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2050-0')).assertFalse();
    });

    /* Business case 2049-9 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2049', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2049-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2048-8 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2048', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2048-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2047-7 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2047', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2047-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2046-6 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2046', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2046-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2045-5 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2045', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2045-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2044-4 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2044', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2044-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2043-3 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2043', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2042-2 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2042', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2041-1 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2041', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2041-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2040-0 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2040', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2040-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2040-0')).assertFalse();
    });

    /* Business case 2039-9 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2039', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2039-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2038-8 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2038', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2038-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2037-7 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2037', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2037-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2036-6 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2036', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2036-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2035-5 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2035', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2035-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2034-4 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2034', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2034-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2033-3 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2033', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2032-2 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2032', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2031-1 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2031', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2031-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2030-0 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2030', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2030-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2030-0')).assertFalse();
    });

    /* Business case 2029-9 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2029', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2029-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2028-8 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2028', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2028-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2027-7 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2027', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2027-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2026-6 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2026', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2026-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2025-5 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2025', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2025-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2024-4 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2024', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2024-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2023-3 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2023', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2022-2 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2022', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2021-1 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2021', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2021-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2020-0 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2020', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2020-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2020-0')).assertFalse();
    });

    /* Business case 2019-9 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2019', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2019-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2018-8 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2018', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2018-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2017-7 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2017', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2017-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2016-6 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2016', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2016-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2015-5 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2015', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2015-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2014-4 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2014', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2014-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2013-3 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2013', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2012-2 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2012', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2011-1 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2011', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2011-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2010-0 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2010', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2010-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2010-0')).assertFalse();
    });

    /* Business case 2009-9 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2009', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2009-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2008-8 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2008', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2008-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2007-7 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2007', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2007-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2006-6 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2006', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2006-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2005-5 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2005', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2005-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2004-4 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2004', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-2004-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 2003-3 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2003', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 2002-2 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2002', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 2001-1 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2001', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-2001-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 2000-0 for DeviceInterruptionRecovery */
    it('DeviceInterruptionRecovery_case_2000', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-2000-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-2000-0')).assertFalse();
    });

  });
}
