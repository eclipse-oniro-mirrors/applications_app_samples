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
import { MemoDataSource } from '../../../../main/ets/pages/DataSource';
import { MemoInfo } from '../../../../main/ets/pages/MemoInfo';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for MemoDataSource.getData (33 cases). */
export default function memoDataSourceGetData2Test(): void {
  describe('MemoDataSourceGetData2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0088
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0088
     * @tc.desc      MemoDataSource.getData(index=83) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0088 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(83);
      logInfo(`getData(index=83): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0089
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0089
     * @tc.desc      MemoDataSource.getData(index=191) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0089 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(191);
      logInfo(`getData(index=191): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0090
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0090
     * @tc.desc      MemoDataSource.getData(index=44.36) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0090 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(44.36);
      logInfo(`getData(index=44.36): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0091
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0091
     * @tc.desc      MemoDataSource.getData(index=108) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0091 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(108);
      logInfo(`getData(index=108): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0092
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0092
     * @tc.desc      MemoDataSource.getData(index=43.15) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0092 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(43.15);
      logInfo(`getData(index=43.15): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0093
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0093
     * @tc.desc      MemoDataSource.getData(index=37) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0093 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(37);
      logInfo(`getData(index=37): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0094
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0094
     * @tc.desc      MemoDataSource.getData(index=30.71) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0094 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(30.71);
      logInfo(`getData(index=30.71): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0095
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0095
     * @tc.desc      MemoDataSource.getData(index=44.15) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0095 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(44.15);
      logInfo(`getData(index=44.15): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0096
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0096
     * @tc.desc      MemoDataSource.getData(index=83.33) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0096 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(83.33);
      logInfo(`getData(index=83.33): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0096 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0097
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0097
     * @tc.desc      MemoDataSource.getData(index=91.14) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0097 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(91.14);
      logInfo(`getData(index=91.14): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0098
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0098
     * @tc.desc      MemoDataSource.getData(index=1.16) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0098 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(1.16);
      logInfo(`getData(index=1.16): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0099
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0099
     * @tc.desc      MemoDataSource.getData(index=-7) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0099 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-7);
      logInfo(`getData(index=-7): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0100
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0100
     * @tc.desc      MemoDataSource.getData(index=96) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0100 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(96);
      logInfo(`getData(index=96): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0101
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0101
     * @tc.desc      MemoDataSource.getData(index=91.41) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0101 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(91.41);
      logInfo(`getData(index=91.41): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0102
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0102
     * @tc.desc      MemoDataSource.getData(index=-3) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0102 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-3);
      logInfo(`getData(index=-3): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0103
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0103
     * @tc.desc      MemoDataSource.getData(index=19) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0103 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(19);
      logInfo(`getData(index=19): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0104
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0104
     * @tc.desc      MemoDataSource.getData(index=95.47) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0104 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(95.47);
      logInfo(`getData(index=95.47): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0105
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0105
     * @tc.desc      MemoDataSource.getData(index=38.15) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0105 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(38.15);
      logInfo(`getData(index=38.15): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0106
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0106
     * @tc.desc      MemoDataSource.getData(index=49) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0106 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(49);
      logInfo(`getData(index=49): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0107
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0107
     * @tc.desc      MemoDataSource.getData(index=32) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0107 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(32);
      logInfo(`getData(index=32): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0108
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0108
     * @tc.desc      MemoDataSource.getData(index=-82) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0108 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-82);
      logInfo(`getData(index=-82): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0109
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0109
     * @tc.desc      MemoDataSource.getData(index=27) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0109 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(27);
      logInfo(`getData(index=27): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0110
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0110
     * @tc.desc      MemoDataSource.getData(index=88) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0110 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(88);
      logInfo(`getData(index=88): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0111
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0111
     * @tc.desc      MemoDataSource.getData(index=22.82) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0111 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(22.82);
      logInfo(`getData(index=22.82): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0112
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0112
     * @tc.desc      MemoDataSource.getData(index=157) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0112 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(157);
      logInfo(`getData(index=157): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0113
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0113
     * @tc.desc      MemoDataSource.getData(index=-54) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0113 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-54);
      logInfo(`getData(index=-54): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0114
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0114
     * @tc.desc      MemoDataSource.getData(index=73.83) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0114 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(73.83);
      logInfo(`getData(index=73.83): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0115
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0115
     * @tc.desc      MemoDataSource.getData(index=61) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0115 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(61);
      logInfo(`getData(index=61): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0116
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0116
     * @tc.desc      MemoDataSource.getData(index=74) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0116 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(74);
      logInfo(`getData(index=74): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0117
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0117
     * @tc.desc      MemoDataSource.getData(index=66.51) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0117 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(66.51);
      logInfo(`getData(index=66.51): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0118
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0118
     * @tc.desc      MemoDataSource.getData(index=10.24) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0118 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(10.24);
      logInfo(`getData(index=10.24): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0119
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0119
     * @tc.desc      MemoDataSource.getData(index=99) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0119 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(99);
      logInfo(`getData(index=99): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0120
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0120
     * @tc.desc      MemoDataSource.getData(index=-46) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0120 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-46);
      logInfo(`getData(index=-46): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0120 end`);
    });
  });
}
