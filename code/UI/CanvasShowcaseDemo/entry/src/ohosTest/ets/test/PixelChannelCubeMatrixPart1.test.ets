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

export default function PixelChannelCubeMatrixPart1Test(): void {
  describe('PixelChannelCubeMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0100
     * @tc.name      testPackCube0001
     * @tc.desc      Verify rgba(3, 6, 9, 12).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0001 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(3, 6, 9, 12)).assertEqual(50727180);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0200
     * @tc.name      testPackCube0002
     * @tc.desc      Verify rgba(2, 4, 6, 8).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0002 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(2, 4, 6, 8)).assertEqual(33818120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0300
     * @tc.name      testPackCube0003
     * @tc.desc      Verify rgba(0, 0, 255, 64).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0003 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 0, 255, 64)).assertEqual(65344);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0400
     * @tc.name      testPackCube0004
     * @tc.desc      Verify rgba(255, 255, 255, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0004 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(255, 255, 255, 0)).assertEqual(4294967040);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0500
     * @tc.name      testPackCube0005
     * @tc.desc      Verify rgba(200, 100, 50, 25).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0005 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(200, 100, 50, 25)).assertEqual(3362009625);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0600
     * @tc.name      testPackCube0006
     * @tc.desc      Verify rgba(9, 18, 27, 36).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0006 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(9, 18, 27, 36)).assertEqual(152181540);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0700
     * @tc.name      testPackCube0007
     * @tc.desc      Verify rgba(255, 255, 0, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0007 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(255, 255, 0, 0)).assertEqual(4294901760);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0800
     * @tc.name      testPackCube0008
     * @tc.desc      Verify rgba(0, 255, 255, 255).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0008 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(0, 255, 255, 255)).assertEqual(16777215);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_0900
     * @tc.name      testPackCube0009
     * @tc.desc      Verify rgba(255, 0, 255, 128).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0009 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(255, 0, 255, 128)).assertEqual(4278255488);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_1000
     * @tc.name      testPackCube0010
     * @tc.desc      Verify rgba(16, 32, 64, 128).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0010 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(16, 32, 64, 128)).assertEqual(270549120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_1100
     * @tc.name      testPackCube0011
     * @tc.desc      Verify rgba(64, 32, 16, 8).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0011 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(64, 32, 16, 8)).assertEqual(1075843080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_PCCP1_1200
     * @tc.name      testPackCube0012
     * @tc.desc      Verify rgba(10, 20, 30, 40).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPackCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0012 begin');
      await delayTick();
      expect(PixelMapUtil.rgba(10, 20, 30, 40)).assertEqual(169090600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPackCube0012 end');
    })

  })
}
