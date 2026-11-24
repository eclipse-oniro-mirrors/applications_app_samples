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
import { mockFileOfPage } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for mockFileOfPage (59 cases). */
export default function mockFileOfPageTest(): void {
  describe('MockFileOfPageTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0001
     * @tc.name      PullToRefresh_MockFileOfPage_0001
     * @tc.desc      mockFileOfPage(page=0) returns "mockDataOne.json"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_MockFileOfPage_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0001 begin`);
      const actual: string = mockFileOfPage(0);
      logInfo(`mockFileOfPage(page=0): actual=${actual}`);
      expect(actual).assertEqual('mockDataOne.json');
      logInfo(`${BUNDLE}MockFileOfPage_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0002
     * @tc.name      PullToRefresh_MockFileOfPage_0002
     * @tc.desc      mockFileOfPage(page=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_MockFileOfPage_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0002 begin`);
      const actual: string = mockFileOfPage(-1);
      logInfo(`mockFileOfPage(page=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0003
     * @tc.name      PullToRefresh_MockFileOfPage_0003
     * @tc.desc      mockFileOfPage(page=1) returns "mockDataTwo.json"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_MockFileOfPage_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0003 begin`);
      const actual: string = mockFileOfPage(1);
      logInfo(`mockFileOfPage(page=1): actual=${actual}`);
      expect(actual).assertEqual('mockDataTwo.json');
      logInfo(`${BUNDLE}MockFileOfPage_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0004
     * @tc.name      PullToRefresh_MockFileOfPage_0004
     * @tc.desc      mockFileOfPage(page=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_MockFileOfPage_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0004 begin`);
      const actual: string = mockFileOfPage(2);
      logInfo(`mockFileOfPage(page=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0005
     * @tc.name      PullToRefresh_MockFileOfPage_0005
     * @tc.desc      mockFileOfPage(page=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0005 begin`);
      const actual: string = mockFileOfPage(3);
      logInfo(`mockFileOfPage(page=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0006
     * @tc.name      PullToRefresh_MockFileOfPage_0006
     * @tc.desc      mockFileOfPage(page=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0006 begin`);
      const actual: string = mockFileOfPage(10);
      logInfo(`mockFileOfPage(page=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0007
     * @tc.name      PullToRefresh_MockFileOfPage_0007
     * @tc.desc      mockFileOfPage(page=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0007 begin`);
      const actual: string = mockFileOfPage(100);
      logInfo(`mockFileOfPage(page=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0008
     * @tc.name      PullToRefresh_MockFileOfPage_0008
     * @tc.desc      mockFileOfPage(page=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0008 begin`);
      const actual: string = mockFileOfPage(5);
      logInfo(`mockFileOfPage(page=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0009
     * @tc.name      PullToRefresh_MockFileOfPage_0009
     * @tc.desc      mockFileOfPage(page=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0009 begin`);
      const actual: string = mockFileOfPage(15);
      logInfo(`mockFileOfPage(page=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0010
     * @tc.name      PullToRefresh_MockFileOfPage_0010
     * @tc.desc      mockFileOfPage(page=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0010 begin`);
      const actual: string = mockFileOfPage(20);
      logInfo(`mockFileOfPage(page=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0011
     * @tc.name      PullToRefresh_MockFileOfPage_0011
     * @tc.desc      mockFileOfPage(page=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0011 begin`);
      const actual: string = mockFileOfPage(25);
      logInfo(`mockFileOfPage(page=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0012
     * @tc.name      PullToRefresh_MockFileOfPage_0012
     * @tc.desc      mockFileOfPage(page=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0012 begin`);
      const actual: string = mockFileOfPage(30);
      logInfo(`mockFileOfPage(page=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0013
     * @tc.name      PullToRefresh_MockFileOfPage_0013
     * @tc.desc      mockFileOfPage(page=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0013 begin`);
      const actual: string = mockFileOfPage(35);
      logInfo(`mockFileOfPage(page=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0014
     * @tc.name      PullToRefresh_MockFileOfPage_0014
     * @tc.desc      mockFileOfPage(page=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0014 begin`);
      const actual: string = mockFileOfPage(40);
      logInfo(`mockFileOfPage(page=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0015
     * @tc.name      PullToRefresh_MockFileOfPage_0015
     * @tc.desc      mockFileOfPage(page=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0015 begin`);
      const actual: string = mockFileOfPage(45);
      logInfo(`mockFileOfPage(page=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0016
     * @tc.name      PullToRefresh_MockFileOfPage_0016
     * @tc.desc      mockFileOfPage(page=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0016 begin`);
      const actual: string = mockFileOfPage(50);
      logInfo(`mockFileOfPage(page=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0017
     * @tc.name      PullToRefresh_MockFileOfPage_0017
     * @tc.desc      mockFileOfPage(page=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0017 begin`);
      const actual: string = mockFileOfPage(55);
      logInfo(`mockFileOfPage(page=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0018
     * @tc.name      PullToRefresh_MockFileOfPage_0018
     * @tc.desc      mockFileOfPage(page=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0018 begin`);
      const actual: string = mockFileOfPage(60);
      logInfo(`mockFileOfPage(page=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0019
     * @tc.name      PullToRefresh_MockFileOfPage_0019
     * @tc.desc      mockFileOfPage(page=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0019 begin`);
      const actual: string = mockFileOfPage(65);
      logInfo(`mockFileOfPage(page=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0020
     * @tc.name      PullToRefresh_MockFileOfPage_0020
     * @tc.desc      mockFileOfPage(page=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0020 begin`);
      const actual: string = mockFileOfPage(70);
      logInfo(`mockFileOfPage(page=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0021
     * @tc.name      PullToRefresh_MockFileOfPage_0021
     * @tc.desc      mockFileOfPage(page=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0021 begin`);
      const actual: string = mockFileOfPage(75);
      logInfo(`mockFileOfPage(page=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0022
     * @tc.name      PullToRefresh_MockFileOfPage_0022
     * @tc.desc      mockFileOfPage(page=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0022 begin`);
      const actual: string = mockFileOfPage(80);
      logInfo(`mockFileOfPage(page=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0023
     * @tc.name      PullToRefresh_MockFileOfPage_0023
     * @tc.desc      mockFileOfPage(page=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0023 begin`);
      const actual: string = mockFileOfPage(85);
      logInfo(`mockFileOfPage(page=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0024
     * @tc.name      PullToRefresh_MockFileOfPage_0024
     * @tc.desc      mockFileOfPage(page=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0024 begin`);
      const actual: string = mockFileOfPage(90);
      logInfo(`mockFileOfPage(page=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0025
     * @tc.name      PullToRefresh_MockFileOfPage_0025
     * @tc.desc      mockFileOfPage(page=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0025 begin`);
      const actual: string = mockFileOfPage(95);
      logInfo(`mockFileOfPage(page=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0026
     * @tc.name      PullToRefresh_MockFileOfPage_0026
     * @tc.desc      mockFileOfPage(page=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0026 begin`);
      const actual: string = mockFileOfPage(105);
      logInfo(`mockFileOfPage(page=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0027
     * @tc.name      PullToRefresh_MockFileOfPage_0027
     * @tc.desc      mockFileOfPage(page=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0027 begin`);
      const actual: string = mockFileOfPage(110);
      logInfo(`mockFileOfPage(page=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0028
     * @tc.name      PullToRefresh_MockFileOfPage_0028
     * @tc.desc      mockFileOfPage(page=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0028 begin`);
      const actual: string = mockFileOfPage(115);
      logInfo(`mockFileOfPage(page=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0029
     * @tc.name      PullToRefresh_MockFileOfPage_0029
     * @tc.desc      mockFileOfPage(page=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0029 begin`);
      const actual: string = mockFileOfPage(120);
      logInfo(`mockFileOfPage(page=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0030
     * @tc.name      PullToRefresh_MockFileOfPage_0030
     * @tc.desc      mockFileOfPage(page=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0030 begin`);
      const actual: string = mockFileOfPage(125);
      logInfo(`mockFileOfPage(page=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0031
     * @tc.name      PullToRefresh_MockFileOfPage_0031
     * @tc.desc      mockFileOfPage(page=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0031 begin`);
      const actual: string = mockFileOfPage(130);
      logInfo(`mockFileOfPage(page=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0032
     * @tc.name      PullToRefresh_MockFileOfPage_0032
     * @tc.desc      mockFileOfPage(page=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0032 begin`);
      const actual: string = mockFileOfPage(135);
      logInfo(`mockFileOfPage(page=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0033
     * @tc.name      PullToRefresh_MockFileOfPage_0033
     * @tc.desc      mockFileOfPage(page=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0033 begin`);
      const actual: string = mockFileOfPage(140);
      logInfo(`mockFileOfPage(page=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0034
     * @tc.name      PullToRefresh_MockFileOfPage_0034
     * @tc.desc      mockFileOfPage(page=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0034 begin`);
      const actual: string = mockFileOfPage(145);
      logInfo(`mockFileOfPage(page=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0035
     * @tc.name      PullToRefresh_MockFileOfPage_0035
     * @tc.desc      mockFileOfPage(page=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0035 begin`);
      const actual: string = mockFileOfPage(150);
      logInfo(`mockFileOfPage(page=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0036
     * @tc.name      PullToRefresh_MockFileOfPage_0036
     * @tc.desc      mockFileOfPage(page=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0036 begin`);
      const actual: string = mockFileOfPage(155);
      logInfo(`mockFileOfPage(page=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0037
     * @tc.name      PullToRefresh_MockFileOfPage_0037
     * @tc.desc      mockFileOfPage(page=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0037 begin`);
      const actual: string = mockFileOfPage(160);
      logInfo(`mockFileOfPage(page=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0038
     * @tc.name      PullToRefresh_MockFileOfPage_0038
     * @tc.desc      mockFileOfPage(page=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0038 begin`);
      const actual: string = mockFileOfPage(165);
      logInfo(`mockFileOfPage(page=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0039
     * @tc.name      PullToRefresh_MockFileOfPage_0039
     * @tc.desc      mockFileOfPage(page=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0039 begin`);
      const actual: string = mockFileOfPage(170);
      logInfo(`mockFileOfPage(page=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0040
     * @tc.name      PullToRefresh_MockFileOfPage_0040
     * @tc.desc      mockFileOfPage(page=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0040 begin`);
      const actual: string = mockFileOfPage(175);
      logInfo(`mockFileOfPage(page=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0041
     * @tc.name      PullToRefresh_MockFileOfPage_0041
     * @tc.desc      mockFileOfPage(page=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0041 begin`);
      const actual: string = mockFileOfPage(180);
      logInfo(`mockFileOfPage(page=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0042
     * @tc.name      PullToRefresh_MockFileOfPage_0042
     * @tc.desc      mockFileOfPage(page=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0042 begin`);
      const actual: string = mockFileOfPage(185);
      logInfo(`mockFileOfPage(page=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0043
     * @tc.name      PullToRefresh_MockFileOfPage_0043
     * @tc.desc      mockFileOfPage(page=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0043 begin`);
      const actual: string = mockFileOfPage(190);
      logInfo(`mockFileOfPage(page=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0044
     * @tc.name      PullToRefresh_MockFileOfPage_0044
     * @tc.desc      mockFileOfPage(page=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0044 begin`);
      const actual: string = mockFileOfPage(195);
      logInfo(`mockFileOfPage(page=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0045
     * @tc.name      PullToRefresh_MockFileOfPage_0045
     * @tc.desc      mockFileOfPage(page=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0045 begin`);
      const actual: string = mockFileOfPage(200);
      logInfo(`mockFileOfPage(page=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0046
     * @tc.name      PullToRefresh_MockFileOfPage_0046
     * @tc.desc      mockFileOfPage(page=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_MockFileOfPage_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0046 begin`);
      const actual: string = mockFileOfPage(-52);
      logInfo(`mockFileOfPage(page=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0047
     * @tc.name      PullToRefresh_MockFileOfPage_0047
     * @tc.desc      mockFileOfPage(page=197) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0047 begin`);
      const actual: string = mockFileOfPage(197);
      logInfo(`mockFileOfPage(page=197): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0048
     * @tc.name      PullToRefresh_MockFileOfPage_0048
     * @tc.desc      mockFileOfPage(page=-29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_MockFileOfPage_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0048 begin`);
      const actual: string = mockFileOfPage(-29);
      logInfo(`mockFileOfPage(page=-29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0049
     * @tc.name      PullToRefresh_MockFileOfPage_0049
     * @tc.desc      mockFileOfPage(page=101) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0049 begin`);
      const actual: string = mockFileOfPage(101);
      logInfo(`mockFileOfPage(page=101): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0050
     * @tc.name      PullToRefresh_MockFileOfPage_0050
     * @tc.desc      mockFileOfPage(page=124) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0050 begin`);
      const actual: string = mockFileOfPage(124);
      logInfo(`mockFileOfPage(page=124): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0051
     * @tc.name      PullToRefresh_MockFileOfPage_0051
     * @tc.desc      mockFileOfPage(page=44) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0051 begin`);
      const actual: string = mockFileOfPage(44);
      logInfo(`mockFileOfPage(page=44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0052
     * @tc.name      PullToRefresh_MockFileOfPage_0052
     * @tc.desc      mockFileOfPage(page=52.22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0052 begin`);
      const actual: string = mockFileOfPage(52.22);
      logInfo(`mockFileOfPage(page=52.22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0053
     * @tc.name      PullToRefresh_MockFileOfPage_0053
     * @tc.desc      mockFileOfPage(page=89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0053 begin`);
      const actual: string = mockFileOfPage(89);
      logInfo(`mockFileOfPage(page=89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0054
     * @tc.name      PullToRefresh_MockFileOfPage_0054
     * @tc.desc      mockFileOfPage(page=123) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0054 begin`);
      const actual: string = mockFileOfPage(123);
      logInfo(`mockFileOfPage(page=123): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0055
     * @tc.name      PullToRefresh_MockFileOfPage_0055
     * @tc.desc      mockFileOfPage(page=199) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0055 begin`);
      const actual: string = mockFileOfPage(199);
      logInfo(`mockFileOfPage(page=199): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0056
     * @tc.name      PullToRefresh_MockFileOfPage_0056
     * @tc.desc      mockFileOfPage(page=-93) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_MockFileOfPage_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0056 begin`);
      const actual: string = mockFileOfPage(-93);
      logInfo(`mockFileOfPage(page=-93): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0057
     * @tc.name      PullToRefresh_MockFileOfPage_0057
     * @tc.desc      mockFileOfPage(page=54.75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0057 begin`);
      const actual: string = mockFileOfPage(54.75);
      logInfo(`mockFileOfPage(page=54.75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0058
     * @tc.name      PullToRefresh_MockFileOfPage_0058
     * @tc.desc      mockFileOfPage(page=12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0058 begin`);
      const actual: string = mockFileOfPage(12);
      logInfo(`mockFileOfPage(page=12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_MOCK_FILE_OF_PAGE_0059
     * @tc.name      PullToRefresh_MockFileOfPage_0059
     * @tc.desc      mockFileOfPage(page=52.44) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_MockFileOfPage_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MockFileOfPage_0059 begin`);
      const actual: string = mockFileOfPage(52.44);
      logInfo(`mockFileOfPage(page=52.44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}MockFileOfPage_0059 end`);
    });
  });
}
