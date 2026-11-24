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
const LOG_TAG: string = '[Sample_MobileNetwork_RoamVolume06]';

export default function roamVolume06Test() {
  describe('RoamVolume06Test', () => {

    /**
     * @tc.name   testRoam0365
     * @tc.number SUB_MOBILENETWORK_ROAM_0365
     * @tc.desc   input -75 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0365 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0365 end');
    })

    /**
     * @tc.name   testRoam0366
     * @tc.number SUB_MOBILENETWORK_ROAM_0366
     * @tc.desc   input -74 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0366 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-74);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0366 end');
    })

    /**
     * @tc.name   testRoam0367
     * @tc.number SUB_MOBILENETWORK_ROAM_0367
     * @tc.desc   input -73 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0367 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-73);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0367 end');
    })

    /**
     * @tc.name   testRoam0368
     * @tc.number SUB_MOBILENETWORK_ROAM_0368
     * @tc.desc   input -72 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0368 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-72);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0368 end');
    })

    /**
     * @tc.name   testRoam0369
     * @tc.number SUB_MOBILENETWORK_ROAM_0369
     * @tc.desc   input -71 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0369 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-71);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0369 end');
    })

    /**
     * @tc.name   testRoam0370
     * @tc.number SUB_MOBILENETWORK_ROAM_0370
     * @tc.desc   input -70 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0370 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-70);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0370 end');
    })

    /**
     * @tc.name   testRoam0371
     * @tc.number SUB_MOBILENETWORK_ROAM_0371
     * @tc.desc   input -69 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0371 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-69);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0371 end');
    })

    /**
     * @tc.name   testRoam0372
     * @tc.number SUB_MOBILENETWORK_ROAM_0372
     * @tc.desc   input -68 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0372 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-68);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0372 end');
    })

    /**
     * @tc.name   testRoam0373
     * @tc.number SUB_MOBILENETWORK_ROAM_0373
     * @tc.desc   input -67 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0373 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-67);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0373 end');
    })

    /**
     * @tc.name   testRoam0374
     * @tc.number SUB_MOBILENETWORK_ROAM_0374
     * @tc.desc   input -66 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0374 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-66);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0374 end');
    })

    /**
     * @tc.name   testRoam0375
     * @tc.number SUB_MOBILENETWORK_ROAM_0375
     * @tc.desc   input -65 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0375 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-65);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0375 end');
    })

    /**
     * @tc.name   testRoam0376
     * @tc.number SUB_MOBILENETWORK_ROAM_0376
     * @tc.desc   input -64 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0376 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-64);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0376 end');
    })

    /**
     * @tc.name   testRoam0377
     * @tc.number SUB_MOBILENETWORK_ROAM_0377
     * @tc.desc   input -63 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0377 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-63);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0377 end');
    })

    /**
     * @tc.name   testRoam0378
     * @tc.number SUB_MOBILENETWORK_ROAM_0378
     * @tc.desc   input -62 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0378 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-62);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0378 end');
    })

    /**
     * @tc.name   testRoam0379
     * @tc.number SUB_MOBILENETWORK_ROAM_0379
     * @tc.desc   input -61 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0379 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-61);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0379 end');
    })

    /**
     * @tc.name   testRoam0380
     * @tc.number SUB_MOBILENETWORK_ROAM_0380
     * @tc.desc   input -60 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0380 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0380 end');
    })

    /**
     * @tc.name   testRoam0381
     * @tc.number SUB_MOBILENETWORK_ROAM_0381
     * @tc.desc   input -59 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0381 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-59);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0381 end');
    })

    /**
     * @tc.name   testRoam0382
     * @tc.number SUB_MOBILENETWORK_ROAM_0382
     * @tc.desc   input -58 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0382 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-58);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0382 end');
    })

    /**
     * @tc.name   testRoam0383
     * @tc.number SUB_MOBILENETWORK_ROAM_0383
     * @tc.desc   input -57 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0383 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-57);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0383 end');
    })

    /**
     * @tc.name   testRoam0384
     * @tc.number SUB_MOBILENETWORK_ROAM_0384
     * @tc.desc   input -56 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0384 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-56);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0384 end');
    })

    /**
     * @tc.name   testRoam0385
     * @tc.number SUB_MOBILENETWORK_ROAM_0385
     * @tc.desc   input -55 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0385 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-55);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0385 end');
    })

    /**
     * @tc.name   testRoam0386
     * @tc.number SUB_MOBILENETWORK_ROAM_0386
     * @tc.desc   input -54 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0386 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-54);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0386 end');
    })

    /**
     * @tc.name   testRoam0387
     * @tc.number SUB_MOBILENETWORK_ROAM_0387
     * @tc.desc   input -53 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0387 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-53);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0387 end');
    })

    /**
     * @tc.name   testRoam0388
     * @tc.number SUB_MOBILENETWORK_ROAM_0388
     * @tc.desc   input -52 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0388 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-52);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0388 end');
    })

    /**
     * @tc.name   testRoam0389
     * @tc.number SUB_MOBILENETWORK_ROAM_0389
     * @tc.desc   input -51 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0389 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0389 end');
    })

    /**
     * @tc.name   testRoam0390
     * @tc.number SUB_MOBILENETWORK_ROAM_0390
     * @tc.desc   input -50 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0390 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0390 end');
    })

    /**
     * @tc.name   testRoam0391
     * @tc.number SUB_MOBILENETWORK_ROAM_0391
     * @tc.desc   input -49 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0391 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0391 end');
    })

    /**
     * @tc.name   testRoam0392
     * @tc.number SUB_MOBILENETWORK_ROAM_0392
     * @tc.desc   input -48 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0392 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-48);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0392 end');
    })

    /**
     * @tc.name   testRoam0393
     * @tc.number SUB_MOBILENETWORK_ROAM_0393
     * @tc.desc   input -47 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0393 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-47);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0393 end');
    })

    /**
     * @tc.name   testRoam0394
     * @tc.number SUB_MOBILENETWORK_ROAM_0394
     * @tc.desc   input -46 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0394 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-46);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0394 end');
    })

    /**
     * @tc.name   testRoam0395
     * @tc.number SUB_MOBILENETWORK_ROAM_0395
     * @tc.desc   input -45 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0395 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-45);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0395 end');
    })

    /**
     * @tc.name   testRoam0396
     * @tc.number SUB_MOBILENETWORK_ROAM_0396
     * @tc.desc   input -44 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0396 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-44);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0396 end');
    })

    /**
     * @tc.name   testRoam0397
     * @tc.number SUB_MOBILENETWORK_ROAM_0397
     * @tc.desc   input -43 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0397 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-43);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0397 end');
    })

    /**
     * @tc.name   testRoam0398
     * @tc.number SUB_MOBILENETWORK_ROAM_0398
     * @tc.desc   input -42 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0398 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0398 end');
    })

    /**
     * @tc.name   testRoam0399
     * @tc.number SUB_MOBILENETWORK_ROAM_0399
     * @tc.desc   input -41 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0399 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-41);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0399 end');
    })

    /**
     * @tc.name   testRoam0400
     * @tc.number SUB_MOBILENETWORK_ROAM_0400
     * @tc.desc   input -40 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0400 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0400 end');
    })

    /**
     * @tc.name   testRoam0401
     * @tc.number SUB_MOBILENETWORK_ROAM_0401
     * @tc.desc   input -39 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0401 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-39);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0401 end');
    })

    /**
     * @tc.name   testRoam0402
     * @tc.number SUB_MOBILENETWORK_ROAM_0402
     * @tc.desc   input -38 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0402 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0402 end');
    })

    /**
     * @tc.name   testRoam0403
     * @tc.number SUB_MOBILENETWORK_ROAM_0403
     * @tc.desc   input -37 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0403 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-37);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0403 end');
    })

    /**
     * @tc.name   testRoam0404
     * @tc.number SUB_MOBILENETWORK_ROAM_0404
     * @tc.desc   input -36 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0404 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0404 end');
    })

    /**
     * @tc.name   testRoam0405
     * @tc.number SUB_MOBILENETWORK_ROAM_0405
     * @tc.desc   input -35 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0405 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-35);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0405 end');
    })

    /**
     * @tc.name   testRoam0406
     * @tc.number SUB_MOBILENETWORK_ROAM_0406
     * @tc.desc   input -34 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0406 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-34);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0406 end');
    })

    /**
     * @tc.name   testRoam0407
     * @tc.number SUB_MOBILENETWORK_ROAM_0407
     * @tc.desc   input -33 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0407 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-33);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0407 end');
    })

    /**
     * @tc.name   testRoam0408
     * @tc.number SUB_MOBILENETWORK_ROAM_0408
     * @tc.desc   input -32 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0408 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-32);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0408 end');
    })

    /**
     * @tc.name   testRoam0409
     * @tc.number SUB_MOBILENETWORK_ROAM_0409
     * @tc.desc   input -31 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0409 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-31);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0409 end');
    })

    /**
     * @tc.name   testRoam0410
     * @tc.number SUB_MOBILENETWORK_ROAM_0410
     * @tc.desc   input -30 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0410 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0410 end');
    })

    /**
     * @tc.name   testRoam0411
     * @tc.number SUB_MOBILENETWORK_ROAM_0411
     * @tc.desc   input -29 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0411 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0411 end');
    })

    /**
     * @tc.name   testRoam0412
     * @tc.number SUB_MOBILENETWORK_ROAM_0412
     * @tc.desc   input -28 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0412 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0412 end');
    })

    /**
     * @tc.name   testRoam0413
     * @tc.number SUB_MOBILENETWORK_ROAM_0413
     * @tc.desc   input -27 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0413 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-27);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0413 end');
    })

    /**
     * @tc.name   testRoam0414
     * @tc.number SUB_MOBILENETWORK_ROAM_0414
     * @tc.desc   input -26 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0414 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-26);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0414 end');
    })

    /**
     * @tc.name   testRoam0415
     * @tc.number SUB_MOBILENETWORK_ROAM_0415
     * @tc.desc   input -25 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0415 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0415 end');
    })

    /**
     * @tc.name   testRoam0416
     * @tc.number SUB_MOBILENETWORK_ROAM_0416
     * @tc.desc   input -24 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0416 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0416 end');
    })

    /**
     * @tc.name   testRoam0417
     * @tc.number SUB_MOBILENETWORK_ROAM_0417
     * @tc.desc   input -23 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0417 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0417 end');
    })

    /**
     * @tc.name   testRoam0418
     * @tc.number SUB_MOBILENETWORK_ROAM_0418
     * @tc.desc   input -22 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0418 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0418 end');
    })

    /**
     * @tc.name   testRoam0419
     * @tc.number SUB_MOBILENETWORK_ROAM_0419
     * @tc.desc   input -21 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0419 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0419 end');
    })

    /**
     * @tc.name   testRoam0420
     * @tc.number SUB_MOBILENETWORK_ROAM_0420
     * @tc.desc   input -20 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0420 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0420 end');
    })

    /**
     * @tc.name   testRoam0421
     * @tc.number SUB_MOBILENETWORK_ROAM_0421
     * @tc.desc   input -19 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0421 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0421 end');
    })

    /**
     * @tc.name   testRoam0422
     * @tc.number SUB_MOBILENETWORK_ROAM_0422
     * @tc.desc   input -18 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0422 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0422 end');
    })

    /**
     * @tc.name   testRoam0423
     * @tc.number SUB_MOBILENETWORK_ROAM_0423
     * @tc.desc   input -17 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0423 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0423 end');
    })

    /**
     * @tc.name   testRoam0424
     * @tc.number SUB_MOBILENETWORK_ROAM_0424
     * @tc.desc   input -16 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0424 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0424 end');
    })

    /**
     * @tc.name   testRoam0425
     * @tc.number SUB_MOBILENETWORK_ROAM_0425
     * @tc.desc   input -15 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0425 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0425 end');
    })

    /**
     * @tc.name   testRoam0426
     * @tc.number SUB_MOBILENETWORK_ROAM_0426
     * @tc.desc   input -14 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0426 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0426 end');
    })

    /**
     * @tc.name   testRoam0427
     * @tc.number SUB_MOBILENETWORK_ROAM_0427
     * @tc.desc   input -13 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0427 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0427 end');
    })

    /**
     * @tc.name   testRoam0428
     * @tc.number SUB_MOBILENETWORK_ROAM_0428
     * @tc.desc   input -12 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0428 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0428 end');
    })

    /**
     * @tc.name   testRoam0429
     * @tc.number SUB_MOBILENETWORK_ROAM_0429
     * @tc.desc   input -11 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0429 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0429 end');
    })

    /**
     * @tc.name   testRoam0430
     * @tc.number SUB_MOBILENETWORK_ROAM_0430
     * @tc.desc   input -10 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0430 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0430 end');
    })

    /**
     * @tc.name   testRoam0431
     * @tc.number SUB_MOBILENETWORK_ROAM_0431
     * @tc.desc   input -9 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0431 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0431 end');
    })

    /**
     * @tc.name   testRoam0432
     * @tc.number SUB_MOBILENETWORK_ROAM_0432
     * @tc.desc   input -8 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0432 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0432 end');
    })

    /**
     * @tc.name   testRoam0433
     * @tc.number SUB_MOBILENETWORK_ROAM_0433
     * @tc.desc   input -7 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0433 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0433 end');
    })

    /**
     * @tc.name   testRoam0434
     * @tc.number SUB_MOBILENETWORK_ROAM_0434
     * @tc.desc   input -6 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0434 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0434 end');
    })

    /**
     * @tc.name   testRoam0435
     * @tc.number SUB_MOBILENETWORK_ROAM_0435
     * @tc.desc   input -5 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0435 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0435 end');
    })

    /**
     * @tc.name   testRoam0436
     * @tc.number SUB_MOBILENETWORK_ROAM_0436
     * @tc.desc   input -4 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0436 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0436 end');
    })

    /**
     * @tc.name   testRoam0437
     * @tc.number SUB_MOBILENETWORK_ROAM_0437
     * @tc.desc   input -3 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0437 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0437 end');
    })

    /**
     * @tc.name   testRoam0438
     * @tc.number SUB_MOBILENETWORK_ROAM_0438
     * @tc.desc   input -2 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0438 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0438 end');
    })

    /**
     * @tc.name   testRoam0439
     * @tc.number SUB_MOBILENETWORK_ROAM_0439
     * @tc.desc   input -1 lies below the valid slot domain and maps to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRoam0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0439 begin');
      const sut: NetworkMobile = new NetworkMobile();
      const result: boolean = await sut.isCellularDataRoamingEnabled(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(typeof result), String('boolean'));
      expect(typeof result).assertEqual('boolean');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === true));
      expect(result === true).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRoam0439 end');
    })

  })
}
