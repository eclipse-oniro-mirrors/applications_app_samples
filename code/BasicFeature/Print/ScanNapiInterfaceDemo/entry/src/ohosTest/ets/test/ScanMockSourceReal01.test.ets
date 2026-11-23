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
import { ScanMockSource } from '../../../main/ets/scan/model/ScanMockSource';
import { ScanMockProbe } from '../../../main/ets/scan/model/ScanMockProbe';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanMockSourceRealTest() {
  describe('ScanMockSource', () => {

    /**
     * @tc.name   testMockReal0001
     * @tc.number SUB_SCAN_MOCKSRC_02_0001
     * @tc.desc   the seventeenth add is refused once capacity is reached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0001 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(15);
      const accepted: boolean = source.add(ScanMockProbe.device('N1', false));
      const refused: boolean = source.add(ScanMockProbe.device('N2', false));
      expect(source.count()).assertEqual(16);
      expect(accepted).assertTrue();
      expect(refused).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0001 end');
    });

    /**
     * @tc.name   testMockReal0002
     * @tc.number SUB_SCAN_MOCKSRC_02_0002
     * @tc.desc   add appends a new device at the tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0002 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(2);
      const accepted: boolean = source.add(ScanMockProbe.device('A9', true));
      expect(accepted).assertTrue();
      expect(source.count()).assertEqual(3);
      expect(source.getAll()[2].scannerId).assertEqual('A9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0002 end');
    });

    /**
     * @tc.name   testMockReal0003
     * @tc.number SUB_SCAN_MOCKSRC_02_0003
     * @tc.desc   add refuses an id that is already present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0003 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(3);
      const accepted: boolean = source.add(ScanMockProbe.device('S1', false));
      expect(accepted).assertFalse();
      expect(source.count()).assertEqual(3);
      expect(source.indexOf('S1')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0003 end');
    });

    /**
     * @tc.name   testMockReal0004
     * @tc.number SUB_SCAN_MOCKSRC_02_0004
     * @tc.desc   add on a full source changes nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0004 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(16);
      const accepted: boolean = source.add(ScanMockProbe.device('A9', false));
      expect(source.isFull()).assertTrue();
      expect(accepted).assertFalse();
      expect(source.count()).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0004 end');
    });

    /**
     * @tc.name   testMockReal0005
     * @tc.number SUB_SCAN_MOCKSRC_02_0005
     * @tc.desc   remove shifts the remaining devices forward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0005 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(3);
      const removed: boolean = source.remove('S0');
      expect(removed).assertTrue();
      expect(source.count()).assertEqual(2);
      expect(source.getAll()[0].scannerId).assertEqual('S1');
      expect(source.indexOf('S0')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0005 end');
    });

    /**
     * @tc.name   testMockReal0006
     * @tc.number SUB_SCAN_MOCKSRC_02_0006
     * @tc.desc   remove reports false for an unknown id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0006 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(2);
      const removed: boolean = source.remove('X9');
      expect(removed).assertFalse();
      expect(source.count()).assertEqual(2);
      expect(source.getAll()[1].scannerId).assertEqual('S1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0006 end');
    });

    /**
     * @tc.name   testMockReal0007
     * @tc.number SUB_SCAN_MOCKSRC_02_0007
     * @tc.desc   remove on an empty source reports false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0007 begin');
      const source: ScanMockSource = new ScanMockSource();
      expect(source.isEmpty()).assertTrue();
      expect(source.remove('S0')).assertFalse();
      expect(source.count()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0007 end');
    });

    /**
     * @tc.name   testMockReal0008
     * @tc.number SUB_SCAN_MOCKSRC_02_0008
     * @tc.desc   rename replaces the device name and keeps the other fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0008 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(2);
      const renamed: boolean = source.rename('S1', 'LabScanner');
      expect(renamed).assertTrue();
      expect(source.getAll()[1].deviceName).assertEqual('LabScanner');
      expect(source.getAll()[1].scannerId).assertEqual('S1');
      expect(source.getAll()[1].manufacturer).assertEqual('Acme');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0008 end');
    });

    /**
     * @tc.name   testMockReal0009
     * @tc.number SUB_SCAN_MOCKSRC_02_0009
     * @tc.desc   rename of an unknown id leaves every device untouched
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0009 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(2);
      const renamed: boolean = source.rename('X9', 'Ghost');
      expect(renamed).assertFalse();
      expect(source.count()).assertEqual(2);
      expect(source.getAll()[0].deviceName).assertEqual('name_S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0009 end');
    });

    /**
     * @tc.name   testMockReal0010
     * @tc.number SUB_SCAN_MOCKSRC_02_0010
     * @tc.desc   replace truncates the incoming list at capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0010 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(1);
      source.replace(ScanMockProbe.incoming(20, false));
      expect(source.count()).assertEqual(16);
      expect(source.getAll()[0].scannerId).assertEqual('R0');
      expect(source.getAll()[15].scannerId).assertEqual('R15');
      expect(source.indexOf('R16')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0010 end');
    });

    /**
     * @tc.name   testMockReal0011
     * @tc.number SUB_SCAN_MOCKSRC_02_0011
     * @tc.desc   replace keeps only the first occurrence of a repeated id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0011 begin');
      const incoming: scan.ScannerDevice[] = ScanMockProbe.incoming(3, false);
      incoming.push(ScanMockProbe.device('R1', true));
      const source: ScanMockSource = new ScanMockSource();
      source.replace(incoming);
      expect(source.count()).assertEqual(3);
      expect(source.indexOf('R1')).assertEqual(1);
      expect(source.countByMode(scan.ScannerDiscoveryMode.USB_STR)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0011 end');
    });

    /**
     * @tc.name   testMockReal0012
     * @tc.number SUB_SCAN_MOCKSRC_02_0012
     * @tc.desc   replace drops the previously held devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0012 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(4);
      source.replace(ScanMockProbe.incoming(1, true));
      expect(source.count()).assertEqual(1);
      expect(source.indexOf('S0')).assertEqual(-1);
      expect(source.countByMode(scan.ScannerDiscoveryMode.USB_STR)).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0012 end');
    });

    /**
     * @tc.name   testMockReal0013
     * @tc.number SUB_SCAN_MOCKSRC_02_0013
     * @tc.desc   the list returned by getAll is a detached copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0013 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(2);
      const copy: scan.ScannerDevice[] = source.getAll();
      copy.push(ScanMockProbe.device('EXTRA', false));
      expect(copy.length).assertEqual(3);
      expect(source.count()).assertEqual(2);
      expect(source.indexOf('EXTRA')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0013 end');
    });

    /**
     * @tc.name   testMockReal0014
     * @tc.number SUB_SCAN_MOCKSRC_02_0014
     * @tc.desc   the copy returned by getAll preserves the order of the source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0014 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(3);
      const copy: scan.ScannerDevice[] = source.getAll();
      let same: number = 0;
      for (let index = 0; index < copy.length; index++) {
        if (copy[index].scannerId === `S${index}`) {
          same++;
        }
      }
      expect(same).assertEqual(3);
      expect(copy.length).assertEqual(source.count());
      expect(copy[0].deviceName).assertEqual('name_S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0014 end');
    });

    /**
     * @tc.name   testMockReal0015
     * @tc.number SUB_SCAN_MOCKSRC_02_0015
     * @tc.desc   isEmpty and isFull flip once the source reaches capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0015 begin');
      const source: ScanMockSource = new ScanMockSource();
      expect(source.isEmpty()).assertTrue();
      expect(source.isFull()).assertFalse();
      source.replace(ScanMockProbe.incoming(16, false));
      expect(source.isEmpty()).assertFalse();
      expect(source.isFull()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0015 end');
    });

    /**
     * @tc.name   testMockReal0016
     * @tc.number SUB_SCAN_MOCKSRC_02_0016
     * @tc.desc   indexOf reports the position or minus one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0016 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(3);
      expect(source.indexOf('S0')).assertEqual(0);
      expect(source.indexOf('S2')).assertEqual(2);
      expect(source.indexOf('S3')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0016 end');
    });

    /**
     * @tc.name   testMockReal0017
     * @tc.number SUB_SCAN_MOCKSRC_02_0017
     * @tc.desc   an empty source reports dashes for both head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0017 begin');
      const source: ScanMockSource = new ScanMockSource();
      const text: string = ScanMockProbe.snapshot(source);
      expect(ScanMockProbe.firstOf(text)).assertEqual('-');
      expect(ScanMockProbe.lastOf(text)).assertEqual('-');
      expect(ScanMockProbe.countOf(text)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0017 end');
    });

    /**
     * @tc.name   testMockReal0018
     * @tc.number SUB_SCAN_MOCKSRC_02_0018
     * @tc.desc   first returns the head device that was added first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0018 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(2);
      const head: scan.ScannerDevice | undefined = source.first();
      let headId: string = '-';
      if (head !== undefined) {
        headId = head.scannerId;
      }
      expect(headId).assertEqual('S0');
      expect(headId).assertEqual(source.getAll()[0].scannerId);
      expect(source.indexOf(headId)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0018 end');
    });

    /**
     * @tc.name   testMockReal0019
     * @tc.number SUB_SCAN_MOCKSRC_02_0019
     * @tc.desc   countByMode splits the seeded devices by discovery mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0019 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(7);
      expect(source.countByMode(scan.ScannerDiscoveryMode.TCP_STR)).assertEqual(4);
      expect(source.countByMode(scan.ScannerDiscoveryMode.USB_STR)).assertEqual(3);
      expect(source.count()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0019 end');
    });

    /**
     * @tc.name   testMockReal0020
     * @tc.number SUB_SCAN_MOCKSRC_02_0020
     * @tc.desc   reset empties a populated source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0020 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(5);
      source.reset();
      expect(source.count()).assertEqual(0);
      expect(ScanMockProbe.countOf(ScanMockProbe.snapshot(source))).assertEqual(0);
      expect(source.isFull()).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0020 end');
    });

    /**
     * @tc.name   testMockReal0021
     * @tc.number SUB_SCAN_MOCKSRC_02_0021
     * @tc.desc   createDevice copies every argument into the device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0021 begin');
      const mode: scan.ScannerDiscoveryMode = scan.ScannerDiscoveryMode.USB_STR;
      const device: scan.ScannerDevice = ScanMockSource.createDevice('D1', 'U1', 'Maker', 'MX', 'Lab', mode);
      expect(device.scannerId).assertEqual('D1');
      expect(device.uniqueId).assertEqual('U1');
      expect(device.manufacturer).assertEqual('Maker');
      expect(device.deviceName).assertEqual('Lab');
      expect(device.discoveryMode === mode).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0021 end');
    });

    /**
     * @tc.name   testMockReal0022
     * @tc.number SUB_SCAN_MOCKSRC_02_0022
     * @tc.desc   the snapshot string parses back into the seeded state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0022 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(4);
      const text: string = ScanMockProbe.snapshot(source);
      expect(ScanMockProbe.countOf(text)).assertEqual(4);
      expect(ScanMockProbe.firstOf(text)).assertEqual('S0');
      expect(ScanMockProbe.lastOf(text)).assertEqual('S3');
      expect(ScanMockProbe.flagOf(text, 'tcp')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0022 end');
    });

    /**
     * @tc.name   testMockReal0023
     * @tc.number SUB_SCAN_MOCKSRC_02_0023
     * @tc.desc   a full source refuses every further add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0023 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(16);
      let accepted: number = 0;
      for (let index = 0; index < 4; index++) {
        if (source.add(ScanMockProbe.device(`X${index}`, false))) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(0);
      expect(source.count()).assertEqual(16);
      expect(source.indexOf('X0')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0023 end');
    });

    /**
     * @tc.name   testMockReal0024
     * @tc.number SUB_SCAN_MOCKSRC_02_0024
     * @tc.desc   rename keeps the position and the untouched fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMockReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0024 begin');
      const source: ScanMockSource = ScanMockProbe.seeded(3);
      source.rename('S2', 'Archive');
      expect(source.indexOf('S2')).assertEqual(2);
      expect(source.getAll()[2].deviceName).assertEqual('Archive');
      expect(source.getAll()[2].model).assertEqual('M100');
      expect(source.count()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMockReal0024 end');
    });
  });
}
