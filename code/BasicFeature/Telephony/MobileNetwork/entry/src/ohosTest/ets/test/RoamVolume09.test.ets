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
const LOG_TAG: string = '[Sample_MobileNetwork_RoamVolume09]';

export default function roamVolume09Test() {
  describe('RoamVolume09Test', () => {

    /**
     * @tc.name   testRoam0590
     * @tc.number SUB_MOBILENETWORK_ROAM_0590
     * @tc.desc   input 152 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0590 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0590 end');
    })

    /**
     * @tc.name   testRoam0591
     * @tc.number SUB_MOBILENETWORK_ROAM_0591
     * @tc.desc   input 153 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0591', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0591 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(153);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0591 end');
    })

    /**
     * @tc.name   testRoam0592
     * @tc.number SUB_MOBILENETWORK_ROAM_0592
     * @tc.desc   input 154 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0592', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0592 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0592 end');
    })

    /**
     * @tc.name   testRoam0593
     * @tc.number SUB_MOBILENETWORK_ROAM_0593
     * @tc.desc   input 155 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0593', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0593 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0593 end');
    })

    /**
     * @tc.name   testRoam0594
     * @tc.number SUB_MOBILENETWORK_ROAM_0594
     * @tc.desc   input 156 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0594', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0594 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0594 end');
    })

    /**
     * @tc.name   testRoam0595
     * @tc.number SUB_MOBILENETWORK_ROAM_0595
     * @tc.desc   input 157 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0595', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0595 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(157);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0595 end');
    })

    /**
     * @tc.name   testRoam0596
     * @tc.number SUB_MOBILENETWORK_ROAM_0596
     * @tc.desc   input 158 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0596', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0596 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0596 end');
    })

    /**
     * @tc.name   testRoam0597
     * @tc.number SUB_MOBILENETWORK_ROAM_0597
     * @tc.desc   input 159 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0597', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0597 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0597 end');
    })

    /**
     * @tc.name   testRoam0598
     * @tc.number SUB_MOBILENETWORK_ROAM_0598
     * @tc.desc   input 160 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0598', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0598 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0598 end');
    })

    /**
     * @tc.name   testRoam0599
     * @tc.number SUB_MOBILENETWORK_ROAM_0599
     * @tc.desc   input 161 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0599', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0599 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0599 end');
    })

    /**
     * @tc.name   testRoam0600
     * @tc.number SUB_MOBILENETWORK_ROAM_0600
     * @tc.desc   input 162 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0600 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0600 end');
    })

    /**
     * @tc.name   testRoam0601
     * @tc.number SUB_MOBILENETWORK_ROAM_0601
     * @tc.desc   input 163 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0601 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(163);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0601 end');
    })

    /**
     * @tc.name   testRoam0602
     * @tc.number SUB_MOBILENETWORK_ROAM_0602
     * @tc.desc   input 164 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0602 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0602 end');
    })

    /**
     * @tc.name   testRoam0603
     * @tc.number SUB_MOBILENETWORK_ROAM_0603
     * @tc.desc   input 165 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0603 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0603 end');
    })

    /**
     * @tc.name   testRoam0604
     * @tc.number SUB_MOBILENETWORK_ROAM_0604
     * @tc.desc   input 166 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0604 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(166);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0604 end');
    })

    /**
     * @tc.name   testRoam0605
     * @tc.number SUB_MOBILENETWORK_ROAM_0605
     * @tc.desc   input 167 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0605 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(167);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0605 end');
    })

    /**
     * @tc.name   testRoam0606
     * @tc.number SUB_MOBILENETWORK_ROAM_0606
     * @tc.desc   input 168 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0606 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0606 end');
    })

    /**
     * @tc.name   testRoam0607
     * @tc.number SUB_MOBILENETWORK_ROAM_0607
     * @tc.desc   input 169 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0607 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0607 end');
    })

    /**
     * @tc.name   testRoam0608
     * @tc.number SUB_MOBILENETWORK_ROAM_0608
     * @tc.desc   input 170 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0608 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(170);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0608 end');
    })

    /**
     * @tc.name   testRoam0609
     * @tc.number SUB_MOBILENETWORK_ROAM_0609
     * @tc.desc   input 171 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0609 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(171);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0609 end');
    })

    /**
     * @tc.name   testRoam0610
     * @tc.number SUB_MOBILENETWORK_ROAM_0610
     * @tc.desc   input 172 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0610 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0610 end');
    })

    /**
     * @tc.name   testRoam0611
     * @tc.number SUB_MOBILENETWORK_ROAM_0611
     * @tc.desc   input 173 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0611 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(173);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0611 end');
    })

    /**
     * @tc.name   testRoam0612
     * @tc.number SUB_MOBILENETWORK_ROAM_0612
     * @tc.desc   input 174 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0612 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(174);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0612 end');
    })

    /**
     * @tc.name   testRoam0613
     * @tc.number SUB_MOBILENETWORK_ROAM_0613
     * @tc.desc   input 175 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0613', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0613 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0613 end');
    })

    /**
     * @tc.name   testRoam0614
     * @tc.number SUB_MOBILENETWORK_ROAM_0614
     * @tc.desc   input 176 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0614', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0614 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0614 end');
    })

    /**
     * @tc.name   testRoam0615
     * @tc.number SUB_MOBILENETWORK_ROAM_0615
     * @tc.desc   input 177 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0615 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(177);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0615 end');
    })

    /**
     * @tc.name   testRoam0616
     * @tc.number SUB_MOBILENETWORK_ROAM_0616
     * @tc.desc   input 178 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0616', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0616 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(178);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0616 end');
    })

    /**
     * @tc.name   testRoam0617
     * @tc.number SUB_MOBILENETWORK_ROAM_0617
     * @tc.desc   input 179 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0617', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0617 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(179);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0617 end');
    })

    /**
     * @tc.name   testRoam0618
     * @tc.number SUB_MOBILENETWORK_ROAM_0618
     * @tc.desc   input 180 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0618', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0618 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0618 end');
    })

    /**
     * @tc.name   testRoam0619
     * @tc.number SUB_MOBILENETWORK_ROAM_0619
     * @tc.desc   input 181 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0619', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0619 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(181);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0619 end');
    })

    /**
     * @tc.name   testRoam0620
     * @tc.number SUB_MOBILENETWORK_ROAM_0620
     * @tc.desc   input 182 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0620 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(182);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0620 end');
    })

    /**
     * @tc.name   testRoam0621
     * @tc.number SUB_MOBILENETWORK_ROAM_0621
     * @tc.desc   input 183 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0621', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0621 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0621 end');
    })

    /**
     * @tc.name   testRoam0622
     * @tc.number SUB_MOBILENETWORK_ROAM_0622
     * @tc.desc   input 184 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0622', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0622 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0622 end');
    })

    /**
     * @tc.name   testRoam0623
     * @tc.number SUB_MOBILENETWORK_ROAM_0623
     * @tc.desc   input 185 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0623', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0623 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(185);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0623 end');
    })

    /**
     * @tc.name   testRoam0624
     * @tc.number SUB_MOBILENETWORK_ROAM_0624
     * @tc.desc   input 186 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0624', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0624 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(186);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0624 end');
    })

    /**
     * @tc.name   testRoam0625
     * @tc.number SUB_MOBILENETWORK_ROAM_0625
     * @tc.desc   input 187 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0625', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0625 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(187);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0625 end');
    })

    /**
     * @tc.name   testRoam0626
     * @tc.number SUB_MOBILENETWORK_ROAM_0626
     * @tc.desc   input 188 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0626', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0626 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0626 end');
    })

    /**
     * @tc.name   testRoam0627
     * @tc.number SUB_MOBILENETWORK_ROAM_0627
     * @tc.desc   input 189 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0627', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0627 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(189);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0627 end');
    })

    /**
     * @tc.name   testRoam0628
     * @tc.number SUB_MOBILENETWORK_ROAM_0628
     * @tc.desc   input 190 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0628', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0628 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(190);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0628 end');
    })

    /**
     * @tc.name   testRoam0629
     * @tc.number SUB_MOBILENETWORK_ROAM_0629
     * @tc.desc   input 191 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0629', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0629 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(191);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0629 end');
    })

    /**
     * @tc.name   testRoam0630
     * @tc.number SUB_MOBILENETWORK_ROAM_0630
     * @tc.desc   input 192 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0630 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0630 end');
    })

    /**
     * @tc.name   testRoam0631
     * @tc.number SUB_MOBILENETWORK_ROAM_0631
     * @tc.desc   input 193 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0631', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0631 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(193);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0631 end');
    })

    /**
     * @tc.name   testRoam0632
     * @tc.number SUB_MOBILENETWORK_ROAM_0632
     * @tc.desc   input 194 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0632', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0632 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(194);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0632 end');
    })

    /**
     * @tc.name   testRoam0633
     * @tc.number SUB_MOBILENETWORK_ROAM_0633
     * @tc.desc   input 195 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0633', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0633 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(195);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0633 end');
    })

    /**
     * @tc.name   testRoam0634
     * @tc.number SUB_MOBILENETWORK_ROAM_0634
     * @tc.desc   input 196 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0634', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0634 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0634 end');
    })

    /**
     * @tc.name   testRoam0635
     * @tc.number SUB_MOBILENETWORK_ROAM_0635
     * @tc.desc   input 197 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0635', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0635 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(197);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0635 end');
    })

    /**
     * @tc.name   testRoam0636
     * @tc.number SUB_MOBILENETWORK_ROAM_0636
     * @tc.desc   input 198 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0636', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0636 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(198);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0636 end');
    })

    /**
     * @tc.name   testRoam0637
     * @tc.number SUB_MOBILENETWORK_ROAM_0637
     * @tc.desc   input 199 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0637', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0637 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(199);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0637 end');
    })

    /**
     * @tc.name   testRoam0638
     * @tc.number SUB_MOBILENETWORK_ROAM_0638
     * @tc.desc   input 200 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0638', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0638 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0638 end');
    })

    /**
     * @tc.name   testRoam0639
     * @tc.number SUB_MOBILENETWORK_ROAM_0639
     * @tc.desc   input 201 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0639', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0639 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(201);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0639 end');
    })

    /**
     * @tc.name   testRoam0640
     * @tc.number SUB_MOBILENETWORK_ROAM_0640
     * @tc.desc   input 202 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0640 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(202);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0640 end');
    })

    /**
     * @tc.name   testRoam0641
     * @tc.number SUB_MOBILENETWORK_ROAM_0641
     * @tc.desc   input 203 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0641', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0641 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(203);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0641 end');
    })

    /**
     * @tc.name   testRoam0642
     * @tc.number SUB_MOBILENETWORK_ROAM_0642
     * @tc.desc   input 204 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0642', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0642 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0642 end');
    })

    /**
     * @tc.name   testRoam0643
     * @tc.number SUB_MOBILENETWORK_ROAM_0643
     * @tc.desc   input 205 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0643', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0643 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(205);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0643 end');
    })

    /**
     * @tc.name   testRoam0644
     * @tc.number SUB_MOBILENETWORK_ROAM_0644
     * @tc.desc   input 206 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0644', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0644 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(206);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0644 end');
    })

    /**
     * @tc.name   testRoam0645
     * @tc.number SUB_MOBILENETWORK_ROAM_0645
     * @tc.desc   input 207 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0645 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(207);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0645 end');
    })

    /**
     * @tc.name   testRoam0646
     * @tc.number SUB_MOBILENETWORK_ROAM_0646
     * @tc.desc   input 208 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0646', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0646 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0646 end');
    })

    /**
     * @tc.name   testRoam0647
     * @tc.number SUB_MOBILENETWORK_ROAM_0647
     * @tc.desc   input 209 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0647', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0647 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(209);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0647 end');
    })

    /**
     * @tc.name   testRoam0648
     * @tc.number SUB_MOBILENETWORK_ROAM_0648
     * @tc.desc   input 210 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0648 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0648 end');
    })

    /**
     * @tc.name   testRoam0649
     * @tc.number SUB_MOBILENETWORK_ROAM_0649
     * @tc.desc   input 211 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0649', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0649 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(211);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0649 end');
    })

    /**
     * @tc.name   testRoam0650
     * @tc.number SUB_MOBILENETWORK_ROAM_0650
     * @tc.desc   input 212 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0650 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0650 end');
    })

    /**
     * @tc.name   testRoam0651
     * @tc.number SUB_MOBILENETWORK_ROAM_0651
     * @tc.desc   input 213 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0651', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0651 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(213);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0651 end');
    })

    /**
     * @tc.name   testRoam0652
     * @tc.number SUB_MOBILENETWORK_ROAM_0652
     * @tc.desc   input 214 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0652', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0652 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(214);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0652 end');
    })

    /**
     * @tc.name   testRoam0653
     * @tc.number SUB_MOBILENETWORK_ROAM_0653
     * @tc.desc   input 215 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0653', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0653 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(215);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0653 end');
    })

    /**
     * @tc.name   testRoam0654
     * @tc.number SUB_MOBILENETWORK_ROAM_0654
     * @tc.desc   input 216 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0654', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0654 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0654 end');
    })

    /**
     * @tc.name   testRoam0655
     * @tc.number SUB_MOBILENETWORK_ROAM_0655
     * @tc.desc   input 217 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0655', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0655 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(217);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0655 end');
    })

    /**
     * @tc.name   testRoam0656
     * @tc.number SUB_MOBILENETWORK_ROAM_0656
     * @tc.desc   input 218 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0656', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0656 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(218);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0656 end');
    })

    /**
     * @tc.name   testRoam0657
     * @tc.number SUB_MOBILENETWORK_ROAM_0657
     * @tc.desc   input 219 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0657', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0657 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(219);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0657 end');
    })

    /**
     * @tc.name   testRoam0658
     * @tc.number SUB_MOBILENETWORK_ROAM_0658
     * @tc.desc   input 220 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0658', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0658 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0658 end');
    })

    /**
     * @tc.name   testRoam0659
     * @tc.number SUB_MOBILENETWORK_ROAM_0659
     * @tc.desc   input 221 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0659', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0659 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(221);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0659 end');
    })

    /**
     * @tc.name   testRoam0660
     * @tc.number SUB_MOBILENETWORK_ROAM_0660
     * @tc.desc   input 222 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0660 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(222);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0660 end');
    })

    /**
     * @tc.name   testRoam0661
     * @tc.number SUB_MOBILENETWORK_ROAM_0661
     * @tc.desc   input 223 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0661', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0661 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(223);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0661 end');
    })

    /**
     * @tc.name   testRoam0662
     * @tc.number SUB_MOBILENETWORK_ROAM_0662
     * @tc.desc   input 224 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0662', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0662 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0662 end');
    })

    /**
     * @tc.name   testRoam0663
     * @tc.number SUB_MOBILENETWORK_ROAM_0663
     * @tc.desc   input 225 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0663', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0663 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0663 end');
    })

    /**
     * @tc.name   testRoam0664
     * @tc.number SUB_MOBILENETWORK_ROAM_0664
     * @tc.desc   input 226 lies above the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0664', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0664 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(226);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0664 end');
    })

  })
}
