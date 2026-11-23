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
import { footerIconSize } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for footerIconSize (59 cases). */
export default function footerIconSizeTest(): void {
  describe('FooterIconSizeTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0001
     * @tc.name      PullToRefresh_FooterIconSize_0001
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_FooterIconSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FooterIconSize_0001 begin`);
      const actual: number = footerIconSize(0, true, 0);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FooterIconSize_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0002
     * @tc.name      PullToRefresh_FooterIconSize_0002
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_FooterIconSize_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FooterIconSize_0002 begin`);
      const actual: number = footerIconSize(0, true, 1);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FooterIconSize_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0003
     * @tc.name      PullToRefresh_FooterIconSize_0003
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0003 begin`);
      const actual: number = footerIconSize(0, true, -1);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FooterIconSize_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0004
     * @tc.name      PullToRefresh_FooterIconSize_0004
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0004 begin`);
      const actual: number = footerIconSize(0, true, 100);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}FooterIconSize_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0005
     * @tc.name      PullToRefresh_FooterIconSize_0005
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=360) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0005 begin`);
      const actual: number = footerIconSize(0, true, 360);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}FooterIconSize_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0006
     * @tc.name      PullToRefresh_FooterIconSize_0006
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=720) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0006 begin`);
      const actual: number = footerIconSize(0, true, 720);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}FooterIconSize_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0007
     * @tc.name      PullToRefresh_FooterIconSize_0007
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=1080) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0007 begin`);
      const actual: number = footerIconSize(0, true, 1080);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}FooterIconSize_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0008
     * @tc.name      PullToRefresh_FooterIconSize_0008
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=1920) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0008 begin`);
      const actual: number = footerIconSize(0, true, 1920);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}FooterIconSize_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0009
     * @tc.name      PullToRefresh_FooterIconSize_0009
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0009 begin`);
      const actual: number = footerIconSize(0, true, 2);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FooterIconSize_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0010
     * @tc.name      PullToRefresh_FooterIconSize_0010
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0010 begin`);
      const actual: number = footerIconSize(0, true, 3);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FooterIconSize_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0011
     * @tc.name      PullToRefresh_FooterIconSize_0011
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0011 begin`);
      const actual: number = footerIconSize(0, true, 10);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}FooterIconSize_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0012
     * @tc.name      PullToRefresh_FooterIconSize_0012
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=true, loadImgHeight=96) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0012 begin`);
      const actual: number = footerIconSize(0, true, 96);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}FooterIconSize_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0013
     * @tc.name      PullToRefresh_FooterIconSize_0013
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0013 begin`);
      const actual: number = footerIconSize(0, false, 0);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FooterIconSize_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0014
     * @tc.name      PullToRefresh_FooterIconSize_0014
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0014 begin`);
      const actual: number = footerIconSize(0, false, 1);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FooterIconSize_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0015
     * @tc.name      PullToRefresh_FooterIconSize_0015
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0015 begin`);
      const actual: number = footerIconSize(0, false, -1);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FooterIconSize_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0016
     * @tc.name      PullToRefresh_FooterIconSize_0016
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0016 begin`);
      const actual: number = footerIconSize(0, false, 100);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}FooterIconSize_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0017
     * @tc.name      PullToRefresh_FooterIconSize_0017
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=360) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0017 begin`);
      const actual: number = footerIconSize(0, false, 360);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}FooterIconSize_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0018
     * @tc.name      PullToRefresh_FooterIconSize_0018
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=720) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0018 begin`);
      const actual: number = footerIconSize(0, false, 720);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}FooterIconSize_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0019
     * @tc.name      PullToRefresh_FooterIconSize_0019
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=1080) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0019 begin`);
      const actual: number = footerIconSize(0, false, 1080);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}FooterIconSize_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0020
     * @tc.name      PullToRefresh_FooterIconSize_0020
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=1920) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0020 begin`);
      const actual: number = footerIconSize(0, false, 1920);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}FooterIconSize_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0021
     * @tc.name      PullToRefresh_FooterIconSize_0021
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0021 begin`);
      const actual: number = footerIconSize(0, false, 2);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FooterIconSize_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0022
     * @tc.name      PullToRefresh_FooterIconSize_0022
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0022 begin`);
      const actual: number = footerIconSize(0, false, 3);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FooterIconSize_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0023
     * @tc.name      PullToRefresh_FooterIconSize_0023
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0023 begin`);
      const actual: number = footerIconSize(0, false, 10);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}FooterIconSize_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0024
     * @tc.name      PullToRefresh_FooterIconSize_0024
     * @tc.desc      footerIconSize(newsDataListIndex=0, isLoading=false, loadImgHeight=96) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0024 begin`);
      const actual: number = footerIconSize(0, false, 96);
      logInfo(`footerIconSize(newsDataListIndex=0, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}FooterIconSize_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0025
     * @tc.name      PullToRefresh_FooterIconSize_0025
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0025 begin`);
      const actual: number = footerIconSize(1, true, 0);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FooterIconSize_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0026
     * @tc.name      PullToRefresh_FooterIconSize_0026
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0026 begin`);
      const actual: number = footerIconSize(1, true, 1);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FooterIconSize_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0027
     * @tc.name      PullToRefresh_FooterIconSize_0027
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0027 begin`);
      const actual: number = footerIconSize(1, true, -1);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FooterIconSize_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0028
     * @tc.name      PullToRefresh_FooterIconSize_0028
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0028 begin`);
      const actual: number = footerIconSize(1, true, 100);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}FooterIconSize_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0029
     * @tc.name      PullToRefresh_FooterIconSize_0029
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=360) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0029 begin`);
      const actual: number = footerIconSize(1, true, 360);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}FooterIconSize_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0030
     * @tc.name      PullToRefresh_FooterIconSize_0030
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=720) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0030 begin`);
      const actual: number = footerIconSize(1, true, 720);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}FooterIconSize_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0031
     * @tc.name      PullToRefresh_FooterIconSize_0031
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=1080) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0031 begin`);
      const actual: number = footerIconSize(1, true, 1080);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}FooterIconSize_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0032
     * @tc.name      PullToRefresh_FooterIconSize_0032
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=1920) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0032 begin`);
      const actual: number = footerIconSize(1, true, 1920);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}FooterIconSize_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0033
     * @tc.name      PullToRefresh_FooterIconSize_0033
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0033 begin`);
      const actual: number = footerIconSize(1, true, 2);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FooterIconSize_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0034
     * @tc.name      PullToRefresh_FooterIconSize_0034
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0034 begin`);
      const actual: number = footerIconSize(1, true, 3);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FooterIconSize_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0035
     * @tc.name      PullToRefresh_FooterIconSize_0035
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0035 begin`);
      const actual: number = footerIconSize(1, true, 10);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}FooterIconSize_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0036
     * @tc.name      PullToRefresh_FooterIconSize_0036
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=true, loadImgHeight=96) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0036 begin`);
      const actual: number = footerIconSize(1, true, 96);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}FooterIconSize_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0037
     * @tc.name      PullToRefresh_FooterIconSize_0037
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0037 begin`);
      const actual: number = footerIconSize(1, false, 0);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FooterIconSize_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0038
     * @tc.name      PullToRefresh_FooterIconSize_0038
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0038 begin`);
      const actual: number = footerIconSize(1, false, 1);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FooterIconSize_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0039
     * @tc.name      PullToRefresh_FooterIconSize_0039
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0039 begin`);
      const actual: number = footerIconSize(1, false, -1);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FooterIconSize_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0040
     * @tc.name      PullToRefresh_FooterIconSize_0040
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0040 begin`);
      const actual: number = footerIconSize(1, false, 100);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}FooterIconSize_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0041
     * @tc.name      PullToRefresh_FooterIconSize_0041
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=360) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0041 begin`);
      const actual: number = footerIconSize(1, false, 360);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}FooterIconSize_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0042
     * @tc.name      PullToRefresh_FooterIconSize_0042
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=720) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0042 begin`);
      const actual: number = footerIconSize(1, false, 720);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}FooterIconSize_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0043
     * @tc.name      PullToRefresh_FooterIconSize_0043
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=1080) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0043 begin`);
      const actual: number = footerIconSize(1, false, 1080);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}FooterIconSize_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0044
     * @tc.name      PullToRefresh_FooterIconSize_0044
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=1920) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0044 begin`);
      const actual: number = footerIconSize(1, false, 1920);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}FooterIconSize_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0045
     * @tc.name      PullToRefresh_FooterIconSize_0045
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0045 begin`);
      const actual: number = footerIconSize(1, false, 2);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FooterIconSize_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0046
     * @tc.name      PullToRefresh_FooterIconSize_0046
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0046 begin`);
      const actual: number = footerIconSize(1, false, 3);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FooterIconSize_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0047
     * @tc.name      PullToRefresh_FooterIconSize_0047
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0047 begin`);
      const actual: number = footerIconSize(1, false, 10);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}FooterIconSize_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0048
     * @tc.name      PullToRefresh_FooterIconSize_0048
     * @tc.desc      footerIconSize(newsDataListIndex=1, isLoading=false, loadImgHeight=96) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_FooterIconSize_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FooterIconSize_0048 begin`);
      const actual: number = footerIconSize(1, false, 96);
      logInfo(`footerIconSize(newsDataListIndex=1, isLoa...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}FooterIconSize_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0049
     * @tc.name      PullToRefresh_FooterIconSize_0049
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0049 begin`);
      const actual: number = footerIconSize(-1, true, 0);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FooterIconSize_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0050
     * @tc.name      PullToRefresh_FooterIconSize_0050
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0050 begin`);
      const actual: number = footerIconSize(-1, true, 1);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FooterIconSize_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0051
     * @tc.name      PullToRefresh_FooterIconSize_0051
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0051 begin`);
      const actual: number = footerIconSize(-1, true, -1);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FooterIconSize_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0052
     * @tc.name      PullToRefresh_FooterIconSize_0052
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0052 begin`);
      const actual: number = footerIconSize(-1, true, 100);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}FooterIconSize_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0053
     * @tc.name      PullToRefresh_FooterIconSize_0053
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=360) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0053 begin`);
      const actual: number = footerIconSize(-1, true, 360);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}FooterIconSize_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0054
     * @tc.name      PullToRefresh_FooterIconSize_0054
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=720) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0054 begin`);
      const actual: number = footerIconSize(-1, true, 720);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}FooterIconSize_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0055
     * @tc.name      PullToRefresh_FooterIconSize_0055
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=1080) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0055 begin`);
      const actual: number = footerIconSize(-1, true, 1080);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}FooterIconSize_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0056
     * @tc.name      PullToRefresh_FooterIconSize_0056
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=1920) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0056 begin`);
      const actual: number = footerIconSize(-1, true, 1920);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}FooterIconSize_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0057
     * @tc.name      PullToRefresh_FooterIconSize_0057
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0057 begin`);
      const actual: number = footerIconSize(-1, true, 2);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FooterIconSize_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0058
     * @tc.name      PullToRefresh_FooterIconSize_0058
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0058 begin`);
      const actual: number = footerIconSize(-1, true, 3);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FooterIconSize_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_FOOTER_ICON_SIZE_0059
     * @tc.name      PullToRefresh_FooterIconSize_0059
     * @tc.desc      footerIconSize(newsDataListIndex=-1, isLoading=true, loadImgHeight=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_FooterIconSize_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}FooterIconSize_0059 begin`);
      const actual: number = footerIconSize(-1, true, 10);
      logInfo(`footerIconSize(newsDataListIndex=-1, isLo...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}FooterIconSize_0059 end`);
    });
  });
}
