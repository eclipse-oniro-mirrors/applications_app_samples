/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { CommonConstants } from '../../../main/ets/common/CommonConstants';
import hilog from '@ohos.hilog';
const DOMAIN: number = 0xF811;
const TAG: string = 'Video01';


/**
 * Video Test Suite（视频显示链路真实用例）
 *
 * 被测逻辑：Index.ets 用真实屏幕宽度按 16:9 换算出 XComponent 的高度，解码后的视频帧
 * 通过 EGL 渲染到该 SURFACE 上。用例直接读取真实显示参数，并复用工程真实常量
 * （CommonConstants.DEFAULT_WIDTH / DEFAULT_HEIGHT / PX）参与计算，校验布局换算的边界，
 * 不使用写死的分辨率、刷新率等模拟值。
 */
export default function Video01Test() {
  describe('Video01Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: suite setup`);
    })

    /**
     * @tc.number    SUB_VIDEO_TEST01_0100
     * @tc.name      testVideo01Chapter0001
     * @tc.desc      Verify TC_Video_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testVideo01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0001 start');
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      console.info(`${TAG}: display ${defaultDisplay.width}x${defaultDisplay.height}, ` +
        `density ${defaultDisplay.densityPixels}`);
      expect(defaultDisplay.width).assertLarger(0);
      expect(defaultDisplay.height).assertLarger(0);
      expect(defaultDisplay.densityPixels).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0001 end');
    })

    /**
     * @tc.number    SUB_VIDEO_TEST01_0200
     * @tc.name      testVideo01Chapter0002
     * @tc.desc      Verify TC_Video_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testVideo01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0002 start');
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      const heightPx: string = (defaultDisplay.width * CommonConstants.DEFAULT_HEIGHT /
        CommonConstants.DEFAULT_WIDTH) + CommonConstants.PX;
      expect(heightPx.endsWith(CommonConstants.PX)).assertTrue();
      const heightValue: number = Number(heightPx.substring(0, heightPx.length - CommonConstants.PX.length));
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: XComponent height ${heightValue}px on screen height ${defaultDisplay.height}px`);
      expect(Number.isNaN(heightValue)).assertFalse();
      expect(heightValue).assertLarger(0);
      expect(heightValue).assertLessOrEqual(defaultDisplay.height);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0002 end');
    })

    /**
     * @tc.number    SUB_VIDEO_TEST01_0300
     * @tc.name      testVideo01Chapter0003
     * @tc.desc      Verify TC_Video_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testVideo01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0003 start');
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      expect(defaultDisplay.refreshRate).assertLarger(0);
      const frameIntervalMs: number = 1000 / defaultDisplay.refreshRate;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: refreshRate ${defaultDisplay.refreshRate}Hz, frame interval ${frameIntervalMs}ms`);
      expect(frameIntervalMs).assertLessOrEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0003 end');
    })

    /**
     * @tc.number    SUB_VIDEO_TEST01_0400
     * @tc.name      testVideo01Chapter0004
     * @tc.desc      Verify TC_Video_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testVideo01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0004 start');
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      expect(defaultDisplay.densityPixels).assertLarger(0);
      const widthInVp: number = defaultDisplay.width / defaultDisplay.densityPixels;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: screen width ${widthInVp}vp = ${defaultDisplay.width}px`);
      expect(widthInVp).assertLarger(0);
      expect(widthInVp * defaultDisplay.densityPixels).assertClose(defaultDisplay.width, 0.01);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0004 end');
    })

    /**
     * @tc.number    SUB_VIDEO_TEST01_0500
     * @tc.name      testVideo01Chapter0005
     * @tc.desc      Verify TC_Video_005
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testVideo01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0005 start');
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      const heightByConstant: number = defaultDisplay.width * CommonConstants.DEFAULT_HEIGHT /
        CommonConstants.DEFAULT_WIDTH;
      const heightByRatio: number = defaultDisplay.width * 9 / 16;
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: height by constant ${heightByConstant}px, height by 16:9 ${heightByRatio}px`);
      expect(heightByConstant).assertClose(heightByRatio, 0.01);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideo01Chapter0005 end');
    })
  })
}
