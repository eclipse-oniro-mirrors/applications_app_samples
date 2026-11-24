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
import { NetworkMobile } from '../../../../src/main/ets/model/NetworkMobile';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MobileNetwork_RoamVolume07]';

export default function roamVolume07Test() {
  describe('RoamVolume07Test', () => {

    /**
     * @tc.name   testRoam0440
     * @tc.number SUB_MOBILENETWORK_ROAM_0440
     * @tc.desc   input 2 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0440 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0440 end');
    })

    /**
     * @tc.name   testRoam0441
     * @tc.number SUB_MOBILENETWORK_ROAM_0441
     * @tc.desc   input 3 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0441 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0441 end');
    })

    /**
     * @tc.name   testRoam0442
     * @tc.number SUB_MOBILENETWORK_ROAM_0442
     * @tc.desc   input 4 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0442 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0442 end');
    })

    /**
     * @tc.name   testRoam0443
     * @tc.number SUB_MOBILENETWORK_ROAM_0443
     * @tc.desc   input 5 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0443 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0443 end');
    })

    /**
     * @tc.name   testRoam0444
     * @tc.number SUB_MOBILENETWORK_ROAM_0444
     * @tc.desc   input 6 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0444 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0444 end');
    })

    /**
     * @tc.name   testRoam0445
     * @tc.number SUB_MOBILENETWORK_ROAM_0445
     * @tc.desc   input 7 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0445 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0445 end');
    })

    /**
     * @tc.name   testRoam0446
     * @tc.number SUB_MOBILENETWORK_ROAM_0446
     * @tc.desc   input 8 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0446 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0446 end');
    })

    /**
     * @tc.name   testRoam0447
     * @tc.number SUB_MOBILENETWORK_ROAM_0447
     * @tc.desc   input 9 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0447 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0447 end');
    })

    /**
     * @tc.name   testRoam0448
     * @tc.number SUB_MOBILENETWORK_ROAM_0448
     * @tc.desc   input 10 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0448 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0448 end');
    })

    /**
     * @tc.name   testRoam0449
     * @tc.number SUB_MOBILENETWORK_ROAM_0449
     * @tc.desc   input 11 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0449 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0449 end');
    })

    /**
     * @tc.name   testRoam0450
     * @tc.number SUB_MOBILENETWORK_ROAM_0450
     * @tc.desc   input 12 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0450 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0450 end');
    })

    /**
     * @tc.name   testRoam0451
     * @tc.number SUB_MOBILENETWORK_ROAM_0451
     * @tc.desc   input 13 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0451 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0451 end');
    })

    /**
     * @tc.name   testRoam0452
     * @tc.number SUB_MOBILENETWORK_ROAM_0452
     * @tc.desc   input 14 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0452 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0452 end');
    })

    /**
     * @tc.name   testRoam0453
     * @tc.number SUB_MOBILENETWORK_ROAM_0453
     * @tc.desc   input 15 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0453 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0453 end');
    })

    /**
     * @tc.name   testRoam0454
     * @tc.number SUB_MOBILENETWORK_ROAM_0454
     * @tc.desc   input 16 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0454 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0454 end');
    })

    /**
     * @tc.name   testRoam0455
     * @tc.number SUB_MOBILENETWORK_ROAM_0455
     * @tc.desc   input 17 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0455 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0455 end');
    })

    /**
     * @tc.name   testRoam0456
     * @tc.number SUB_MOBILENETWORK_ROAM_0456
     * @tc.desc   input 18 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0456 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0456 end');
    })

    /**
     * @tc.name   testRoam0457
     * @tc.number SUB_MOBILENETWORK_ROAM_0457
     * @tc.desc   input 19 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0457', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0457 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0457 end');
    })

    /**
     * @tc.name   testRoam0458
     * @tc.number SUB_MOBILENETWORK_ROAM_0458
     * @tc.desc   input 20 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0458', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0458 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0458 end');
    })

    /**
     * @tc.name   testRoam0459
     * @tc.number SUB_MOBILENETWORK_ROAM_0459
     * @tc.desc   input 21 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0459', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0459 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0459 end');
    })

    /**
     * @tc.name   testRoam0460
     * @tc.number SUB_MOBILENETWORK_ROAM_0460
     * @tc.desc   input 22 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0460 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0460 end');
    })

    /**
     * @tc.name   testRoam0461
     * @tc.number SUB_MOBILENETWORK_ROAM_0461
     * @tc.desc   input 23 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0461', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0461 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0461 end');
    })

    /**
     * @tc.name   testRoam0462
     * @tc.number SUB_MOBILENETWORK_ROAM_0462
     * @tc.desc   input 24 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0462', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0462 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0462 end');
    })

    /**
     * @tc.name   testRoam0463
     * @tc.number SUB_MOBILENETWORK_ROAM_0463
     * @tc.desc   input 25 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0463', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0463 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0463 end');
    })

    /**
     * @tc.name   testRoam0464
     * @tc.number SUB_MOBILENETWORK_ROAM_0464
     * @tc.desc   input 26 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0464', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0464 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0464 end');
    })

    /**
     * @tc.name   testRoam0465
     * @tc.number SUB_MOBILENETWORK_ROAM_0465
     * @tc.desc   input 27 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0465 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0465 end');
    })

    /**
     * @tc.name   testRoam0466
     * @tc.number SUB_MOBILENETWORK_ROAM_0466
     * @tc.desc   input 28 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0466 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0466 end');
    })

    /**
     * @tc.name   testRoam0467
     * @tc.number SUB_MOBILENETWORK_ROAM_0467
     * @tc.desc   input 29 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0467 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0467 end');
    })

    /**
     * @tc.name   testRoam0468
     * @tc.number SUB_MOBILENETWORK_ROAM_0468
     * @tc.desc   input 30 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0468 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0468 end');
    })

    /**
     * @tc.name   testRoam0469
     * @tc.number SUB_MOBILENETWORK_ROAM_0469
     * @tc.desc   input 31 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0469 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0469 end');
    })

    /**
     * @tc.name   testRoam0470
     * @tc.number SUB_MOBILENETWORK_ROAM_0470
     * @tc.desc   input 32 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0470 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0470 end');
    })

    /**
     * @tc.name   testRoam0471
     * @tc.number SUB_MOBILENETWORK_ROAM_0471
     * @tc.desc   input 33 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0471 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0471 end');
    })

    /**
     * @tc.name   testRoam0472
     * @tc.number SUB_MOBILENETWORK_ROAM_0472
     * @tc.desc   input 34 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0472 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0472 end');
    })

    /**
     * @tc.name   testRoam0473
     * @tc.number SUB_MOBILENETWORK_ROAM_0473
     * @tc.desc   input 35 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0473 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0473 end');
    })

    /**
     * @tc.name   testRoam0474
     * @tc.number SUB_MOBILENETWORK_ROAM_0474
     * @tc.desc   input 36 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0474 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0474 end');
    })

    /**
     * @tc.name   testRoam0475
     * @tc.number SUB_MOBILENETWORK_ROAM_0475
     * @tc.desc   input 37 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0475 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0475 end');
    })

    /**
     * @tc.name   testRoam0476
     * @tc.number SUB_MOBILENETWORK_ROAM_0476
     * @tc.desc   input 38 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0476 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0476 end');
    })

    /**
     * @tc.name   testRoam0477
     * @tc.number SUB_MOBILENETWORK_ROAM_0477
     * @tc.desc   input 39 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0477 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0477 end');
    })

    /**
     * @tc.name   testRoam0478
     * @tc.number SUB_MOBILENETWORK_ROAM_0478
     * @tc.desc   input 40 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0478 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0478 end');
    })

    /**
     * @tc.name   testRoam0479
     * @tc.number SUB_MOBILENETWORK_ROAM_0479
     * @tc.desc   input 41 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0479 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0479 end');
    })

    /**
     * @tc.name   testRoam0480
     * @tc.number SUB_MOBILENETWORK_ROAM_0480
     * @tc.desc   input 42 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0480 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0480 end');
    })

    /**
     * @tc.name   testRoam0481
     * @tc.number SUB_MOBILENETWORK_ROAM_0481
     * @tc.desc   input 43 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0481 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0481 end');
    })

    /**
     * @tc.name   testRoam0482
     * @tc.number SUB_MOBILENETWORK_ROAM_0482
     * @tc.desc   input 44 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0482 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0482 end');
    })

    /**
     * @tc.name   testRoam0483
     * @tc.number SUB_MOBILENETWORK_ROAM_0483
     * @tc.desc   input 45 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0483 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0483 end');
    })

    /**
     * @tc.name   testRoam0484
     * @tc.number SUB_MOBILENETWORK_ROAM_0484
     * @tc.desc   input 46 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0484 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0484 end');
    })

    /**
     * @tc.name   testRoam0485
     * @tc.number SUB_MOBILENETWORK_ROAM_0485
     * @tc.desc   input 47 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0485 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0485 end');
    })

    /**
     * @tc.name   testRoam0486
     * @tc.number SUB_MOBILENETWORK_ROAM_0486
     * @tc.desc   input 48 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0486 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0486 end');
    })

    /**
     * @tc.name   testRoam0487
     * @tc.number SUB_MOBILENETWORK_ROAM_0487
     * @tc.desc   input 49 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0487 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0487 end');
    })

    /**
     * @tc.name   testRoam0488
     * @tc.number SUB_MOBILENETWORK_ROAM_0488
     * @tc.desc   input 50 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0488 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0488 end');
    })

    /**
     * @tc.name   testRoam0489
     * @tc.number SUB_MOBILENETWORK_ROAM_0489
     * @tc.desc   input 51 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0489 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0489 end');
    })

    /**
     * @tc.name   testRoam0490
     * @tc.number SUB_MOBILENETWORK_ROAM_0490
     * @tc.desc   input 52 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0490 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0490 end');
    })

    /**
     * @tc.name   testRoam0491
     * @tc.number SUB_MOBILENETWORK_ROAM_0491
     * @tc.desc   input 53 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0491 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0491 end');
    })

    /**
     * @tc.name   testRoam0492
     * @tc.number SUB_MOBILENETWORK_ROAM_0492
     * @tc.desc   input 54 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0492 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0492 end');
    })

    /**
     * @tc.name   testRoam0493
     * @tc.number SUB_MOBILENETWORK_ROAM_0493
     * @tc.desc   input 55 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0493 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0493 end');
    })

    /**
     * @tc.name   testRoam0494
     * @tc.number SUB_MOBILENETWORK_ROAM_0494
     * @tc.desc   input 56 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0494 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0494 end');
    })

    /**
     * @tc.name   testRoam0495
     * @tc.number SUB_MOBILENETWORK_ROAM_0495
     * @tc.desc   input 57 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0495 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0495 end');
    })

    /**
     * @tc.name   testRoam0496
     * @tc.number SUB_MOBILENETWORK_ROAM_0496
     * @tc.desc   input 58 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0496 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0496 end');
    })

    /**
     * @tc.name   testRoam0497
     * @tc.number SUB_MOBILENETWORK_ROAM_0497
     * @tc.desc   input 59 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0497 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0497 end');
    })

    /**
     * @tc.name   testRoam0498
     * @tc.number SUB_MOBILENETWORK_ROAM_0498
     * @tc.desc   input 60 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0498 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0498 end');
    })

    /**
     * @tc.name   testRoam0499
     * @tc.number SUB_MOBILENETWORK_ROAM_0499
     * @tc.desc   input 61 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0499 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0499 end');
    })

    /**
     * @tc.name   testRoam0500
     * @tc.number SUB_MOBILENETWORK_ROAM_0500
     * @tc.desc   input 62 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0500 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0500 end');
    })

    /**
     * @tc.name   testRoam0501
     * @tc.number SUB_MOBILENETWORK_ROAM_0501
     * @tc.desc   input 63 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0501 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0501 end');
    })

    /**
     * @tc.name   testRoam0502
     * @tc.number SUB_MOBILENETWORK_ROAM_0502
     * @tc.desc   input 64 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0502 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0502 end');
    })

    /**
     * @tc.name   testRoam0503
     * @tc.number SUB_MOBILENETWORK_ROAM_0503
     * @tc.desc   input 65 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0503 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0503 end');
    })

    /**
     * @tc.name   testRoam0504
     * @tc.number SUB_MOBILENETWORK_ROAM_0504
     * @tc.desc   input 66 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0504 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0504 end');
    })

    /**
     * @tc.name   testRoam0505
     * @tc.number SUB_MOBILENETWORK_ROAM_0505
     * @tc.desc   input 67 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0505 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0505 end');
    })

    /**
     * @tc.name   testRoam0506
     * @tc.number SUB_MOBILENETWORK_ROAM_0506
     * @tc.desc   input 68 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0506 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0506 end');
    })

    /**
     * @tc.name   testRoam0507
     * @tc.number SUB_MOBILENETWORK_ROAM_0507
     * @tc.desc   input 69 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0507 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0507 end');
    })

    /**
     * @tc.name   testRoam0508
     * @tc.number SUB_MOBILENETWORK_ROAM_0508
     * @tc.desc   input 70 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0508 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0508 end');
    })

    /**
     * @tc.name   testRoam0509
     * @tc.number SUB_MOBILENETWORK_ROAM_0509
     * @tc.desc   input 71 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0509 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0509 end');
    })

    /**
     * @tc.name   testRoam0510
     * @tc.number SUB_MOBILENETWORK_ROAM_0510
     * @tc.desc   input 72 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0510 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0510 end');
    })

    /**
     * @tc.name   testRoam0511
     * @tc.number SUB_MOBILENETWORK_ROAM_0511
     * @tc.desc   input 73 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0511 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0511 end');
    })

    /**
     * @tc.name   testRoam0512
     * @tc.number SUB_MOBILENETWORK_ROAM_0512
     * @tc.desc   input 74 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0512 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0512 end');
    })

    /**
     * @tc.name   testRoam0513
     * @tc.number SUB_MOBILENETWORK_ROAM_0513
     * @tc.desc   input 75 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0513 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0513 end');
    })

    /**
     * @tc.name   testRoam0514
     * @tc.number SUB_MOBILENETWORK_ROAM_0514
     * @tc.desc   input 76 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0514 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0514 end');
    })

  })
}
