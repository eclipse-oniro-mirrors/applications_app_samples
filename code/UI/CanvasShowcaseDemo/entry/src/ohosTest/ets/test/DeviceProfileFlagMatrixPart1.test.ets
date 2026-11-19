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
import { delayTick } from './shared/AsyncYield';
import { DeviceUtil } from '../../../main/ets/model/utils/DeviceUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function DeviceProfileFlagMatrixPart1Test(): void {
  describe('DeviceProfileFlagMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0100
     * @tc.name      testFlagsExclusive0001
     * @tc.desc      Verify only one device-form flag is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlagsExclusive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagsExclusive0001 begin');
      await delayTick();
      const count: number = (DeviceUtil.isPhone() ? 1 : 0) + (DeviceUtil.isTablet() ? 1 : 0) + (DeviceUtil.is2in1() ? 1 : 0);
      expect(count <= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlagsExclusive0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0200
     * @tc.name      testWideScreenConsistency0002
     * @tc.desc      Verify wide-screen flag equals tablet or 2in1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWideScreenConsistency0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWideScreenConsistency0002 begin');
      await delayTick();
      expect(DeviceUtil.isWideScreen() === (DeviceUtil.isTablet() || DeviceUtil.is2in1())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWideScreenConsistency0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0300
     * @tc.name      testDeviceTypeNonEmpty0003
     * @tc.desc      Verify device type string is non-empty.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDeviceTypeNonEmpty0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceTypeNonEmpty0003 begin');
      await delayTick();
      expect(DeviceUtil.getDeviceType().length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeviceTypeNonEmpty0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0400
     * @tc.name      testOsNameNonEmpty0004
     * @tc.desc      Verify OS full name is non-empty.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOsNameNonEmpty0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOsNameNonEmpty0004 begin');
      await delayTick();
      expect(DeviceUtil.getOsFullName().length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOsNameNonEmpty0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0500
     * @tc.name      testProductModelNonEmpty0005
     * @tc.desc      Verify product model is non-empty.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductModelNonEmpty0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductModelNonEmpty0005 begin');
      await delayTick();
      expect(DeviceUtil.getProductModel().length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductModelNonEmpty0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0600
     * @tc.name      testMarketNameNonEmpty0006
     * @tc.desc      Verify market name is non-empty.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMarketNameNonEmpty0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMarketNameNonEmpty0006 begin');
      await delayTick();
      expect(DeviceUtil.getMarketName().length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMarketNameNonEmpty0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0700
     * @tc.name      testSdkPositive0007
     * @tc.desc      Verify SDK API version is non-negative.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSdkPositive0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSdkPositive0007 begin');
      await delayTick();
      expect(DeviceUtil.getSdkApiVersion() >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSdkPositive0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DPFP1_0800
     * @tc.name      testLogProfileNoThrow0008
     * @tc.desc      Verify logging the device profile does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLogProfileNoThrow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogProfileNoThrow0008 begin');
      await delayTick();
      let threw: boolean = false;
      try {
        DeviceUtil.logDeviceProfile();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLogProfileNoThrow0008 end');
    })

  })
}
