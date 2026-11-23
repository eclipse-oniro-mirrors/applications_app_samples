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
import { Scan } from '../../../main/ets/scan/scan';
import { ScanLog } from '../../../main/ets/scan/log';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanTest() {
  describe('ScanSmoke', () => {
    /**
     * @tc.number SUB_SCAN_SMOKE_0001
     * @tc.name testScanSmoke0001
     * @tc.desc the Scan facade exposes the whole discovery and scan entry set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testScanSmoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScanSmoke0001 begin');
      expect(typeof Scan.init).assertEqual('function');
      expect(typeof Scan.startScannerDiscovery).assertEqual('function');
      expect(typeof Scan.getScannerParameter).assertEqual('function');
      expect(new Scan() instanceof Scan).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScanSmoke0001 end');
    });

    /**
     * @tc.number SUB_SCAN_SMOKE_0002
     * @tc.name testScanSmoke0002
     * @tc.desc SDK enums keep their documented wire values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testScanSmoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScanSmoke0002 begin');
      expect(scan.ScannerDiscoveryMode.TCP_STR).assertEqual('TCP');
      expect(scan.ScannerDiscoveryMode.USB_STR).assertEqual('USB');
      expect(scan.ScannerSyncMode.UPDATE_STR).assertEqual('update');
      expect(scan.ScannerSyncMode.DELETE_STR).assertEqual('delete');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScanSmoke0002 end');
    });

    /**
     * @tc.number SUB_SCAN_SMOKE_0003
     * @tc.name testScanSmoke0003
     * @tc.desc the legacy logger keeps four severity entries available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testScanSmoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScanSmoke0003 begin');
      expect(typeof ScanLog.info).assertEqual('function');
      expect(typeof ScanLog.warn).assertEqual('function');
      expect(typeof ScanLog.fatal).assertEqual('function');
      expect(new ScanLog() instanceof ScanLog).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScanSmoke0003 end');
    });
  });
}
