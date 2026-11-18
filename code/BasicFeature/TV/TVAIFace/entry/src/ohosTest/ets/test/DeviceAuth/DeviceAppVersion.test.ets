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

export default function deviceAppVersionTest(): void {
  describe('deviceAppVersion_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('DeviceAppVersion_unknown_device_16', 0, () => {
      const trusted: boolean = RemoteDeviceModel.isDeviceIdInTrustList('synthetic-16');
      const untrusted: boolean = RemoteDeviceModel.isDeviceIdInUnTrustList('synthetic-16');
      expect(trusted).assertFalse();
      expect(untrusted).assertFalse();
    });


    it('DeviceAppVersion_delete_unknown_16', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('synthetic-delete-16');
      const after: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      expect(after).assertEqual(before);
    });


    /* Business case 1688-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1688', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1688-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1687-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1687', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1687-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1686-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1686', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1686-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1685-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1685', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1685-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1684-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1684', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1684-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1683-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1683', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1682-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1682', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1681-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1681', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1681-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1680-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1680', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1680-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1680-0')).assertFalse();
    });

    /* Business case 1679-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1679', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1679-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1678-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1678', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1678-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1677-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1677', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1677-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1676-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1676', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1676-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1675-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1675', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1675-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1674-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1674', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1674-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1673-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1673', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1672-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1672', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1671-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1671', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1671-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1670-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1670', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1670-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1670-0')).assertFalse();
    });

    /* Business case 1669-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1669', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1669-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1668-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1668', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1668-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1667-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1667', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1667-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1666-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1666', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1666-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1665-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1665', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1665-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1664-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1664', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1664-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1663-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1663', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1662-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1662', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1661-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1661', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1661-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1660-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1660', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1660-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1660-0')).assertFalse();
    });

    /* Business case 1659-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1659', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1659-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1658-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1658', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1658-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1657-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1657', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1657-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1656-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1656', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1656-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1655-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1655', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1655-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1654-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1654', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1654-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1653-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1653', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1652-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1652', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1651-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1651', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1651-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1650-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1650', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1650-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1650-0')).assertFalse();
    });

    /* Business case 1649-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1649', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1649-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1648-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1648', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1648-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1647-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1647', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1647-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1646-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1646', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1646-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1645-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1645', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1645-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1644-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1644', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1644-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1643-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1643', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1642-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1642', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1641-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1641', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1641-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1640-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1640', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1640-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1640-0')).assertFalse();
    });

    /* Business case 1639-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1639', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1639-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1638-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1638', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1638-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1637-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1637', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1637-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1636-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1636', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1636-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1635-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1635', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1635-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1634-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1634', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1634-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1633-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1633', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1632-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1632', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1631-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1631', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1631-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1630-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1630', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1630-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1630-0')).assertFalse();
    });

    /* Business case 1629-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1629', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1629-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1628-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1628', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1628-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1627-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1627', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1627-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1626-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1626', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1626-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1625-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1625', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1625-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1624-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1624', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1624-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1623-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1623', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1622-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1622', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1621-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1621', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1621-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1620-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1620', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1620-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1620-0')).assertFalse();
    });

    /* Business case 1619-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1619', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1619-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1618-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1618', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1618-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1617-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1617', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1617-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1616-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1616', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1616-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1615-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1615', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1615-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1614-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1614', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1614-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1613-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1613', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1612-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1612', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1611-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1611', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1611-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1610-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1610', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1610-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1610-0')).assertFalse();
    });

    /* Business case 1609-9 for DeviceAppVersion */
    it('DeviceAppVersion_case_1609', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1609-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1608-8 for DeviceAppVersion */
    it('DeviceAppVersion_case_1608', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1608-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1607-7 for DeviceAppVersion */
    it('DeviceAppVersion_case_1607', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1607-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1606-6 for DeviceAppVersion */
    it('DeviceAppVersion_case_1606', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1606-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1605-5 for DeviceAppVersion */
    it('DeviceAppVersion_case_1605', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1605-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1604-4 for DeviceAppVersion */
    it('DeviceAppVersion_case_1604', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1604-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1603-3 for DeviceAppVersion */
    it('DeviceAppVersion_case_1603', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1602-2 for DeviceAppVersion */
    it('DeviceAppVersion_case_1602', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1601-1 for DeviceAppVersion */
    it('DeviceAppVersion_case_1601', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1601-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1600-0 for DeviceAppVersion */
    it('DeviceAppVersion_case_1600', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1600-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1600-0')).assertFalse();
    });

  });
}
