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
const LOG_TAG: string = '[Sample_MobileNetwork_RoamVolume03]';

export default function roamVolume03Test() {
  describe('RoamVolume03Test', () => {

    /**
     * @tc.name   testRoam0140
     * @tc.number SUB_MOBILENETWORK_ROAM_0140
     * @tc.desc   input -300 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0140 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-300);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0140 end');
    })

    /**
     * @tc.name   testRoam0141
     * @tc.number SUB_MOBILENETWORK_ROAM_0141
     * @tc.desc   input -299 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0141 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-299);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0141 end');
    })

    /**
     * @tc.name   testRoam0142
     * @tc.number SUB_MOBILENETWORK_ROAM_0142
     * @tc.desc   input -298 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0142 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-298);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0142 end');
    })

    /**
     * @tc.name   testRoam0143
     * @tc.number SUB_MOBILENETWORK_ROAM_0143
     * @tc.desc   input -297 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0143 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-297);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0143 end');
    })

    /**
     * @tc.name   testRoam0144
     * @tc.number SUB_MOBILENETWORK_ROAM_0144
     * @tc.desc   input -296 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0144 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0144 end');
    })

    /**
     * @tc.name   testRoam0145
     * @tc.number SUB_MOBILENETWORK_ROAM_0145
     * @tc.desc   input -295 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0145 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0145 end');
    })

    /**
     * @tc.name   testRoam0146
     * @tc.number SUB_MOBILENETWORK_ROAM_0146
     * @tc.desc   input -294 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0146 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-294);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0146 end');
    })

    /**
     * @tc.name   testRoam0147
     * @tc.number SUB_MOBILENETWORK_ROAM_0147
     * @tc.desc   input -293 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0147 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-293);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0147 end');
    })

    /**
     * @tc.name   testRoam0148
     * @tc.number SUB_MOBILENETWORK_ROAM_0148
     * @tc.desc   input -292 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0148 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-292);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0148 end');
    })

    /**
     * @tc.name   testRoam0149
     * @tc.number SUB_MOBILENETWORK_ROAM_0149
     * @tc.desc   input -291 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0149 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-291);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0149 end');
    })

    /**
     * @tc.name   testRoam0150
     * @tc.number SUB_MOBILENETWORK_ROAM_0150
     * @tc.desc   input -290 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0150 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-290);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0150 end');
    })

    /**
     * @tc.name   testRoam0151
     * @tc.number SUB_MOBILENETWORK_ROAM_0151
     * @tc.desc   input -289 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0151 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-289);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0151 end');
    })

    /**
     * @tc.name   testRoam0152
     * @tc.number SUB_MOBILENETWORK_ROAM_0152
     * @tc.desc   input -288 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0152 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-288);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0152 end');
    })

    /**
     * @tc.name   testRoam0153
     * @tc.number SUB_MOBILENETWORK_ROAM_0153
     * @tc.desc   input -287 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0153 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-287);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0153 end');
    })

    /**
     * @tc.name   testRoam0154
     * @tc.number SUB_MOBILENETWORK_ROAM_0154
     * @tc.desc   input -286 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0154 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-286);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0154 end');
    })

    /**
     * @tc.name   testRoam0155
     * @tc.number SUB_MOBILENETWORK_ROAM_0155
     * @tc.desc   input -285 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0155 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-285);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0155 end');
    })

    /**
     * @tc.name   testRoam0156
     * @tc.number SUB_MOBILENETWORK_ROAM_0156
     * @tc.desc   input -284 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0156 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-284);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0156 end');
    })

    /**
     * @tc.name   testRoam0157
     * @tc.number SUB_MOBILENETWORK_ROAM_0157
     * @tc.desc   input -283 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0157 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-283);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0157 end');
    })

    /**
     * @tc.name   testRoam0158
     * @tc.number SUB_MOBILENETWORK_ROAM_0158
     * @tc.desc   input -282 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0158 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-282);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0158 end');
    })

    /**
     * @tc.name   testRoam0159
     * @tc.number SUB_MOBILENETWORK_ROAM_0159
     * @tc.desc   input -281 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0159 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-281);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0159 end');
    })

    /**
     * @tc.name   testRoam0160
     * @tc.number SUB_MOBILENETWORK_ROAM_0160
     * @tc.desc   input -280 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0160 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0160 end');
    })

    /**
     * @tc.name   testRoam0161
     * @tc.number SUB_MOBILENETWORK_ROAM_0161
     * @tc.desc   input -279 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0161 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-279);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0161 end');
    })

    /**
     * @tc.name   testRoam0162
     * @tc.number SUB_MOBILENETWORK_ROAM_0162
     * @tc.desc   input -278 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0162 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-278);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0162 end');
    })

    /**
     * @tc.name   testRoam0163
     * @tc.number SUB_MOBILENETWORK_ROAM_0163
     * @tc.desc   input -277 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0163 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-277);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0163 end');
    })

    /**
     * @tc.name   testRoam0164
     * @tc.number SUB_MOBILENETWORK_ROAM_0164
     * @tc.desc   input -276 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0164 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-276);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0164 end');
    })

    /**
     * @tc.name   testRoam0165
     * @tc.number SUB_MOBILENETWORK_ROAM_0165
     * @tc.desc   input -275 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0165 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-275);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0165 end');
    })

    /**
     * @tc.name   testRoam0166
     * @tc.number SUB_MOBILENETWORK_ROAM_0166
     * @tc.desc   input -274 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0166 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0166 end');
    })

    /**
     * @tc.name   testRoam0167
     * @tc.number SUB_MOBILENETWORK_ROAM_0167
     * @tc.desc   input -273 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0167 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0167 end');
    })

    /**
     * @tc.name   testRoam0168
     * @tc.number SUB_MOBILENETWORK_ROAM_0168
     * @tc.desc   input -272 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0168 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0168 end');
    })

    /**
     * @tc.name   testRoam0169
     * @tc.number SUB_MOBILENETWORK_ROAM_0169
     * @tc.desc   input -271 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0169 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-271);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0169 end');
    })

    /**
     * @tc.name   testRoam0170
     * @tc.number SUB_MOBILENETWORK_ROAM_0170
     * @tc.desc   input -270 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0170 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0170 end');
    })

    /**
     * @tc.name   testRoam0171
     * @tc.number SUB_MOBILENETWORK_ROAM_0171
     * @tc.desc   input -269 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0171 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-269);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0171 end');
    })

    /**
     * @tc.name   testRoam0172
     * @tc.number SUB_MOBILENETWORK_ROAM_0172
     * @tc.desc   input -268 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0172 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-268);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0172 end');
    })

    /**
     * @tc.name   testRoam0173
     * @tc.number SUB_MOBILENETWORK_ROAM_0173
     * @tc.desc   input -267 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0173 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0173 end');
    })

    /**
     * @tc.name   testRoam0174
     * @tc.number SUB_MOBILENETWORK_ROAM_0174
     * @tc.desc   input -266 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0174 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-266);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0174 end');
    })

    /**
     * @tc.name   testRoam0175
     * @tc.number SUB_MOBILENETWORK_ROAM_0175
     * @tc.desc   input -265 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0175 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0175 end');
    })

    /**
     * @tc.name   testRoam0176
     * @tc.number SUB_MOBILENETWORK_ROAM_0176
     * @tc.desc   input -264 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0176 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0176 end');
    })

    /**
     * @tc.name   testRoam0177
     * @tc.number SUB_MOBILENETWORK_ROAM_0177
     * @tc.desc   input -263 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0177 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0177 end');
    })

    /**
     * @tc.name   testRoam0178
     * @tc.number SUB_MOBILENETWORK_ROAM_0178
     * @tc.desc   input -262 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0178 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-262);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0178 end');
    })

    /**
     * @tc.name   testRoam0179
     * @tc.number SUB_MOBILENETWORK_ROAM_0179
     * @tc.desc   input -261 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0179 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0179 end');
    })

    /**
     * @tc.name   testRoam0180
     * @tc.number SUB_MOBILENETWORK_ROAM_0180
     * @tc.desc   input -260 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0180 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0180 end');
    })

    /**
     * @tc.name   testRoam0181
     * @tc.number SUB_MOBILENETWORK_ROAM_0181
     * @tc.desc   input -259 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0181 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-259);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0181 end');
    })

    /**
     * @tc.name   testRoam0182
     * @tc.number SUB_MOBILENETWORK_ROAM_0182
     * @tc.desc   input -258 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0182 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-258);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0182 end');
    })

    /**
     * @tc.name   testRoam0183
     * @tc.number SUB_MOBILENETWORK_ROAM_0183
     * @tc.desc   input -257 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0183 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-257);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0183 end');
    })

    /**
     * @tc.name   testRoam0184
     * @tc.number SUB_MOBILENETWORK_ROAM_0184
     * @tc.desc   input -256 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0184 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0184 end');
    })

    /**
     * @tc.name   testRoam0185
     * @tc.number SUB_MOBILENETWORK_ROAM_0185
     * @tc.desc   input -255 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0185 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0185 end');
    })

    /**
     * @tc.name   testRoam0186
     * @tc.number SUB_MOBILENETWORK_ROAM_0186
     * @tc.desc   input -254 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0186 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-254);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0186 end');
    })

    /**
     * @tc.name   testRoam0187
     * @tc.number SUB_MOBILENETWORK_ROAM_0187
     * @tc.desc   input -253 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0187 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0187 end');
    })

    /**
     * @tc.name   testRoam0188
     * @tc.number SUB_MOBILENETWORK_ROAM_0188
     * @tc.desc   input -252 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0188 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0188 end');
    })

    /**
     * @tc.name   testRoam0189
     * @tc.number SUB_MOBILENETWORK_ROAM_0189
     * @tc.desc   input -251 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0189 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-251);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0189 end');
    })

    /**
     * @tc.name   testRoam0190
     * @tc.number SUB_MOBILENETWORK_ROAM_0190
     * @tc.desc   input -250 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0190 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-250);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0190 end');
    })

    /**
     * @tc.name   testRoam0191
     * @tc.number SUB_MOBILENETWORK_ROAM_0191
     * @tc.desc   input -249 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0191 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0191 end');
    })

    /**
     * @tc.name   testRoam0192
     * @tc.number SUB_MOBILENETWORK_ROAM_0192
     * @tc.desc   input -248 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0192 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0192 end');
    })

    /**
     * @tc.name   testRoam0193
     * @tc.number SUB_MOBILENETWORK_ROAM_0193
     * @tc.desc   input -247 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0193 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-247);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0193 end');
    })

    /**
     * @tc.name   testRoam0194
     * @tc.number SUB_MOBILENETWORK_ROAM_0194
     * @tc.desc   input -246 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0194 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0194 end');
    })

    /**
     * @tc.name   testRoam0195
     * @tc.number SUB_MOBILENETWORK_ROAM_0195
     * @tc.desc   input -245 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0195 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0195 end');
    })

    /**
     * @tc.name   testRoam0196
     * @tc.number SUB_MOBILENETWORK_ROAM_0196
     * @tc.desc   input -244 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0196 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0196 end');
    })

    /**
     * @tc.name   testRoam0197
     * @tc.number SUB_MOBILENETWORK_ROAM_0197
     * @tc.desc   input -243 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0197 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-243);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0197 end');
    })

    /**
     * @tc.name   testRoam0198
     * @tc.number SUB_MOBILENETWORK_ROAM_0198
     * @tc.desc   input -242 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0198 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-242);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0198 end');
    })

    /**
     * @tc.name   testRoam0199
     * @tc.number SUB_MOBILENETWORK_ROAM_0199
     * @tc.desc   input -241 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0199 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-241);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0199 end');
    })

    /**
     * @tc.name   testRoam0200
     * @tc.number SUB_MOBILENETWORK_ROAM_0200
     * @tc.desc   input -240 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0200 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0200 end');
    })

    /**
     * @tc.name   testRoam0201
     * @tc.number SUB_MOBILENETWORK_ROAM_0201
     * @tc.desc   input -239 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0201 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0201 end');
    })

    /**
     * @tc.name   testRoam0202
     * @tc.number SUB_MOBILENETWORK_ROAM_0202
     * @tc.desc   input -238 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0202 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-238);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0202 end');
    })

    /**
     * @tc.name   testRoam0203
     * @tc.number SUB_MOBILENETWORK_ROAM_0203
     * @tc.desc   input -237 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0203 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-237);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0203 end');
    })

    /**
     * @tc.name   testRoam0204
     * @tc.number SUB_MOBILENETWORK_ROAM_0204
     * @tc.desc   input -236 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0204 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0204 end');
    })

    /**
     * @tc.name   testRoam0205
     * @tc.number SUB_MOBILENETWORK_ROAM_0205
     * @tc.desc   input -235 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0205 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0205 end');
    })

    /**
     * @tc.name   testRoam0206
     * @tc.number SUB_MOBILENETWORK_ROAM_0206
     * @tc.desc   input -234 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0206 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0206 end');
    })

    /**
     * @tc.name   testRoam0207
     * @tc.number SUB_MOBILENETWORK_ROAM_0207
     * @tc.desc   input -233 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0207 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-233);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0207 end');
    })

    /**
     * @tc.name   testRoam0208
     * @tc.number SUB_MOBILENETWORK_ROAM_0208
     * @tc.desc   input -232 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0208 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0208 end');
    })

    /**
     * @tc.name   testRoam0209
     * @tc.number SUB_MOBILENETWORK_ROAM_0209
     * @tc.desc   input -231 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0209 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0209 end');
    })

    /**
     * @tc.name   testRoam0210
     * @tc.number SUB_MOBILENETWORK_ROAM_0210
     * @tc.desc   input -230 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0210 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-230);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0210 end');
    })

    /**
     * @tc.name   testRoam0211
     * @tc.number SUB_MOBILENETWORK_ROAM_0211
     * @tc.desc   input -229 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0211 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-229);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0211 end');
    })

    /**
     * @tc.name   testRoam0212
     * @tc.number SUB_MOBILENETWORK_ROAM_0212
     * @tc.desc   input -228 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0212 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0212 end');
    })

    /**
     * @tc.name   testRoam0213
     * @tc.number SUB_MOBILENETWORK_ROAM_0213
     * @tc.desc   input -227 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0213 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-227);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0213 end');
    })

    /**
     * @tc.name   testRoam0214
     * @tc.number SUB_MOBILENETWORK_ROAM_0214
     * @tc.desc   input -226 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0214 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-226);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0214 end');
    })

  })
}
