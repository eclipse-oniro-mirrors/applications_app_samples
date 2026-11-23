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
import { ScanSessionRecorder } from '../../../main/ets/scan/model/ScanSessionRecorder';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanSessionVolume01Test() {
  describe('ScanSession', () => {

    /**
     * @tc.name   testSession010001
     * @tc.number SUB_SCAN_SESSION_01_0001
     * @tc.desc   fill(0) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010001 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010001 end');
    });

    /**
     * @tc.name   testSession010002
     * @tc.number SUB_SCAN_SESSION_01_0002
     * @tc.desc   fill(1) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010002 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010002 end');
    });

    /**
     * @tc.name   testSession010003
     * @tc.number SUB_SCAN_SESSION_01_0003
     * @tc.desc   fill(2) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010003 begin');
      const result: string[] = ScanSessionRecorder.fill(2, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(2);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010003 end');
    });

    /**
     * @tc.name   testSession010004
     * @tc.number SUB_SCAN_SESSION_01_0004
     * @tc.desc   fill(3) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010004 begin');
      const result: string[] = ScanSessionRecorder.fill(3, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(3);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010004 end');
    });

    /**
     * @tc.name   testSession010005
     * @tc.number SUB_SCAN_SESSION_01_0005
     * @tc.desc   fill(9) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010005 begin');
      const result: string[] = ScanSessionRecorder.fill(9, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(9);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010005 end');
    });

    /**
     * @tc.name   testSession010006
     * @tc.number SUB_SCAN_SESSION_01_0006
     * @tc.desc   fill(10) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010006 begin');
      const result: string[] = ScanSessionRecorder.fill(10, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(10);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010006 end');
    });

    /**
     * @tc.name   testSession010007
     * @tc.number SUB_SCAN_SESSION_01_0007
     * @tc.desc   fill(50) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010007 begin');
      const result: string[] = ScanSessionRecorder.fill(50, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(50);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e49');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010007 end');
    });

    /**
     * @tc.name   testSession010008
     * @tc.number SUB_SCAN_SESSION_01_0008
     * @tc.desc   fill(98) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010008 begin');
      const result: string[] = ScanSessionRecorder.fill(98, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(98);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e97');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010008 end');
    });

    /**
     * @tc.name   testSession010009
     * @tc.number SUB_SCAN_SESSION_01_0009
     * @tc.desc   fill(99) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010009 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(99);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e98');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010009 end');
    });

    /**
     * @tc.name   testSession010010
     * @tc.number SUB_SCAN_SESSION_01_0010
     * @tc.desc   fill(100) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010010 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e99');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010010 end');
    });

    /**
     * @tc.name   testSession010011
     * @tc.number SUB_SCAN_SESSION_01_0011
     * @tc.desc   fill(101) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010011 begin');
      const result: string[] = ScanSessionRecorder.fill(101, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e1');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010011 end');
    });

    /**
     * @tc.name   testSession010012
     * @tc.number SUB_SCAN_SESSION_01_0012
     * @tc.desc   fill(105) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010012 begin');
      const result: string[] = ScanSessionRecorder.fill(105, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e5');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e104');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010012 end');
    });

    /**
     * @tc.name   testSession010013
     * @tc.number SUB_SCAN_SESSION_01_0013
     * @tc.desc   fill(150) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010013 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e50');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e149');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010013 end');
    });

    /**
     * @tc.name   testSession010014
     * @tc.number SUB_SCAN_SESSION_01_0014
     * @tc.desc   fill(200) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010014 begin');
      const result: string[] = ScanSessionRecorder.fill(200, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e100');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e199');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010014 end');
    });

    /**
     * @tc.name   testSession010015
     * @tc.number SUB_SCAN_SESSION_01_0015
     * @tc.desc   fill(500) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010015 begin');
      const result: string[] = ScanSessionRecorder.fill(500, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e400');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e499');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010015 end');
    });

    /**
     * @tc.name   testSession010016
     * @tc.number SUB_SCAN_SESSION_01_0016
     * @tc.desc   fill(1000) caps at 100 events with rolling window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010016 begin');
      const result: string[] = ScanSessionRecorder.fill(1000, 'e');
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e900');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('e999');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010016 end');
    });

    /**
     * @tc.name   testSession010017
     * @tc.number SUB_SCAN_SESSION_01_0017
     * @tc.desc   append 'a' after 0 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010017 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(1);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010017 end');
    });

    /**
     * @tc.name   testSession010018
     * @tc.number SUB_SCAN_SESSION_01_0018
     * @tc.desc   append 'x' after 0 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010018 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(1);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010018 end');
    });

    /**
     * @tc.name   testSession010019
     * @tc.number SUB_SCAN_SESSION_01_0019
     * @tc.desc   append 'a' after 1 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010019 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(2);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010019 end');
    });

    /**
     * @tc.name   testSession010020
     * @tc.number SUB_SCAN_SESSION_01_0020
     * @tc.desc   append 'x' after 1 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010020 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(2);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010020 end');
    });

    /**
     * @tc.name   testSession010021
     * @tc.number SUB_SCAN_SESSION_01_0021
     * @tc.desc   append 'a' after 2 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010021 begin');
      const result: string[] = ScanSessionRecorder.fill(2, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(3);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010021 end');
    });

    /**
     * @tc.name   testSession010022
     * @tc.number SUB_SCAN_SESSION_01_0022
     * @tc.desc   append 'x' after 2 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010022 begin');
      const result: string[] = ScanSessionRecorder.fill(2, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(3);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010022 end');
    });

    /**
     * @tc.name   testSession010023
     * @tc.number SUB_SCAN_SESSION_01_0023
     * @tc.desc   append 'a' after 99 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010023 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010023 end');
    });

    /**
     * @tc.name   testSession010024
     * @tc.number SUB_SCAN_SESSION_01_0024
     * @tc.desc   append 'x' after 99 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010024 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010024 end');
    });

    /**
     * @tc.name   testSession010025
     * @tc.number SUB_SCAN_SESSION_01_0025
     * @tc.desc   append 'a' after 100 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010025 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010025 end');
    });

    /**
     * @tc.name   testSession010026
     * @tc.number SUB_SCAN_SESSION_01_0026
     * @tc.desc   append 'x' after 100 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010026 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010026 end');
    });

    /**
     * @tc.name   testSession010027
     * @tc.number SUB_SCAN_SESSION_01_0027
     * @tc.desc   append 'a' after 101 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010027 begin');
      const result: string[] = ScanSessionRecorder.fill(101, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010027 end');
    });

    /**
     * @tc.name   testSession010028
     * @tc.number SUB_SCAN_SESSION_01_0028
     * @tc.desc   append 'x' after 101 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010028 begin');
      const result: string[] = ScanSessionRecorder.fill(101, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010028 end');
    });

    /**
     * @tc.name   testSession010029
     * @tc.number SUB_SCAN_SESSION_01_0029
     * @tc.desc   append 'a' after 150 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010029 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010029 end');
    });

    /**
     * @tc.name   testSession010030
     * @tc.number SUB_SCAN_SESSION_01_0030
     * @tc.desc   append 'x' after 150 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010030 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010030 end');
    });

    /**
     * @tc.name   testSession010031
     * @tc.number SUB_SCAN_SESSION_01_0031
     * @tc.desc   append 'a' after 200 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010031 begin');
      const result: string[] = ScanSessionRecorder.fill(200, 'e');
      expect(ScanSessionRecorder.make(result).append('a')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('a') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010031 end');
    });

    /**
     * @tc.name   testSession010032
     * @tc.number SUB_SCAN_SESSION_01_0032
     * @tc.desc   append 'x' after 200 events caps the count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010032 begin');
      const result: string[] = ScanSessionRecorder.fill(200, 'e');
      expect(ScanSessionRecorder.make(result).append('x')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).append('x') - ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(result.length).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010032 end');
    });

    /**
     * @tc.name   testSession010033
     * @tc.number SUB_SCAN_SESSION_01_0033
     * @tc.desc   contains 'e0' in 0 events is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010033 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'e');
      expect(ScanSessionRecorder.make(result).contains('e0')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(0);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010033 end');
    });

    /**
     * @tc.name   testSession010034
     * @tc.number SUB_SCAN_SESSION_01_0034
     * @tc.desc   contains 'e0' in 1 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010034 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'e');
      expect(ScanSessionRecorder.make(result).contains('e0')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010034 end');
    });

    /**
     * @tc.name   testSession010035
     * @tc.number SUB_SCAN_SESSION_01_0035
     * @tc.desc   contains 'e4' in 5 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010035 begin');
      const result: string[] = ScanSessionRecorder.fill(5, 'e');
      expect(ScanSessionRecorder.make(result).contains('e4')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(5);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010035 end');
    });

    /**
     * @tc.name   testSession010036
     * @tc.number SUB_SCAN_SESSION_01_0036
     * @tc.desc   contains 'e5' in 5 events is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010036 begin');
      const result: string[] = ScanSessionRecorder.fill(5, 'e');
      expect(ScanSessionRecorder.make(result).contains('e5')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(5);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010036 end');
    });

    /**
     * @tc.name   testSession010037
     * @tc.number SUB_SCAN_SESSION_01_0037
     * @tc.desc   contains 'e0' in 99 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010037 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'e');
      expect(ScanSessionRecorder.make(result).contains('e0')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(99);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010037 end');
    });

    /**
     * @tc.name   testSession010038
     * @tc.number SUB_SCAN_SESSION_01_0038
     * @tc.desc   contains 'e0' in 100 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010038 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).contains('e0')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010038 end');
    });

    /**
     * @tc.name   testSession010039
     * @tc.number SUB_SCAN_SESSION_01_0039
     * @tc.desc   contains 'e99' in 100 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010039 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).contains('e99')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010039 end');
    });

    /**
     * @tc.name   testSession010040
     * @tc.number SUB_SCAN_SESSION_01_0040
     * @tc.desc   contains 'e100' in 100 events is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010040 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).contains('e100')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010040 end');
    });

    /**
     * @tc.name   testSession010041
     * @tc.number SUB_SCAN_SESSION_01_0041
     * @tc.desc   contains 'e49' in 150 events is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010041 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).contains('e49')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e50');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010041 end');
    });

    /**
     * @tc.name   testSession010042
     * @tc.number SUB_SCAN_SESSION_01_0042
     * @tc.desc   contains 'e50' in 150 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010042 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).contains('e50')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e50');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010042 end');
    });

    /**
     * @tc.name   testSession010043
     * @tc.number SUB_SCAN_SESSION_01_0043
     * @tc.desc   contains 'e100' in 150 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010043 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).contains('e100')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e50');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010043 end');
    });

    /**
     * @tc.name   testSession010044
     * @tc.number SUB_SCAN_SESSION_01_0044
     * @tc.desc   contains 'e99' in 200 events is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010044 begin');
      const result: string[] = ScanSessionRecorder.fill(200, 'e');
      expect(ScanSessionRecorder.make(result).contains('e99')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010044 end');
    });

    /**
     * @tc.name   testSession010045
     * @tc.number SUB_SCAN_SESSION_01_0045
     * @tc.desc   contains 'e1' in 1 events is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010045 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'e');
      expect(ScanSessionRecorder.make(result).contains('e1')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(1);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010045 end');
    });

    /**
     * @tc.name   testSession010046
     * @tc.number SUB_SCAN_SESSION_01_0046
     * @tc.desc   contains 'e98' in 99 events is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010046 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'e');
      expect(ScanSessionRecorder.make(result).contains('e98')).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(99);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('e0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010046 end');
    });

    /**
     * @tc.name   testSession010047
     * @tc.number SUB_SCAN_SESSION_01_0047
     * @tc.desc   summary aggregates 0 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010047 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=0 first= last=');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010047 end');
    });

    /**
     * @tc.name   testSession010048
     * @tc.number SUB_SCAN_SESSION_01_0048
     * @tc.desc   summary aggregates 1 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010048 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=1 first=e0 last=e0');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010048 end');
    });

    /**
     * @tc.name   testSession010049
     * @tc.number SUB_SCAN_SESSION_01_0049
     * @tc.desc   summary aggregates 9 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010049 begin');
      const result: string[] = ScanSessionRecorder.fill(9, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=9 first=e0 last=e8');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010049 end');
    });

    /**
     * @tc.name   testSession010050
     * @tc.number SUB_SCAN_SESSION_01_0050
     * @tc.desc   summary aggregates 99 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010050 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=99 first=e0 last=e98');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010050 end');
    });

    /**
     * @tc.name   testSession010051
     * @tc.number SUB_SCAN_SESSION_01_0051
     * @tc.desc   summary aggregates 100 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010051 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=100 first=e0 last=e99');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010051 end');
    });

    /**
     * @tc.name   testSession010052
     * @tc.number SUB_SCAN_SESSION_01_0052
     * @tc.desc   summary aggregates 101 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010052 begin');
      const result: string[] = ScanSessionRecorder.fill(101, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=100 first=e1 last=e100');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010052 end');
    });

    /**
     * @tc.name   testSession010053
     * @tc.number SUB_SCAN_SESSION_01_0053
     * @tc.desc   summary aggregates 150 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010053 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=100 first=e50 last=e149');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010053 end');
    });

    /**
     * @tc.name   testSession010054
     * @tc.number SUB_SCAN_SESSION_01_0054
     * @tc.desc   summary aggregates 200 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010054 begin');
      const result: string[] = ScanSessionRecorder.fill(200, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=100 first=e100 last=e199');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010054 end');
    });

    /**
     * @tc.name   testSession010055
     * @tc.number SUB_SCAN_SESSION_01_0055
     * @tc.desc   summary aggregates 5 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010055 begin');
      const result: string[] = ScanSessionRecorder.fill(5, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=5 first=e0 last=e4');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010055 end');
    });

    /**
     * @tc.name   testSession010056
     * @tc.number SUB_SCAN_SESSION_01_0056
     * @tc.desc   summary aggregates 50 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010056 begin');
      const result: string[] = ScanSessionRecorder.fill(50, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=50 first=e0 last=e49');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010056 end');
    });

    /**
     * @tc.name   testSession010057
     * @tc.number SUB_SCAN_SESSION_01_0057
     * @tc.desc   summary aggregates 1000 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010057 begin');
      const result: string[] = ScanSessionRecorder.fill(1000, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=100 first=e900 last=e999');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010057 end');
    });

    /**
     * @tc.name   testSession010058
     * @tc.number SUB_SCAN_SESSION_01_0058
     * @tc.desc   summary aggregates 3 events into a frozen snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010058 begin');
      const result: string[] = ScanSessionRecorder.fill(3, 'e');
      expect(ScanSessionRecorder.make(result).summary()).assertEqual('count=3 first=e0 last=e2');
      expect(ScanSessionRecorder.make(result).summary().indexOf('count=') >= 0).assertEqual(true);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010058 end');
    });

    /**
     * @tc.name   testSession010059
     * @tc.number SUB_SCAN_SESSION_01_0059
     * @tc.desc   toArray copies 0 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010059 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(0);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(false);
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010059 end');
    });

    /**
     * @tc.name   testSession010060
     * @tc.number SUB_SCAN_SESSION_01_0060
     * @tc.desc   toArray copies 1 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010060 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(1);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010060 end');
    });

    /**
     * @tc.name   testSession010061
     * @tc.number SUB_SCAN_SESSION_01_0061
     * @tc.desc   toArray copies 2 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010061 begin');
      const result: string[] = ScanSessionRecorder.fill(2, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(2);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010061 end');
    });

    /**
     * @tc.name   testSession010062
     * @tc.number SUB_SCAN_SESSION_01_0062
     * @tc.desc   toArray copies 5 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010062 begin');
      const result: string[] = ScanSessionRecorder.fill(5, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(5);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010062 end');
    });

    /**
     * @tc.name   testSession010063
     * @tc.number SUB_SCAN_SESSION_01_0063
     * @tc.desc   toArray copies 10 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010063 begin');
      const result: string[] = ScanSessionRecorder.fill(10, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(10);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010063 end');
    });

    /**
     * @tc.name   testSession010064
     * @tc.number SUB_SCAN_SESSION_01_0064
     * @tc.desc   toArray copies 50 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010064 begin');
      const result: string[] = ScanSessionRecorder.fill(50, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(50);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010064 end');
    });

    /**
     * @tc.name   testSession010065
     * @tc.number SUB_SCAN_SESSION_01_0065
     * @tc.desc   toArray copies 99 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010065 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(99);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010065 end');
    });

    /**
     * @tc.name   testSession010066
     * @tc.number SUB_SCAN_SESSION_01_0066
     * @tc.desc   toArray copies 100 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010066 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010066 end');
    });

    /**
     * @tc.name   testSession010067
     * @tc.number SUB_SCAN_SESSION_01_0067
     * @tc.desc   toArray copies 101 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010067 begin');
      const result: string[] = ScanSessionRecorder.fill(101, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010067 end');
    });

    /**
     * @tc.name   testSession010068
     * @tc.number SUB_SCAN_SESSION_01_0068
     * @tc.desc   toArray copies 150 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010068 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(150);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010068 end');
    });

    /**
     * @tc.name   testSession010069
     * @tc.number SUB_SCAN_SESSION_01_0069
     * @tc.desc   toArray copies 200 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010069 begin');
      const result: string[] = ScanSessionRecorder.fill(200, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010069 end');
    });

    /**
     * @tc.name   testSession010070
     * @tc.number SUB_SCAN_SESSION_01_0070
     * @tc.desc   toArray copies 1000 events capped at 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010070 begin');
      const result: string[] = ScanSessionRecorder.fill(1000, 'e');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).toArray().length > 0).assertEqual(true);
      expect(result.length).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010070 end');
    });

    /**
     * @tc.name   testSession010071
     * @tc.number SUB_SCAN_SESSION_01_0071
     * @tc.desc   make with prefix 'a' and 3 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010071 begin');
      const result: string[] = ScanSessionRecorder.fill(3, 'a');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(3);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('a0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('a2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010071 end');
    });

    /**
     * @tc.name   testSession010072
     * @tc.number SUB_SCAN_SESSION_01_0072
     * @tc.desc   make with prefix 'b' and 3 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010072 begin');
      const result: string[] = ScanSessionRecorder.fill(3, 'b');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(3);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('b0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('b2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010072 end');
    });

    /**
     * @tc.name   testSession010073
     * @tc.number SUB_SCAN_SESSION_01_0073
     * @tc.desc   make with prefix 'x' and 5 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010073 begin');
      const result: string[] = ScanSessionRecorder.fill(5, 'x');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(5);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('x0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('x4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010073 end');
    });

    /**
     * @tc.name   testSession010074
     * @tc.number SUB_SCAN_SESSION_01_0074
     * @tc.desc   make with prefix 'z' and 1 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010074 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'z');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(1);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('z0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('z0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010074 end');
    });

    /**
     * @tc.name   testSession010075
     * @tc.number SUB_SCAN_SESSION_01_0075
     * @tc.desc   make with prefix 'k' and 100 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010075 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'k');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('k0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('k99');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010075 end');
    });

    /**
     * @tc.name   testSession010076
     * @tc.number SUB_SCAN_SESSION_01_0076
     * @tc.desc   make with prefix 'm' and 150 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010076 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'm');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('m50');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('m149');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010076 end');
    });

    /**
     * @tc.name   testSession010077
     * @tc.number SUB_SCAN_SESSION_01_0077
     * @tc.desc   make with prefix 'q' and 0 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010077 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'q');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(0);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010077 end');
    });

    /**
     * @tc.name   testSession010078
     * @tc.number SUB_SCAN_SESSION_01_0078
     * @tc.desc   make with prefix 'r' and 2 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010078 begin');
      const result: string[] = ScanSessionRecorder.fill(2, 'r');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(2);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('r0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('r1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010078 end');
    });

    /**
     * @tc.name   testSession010079
     * @tc.number SUB_SCAN_SESSION_01_0079
     * @tc.desc   make with prefix 's' and 99 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010079 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 's');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(99);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('s0');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('s98');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010079 end');
    });

    /**
     * @tc.name   testSession010080
     * @tc.number SUB_SCAN_SESSION_01_0080
     * @tc.desc   make with prefix 't' and 101 events exposes frozen head and tail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010080 begin');
      const result: string[] = ScanSessionRecorder.fill(101, 't');
      expect(ScanSessionRecorder.make(result).toArray().length).assertEqual(100);
      expect(ScanSessionRecorder.make(result).first()).assertEqual('t1');
      expect(ScanSessionRecorder.make(result).last()).assertEqual('t100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010080 end');
    });

    /**
     * @tc.name   testSession010081
     * @tc.number SUB_SCAN_SESSION_01_0081
     * @tc.desc   append 'boot' after 0 'a' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010081 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'a');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(1);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010081 end');
    });

    /**
     * @tc.name   testSession010082
     * @tc.number SUB_SCAN_SESSION_01_0082
     * @tc.desc   append 'boot' after 1 'a' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010082 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'a');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(2);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010082 end');
    });

    /**
     * @tc.name   testSession010083
     * @tc.number SUB_SCAN_SESSION_01_0083
     * @tc.desc   append 'boot' after 50 'a' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010083 begin');
      const result: string[] = ScanSessionRecorder.fill(50, 'a');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(51);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010083 end');
    });

    /**
     * @tc.name   testSession010084
     * @tc.number SUB_SCAN_SESSION_01_0084
     * @tc.desc   append 'boot' after 99 'a' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010084 begin');
      const result: string[] = ScanSessionRecorder.fill(99, 'a');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010084 end');
    });

    /**
     * @tc.name   testSession010085
     * @tc.number SUB_SCAN_SESSION_01_0085
     * @tc.desc   append 'boot' after 100 'a' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010085 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'a');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010085 end');
    });

    /**
     * @tc.name   testSession010086
     * @tc.number SUB_SCAN_SESSION_01_0086
     * @tc.desc   append 'boot' after 150 'a' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010086 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'a');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010086 end');
    });

    /**
     * @tc.name   testSession010087
     * @tc.number SUB_SCAN_SESSION_01_0087
     * @tc.desc   append 'boot' after 0 'b' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010087 begin');
      const result: string[] = ScanSessionRecorder.fill(0, 'b');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(1);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010087 end');
    });

    /**
     * @tc.name   testSession010088
     * @tc.number SUB_SCAN_SESSION_01_0088
     * @tc.desc   append 'boot' after 1 'b' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010088 begin');
      const result: string[] = ScanSessionRecorder.fill(1, 'b');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(2);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010088 end');
    });

    /**
     * @tc.name   testSession010089
     * @tc.number SUB_SCAN_SESSION_01_0089
     * @tc.desc   append 'boot' after 100 'b' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010089 begin');
      const result: string[] = ScanSessionRecorder.fill(100, 'b');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010089 end');
    });

    /**
     * @tc.name   testSession010090
     * @tc.number SUB_SCAN_SESSION_01_0090
     * @tc.desc   append 'boot' after 150 'b' events is observable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSession010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010090 begin');
      const result: string[] = ScanSessionRecorder.fill(150, 'b');
      expect(ScanSessionRecorder.make(result).append('boot')).assertEqual(100);
      expect(ScanSessionRecorder.make(result).contains('boot')).assertEqual(false);
      expect(ScanSessionRecorder.make(result).count()).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSession010090 end');
    });

  });
}
