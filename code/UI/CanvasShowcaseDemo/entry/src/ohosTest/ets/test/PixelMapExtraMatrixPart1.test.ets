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
import { PixelMapUtil } from '../../../main/ets/model/utils/PixelMapUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function PixelMapExtraMatrixPart1Test(): void {
  describe('PixelMapExtraMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0100
     * @tc.name      testRgba0001
     * @tc.desc      Verify PixelMapUtil.rgba with channel -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgba0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0001 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(-1, 0, 1, 2)).assertEqual(4278190338);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0200
     * @tc.name      testRgba0002
     * @tc.desc      Verify PixelMapUtil.rgba with channel 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgba0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0002 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 1, 2, 3)).assertEqual(66051);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0300
     * @tc.name      testRgba0003
     * @tc.desc      Verify PixelMapUtil.rgba with channel 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgba0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0003 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(1, 2, 3, 4)).assertEqual(16909060);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0400
     * @tc.name      testRgba0004
     * @tc.desc      Verify PixelMapUtil.rgba with channel 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgba0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0004 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(127, 128, 129, 130)).assertEqual(2139128194);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0500
     * @tc.name      testRgba0005
     * @tc.desc      Verify PixelMapUtil.rgba with channel 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgba0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0005 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(128, 129, 130, 131)).assertEqual(2155971203);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0600
     * @tc.name      testRgba0006
     * @tc.desc      Verify PixelMapUtil.rgba with channel 255.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgba0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0006 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(255, 256, 257, 258)).assertEqual(4278190338);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0700
     * @tc.name      testRgba0007
     * @tc.desc      Verify PixelMapUtil.rgba with channel 256.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgba0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0007 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(256, 257, 258, 259)).assertEqual(66051);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgba0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0800
     * @tc.name      testRgbaCombo0008
     * @tc.desc      Verify rgba(255, 0, 0, 255).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaCombo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0008 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(255, 0, 0, 255)).assertEqual(4278190335);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_0900
     * @tc.name      testRgbaCombo0009
     * @tc.desc      Verify rgba(0, 255, 0, 128).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaCombo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0009 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 255, 0, 128)).assertEqual(16711808);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_1000
     * @tc.name      testRgbaCombo0010
     * @tc.desc      Verify rgba(0, 0, 255, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaCombo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0010 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 0, 255, 0)).assertEqual(65280);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PEXP1_1100
     * @tc.name      testRgbaCombo0011
     * @tc.desc      Verify rgba(18, 52, 86, 120).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRgbaCombo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0011 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(18, 52, 86, 120)).assertEqual(305419896);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRgbaCombo0011 end');
    })

  })
}
