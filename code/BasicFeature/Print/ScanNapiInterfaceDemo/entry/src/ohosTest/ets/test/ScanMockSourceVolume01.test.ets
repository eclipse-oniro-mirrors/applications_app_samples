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
import { ScanMockSource } from '../../../main/ets/scan/model/ScanMockSource';
import { ScanMockProbe } from '../../../main/ets/scan/model/ScanMockProbe';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanMockSourceTest() {
  describe('ScanMockSource', () => {

    /**
     * @tc.name   testMockSrc0001
     * @tc.number SUB_SCAN_MOCKSRC_01_0001
     * @tc.desc   snapshot of 0 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0001 begin');
      const result: string = ScanMockProbe.run(0, 'none', '', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0001 end');
    });

    /**
     * @tc.name   testMockSrc0002
     * @tc.number SUB_SCAN_MOCKSRC_01_0002
     * @tc.desc   snapshot of 1 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0002 begin');
      const result: string = ScanMockProbe.run(1, 'none', '', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0002 end');
    });

    /**
     * @tc.name   testMockSrc0003
     * @tc.number SUB_SCAN_MOCKSRC_01_0003
     * @tc.desc   snapshot of 2 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0003 begin');
      const result: string = ScanMockProbe.run(2, 'none', '', 0);
      expect(result).assertEqual('count=2;first=S0;last=S1;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0003 end');
    });

    /**
     * @tc.name   testMockSrc0004
     * @tc.number SUB_SCAN_MOCKSRC_01_0004
     * @tc.desc   snapshot of 3 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0004 begin');
      const result: string = ScanMockProbe.run(3, 'none', '', 0);
      expect(result).assertEqual('count=3;first=S0;last=S2;tcp=2;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0004 end');
    });

    /**
     * @tc.name   testMockSrc0005
     * @tc.number SUB_SCAN_MOCKSRC_01_0005
     * @tc.desc   snapshot of 4 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0005 begin');
      const result: string = ScanMockProbe.run(4, 'none', '', 0);
      expect(result).assertEqual('count=4;first=S0;last=S3;tcp=2;usb=2;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(4);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S3');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0005 end');
    });

    /**
     * @tc.name   testMockSrc0006
     * @tc.number SUB_SCAN_MOCKSRC_01_0006
     * @tc.desc   snapshot of 5 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0006 begin');
      const result: string = ScanMockProbe.run(5, 'none', '', 0);
      expect(result).assertEqual('count=5;first=S0;last=S4;tcp=3;usb=2;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(5);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S4');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0006 end');
    });

    /**
     * @tc.name   testMockSrc0007
     * @tc.number SUB_SCAN_MOCKSRC_01_0007
     * @tc.desc   snapshot of 6 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0007 begin');
      const result: string = ScanMockProbe.run(6, 'none', '', 0);
      expect(result).assertEqual('count=6;first=S0;last=S5;tcp=3;usb=3;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(6);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S5');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0007 end');
    });

    /**
     * @tc.name   testMockSrc0008
     * @tc.number SUB_SCAN_MOCKSRC_01_0008
     * @tc.desc   snapshot of 7 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0008 begin');
      const result: string = ScanMockProbe.run(7, 'none', '', 0);
      expect(result).assertEqual('count=7;first=S0;last=S6;tcp=4;usb=3;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(7);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S6');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0008 end');
    });

    /**
     * @tc.name   testMockSrc0009
     * @tc.number SUB_SCAN_MOCKSRC_01_0009
     * @tc.desc   snapshot of 8 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0009 begin');
      const result: string = ScanMockProbe.run(8, 'none', '', 0);
      expect(result).assertEqual('count=8;first=S0;last=S7;tcp=4;usb=4;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(8);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S7');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0009 end');
    });

    /**
     * @tc.name   testMockSrc0010
     * @tc.number SUB_SCAN_MOCKSRC_01_0010
     * @tc.desc   snapshot of 9 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0010 begin');
      const result: string = ScanMockProbe.run(9, 'none', '', 0);
      expect(result).assertEqual('count=9;first=S0;last=S8;tcp=5;usb=4;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(9);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S8');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0010 end');
    });

    /**
     * @tc.name   testMockSrc0011
     * @tc.number SUB_SCAN_MOCKSRC_01_0011
     * @tc.desc   snapshot of 10 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0011 begin');
      const result: string = ScanMockProbe.run(10, 'none', '', 0);
      expect(result).assertEqual('count=10;first=S0;last=S9;tcp=5;usb=5;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(10);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0011 end');
    });

    /**
     * @tc.name   testMockSrc0012
     * @tc.number SUB_SCAN_MOCKSRC_01_0012
     * @tc.desc   snapshot of 11 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0012 begin');
      const result: string = ScanMockProbe.run(11, 'none', '', 0);
      expect(result).assertEqual('count=11;first=S0;last=S10;tcp=6;usb=5;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(11);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S10');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0012 end');
    });

    /**
     * @tc.name   testMockSrc0013
     * @tc.number SUB_SCAN_MOCKSRC_01_0013
     * @tc.desc   snapshot of 12 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0013 begin');
      const result: string = ScanMockProbe.run(12, 'none', '', 0);
      expect(result).assertEqual('count=12;first=S0;last=S11;tcp=6;usb=6;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(12);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S11');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0013 end');
    });

    /**
     * @tc.name   testMockSrc0014
     * @tc.number SUB_SCAN_MOCKSRC_01_0014
     * @tc.desc   snapshot of 13 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0014 begin');
      const result: string = ScanMockProbe.run(13, 'none', '', 0);
      expect(result).assertEqual('count=13;first=S0;last=S12;tcp=7;usb=6;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(13);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S12');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0014 end');
    });

    /**
     * @tc.name   testMockSrc0015
     * @tc.number SUB_SCAN_MOCKSRC_01_0015
     * @tc.desc   snapshot of 14 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0015 begin');
      const result: string = ScanMockProbe.run(14, 'none', '', 0);
      expect(result).assertEqual('count=14;first=S0;last=S13;tcp=7;usb=7;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(14);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S13');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0015 end');
    });

    /**
     * @tc.name   testMockSrc0016
     * @tc.number SUB_SCAN_MOCKSRC_01_0016
     * @tc.desc   snapshot of 15 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0016 begin');
      const result: string = ScanMockProbe.run(15, 'none', '', 0);
      expect(result).assertEqual('count=15;first=S0;last=S14;tcp=8;usb=7;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(15);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S14');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0016 end');
    });

    /**
     * @tc.name   testMockSrc0017
     * @tc.number SUB_SCAN_MOCKSRC_01_0017
     * @tc.desc   snapshot of 16 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0017 begin');
      const result: string = ScanMockProbe.run(16, 'none', '', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0017 end');
    });

    /**
     * @tc.name   testMockSrc0018
     * @tc.number SUB_SCAN_MOCKSRC_01_0018
     * @tc.desc   snapshot of 17 seeded devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0018 begin');
      const result: string = ScanMockProbe.run(17, 'none', '', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0018 end');
    });

    /**
     * @tc.name   testMockSrc0019
     * @tc.number SUB_SCAN_MOCKSRC_01_0019
     * @tc.desc   add new id N9 as TCP to 0 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0019 begin');
      const result: string = ScanMockProbe.run(0, 'add', 'N9', 0);
      expect(result).assertEqual('count=1;first=N9;last=N9;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('N9');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0019 end');
    });

    /**
     * @tc.name   testMockSrc0020
     * @tc.number SUB_SCAN_MOCKSRC_01_0020
     * @tc.desc   add new id N9 as USB to 0 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0020 begin');
      const result: string = ScanMockProbe.run(0, 'add', 'N9', 1);
      expect(result).assertEqual('count=1;first=N9;last=N9;tcp=0;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('N9');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0020 end');
    });

    /**
     * @tc.name   testMockSrc0021
     * @tc.number SUB_SCAN_MOCKSRC_01_0021
     * @tc.desc   add new id N9 as TCP to 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0021 begin');
      const result: string = ScanMockProbe.run(1, 'add', 'N9', 0);
      expect(result).assertEqual('count=2;first=S0;last=N9;tcp=2;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0021 end');
    });

    /**
     * @tc.name   testMockSrc0022
     * @tc.number SUB_SCAN_MOCKSRC_01_0022
     * @tc.desc   add new id N9 as USB to 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0022 begin');
      const result: string = ScanMockProbe.run(1, 'add', 'N9', 1);
      expect(result).assertEqual('count=2;first=S0;last=N9;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0022 end');
    });

    /**
     * @tc.name   testMockSrc0023
     * @tc.number SUB_SCAN_MOCKSRC_01_0023
     * @tc.desc   add new id N9 as TCP to 5 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0023 begin');
      const result: string = ScanMockProbe.run(5, 'add', 'N9', 0);
      expect(result).assertEqual('count=6;first=S0;last=N9;tcp=4;usb=2;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(6);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0023 end');
    });

    /**
     * @tc.name   testMockSrc0024
     * @tc.number SUB_SCAN_MOCKSRC_01_0024
     * @tc.desc   add new id N9 as USB to 5 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0024 begin');
      const result: string = ScanMockProbe.run(5, 'add', 'N9', 1);
      expect(result).assertEqual('count=6;first=S0;last=N9;tcp=3;usb=3;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(6);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0024 end');
    });

    /**
     * @tc.name   testMockSrc0025
     * @tc.number SUB_SCAN_MOCKSRC_01_0025
     * @tc.desc   add new id N9 as TCP to 15 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0025 begin');
      const result: string = ScanMockProbe.run(15, 'add', 'N9', 0);
      expect(result).assertEqual('count=16;first=S0;last=N9;tcp=9;usb=7;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0025 end');
    });

    /**
     * @tc.name   testMockSrc0026
     * @tc.number SUB_SCAN_MOCKSRC_01_0026
     * @tc.desc   add new id N9 as USB to 15 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0026 begin');
      const result: string = ScanMockProbe.run(15, 'add', 'N9', 1);
      expect(result).assertEqual('count=16;first=S0;last=N9;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('N9');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0026 end');
    });

    /**
     * @tc.name   testMockSrc0027
     * @tc.number SUB_SCAN_MOCKSRC_01_0027
     * @tc.desc   add new id N9 as TCP to 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0027 begin');
      const result: string = ScanMockProbe.run(16, 'add', 'N9', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0027 end');
    });

    /**
     * @tc.name   testMockSrc0028
     * @tc.number SUB_SCAN_MOCKSRC_01_0028
     * @tc.desc   add new id N9 as USB to 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0028 begin');
      const result: string = ScanMockProbe.run(16, 'add', 'N9', 1);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0028 end');
    });

    /**
     * @tc.name   testMockSrc0029
     * @tc.number SUB_SCAN_MOCKSRC_01_0029
     * @tc.desc   add duplicate S0 to 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0029 begin');
      const result: string = ScanMockProbe.run(1, 'add', 'S0', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0029 end');
    });

    /**
     * @tc.name   testMockSrc0030
     * @tc.number SUB_SCAN_MOCKSRC_01_0030
     * @tc.desc   add duplicate S1 to 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0030 begin');
      const result: string = ScanMockProbe.run(1, 'add', 'S1', 0);
      expect(result).assertEqual('count=2;first=S0;last=S1;tcp=2;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0030 end');
    });

    /**
     * @tc.name   testMockSrc0031
     * @tc.number SUB_SCAN_MOCKSRC_01_0031
     * @tc.desc   add duplicate S0 to 2 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0031 begin');
      const result: string = ScanMockProbe.run(2, 'add', 'S0', 0);
      expect(result).assertEqual('count=2;first=S0;last=S1;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0031 end');
    });

    /**
     * @tc.name   testMockSrc0032
     * @tc.number SUB_SCAN_MOCKSRC_01_0032
     * @tc.desc   add duplicate S1 to 2 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0032 begin');
      const result: string = ScanMockProbe.run(2, 'add', 'S1', 0);
      expect(result).assertEqual('count=2;first=S0;last=S1;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0032 end');
    });

    /**
     * @tc.name   testMockSrc0033
     * @tc.number SUB_SCAN_MOCKSRC_01_0033
     * @tc.desc   add duplicate S0 to 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0033 begin');
      const result: string = ScanMockProbe.run(16, 'add', 'S0', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0033 end');
    });

    /**
     * @tc.name   testMockSrc0034
     * @tc.number SUB_SCAN_MOCKSRC_01_0034
     * @tc.desc   add duplicate S1 to 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0034 begin');
      const result: string = ScanMockProbe.run(16, 'add', 'S1', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0034 end');
    });

    /**
     * @tc.name   testMockSrc0035
     * @tc.number SUB_SCAN_MOCKSRC_01_0035
     * @tc.desc   remove S0 from 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0035 begin');
      const result: string = ScanMockProbe.run(1, 'remove', 'S0', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0035 end');
    });

    /**
     * @tc.name   testMockSrc0036
     * @tc.number SUB_SCAN_MOCKSRC_01_0036
     * @tc.desc   remove S1 from 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0036 begin');
      const result: string = ScanMockProbe.run(1, 'remove', 'S1', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0036 end');
    });

    /**
     * @tc.name   testMockSrc0037
     * @tc.number SUB_SCAN_MOCKSRC_01_0037
     * @tc.desc   remove S0 from 2 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0037 begin');
      const result: string = ScanMockProbe.run(2, 'remove', 'S0', 0);
      expect(result).assertEqual('count=1;first=S1;last=S1;tcp=0;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S1');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0037 end');
    });

    /**
     * @tc.name   testMockSrc0038
     * @tc.number SUB_SCAN_MOCKSRC_01_0038
     * @tc.desc   remove S1 from 2 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0038 begin');
      const result: string = ScanMockProbe.run(2, 'remove', 'S1', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0038 end');
    });

    /**
     * @tc.name   testMockSrc0039
     * @tc.number SUB_SCAN_MOCKSRC_01_0039
     * @tc.desc   remove S0 from 3 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0039 begin');
      const result: string = ScanMockProbe.run(3, 'remove', 'S0', 0);
      expect(result).assertEqual('count=2;first=S1;last=S2;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S1');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0039 end');
    });

    /**
     * @tc.name   testMockSrc0040
     * @tc.number SUB_SCAN_MOCKSRC_01_0040
     * @tc.desc   remove S1 from 3 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0040 begin');
      const result: string = ScanMockProbe.run(3, 'remove', 'S1', 0);
      expect(result).assertEqual('count=2;first=S0;last=S2;tcp=2;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0040 end');
    });

    /**
     * @tc.name   testMockSrc0041
     * @tc.number SUB_SCAN_MOCKSRC_01_0041
     * @tc.desc   remove S0 from 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0041 begin');
      const result: string = ScanMockProbe.run(16, 'remove', 'S0', 0);
      expect(result).assertEqual('count=15;first=S1;last=S15;tcp=7;usb=8;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(15);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S1');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0041 end');
    });

    /**
     * @tc.name   testMockSrc0042
     * @tc.number SUB_SCAN_MOCKSRC_01_0042
     * @tc.desc   remove S1 from 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0042 begin');
      const result: string = ScanMockProbe.run(16, 'remove', 'S1', 0);
      expect(result).assertEqual('count=15;first=S0;last=S15;tcp=8;usb=7;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(15);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0042 end');
    });

    /**
     * @tc.name   testMockSrc0043
     * @tc.number SUB_SCAN_MOCKSRC_01_0043
     * @tc.desc   remove unknown 'X9' from 0 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0043 begin');
      const result: string = ScanMockProbe.run(0, 'remove', 'X9', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0043 end');
    });

    /**
     * @tc.name   testMockSrc0044
     * @tc.number SUB_SCAN_MOCKSRC_01_0044
     * @tc.desc   remove unknown '' from 0 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0044 begin');
      const result: string = ScanMockProbe.run(0, 'remove', '', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0044 end');
    });

    /**
     * @tc.name   testMockSrc0045
     * @tc.number SUB_SCAN_MOCKSRC_01_0045
     * @tc.desc   remove unknown 'X9' from 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0045 begin');
      const result: string = ScanMockProbe.run(1, 'remove', 'X9', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0045 end');
    });

    /**
     * @tc.name   testMockSrc0046
     * @tc.number SUB_SCAN_MOCKSRC_01_0046
     * @tc.desc   remove unknown '' from 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0046 begin');
      const result: string = ScanMockProbe.run(1, 'remove', '', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0046 end');
    });

    /**
     * @tc.name   testMockSrc0047
     * @tc.number SUB_SCAN_MOCKSRC_01_0047
     * @tc.desc   rename S0 in 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0047 begin');
      const result: string = ScanMockProbe.run(1, 'rename', 'S0', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0047 end');
    });

    /**
     * @tc.name   testMockSrc0048
     * @tc.number SUB_SCAN_MOCKSRC_01_0048
     * @tc.desc   rename S1 in 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0048 begin');
      const result: string = ScanMockProbe.run(1, 'rename', 'S1', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0048 end');
    });

    /**
     * @tc.name   testMockSrc0049
     * @tc.number SUB_SCAN_MOCKSRC_01_0049
     * @tc.desc   rename S0 in 2 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0049 begin');
      const result: string = ScanMockProbe.run(2, 'rename', 'S0', 0);
      expect(result).assertEqual('count=2;first=S0;last=S1;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0049 end');
    });

    /**
     * @tc.name   testMockSrc0050
     * @tc.number SUB_SCAN_MOCKSRC_01_0050
     * @tc.desc   rename S1 in 2 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0050 begin');
      const result: string = ScanMockProbe.run(2, 'rename', 'S1', 0);
      expect(result).assertEqual('count=2;first=S0;last=S1;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0050 end');
    });

    /**
     * @tc.name   testMockSrc0051
     * @tc.number SUB_SCAN_MOCKSRC_01_0051
     * @tc.desc   rename S0 in 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0051 begin');
      const result: string = ScanMockProbe.run(16, 'rename', 'S0', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0051 end');
    });

    /**
     * @tc.name   testMockSrc0052
     * @tc.number SUB_SCAN_MOCKSRC_01_0052
     * @tc.desc   rename S1 in 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0052 begin');
      const result: string = ScanMockProbe.run(16, 'rename', 'S1', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0052 end');
    });

    /**
     * @tc.name   testMockSrc0053
     * @tc.number SUB_SCAN_MOCKSRC_01_0053
     * @tc.desc   rename unknown X9 in 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0053 begin');
      const result: string = ScanMockProbe.run(1, 'rename', 'X9', 0);
      expect(result).assertEqual('count=1;first=S0;last=S0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0053 end');
    });

    /**
     * @tc.name   testMockSrc0054
     * @tc.number SUB_SCAN_MOCKSRC_01_0054
     * @tc.desc   rename unknown X9 in 3 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0054 begin');
      const result: string = ScanMockProbe.run(3, 'rename', 'X9', 0);
      expect(result).assertEqual('count=3;first=S0;last=S2;tcp=2;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0054 end');
    });

    /**
     * @tc.name   testMockSrc0055
     * @tc.number SUB_SCAN_MOCKSRC_01_0055
     * @tc.desc   replace 0 devices with 1 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0055 begin');
      const result: string = ScanMockProbe.run(0, 'replace', '1', 0);
      expect(result).assertEqual('count=1;first=R0;last=R0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0055 end');
    });

    /**
     * @tc.name   testMockSrc0056
     * @tc.number SUB_SCAN_MOCKSRC_01_0056
     * @tc.desc   replace 0 devices with 3 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0056 begin');
      const result: string = ScanMockProbe.run(0, 'replace', '3', 0);
      expect(result).assertEqual('count=3;first=R0;last=R2;tcp=3;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0056 end');
    });

    /**
     * @tc.name   testMockSrc0057
     * @tc.number SUB_SCAN_MOCKSRC_01_0057
     * @tc.desc   replace 0 devices with 15 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0057 begin');
      const result: string = ScanMockProbe.run(0, 'replace', '15', 0);
      expect(result).assertEqual('count=15;first=R0;last=R14;tcp=15;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(15);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R14');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0057 end');
    });

    /**
     * @tc.name   testMockSrc0058
     * @tc.number SUB_SCAN_MOCKSRC_01_0058
     * @tc.desc   replace 0 devices with 16 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0058 begin');
      const result: string = ScanMockProbe.run(0, 'replace', '16', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0058 end');
    });

    /**
     * @tc.name   testMockSrc0059
     * @tc.number SUB_SCAN_MOCKSRC_01_0059
     * @tc.desc   replace 0 devices with 17 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0059 begin');
      const result: string = ScanMockProbe.run(0, 'replace', '17', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0059 end');
    });

    /**
     * @tc.name   testMockSrc0060
     * @tc.number SUB_SCAN_MOCKSRC_01_0060
     * @tc.desc   replace 0 devices with 20 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0060 begin');
      const result: string = ScanMockProbe.run(0, 'replace', '20', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0060 end');
    });

    /**
     * @tc.name   testMockSrc0061
     * @tc.number SUB_SCAN_MOCKSRC_01_0061
     * @tc.desc   replace 2 devices with 1 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0061 begin');
      const result: string = ScanMockProbe.run(2, 'replace', '1', 0);
      expect(result).assertEqual('count=1;first=R0;last=R0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0061 end');
    });

    /**
     * @tc.name   testMockSrc0062
     * @tc.number SUB_SCAN_MOCKSRC_01_0062
     * @tc.desc   replace 2 devices with 3 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0062 begin');
      const result: string = ScanMockProbe.run(2, 'replace', '3', 0);
      expect(result).assertEqual('count=3;first=R0;last=R2;tcp=3;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0062 end');
    });

    /**
     * @tc.name   testMockSrc0063
     * @tc.number SUB_SCAN_MOCKSRC_01_0063
     * @tc.desc   replace 2 devices with 15 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0063 begin');
      const result: string = ScanMockProbe.run(2, 'replace', '15', 0);
      expect(result).assertEqual('count=15;first=R0;last=R14;tcp=15;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(15);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R14');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0063 end');
    });

    /**
     * @tc.name   testMockSrc0064
     * @tc.number SUB_SCAN_MOCKSRC_01_0064
     * @tc.desc   replace 2 devices with 16 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0064 begin');
      const result: string = ScanMockProbe.run(2, 'replace', '16', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0064 end');
    });

    /**
     * @tc.name   testMockSrc0065
     * @tc.number SUB_SCAN_MOCKSRC_01_0065
     * @tc.desc   replace 2 devices with 17 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0065 begin');
      const result: string = ScanMockProbe.run(2, 'replace', '17', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0065 end');
    });

    /**
     * @tc.name   testMockSrc0066
     * @tc.number SUB_SCAN_MOCKSRC_01_0066
     * @tc.desc   replace 2 devices with 20 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0066 begin');
      const result: string = ScanMockProbe.run(2, 'replace', '20', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0066 end');
    });

    /**
     * @tc.name   testMockSrc0067
     * @tc.number SUB_SCAN_MOCKSRC_01_0067
     * @tc.desc   replace 16 devices with 1 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0067 begin');
      const result: string = ScanMockProbe.run(16, 'replace', '1', 0);
      expect(result).assertEqual('count=1;first=R0;last=R0;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R0');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0067 end');
    });

    /**
     * @tc.name   testMockSrc0068
     * @tc.number SUB_SCAN_MOCKSRC_01_0068
     * @tc.desc   replace 16 devices with 3 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0068 begin');
      const result: string = ScanMockProbe.run(16, 'replace', '3', 0);
      expect(result).assertEqual('count=3;first=R0;last=R2;tcp=3;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0068 end');
    });

    /**
     * @tc.name   testMockSrc0069
     * @tc.number SUB_SCAN_MOCKSRC_01_0069
     * @tc.desc   replace 16 devices with 15 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0069 begin');
      const result: string = ScanMockProbe.run(16, 'replace', '15', 0);
      expect(result).assertEqual('count=15;first=R0;last=R14;tcp=15;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(15);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R14');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0069 end');
    });

    /**
     * @tc.name   testMockSrc0070
     * @tc.number SUB_SCAN_MOCKSRC_01_0070
     * @tc.desc   replace 16 devices with 16 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0070 begin');
      const result: string = ScanMockProbe.run(16, 'replace', '16', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0070 end');
    });

    /**
     * @tc.name   testMockSrc0071
     * @tc.number SUB_SCAN_MOCKSRC_01_0071
     * @tc.desc   replace 16 devices with 17 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0071 begin');
      const result: string = ScanMockProbe.run(16, 'replace', '17', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0071 end');
    });

    /**
     * @tc.name   testMockSrc0072
     * @tc.number SUB_SCAN_MOCKSRC_01_0072
     * @tc.desc   replace 16 devices with 20 TCP devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0072 begin');
      const result: string = ScanMockProbe.run(16, 'replace', '20', 0);
      expect(result).assertEqual('count=16;first=R0;last=R15;tcp=16;usb=0;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0072 end');
    });

    /**
     * @tc.name   testMockSrc0073
     * @tc.number SUB_SCAN_MOCKSRC_01_0073
     * @tc.desc   replace 0 devices with 2 repeated ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0073 begin');
      const result: string = ScanMockProbe.run(0, 'replaceDup', '2', 0);
      expect(result).assertEqual('count=2;first=R0;last=R1;tcp=2;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0073 end');
    });

    /**
     * @tc.name   testMockSrc0074
     * @tc.number SUB_SCAN_MOCKSRC_01_0074
     * @tc.desc   replace 0 devices with 4 repeated ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0074 begin');
      const result: string = ScanMockProbe.run(0, 'replaceDup', '4', 0);
      expect(result).assertEqual('count=3;first=R0;last=R2;tcp=3;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0074 end');
    });

    /**
     * @tc.name   testMockSrc0075
     * @tc.number SUB_SCAN_MOCKSRC_01_0075
     * @tc.desc   replace 0 devices with 6 repeated ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0075 begin');
      const result: string = ScanMockProbe.run(0, 'replaceDup', '6', 0);
      expect(result).assertEqual('count=3;first=R0;last=R2;tcp=3;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0075 end');
    });

    /**
     * @tc.name   testMockSrc0076
     * @tc.number SUB_SCAN_MOCKSRC_01_0076
     * @tc.desc   replace 2 devices with 2 repeated ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0076 begin');
      const result: string = ScanMockProbe.run(2, 'replaceDup', '2', 0);
      expect(result).assertEqual('count=2;first=R0;last=R1;tcp=2;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R1');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0076 end');
    });

    /**
     * @tc.name   testMockSrc0077
     * @tc.number SUB_SCAN_MOCKSRC_01_0077
     * @tc.desc   replace 2 devices with 4 repeated ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0077 begin');
      const result: string = ScanMockProbe.run(2, 'replaceDup', '4', 0);
      expect(result).assertEqual('count=3;first=R0;last=R2;tcp=3;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0077 end');
    });

    /**
     * @tc.name   testMockSrc0078
     * @tc.number SUB_SCAN_MOCKSRC_01_0078
     * @tc.desc   replace 2 devices with 6 repeated ids
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0078 begin');
      const result: string = ScanMockProbe.run(2, 'replaceDup', '6', 0);
      expect(result).assertEqual('count=3;first=R0;last=R2;tcp=3;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(3);
      expect(ScanMockProbe.firstOf(result)).assertEqual('R0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('R2');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0078 end');
    });

    /**
     * @tc.name   testMockSrc0079
     * @tc.number SUB_SCAN_MOCKSRC_01_0079
     * @tc.desc   append to getAll copy of 0 devices (TCP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0079 begin');
      const result: string = ScanMockProbe.run(0, 'copy', '', 0);
      expect(result).assertEqual('count=1;first=EXTRA;last=EXTRA;tcp=1;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.lastOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0079 end');
    });

    /**
     * @tc.name   testMockSrc0080
     * @tc.number SUB_SCAN_MOCKSRC_01_0080
     * @tc.desc   append to getAll copy of 0 devices (USB)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0080 begin');
      const result: string = ScanMockProbe.run(0, 'copy', '', 1);
      expect(result).assertEqual('count=1;first=EXTRA;last=EXTRA;tcp=0;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(1);
      expect(ScanMockProbe.firstOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.lastOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0080 end');
    });

    /**
     * @tc.name   testMockSrc0081
     * @tc.number SUB_SCAN_MOCKSRC_01_0081
     * @tc.desc   append to getAll copy of 1 devices (TCP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0081 begin');
      const result: string = ScanMockProbe.run(1, 'copy', '', 0);
      expect(result).assertEqual('count=2;first=S0;last=EXTRA;tcp=2;usb=0;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0081 end');
    });

    /**
     * @tc.name   testMockSrc0082
     * @tc.number SUB_SCAN_MOCKSRC_01_0082
     * @tc.desc   append to getAll copy of 1 devices (USB)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0082 begin');
      const result: string = ScanMockProbe.run(1, 'copy', '', 1);
      expect(result).assertEqual('count=2;first=S0;last=EXTRA;tcp=1;usb=1;full=0;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(2);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0082 end');
    });

    /**
     * @tc.name   testMockSrc0083
     * @tc.number SUB_SCAN_MOCKSRC_01_0083
     * @tc.desc   append to getAll copy of 15 devices (TCP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0083 begin');
      const result: string = ScanMockProbe.run(15, 'copy', '', 0);
      expect(result).assertEqual('count=16;first=S0;last=EXTRA;tcp=9;usb=7;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0083 end');
    });

    /**
     * @tc.name   testMockSrc0084
     * @tc.number SUB_SCAN_MOCKSRC_01_0084
     * @tc.desc   append to getAll copy of 15 devices (USB)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0084 begin');
      const result: string = ScanMockProbe.run(15, 'copy', '', 1);
      expect(result).assertEqual('count=16;first=S0;last=EXTRA;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('EXTRA');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0084 end');
    });

    /**
     * @tc.name   testMockSrc0085
     * @tc.number SUB_SCAN_MOCKSRC_01_0085
     * @tc.desc   append to getAll copy of 16 devices (TCP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0085 begin');
      const result: string = ScanMockProbe.run(16, 'copy', '', 0);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0085 end');
    });

    /**
     * @tc.name   testMockSrc0086
     * @tc.number SUB_SCAN_MOCKSRC_01_0086
     * @tc.desc   append to getAll copy of 16 devices (USB)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0086 begin');
      const result: string = ScanMockProbe.run(16, 'copy', '', 1);
      expect(result).assertEqual('count=16;first=S0;last=S15;tcp=8;usb=8;full=1;empty=0');
      expect(ScanMockProbe.countOf(result)).assertEqual(16);
      expect(ScanMockProbe.firstOf(result)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(result)).assertEqual('S15');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0086 end');
    });

    /**
     * @tc.name   testMockSrc0087
     * @tc.number SUB_SCAN_MOCKSRC_01_0087
     * @tc.desc   reset a source holding 0 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0087 begin');
      const result: string = ScanMockProbe.run(0, 'reset', '', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0087 end');
    });

    /**
     * @tc.name   testMockSrc0088
     * @tc.number SUB_SCAN_MOCKSRC_01_0088
     * @tc.desc   reset a source holding 1 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0088 begin');
      const result: string = ScanMockProbe.run(1, 'reset', '', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0088 end');
    });

    /**
     * @tc.name   testMockSrc0089
     * @tc.number SUB_SCAN_MOCKSRC_01_0089
     * @tc.desc   reset a source holding 16 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0089 begin');
      const result: string = ScanMockProbe.run(16, 'reset', '', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0089 end');
    });

    /**
     * @tc.name   testMockSrc0090
     * @tc.number SUB_SCAN_MOCKSRC_01_0090
     * @tc.desc   reset a source holding 17 devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockSrc0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0090 begin');
      const result: string = ScanMockProbe.run(17, 'reset', '', 0);
      expect(result).assertEqual('count=0;first=-;last=-;tcp=0;usb=0;full=0;empty=1');
      expect(ScanMockProbe.countOf(result)).assertEqual(0);
      expect(ScanMockProbe.firstOf(result)).assertEqual('-');
      expect(ScanMockProbe.lastOf(result)).assertEqual('-');
      expect(ScanMockProbe.flagOf(result, 'tcp')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockSrc0090 end');
    });

  });
}
