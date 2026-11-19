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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NewsPageModel } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NewsPageModel.iconSize (58 cases). */
export default function newsPageModelIconSizeTest(): void {
  describe('NewsPageModelIconSizeTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0001
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0001
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPageModelIconSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0001 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(0);
      logInfo(`iconSize(loadImgHeight=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0002
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0002
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPageModelIconSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0002 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1);
      logInfo(`iconSize(loadImgHeight=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0003
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0003
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=360) yields 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPageModelIconSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0003 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(360);
      logInfo(`iconSize(loadImgHeight=360): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0004
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0004
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=359) yields 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPageModelIconSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0004 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(359);
      logInfo(`iconSize(loadImgHeight=359): actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0005
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0005
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=361) yields 361
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPageModelIconSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0005 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(361);
      logInfo(`iconSize(loadImgHeight=361): actual=${actual}`);
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0006
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0006
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=720) yields 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0006 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(720);
      logInfo(`iconSize(loadImgHeight=720): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0007
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0007
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=180) yields 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0007 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(180);
      logInfo(`iconSize(loadImgHeight=180): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0008
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0008
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPageModelIconSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0008 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2);
      logInfo(`iconSize(loadImgHeight=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0009
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0009
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPageModelIconSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0009 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3);
      logInfo(`iconSize(loadImgHeight=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0010
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0010
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsPageModelIconSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0010 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(-1);
      logInfo(`iconSize(loadImgHeight=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0011
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0011
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0011 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(100);
      logInfo(`iconSize(loadImgHeight=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0012
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0012
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1080) yields 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0012 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1080);
      logInfo(`iconSize(loadImgHeight=1080): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0013
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0013
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1920) yields 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0013 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1920);
      logInfo(`iconSize(loadImgHeight=1920): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0014
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0014
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0014 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(10);
      logInfo(`iconSize(loadImgHeight=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0015
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0015
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=96) yields 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0015 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(96);
      logInfo(`iconSize(loadImgHeight=96): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0016
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0016
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=192) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0016 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(192);
      logInfo(`iconSize(loadImgHeight=192): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0017
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0017
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=288) yields 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0017 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(288);
      logInfo(`iconSize(loadImgHeight=288): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0018
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0018
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=384) yields 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0018 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(384);
      logInfo(`iconSize(loadImgHeight=384): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0019
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0019
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=480) yields 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0019 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(480);
      logInfo(`iconSize(loadImgHeight=480): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0020
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0020
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=576) yields 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0020 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(576);
      logInfo(`iconSize(loadImgHeight=576): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0021
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0021
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=672) yields 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0021 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(672);
      logInfo(`iconSize(loadImgHeight=672): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0022
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0022
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=768) yields 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0022 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(768);
      logInfo(`iconSize(loadImgHeight=768): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0023
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0023
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=864) yields 864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0023 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(864);
      logInfo(`iconSize(loadImgHeight=864): actual=${actual}`);
      expect(actual).assertEqual(864);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0024
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0024
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=960) yields 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0024 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(960);
      logInfo(`iconSize(loadImgHeight=960): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0025
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0025
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1056) yields 1056
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0025 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1056);
      logInfo(`iconSize(loadImgHeight=1056): actual=${actual}`);
      expect(actual).assertEqual(1056);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0026
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0026
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1152) yields 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0026 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1152);
      logInfo(`iconSize(loadImgHeight=1152): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0027
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0027
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1248) yields 1248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0027 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1248);
      logInfo(`iconSize(loadImgHeight=1248): actual=${actual}`);
      expect(actual).assertEqual(1248);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0028
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0028
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1344) yields 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0028 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1344);
      logInfo(`iconSize(loadImgHeight=1344): actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0029
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0029
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1440) yields 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0029 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1440);
      logInfo(`iconSize(loadImgHeight=1440): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0030
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0030
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1536) yields 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0030 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1536);
      logInfo(`iconSize(loadImgHeight=1536): actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0031
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0031
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1632) yields 1632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0031 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1632);
      logInfo(`iconSize(loadImgHeight=1632): actual=${actual}`);
      expect(actual).assertEqual(1632);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0032
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0032
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1728) yields 1728
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0032 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1728);
      logInfo(`iconSize(loadImgHeight=1728): actual=${actual}`);
      expect(actual).assertEqual(1728);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0033
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0033
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=1824) yields 1824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0033 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(1824);
      logInfo(`iconSize(loadImgHeight=1824): actual=${actual}`);
      expect(actual).assertEqual(1824);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0034
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0034
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2016) yields 2016
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0034 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2016);
      logInfo(`iconSize(loadImgHeight=2016): actual=${actual}`);
      expect(actual).assertEqual(2016);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0035
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0035
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2112) yields 2112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0035 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2112);
      logInfo(`iconSize(loadImgHeight=2112): actual=${actual}`);
      expect(actual).assertEqual(2112);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0036
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0036
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2208) yields 2208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0036 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2208);
      logInfo(`iconSize(loadImgHeight=2208): actual=${actual}`);
      expect(actual).assertEqual(2208);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0037
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0037
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2304) yields 2304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0037 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2304);
      logInfo(`iconSize(loadImgHeight=2304): actual=${actual}`);
      expect(actual).assertEqual(2304);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0038
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0038
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2400) yields 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0038 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2400);
      logInfo(`iconSize(loadImgHeight=2400): actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0039
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0039
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2496) yields 2496
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0039 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2496);
      logInfo(`iconSize(loadImgHeight=2496): actual=${actual}`);
      expect(actual).assertEqual(2496);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0040
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0040
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2592) yields 2592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0040 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2592);
      logInfo(`iconSize(loadImgHeight=2592): actual=${actual}`);
      expect(actual).assertEqual(2592);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0041
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0041
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2688) yields 2688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0041 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2688);
      logInfo(`iconSize(loadImgHeight=2688): actual=${actual}`);
      expect(actual).assertEqual(2688);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0042
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0042
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2784) yields 2784
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0042 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2784);
      logInfo(`iconSize(loadImgHeight=2784): actual=${actual}`);
      expect(actual).assertEqual(2784);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0043
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0043
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2880) yields 2880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0043 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2880);
      logInfo(`iconSize(loadImgHeight=2880): actual=${actual}`);
      expect(actual).assertEqual(2880);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0044
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0044
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2976) yields 2976
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0044 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2976);
      logInfo(`iconSize(loadImgHeight=2976): actual=${actual}`);
      expect(actual).assertEqual(2976);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0045
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0045
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3072) yields 3072
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0045 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3072);
      logInfo(`iconSize(loadImgHeight=3072): actual=${actual}`);
      expect(actual).assertEqual(3072);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0046
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0046
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3168) yields 3168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0046 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3168);
      logInfo(`iconSize(loadImgHeight=3168): actual=${actual}`);
      expect(actual).assertEqual(3168);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0047
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0047
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3264) yields 3264
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0047 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3264);
      logInfo(`iconSize(loadImgHeight=3264): actual=${actual}`);
      expect(actual).assertEqual(3264);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0048
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0048
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3360) yields 3360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0048 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3360);
      logInfo(`iconSize(loadImgHeight=3360): actual=${actual}`);
      expect(actual).assertEqual(3360);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0049
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0049
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3456) yields 3456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0049 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3456);
      logInfo(`iconSize(loadImgHeight=3456): actual=${actual}`);
      expect(actual).assertEqual(3456);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0050
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0050
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3552) yields 3552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0050 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3552);
      logInfo(`iconSize(loadImgHeight=3552): actual=${actual}`);
      expect(actual).assertEqual(3552);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0051
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0051
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3648) yields 3648
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0051 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3648);
      logInfo(`iconSize(loadImgHeight=3648): actual=${actual}`);
      expect(actual).assertEqual(3648);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0052
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0052
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3744) yields 3744
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0052 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3744);
      logInfo(`iconSize(loadImgHeight=3744): actual=${actual}`);
      expect(actual).assertEqual(3744);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0053
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0053
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3840) yields 3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0053 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3840);
      logInfo(`iconSize(loadImgHeight=3840): actual=${actual}`);
      expect(actual).assertEqual(3840);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0054
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0054
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=271) yields 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0054 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(271);
      logInfo(`iconSize(loadImgHeight=271): actual=${actual}`);
      expect(actual).assertEqual(271);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0055
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0055
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=700.18) yields 700.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0055 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(700.18);
      logInfo(`iconSize(loadImgHeight=700.18): actual=${actual}`);
      expect(actual).assertClose(700.18, PRECISION);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0056
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0056
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=3565) yields 3565
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0056 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(3565);
      logInfo(`iconSize(loadImgHeight=3565): actual=${actual}`);
      expect(actual).assertEqual(3565);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0057
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0057
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=459) yields 459
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0057 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(459);
      logInfo(`iconSize(loadImgHeight=459): actual=${actual}`);
      expect(actual).assertEqual(459);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_ICON_SIZE_0058
     * @tc.name      PullToRefresh_NewsPageModelIconSize_0058
     * @tc.desc      NewsPageModel.iconSize(loadImgHeight=2145) yields 2145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsPageModelIconSize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsPageModelIconSize_0058 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.iconSize(2145);
      logInfo(`iconSize(loadImgHeight=2145): actual=${actual}`);
      expect(actual).assertEqual(2145);
      logInfo(`${BUNDLE}NewsPageModelIconSize_0058 end`);
    });
  });
}
