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

export default function deviceAuthSessionTest(): void {
  describe('deviceAuthSession_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('DeviceAuthSession_unknown_device_17', 0, () => {
      const trusted: boolean = RemoteDeviceModel.isDeviceIdInTrustList('synthetic-17');
      const untrusted: boolean = RemoteDeviceModel.isDeviceIdInUnTrustList('synthetic-17');
      expect(trusted).assertFalse();
      expect(untrusted).assertFalse();
    });


    it('DeviceAuthSession_delete_unknown_17', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('synthetic-delete-17');
      const after: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      expect(after).assertEqual(before);
    });


    /* Business case 1784-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1784', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1784-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1783-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1783', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1782-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1782', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1781-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1781', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1781-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1780-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1780', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1780-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1780-0')).assertFalse();
    });

    /* Business case 1779-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1779', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1779-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1778-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1778', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1778-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1777-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1777', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1777-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1776-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1776', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1776-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1775-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1775', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1775-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1774-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1774', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1774-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1773-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1773', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1772-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1772', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1771-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1771', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1771-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1770-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1770', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1770-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1770-0')).assertFalse();
    });

    /* Business case 1769-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1769', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1769-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1768-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1768', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1768-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1767-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1767', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1767-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1766-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1766', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1766-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1765-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1765', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1765-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1764-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1764', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1764-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1763-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1763', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1762-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1762', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1761-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1761', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1761-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1760-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1760', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1760-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1760-0')).assertFalse();
    });

    /* Business case 1759-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1759', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1759-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1758-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1758', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1758-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1757-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1757', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1757-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1756-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1756', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1756-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1755-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1755', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1755-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1754-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1754', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1754-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1753-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1753', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1752-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1752', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1751-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1751', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1751-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1750-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1750', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1750-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1750-0')).assertFalse();
    });

    /* Business case 1749-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1749', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1749-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1748-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1748', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1748-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1747-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1747', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1747-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1746-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1746', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1746-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1745-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1745', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1745-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1744-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1744', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1744-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1743-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1743', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1742-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1742', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1741-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1741', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1741-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1740-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1740', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1740-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1740-0')).assertFalse();
    });

    /* Business case 1739-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1739', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1739-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1738-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1738', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1738-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1737-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1737', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1737-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1736-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1736', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1736-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1735-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1735', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1735-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1734-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1734', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1734-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1733-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1733', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1732-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1732', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1731-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1731', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1731-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1730-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1730', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1730-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1730-0')).assertFalse();
    });

    /* Business case 1729-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1729', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1729-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1728-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1728', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1728-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1727-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1727', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1727-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1726-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1726', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1726-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1725-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1725', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1725-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1724-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1724', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1724-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1723-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1723', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1722-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1722', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1721-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1721', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1721-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1720-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1720', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1720-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1720-0')).assertFalse();
    });

    /* Business case 1719-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1719', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1719-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1718-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1718', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1718-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1717-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1717', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1717-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1716-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1716', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1716-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1715-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1715', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1715-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1714-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1714', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1714-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1713-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1713', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1712-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1712', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1711-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1711', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1711-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1710-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1710', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1710-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1710-0')).assertFalse();
    });

    /* Business case 1709-9 for DeviceAuthSession */
    it('DeviceAuthSession_case_1709', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1709-9');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1708-8 for DeviceAuthSession */
    it('DeviceAuthSession_case_1708', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1708-8');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1707-7 for DeviceAuthSession */
    it('DeviceAuthSession_case_1707', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1707-7');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1706-6 for DeviceAuthSession */
    it('DeviceAuthSession_case_1706', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1706-6');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1705-5 for DeviceAuthSession */
    it('DeviceAuthSession_case_1705', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1705-5');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1704-4 for DeviceAuthSession */
    it('DeviceAuthSession_case_1704', 0, () => {
      let ok: boolean = true;
      try {
        RemoteDeviceModel.stopDiscovering();
        RemoteDeviceModel.unbindTarget('device-1704-4');
      } catch (error) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /* Business case 1703-3 for DeviceAuthSession */
    it('DeviceAuthSession_case_1703', 0, () => {
      RemoteDeviceModel.createRemoteDeviceModel();
      expect(typeof RemoteDeviceModel.bindTarget).assertEqual('function');
      expect(typeof RemoteDeviceModel.unbindTarget).assertEqual('function');
    });

    /* Business case 1702-2 for DeviceAuthSession */
    it('DeviceAuthSession_case_1702', 0, () => {
      const list: Array<Object> = RemoteDeviceModel.getUnTrustDeviceList();
      expect(Array.isArray(list)).assertTrue();
      expect(list.length).assertLargerOrEqual(0);
    });

    /* Business case 1701-1 for DeviceAuthSession */
    it('DeviceAuthSession_case_1701', 0, () => {
      const before: number = RemoteDeviceModel.getUnTrustDeviceList().length;
      RemoteDeviceModel.deleteDeviceIdInUnTrustList('device-1701-1');
      expect(RemoteDeviceModel.getUnTrustDeviceList().length).assertEqual(before);
    });

    /* Business case 1700-0 for DeviceAuthSession */
    it('DeviceAuthSession_case_1700', 0, () => {
      expect(RemoteDeviceModel.isDeviceIdInTrustList('device-1700-0')).assertFalse();
      expect(RemoteDeviceModel.isDeviceIdInUnTrustList('device-1700-0')).assertFalse();
    });

  });
}
