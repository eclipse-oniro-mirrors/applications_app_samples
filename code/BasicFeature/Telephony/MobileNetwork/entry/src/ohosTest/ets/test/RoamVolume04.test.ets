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
const LOG_TAG: string = '[Sample_MobileNetwork_RoamVolume04]';

export default function roamVolume04Test() {
  describe('RoamVolume04Test', () => {

    /**
     * @tc.name   testRoam0215
     * @tc.number SUB_MOBILENETWORK_ROAM_0215
     * @tc.desc   input -225 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0215 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0215 end');
    })

    /**
     * @tc.name   testRoam0216
     * @tc.number SUB_MOBILENETWORK_ROAM_0216
     * @tc.desc   input -224 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0216 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0216 end');
    })

    /**
     * @tc.name   testRoam0217
     * @tc.number SUB_MOBILENETWORK_ROAM_0217
     * @tc.desc   input -223 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0217 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-223);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0217 end');
    })

    /**
     * @tc.name   testRoam0218
     * @tc.number SUB_MOBILENETWORK_ROAM_0218
     * @tc.desc   input -222 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0218 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-222);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0218 end');
    })

    /**
     * @tc.name   testRoam0219
     * @tc.number SUB_MOBILENETWORK_ROAM_0219
     * @tc.desc   input -221 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0219 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-221);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0219 end');
    })

    /**
     * @tc.name   testRoam0220
     * @tc.number SUB_MOBILENETWORK_ROAM_0220
     * @tc.desc   input -220 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0220 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0220 end');
    })

    /**
     * @tc.name   testRoam0221
     * @tc.number SUB_MOBILENETWORK_ROAM_0221
     * @tc.desc   input -219 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0221 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-219);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0221 end');
    })

    /**
     * @tc.name   testRoam0222
     * @tc.number SUB_MOBILENETWORK_ROAM_0222
     * @tc.desc   input -218 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0222 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-218);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0222 end');
    })

    /**
     * @tc.name   testRoam0223
     * @tc.number SUB_MOBILENETWORK_ROAM_0223
     * @tc.desc   input -217 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0223 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-217);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0223 end');
    })

    /**
     * @tc.name   testRoam0224
     * @tc.number SUB_MOBILENETWORK_ROAM_0224
     * @tc.desc   input -216 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0224 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0224 end');
    })

    /**
     * @tc.name   testRoam0225
     * @tc.number SUB_MOBILENETWORK_ROAM_0225
     * @tc.desc   input -215 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0225 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-215);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0225 end');
    })

    /**
     * @tc.name   testRoam0226
     * @tc.number SUB_MOBILENETWORK_ROAM_0226
     * @tc.desc   input -214 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0226 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-214);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0226 end');
    })

    /**
     * @tc.name   testRoam0227
     * @tc.number SUB_MOBILENETWORK_ROAM_0227
     * @tc.desc   input -213 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0227 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-213);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0227 end');
    })

    /**
     * @tc.name   testRoam0228
     * @tc.number SUB_MOBILENETWORK_ROAM_0228
     * @tc.desc   input -212 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0228 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0228 end');
    })

    /**
     * @tc.name   testRoam0229
     * @tc.number SUB_MOBILENETWORK_ROAM_0229
     * @tc.desc   input -211 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0229 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-211);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0229 end');
    })

    /**
     * @tc.name   testRoam0230
     * @tc.number SUB_MOBILENETWORK_ROAM_0230
     * @tc.desc   input -210 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0230 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0230 end');
    })

    /**
     * @tc.name   testRoam0231
     * @tc.number SUB_MOBILENETWORK_ROAM_0231
     * @tc.desc   input -209 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0231 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-209);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0231 end');
    })

    /**
     * @tc.name   testRoam0232
     * @tc.number SUB_MOBILENETWORK_ROAM_0232
     * @tc.desc   input -208 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0232 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0232 end');
    })

    /**
     * @tc.name   testRoam0233
     * @tc.number SUB_MOBILENETWORK_ROAM_0233
     * @tc.desc   input -207 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0233 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-207);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0233 end');
    })

    /**
     * @tc.name   testRoam0234
     * @tc.number SUB_MOBILENETWORK_ROAM_0234
     * @tc.desc   input -206 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0234 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-206);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0234 end');
    })

    /**
     * @tc.name   testRoam0235
     * @tc.number SUB_MOBILENETWORK_ROAM_0235
     * @tc.desc   input -205 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0235 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-205);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0235 end');
    })

    /**
     * @tc.name   testRoam0236
     * @tc.number SUB_MOBILENETWORK_ROAM_0236
     * @tc.desc   input -204 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0236 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0236 end');
    })

    /**
     * @tc.name   testRoam0237
     * @tc.number SUB_MOBILENETWORK_ROAM_0237
     * @tc.desc   input -203 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0237 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-203);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0237 end');
    })

    /**
     * @tc.name   testRoam0238
     * @tc.number SUB_MOBILENETWORK_ROAM_0238
     * @tc.desc   input -202 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0238 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-202);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0238 end');
    })

    /**
     * @tc.name   testRoam0239
     * @tc.number SUB_MOBILENETWORK_ROAM_0239
     * @tc.desc   input -201 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0239 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-201);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0239 end');
    })

    /**
     * @tc.name   testRoam0240
     * @tc.number SUB_MOBILENETWORK_ROAM_0240
     * @tc.desc   input -200 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0240 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0240 end');
    })

    /**
     * @tc.name   testRoam0241
     * @tc.number SUB_MOBILENETWORK_ROAM_0241
     * @tc.desc   input -199 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0241 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-199);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0241 end');
    })

    /**
     * @tc.name   testRoam0242
     * @tc.number SUB_MOBILENETWORK_ROAM_0242
     * @tc.desc   input -198 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0242 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-198);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0242 end');
    })

    /**
     * @tc.name   testRoam0243
     * @tc.number SUB_MOBILENETWORK_ROAM_0243
     * @tc.desc   input -197 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0243 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-197);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0243 end');
    })

    /**
     * @tc.name   testRoam0244
     * @tc.number SUB_MOBILENETWORK_ROAM_0244
     * @tc.desc   input -196 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0244 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0244 end');
    })

    /**
     * @tc.name   testRoam0245
     * @tc.number SUB_MOBILENETWORK_ROAM_0245
     * @tc.desc   input -195 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0245 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-195);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0245 end');
    })

    /**
     * @tc.name   testRoam0246
     * @tc.number SUB_MOBILENETWORK_ROAM_0246
     * @tc.desc   input -194 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0246 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-194);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0246 end');
    })

    /**
     * @tc.name   testRoam0247
     * @tc.number SUB_MOBILENETWORK_ROAM_0247
     * @tc.desc   input -193 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0247 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-193);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0247 end');
    })

    /**
     * @tc.name   testRoam0248
     * @tc.number SUB_MOBILENETWORK_ROAM_0248
     * @tc.desc   input -192 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0248 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0248 end');
    })

    /**
     * @tc.name   testRoam0249
     * @tc.number SUB_MOBILENETWORK_ROAM_0249
     * @tc.desc   input -191 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0249 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-191);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0249 end');
    })

    /**
     * @tc.name   testRoam0250
     * @tc.number SUB_MOBILENETWORK_ROAM_0250
     * @tc.desc   input -190 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0250 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-190);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0250 end');
    })

    /**
     * @tc.name   testRoam0251
     * @tc.number SUB_MOBILENETWORK_ROAM_0251
     * @tc.desc   input -189 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0251 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-189);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0251 end');
    })

    /**
     * @tc.name   testRoam0252
     * @tc.number SUB_MOBILENETWORK_ROAM_0252
     * @tc.desc   input -188 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0252 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0252 end');
    })

    /**
     * @tc.name   testRoam0253
     * @tc.number SUB_MOBILENETWORK_ROAM_0253
     * @tc.desc   input -187 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0253 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-187);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0253 end');
    })

    /**
     * @tc.name   testRoam0254
     * @tc.number SUB_MOBILENETWORK_ROAM_0254
     * @tc.desc   input -186 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0254 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-186);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0254 end');
    })

    /**
     * @tc.name   testRoam0255
     * @tc.number SUB_MOBILENETWORK_ROAM_0255
     * @tc.desc   input -185 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0255 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-185);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0255 end');
    })

    /**
     * @tc.name   testRoam0256
     * @tc.number SUB_MOBILENETWORK_ROAM_0256
     * @tc.desc   input -184 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0256 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0256 end');
    })

    /**
     * @tc.name   testRoam0257
     * @tc.number SUB_MOBILENETWORK_ROAM_0257
     * @tc.desc   input -183 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0257 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0257 end');
    })

    /**
     * @tc.name   testRoam0258
     * @tc.number SUB_MOBILENETWORK_ROAM_0258
     * @tc.desc   input -182 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0258 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-182);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0258 end');
    })

    /**
     * @tc.name   testRoam0259
     * @tc.number SUB_MOBILENETWORK_ROAM_0259
     * @tc.desc   input -181 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0259 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-181);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0259 end');
    })

    /**
     * @tc.name   testRoam0260
     * @tc.number SUB_MOBILENETWORK_ROAM_0260
     * @tc.desc   input -180 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0260 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0260 end');
    })

    /**
     * @tc.name   testRoam0261
     * @tc.number SUB_MOBILENETWORK_ROAM_0261
     * @tc.desc   input -179 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0261 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-179);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0261 end');
    })

    /**
     * @tc.name   testRoam0262
     * @tc.number SUB_MOBILENETWORK_ROAM_0262
     * @tc.desc   input -178 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0262 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-178);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0262 end');
    })

    /**
     * @tc.name   testRoam0263
     * @tc.number SUB_MOBILENETWORK_ROAM_0263
     * @tc.desc   input -177 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0263 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-177);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0263 end');
    })

    /**
     * @tc.name   testRoam0264
     * @tc.number SUB_MOBILENETWORK_ROAM_0264
     * @tc.desc   input -176 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0264 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0264 end');
    })

    /**
     * @tc.name   testRoam0265
     * @tc.number SUB_MOBILENETWORK_ROAM_0265
     * @tc.desc   input -175 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0265 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0265 end');
    })

    /**
     * @tc.name   testRoam0266
     * @tc.number SUB_MOBILENETWORK_ROAM_0266
     * @tc.desc   input -174 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0266 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-174);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0266 end');
    })

    /**
     * @tc.name   testRoam0267
     * @tc.number SUB_MOBILENETWORK_ROAM_0267
     * @tc.desc   input -173 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0267 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-173);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0267 end');
    })

    /**
     * @tc.name   testRoam0268
     * @tc.number SUB_MOBILENETWORK_ROAM_0268
     * @tc.desc   input -172 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0268 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0268 end');
    })

    /**
     * @tc.name   testRoam0269
     * @tc.number SUB_MOBILENETWORK_ROAM_0269
     * @tc.desc   input -171 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0269 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-171);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0269 end');
    })

    /**
     * @tc.name   testRoam0270
     * @tc.number SUB_MOBILENETWORK_ROAM_0270
     * @tc.desc   input -170 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0270 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-170);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0270 end');
    })

    /**
     * @tc.name   testRoam0271
     * @tc.number SUB_MOBILENETWORK_ROAM_0271
     * @tc.desc   input -169 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0271 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0271 end');
    })

    /**
     * @tc.name   testRoam0272
     * @tc.number SUB_MOBILENETWORK_ROAM_0272
     * @tc.desc   input -168 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0272 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0272 end');
    })

    /**
     * @tc.name   testRoam0273
     * @tc.number SUB_MOBILENETWORK_ROAM_0273
     * @tc.desc   input -167 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0273 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-167);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0273 end');
    })

    /**
     * @tc.name   testRoam0274
     * @tc.number SUB_MOBILENETWORK_ROAM_0274
     * @tc.desc   input -166 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0274 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-166);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0274 end');
    })

    /**
     * @tc.name   testRoam0275
     * @tc.number SUB_MOBILENETWORK_ROAM_0275
     * @tc.desc   input -165 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0275 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0275 end');
    })

    /**
     * @tc.name   testRoam0276
     * @tc.number SUB_MOBILENETWORK_ROAM_0276
     * @tc.desc   input -164 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0276 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0276 end');
    })

    /**
     * @tc.name   testRoam0277
     * @tc.number SUB_MOBILENETWORK_ROAM_0277
     * @tc.desc   input -163 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0277 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-163);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0277 end');
    })

    /**
     * @tc.name   testRoam0278
     * @tc.number SUB_MOBILENETWORK_ROAM_0278
     * @tc.desc   input -162 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0278 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0278 end');
    })

    /**
     * @tc.name   testRoam0279
     * @tc.number SUB_MOBILENETWORK_ROAM_0279
     * @tc.desc   input -161 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0279 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0279 end');
    })

    /**
     * @tc.name   testRoam0280
     * @tc.number SUB_MOBILENETWORK_ROAM_0280
     * @tc.desc   input -160 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0280 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0280 end');
    })

    /**
     * @tc.name   testRoam0281
     * @tc.number SUB_MOBILENETWORK_ROAM_0281
     * @tc.desc   input -159 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0281 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0281 end');
    })

    /**
     * @tc.name   testRoam0282
     * @tc.number SUB_MOBILENETWORK_ROAM_0282
     * @tc.desc   input -158 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0282 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0282 end');
    })

    /**
     * @tc.name   testRoam0283
     * @tc.number SUB_MOBILENETWORK_ROAM_0283
     * @tc.desc   input -157 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0283 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-157);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0283 end');
    })

    /**
     * @tc.name   testRoam0284
     * @tc.number SUB_MOBILENETWORK_ROAM_0284
     * @tc.desc   input -156 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0284 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0284 end');
    })

    /**
     * @tc.name   testRoam0285
     * @tc.number SUB_MOBILENETWORK_ROAM_0285
     * @tc.desc   input -155 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0285 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0285 end');
    })

    /**
     * @tc.name   testRoam0286
     * @tc.number SUB_MOBILENETWORK_ROAM_0286
     * @tc.desc   input -154 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0286 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0286 end');
    })

    /**
     * @tc.name   testRoam0287
     * @tc.number SUB_MOBILENETWORK_ROAM_0287
     * @tc.desc   input -153 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0287 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-153);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0287 end');
    })

    /**
     * @tc.name   testRoam0288
     * @tc.number SUB_MOBILENETWORK_ROAM_0288
     * @tc.desc   input -152 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0288 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0288 end');
    })

    /**
     * @tc.name   testRoam0289
     * @tc.number SUB_MOBILENETWORK_ROAM_0289
     * @tc.desc   input -151 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0289 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0289 end');
    })

  })
}
