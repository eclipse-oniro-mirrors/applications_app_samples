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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import Constants from '../../../main/ets/common/Constants';
import { audio } from '@kit.AudioKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VideoConferenceDemo]';

export default function ConstantsContractPart1Test(): void {
  describe('ConstantsContractPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0100
     * @tc.name      testDomainValue0001
     * @tc.desc      Verify the log domain constant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDomainValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDomainValue0001 begin');
      expect(Constants.DOMAIN).assertEqual(0xFF00);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDomainValue0001 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0200
     * @tc.name      testSubWindowName0002
     * @tc.desc      Verify the sub-window name constant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSubWindowName0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSubWindowName0002 begin');
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSubWindowName0002 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0300
     * @tc.name      testSubWindowWidth0003
     * @tc.desc      Verify the sub-window width constant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSubWindowWidth0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSubWindowWidth0003 begin');
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSubWindowWidth0003 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0400
     * @tc.name      testSubWindowHeight0004
     * @tc.desc      Verify the sub-window height constant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSubWindowHeight0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSubWindowHeight0004 begin');
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSubWindowHeight0004 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0500
     * @tc.name      testRendererInfoDefined0005
     * @tc.desc      Verify the renderer info object exists.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererInfoDefined0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRendererInfoDefined0005 begin');
      expect(Constants.RENDERER_INFO !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRendererInfoDefined0005 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0600
     * @tc.name      testRendererUsage0006
     * @tc.desc      Verify the renderer uses the music stream usage.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsage0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRendererUsage0006 begin');
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRendererUsage0006 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0700
     * @tc.name      testRendererFlags0007
     * @tc.desc      Verify the renderer flags default to zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererFlags0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRendererFlags0007 begin');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRendererFlags0007 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0800
     * @tc.name      testDomainType0008
     * @tc.desc      Verify the domain is numeric.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDomainType0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDomainType0008 begin');
      expect(typeof Constants.DOMAIN).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDomainType0008 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_0900
     * @tc.name      testNameType0009
     * @tc.desc      Verify the sub-window name is a string.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameType0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNameType0009 begin');
      expect(typeof Constants.SUB_WINDOW_NAME).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNameType0009 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_1000
     * @tc.name      testWidthPositive0010
     * @tc.desc      Verify the sub-window width is positive.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWidthPositive0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthPositive0010 begin');
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthPositive0010 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_1100
     * @tc.name      testHeightPositive0011
     * @tc.desc      Verify the sub-window height is positive.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHeightPositive0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightPositive0011 begin');
      expect(Constants.SUB_WINDOW_HEIGHT > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightPositive0011 end');
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_CONSTP1_1200
     * @tc.name      testAspectRatio0012
     * @tc.desc      Verify the sub-window is taller than it is wide.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAspectRatio0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAspectRatio0012 begin');
      expect(Constants.SUB_WINDOW_HEIGHT > Constants.SUB_WINDOW_WIDTH).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAspectRatio0012 end');
    })

  })
}
