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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { itemTitleOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for itemTitleOf (24 cases). */
export default function itemTitleOf2Test(): void {
  describe('ItemTitleOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0097
     * @tc.name      FilePreviewDLP_ItemTitleOf_0097
     * @tc.desc      itemTitleOf(index=22) returns "Text23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0097 begin`);
      const actual: string = itemTitleOf(22);
      logInfo(`itemTitleOf(index=22): actual=${actual}`);
      expect(actual).assertEqual('Text23');
      logInfo(`${BUNDLE}ItemTitleOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0098
     * @tc.name      FilePreviewDLP_ItemTitleOf_0098
     * @tc.desc      itemTitleOf(index=-89) returns "Text-88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0098 begin`);
      const actual: string = itemTitleOf(-89);
      logInfo(`itemTitleOf(index=-89): actual=${actual}`);
      expect(actual).assertEqual('Text-88');
      logInfo(`${BUNDLE}ItemTitleOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0099
     * @tc.name      FilePreviewDLP_ItemTitleOf_0099
     * @tc.desc      itemTitleOf(index=141) returns "Text142"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0099 begin`);
      const actual: string = itemTitleOf(141);
      logInfo(`itemTitleOf(index=141): actual=${actual}`);
      expect(actual).assertEqual('Text142');
      logInfo(`${BUNDLE}ItemTitleOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0100
     * @tc.name      FilePreviewDLP_ItemTitleOf_0100
     * @tc.desc      itemTitleOf(index=56) returns "Text57"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0100 begin`);
      const actual: string = itemTitleOf(56);
      logInfo(`itemTitleOf(index=56): actual=${actual}`);
      expect(actual).assertEqual('Text57');
      logInfo(`${BUNDLE}ItemTitleOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0101
     * @tc.name      FilePreviewDLP_ItemTitleOf_0101
     * @tc.desc      itemTitleOf(index=193) returns "Text194"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0101 begin`);
      const actual: string = itemTitleOf(193);
      logInfo(`itemTitleOf(index=193): actual=${actual}`);
      expect(actual).assertEqual('Text194');
      logInfo(`${BUNDLE}ItemTitleOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0102
     * @tc.name      FilePreviewDLP_ItemTitleOf_0102
     * @tc.desc      itemTitleOf(index=-65) returns "Text-64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0102 begin`);
      const actual: string = itemTitleOf(-65);
      logInfo(`itemTitleOf(index=-65): actual=${actual}`);
      expect(actual).assertEqual('Text-64');
      logInfo(`${BUNDLE}ItemTitleOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0103
     * @tc.name      FilePreviewDLP_ItemTitleOf_0103
     * @tc.desc      itemTitleOf(index=128) returns "Text129"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0103 begin`);
      const actual: string = itemTitleOf(128);
      logInfo(`itemTitleOf(index=128): actual=${actual}`);
      expect(actual).assertEqual('Text129');
      logInfo(`${BUNDLE}ItemTitleOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0104
     * @tc.name      FilePreviewDLP_ItemTitleOf_0104
     * @tc.desc      itemTitleOf(index=-94) returns "Text-93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0104 begin`);
      const actual: string = itemTitleOf(-94);
      logInfo(`itemTitleOf(index=-94): actual=${actual}`);
      expect(actual).assertEqual('Text-93');
      logInfo(`${BUNDLE}ItemTitleOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0105
     * @tc.name      FilePreviewDLP_ItemTitleOf_0105
     * @tc.desc      itemTitleOf(index=71.6) returns "Text72.6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0105 begin`);
      const actual: string = itemTitleOf(71.6);
      logInfo(`itemTitleOf(index=71.6): actual=${actual}`);
      expect(actual).assertEqual('Text72.6');
      logInfo(`${BUNDLE}ItemTitleOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0106
     * @tc.name      FilePreviewDLP_ItemTitleOf_0106
     * @tc.desc      itemTitleOf(index=178) returns "Text179"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0106 begin`);
      const actual: string = itemTitleOf(178);
      logInfo(`itemTitleOf(index=178): actual=${actual}`);
      expect(actual).assertEqual('Text179');
      logInfo(`${BUNDLE}ItemTitleOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0107
     * @tc.name      FilePreviewDLP_ItemTitleOf_0107
     * @tc.desc      itemTitleOf(index=27.05) returns "Text28.05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0107 begin`);
      const actual: string = itemTitleOf(27.05);
      logInfo(`itemTitleOf(index=27.05): actual=${actual}`);
      expect(actual).assertEqual('Text28.05');
      logInfo(`${BUNDLE}ItemTitleOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0108
     * @tc.name      FilePreviewDLP_ItemTitleOf_0108
     * @tc.desc      itemTitleOf(index=159) returns "Text160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0108 begin`);
      const actual: string = itemTitleOf(159);
      logInfo(`itemTitleOf(index=159): actual=${actual}`);
      expect(actual).assertEqual('Text160');
      logInfo(`${BUNDLE}ItemTitleOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0109
     * @tc.name      FilePreviewDLP_ItemTitleOf_0109
     * @tc.desc      itemTitleOf(index=73) returns "Text74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0109 begin`);
      const actual: string = itemTitleOf(73);
      logInfo(`itemTitleOf(index=73): actual=${actual}`);
      expect(actual).assertEqual('Text74');
      logInfo(`${BUNDLE}ItemTitleOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0110
     * @tc.name      FilePreviewDLP_ItemTitleOf_0110
     * @tc.desc      itemTitleOf(index=-17) returns "Text-16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0110 begin`);
      const actual: string = itemTitleOf(-17);
      logInfo(`itemTitleOf(index=-17): actual=${actual}`);
      expect(actual).assertEqual('Text-16');
      logInfo(`${BUNDLE}ItemTitleOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0111
     * @tc.name      FilePreviewDLP_ItemTitleOf_0111
     * @tc.desc      itemTitleOf(index=37.92) returns "Text38.92"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0111 begin`);
      const actual: string = itemTitleOf(37.92);
      logInfo(`itemTitleOf(index=37.92): actual=${actual}`);
      expect(actual).assertEqual('Text38.92');
      logInfo(`${BUNDLE}ItemTitleOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0112
     * @tc.name      FilePreviewDLP_ItemTitleOf_0112
     * @tc.desc      itemTitleOf(index=129) returns "Text130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0112 begin`);
      const actual: string = itemTitleOf(129);
      logInfo(`itemTitleOf(index=129): actual=${actual}`);
      expect(actual).assertEqual('Text130');
      logInfo(`${BUNDLE}ItemTitleOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0113
     * @tc.name      FilePreviewDLP_ItemTitleOf_0113
     * @tc.desc      itemTitleOf(index=-20) returns "Text-19"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0113 begin`);
      const actual: string = itemTitleOf(-20);
      logInfo(`itemTitleOf(index=-20): actual=${actual}`);
      expect(actual).assertEqual('Text-19');
      logInfo(`${BUNDLE}ItemTitleOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0114
     * @tc.name      FilePreviewDLP_ItemTitleOf_0114
     * @tc.desc      itemTitleOf(index=16.91) returns "Text17.91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0114 begin`);
      const actual: string = itemTitleOf(16.91);
      logInfo(`itemTitleOf(index=16.91): actual=${actual}`);
      expect(actual).assertEqual('Text17.91');
      logInfo(`${BUNDLE}ItemTitleOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0115
     * @tc.name      FilePreviewDLP_ItemTitleOf_0115
     * @tc.desc      itemTitleOf(index=38.89) returns "Text39.89"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0115 begin`);
      const actual: string = itemTitleOf(38.89);
      logInfo(`itemTitleOf(index=38.89): actual=${actual}`);
      expect(actual).assertEqual('Text39.89');
      logInfo(`${BUNDLE}ItemTitleOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0116
     * @tc.name      FilePreviewDLP_ItemTitleOf_0116
     * @tc.desc      itemTitleOf(index=-34) returns "Text-33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0116 begin`);
      const actual: string = itemTitleOf(-34);
      logInfo(`itemTitleOf(index=-34): actual=${actual}`);
      expect(actual).assertEqual('Text-33');
      logInfo(`${BUNDLE}ItemTitleOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0117
     * @tc.name      FilePreviewDLP_ItemTitleOf_0117
     * @tc.desc      itemTitleOf(index=4.06) returns "Text5.06"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0117 begin`);
      const actual: string = itemTitleOf(4.06);
      logInfo(`itemTitleOf(index=4.06): actual=${actual}`);
      expect(actual).assertEqual('Text5.06');
      logInfo(`${BUNDLE}ItemTitleOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0118
     * @tc.name      FilePreviewDLP_ItemTitleOf_0118
     * @tc.desc      itemTitleOf(index=25.39) returns "Text26.39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0118 begin`);
      const actual: string = itemTitleOf(25.39);
      logInfo(`itemTitleOf(index=25.39): actual=${actual}`);
      expect(actual).assertEqual('Text26.39');
      logInfo(`${BUNDLE}ItemTitleOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0119
     * @tc.name      FilePreviewDLP_ItemTitleOf_0119
     * @tc.desc      itemTitleOf(index=8.56) returns "Text9.56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0119 begin`);
      const actual: string = itemTitleOf(8.56);
      logInfo(`itemTitleOf(index=8.56): actual=${actual}`);
      expect(actual).assertEqual('Text9.56');
      logInfo(`${BUNDLE}ItemTitleOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0120
     * @tc.name      FilePreviewDLP_ItemTitleOf_0120
     * @tc.desc      itemTitleOf(index=-10) returns "Text-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0120 begin`);
      const actual: string = itemTitleOf(-10);
      logInfo(`itemTitleOf(index=-10): actual=${actual}`);
      expect(actual).assertEqual('Text-9');
      logInfo(`${BUNDLE}ItemTitleOf_0120 end`);
    });
  });
}
