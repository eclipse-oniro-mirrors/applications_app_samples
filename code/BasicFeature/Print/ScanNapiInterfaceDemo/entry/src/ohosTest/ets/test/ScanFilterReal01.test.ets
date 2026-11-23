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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { scan } from '@kit.BasicServicesKit';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { ScanDeviceFilter } from '../../../main/ets/scan/model/ScanDeviceFilter';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanFilterRealTest() {
  describe('ScanFilterReal', () => {
    /**
     * @tc.number SUB_SCAN_FILTER_02_0001
     * @tc.name testFilterReal0001
     * @tc.desc byManufacturer matches the exact vendor only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFilterReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0001 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      const acme: scan.ScannerDevice[] = ScanDeviceFilter.byManufacturer(devices, 'Acme');
      const none: scan.ScannerDevice[] = ScanDeviceFilter.byManufacturer(devices, 'acme');
      expect(acme.length).assertEqual(2);
      expect(none.length).assertEqual(0);
      expect(acme[0].scannerId).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_FILTER_02_0002
     * @tc.name testFilterReal0002
     * @tc.desc sortById orders ids lexicographically
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFilterReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0002 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(12);
      const sorted: scan.ScannerDevice[] = ScanDeviceFilter.sortById(devices);
      expect(sorted.length).assertEqual(12);
      expect(sorted[0].scannerId).assertEqual('S0');
      expect(sorted[11].scannerId).assertEqual('S9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_FILTER_02_0003
     * @tc.name testFilterReal0003
     * @tc.desc intersect keeps the left order and drops missing ids
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFilterReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0003 begin');
      const left: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      const right: scan.ScannerDevice[] = ScanParameterBuilder.devices(
        ScanParameterBuilder.device('S2', 'U2', '', '', '', 'TCP'),
        ScanParameterBuilder.device('S0', 'U0', '', '', '', 'TCP'));
      const hit: scan.ScannerDevice[] = ScanDeviceFilter.intersect(left, right);
      expect(hit.length).assertEqual(2);
      expect(hit[0].scannerId).assertEqual('S0');
      expect(hit[1].scannerId).assertEqual('S2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_FILTER_02_0004
     * @tc.name testFilterReal0004
     * @tc.desc uniqueDevices keeps the first occurrence of each id
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFilterReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0004 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.devices(
        ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP'),
        ScanParameterBuilder.device('1', 'U9', '', '', '', 'USB'),
        ScanParameterBuilder.device('2', 'U2', '', '', '', 'TCP'));
      const unique: string[] = ScanDeviceFilter.uniqueIds(devices);
      expect(unique.length).assertEqual(2);
      expect(unique[0]).assertEqual('1');
      expect(unique[1]).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_FILTER_02_0005
     * @tc.name testFilterReal0005
     * @tc.desc summary aggregates count and edge ids
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFilterReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0005 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(4);
      const summary: string = ScanDeviceFilter.summary(devices);
      expect(summary).assertEqual('count=4 first=S0 last=S3');
      expect(ScanDeviceFilter.summary(ScanParameterBuilder.devices())).assertEqual('count=0 first= last=');
      expect(ScanDeviceFilter.count(devices)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_FILTER_02_0006
     * @tc.name testFilterReal0006
     * @tc.desc byIdPrefix matches the leading substring only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFilterReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0006 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(3);
      const hit: scan.ScannerDevice[] = ScanDeviceFilter.byIdPrefix(devices, 'S1');
      const miss: scan.ScannerDevice[] = ScanDeviceFilter.byIdPrefix(devices, '1');
      expect(hit.length).assertEqual(1);
      expect(hit[0].scannerId).assertEqual('S1');
      expect(miss.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterReal0006 end');
    });
  });
}
