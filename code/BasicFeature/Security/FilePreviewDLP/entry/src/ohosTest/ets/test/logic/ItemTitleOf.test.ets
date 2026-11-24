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

/** Logic checks for itemTitleOf (96 cases). */
export default function itemTitleOfTest(): void {
  describe('ItemTitleOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0001
     * @tc.name      FilePreviewDLP_ItemTitleOf_0001
     * @tc.desc      itemTitleOf(index=0) returns "Text1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ItemTitleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0001 begin`);
      const actual: string = itemTitleOf(0);
      logInfo(`itemTitleOf(index=0): actual=${actual}`);
      expect(actual).assertEqual('Text1');
      logInfo(`${BUNDLE}ItemTitleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0002
     * @tc.name      FilePreviewDLP_ItemTitleOf_0002
     * @tc.desc      itemTitleOf(index=1) returns "Text2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ItemTitleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0002 begin`);
      const actual: string = itemTitleOf(1);
      logInfo(`itemTitleOf(index=1): actual=${actual}`);
      expect(actual).assertEqual('Text2');
      logInfo(`${BUNDLE}ItemTitleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0003
     * @tc.name      FilePreviewDLP_ItemTitleOf_0003
     * @tc.desc      itemTitleOf(index=2) returns "Text3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FilePreviewDLP_ItemTitleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0003 begin`);
      const actual: string = itemTitleOf(2);
      logInfo(`itemTitleOf(index=2): actual=${actual}`);
      expect(actual).assertEqual('Text3');
      logInfo(`${BUNDLE}ItemTitleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0004
     * @tc.name      FilePreviewDLP_ItemTitleOf_0004
     * @tc.desc      itemTitleOf(index=-1) returns "Text0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0004 begin`);
      const actual: string = itemTitleOf(-1);
      logInfo(`itemTitleOf(index=-1): actual=${actual}`);
      expect(actual).assertEqual('Text0');
      logInfo(`${BUNDLE}ItemTitleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0005
     * @tc.name      FilePreviewDLP_ItemTitleOf_0005
     * @tc.desc      itemTitleOf(index=5) returns "Text6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0005 begin`);
      const actual: string = itemTitleOf(5);
      logInfo(`itemTitleOf(index=5): actual=${actual}`);
      expect(actual).assertEqual('Text6');
      logInfo(`${BUNDLE}ItemTitleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0006
     * @tc.name      FilePreviewDLP_ItemTitleOf_0006
     * @tc.desc      itemTitleOf(index=10) returns "Text11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0006 begin`);
      const actual: string = itemTitleOf(10);
      logInfo(`itemTitleOf(index=10): actual=${actual}`);
      expect(actual).assertEqual('Text11');
      logInfo(`${BUNDLE}ItemTitleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0007
     * @tc.name      FilePreviewDLP_ItemTitleOf_0007
     * @tc.desc      itemTitleOf(index=3) returns "Text4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0007 begin`);
      const actual: string = itemTitleOf(3);
      logInfo(`itemTitleOf(index=3): actual=${actual}`);
      expect(actual).assertEqual('Text4');
      logInfo(`${BUNDLE}ItemTitleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0008
     * @tc.name      FilePreviewDLP_ItemTitleOf_0008
     * @tc.desc      itemTitleOf(index=100) returns "Text101"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0008 begin`);
      const actual: string = itemTitleOf(100);
      logInfo(`itemTitleOf(index=100): actual=${actual}`);
      expect(actual).assertEqual('Text101');
      logInfo(`${BUNDLE}ItemTitleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0009
     * @tc.name      FilePreviewDLP_ItemTitleOf_0009
     * @tc.desc      itemTitleOf(index=15) returns "Text16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0009 begin`);
      const actual: string = itemTitleOf(15);
      logInfo(`itemTitleOf(index=15): actual=${actual}`);
      expect(actual).assertEqual('Text16');
      logInfo(`${BUNDLE}ItemTitleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0010
     * @tc.name      FilePreviewDLP_ItemTitleOf_0010
     * @tc.desc      itemTitleOf(index=20) returns "Text21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0010 begin`);
      const actual: string = itemTitleOf(20);
      logInfo(`itemTitleOf(index=20): actual=${actual}`);
      expect(actual).assertEqual('Text21');
      logInfo(`${BUNDLE}ItemTitleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0011
     * @tc.name      FilePreviewDLP_ItemTitleOf_0011
     * @tc.desc      itemTitleOf(index=25) returns "Text26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0011 begin`);
      const actual: string = itemTitleOf(25);
      logInfo(`itemTitleOf(index=25): actual=${actual}`);
      expect(actual).assertEqual('Text26');
      logInfo(`${BUNDLE}ItemTitleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0012
     * @tc.name      FilePreviewDLP_ItemTitleOf_0012
     * @tc.desc      itemTitleOf(index=30) returns "Text31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0012 begin`);
      const actual: string = itemTitleOf(30);
      logInfo(`itemTitleOf(index=30): actual=${actual}`);
      expect(actual).assertEqual('Text31');
      logInfo(`${BUNDLE}ItemTitleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0013
     * @tc.name      FilePreviewDLP_ItemTitleOf_0013
     * @tc.desc      itemTitleOf(index=35) returns "Text36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0013 begin`);
      const actual: string = itemTitleOf(35);
      logInfo(`itemTitleOf(index=35): actual=${actual}`);
      expect(actual).assertEqual('Text36');
      logInfo(`${BUNDLE}ItemTitleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0014
     * @tc.name      FilePreviewDLP_ItemTitleOf_0014
     * @tc.desc      itemTitleOf(index=40) returns "Text41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0014 begin`);
      const actual: string = itemTitleOf(40);
      logInfo(`itemTitleOf(index=40): actual=${actual}`);
      expect(actual).assertEqual('Text41');
      logInfo(`${BUNDLE}ItemTitleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0015
     * @tc.name      FilePreviewDLP_ItemTitleOf_0015
     * @tc.desc      itemTitleOf(index=45) returns "Text46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0015 begin`);
      const actual: string = itemTitleOf(45);
      logInfo(`itemTitleOf(index=45): actual=${actual}`);
      expect(actual).assertEqual('Text46');
      logInfo(`${BUNDLE}ItemTitleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0016
     * @tc.name      FilePreviewDLP_ItemTitleOf_0016
     * @tc.desc      itemTitleOf(index=50) returns "Text51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0016 begin`);
      const actual: string = itemTitleOf(50);
      logInfo(`itemTitleOf(index=50): actual=${actual}`);
      expect(actual).assertEqual('Text51');
      logInfo(`${BUNDLE}ItemTitleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0017
     * @tc.name      FilePreviewDLP_ItemTitleOf_0017
     * @tc.desc      itemTitleOf(index=55) returns "Text56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0017 begin`);
      const actual: string = itemTitleOf(55);
      logInfo(`itemTitleOf(index=55): actual=${actual}`);
      expect(actual).assertEqual('Text56');
      logInfo(`${BUNDLE}ItemTitleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0018
     * @tc.name      FilePreviewDLP_ItemTitleOf_0018
     * @tc.desc      itemTitleOf(index=60) returns "Text61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0018 begin`);
      const actual: string = itemTitleOf(60);
      logInfo(`itemTitleOf(index=60): actual=${actual}`);
      expect(actual).assertEqual('Text61');
      logInfo(`${BUNDLE}ItemTitleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0019
     * @tc.name      FilePreviewDLP_ItemTitleOf_0019
     * @tc.desc      itemTitleOf(index=65) returns "Text66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0019 begin`);
      const actual: string = itemTitleOf(65);
      logInfo(`itemTitleOf(index=65): actual=${actual}`);
      expect(actual).assertEqual('Text66');
      logInfo(`${BUNDLE}ItemTitleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0020
     * @tc.name      FilePreviewDLP_ItemTitleOf_0020
     * @tc.desc      itemTitleOf(index=70) returns "Text71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0020 begin`);
      const actual: string = itemTitleOf(70);
      logInfo(`itemTitleOf(index=70): actual=${actual}`);
      expect(actual).assertEqual('Text71');
      logInfo(`${BUNDLE}ItemTitleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0021
     * @tc.name      FilePreviewDLP_ItemTitleOf_0021
     * @tc.desc      itemTitleOf(index=75) returns "Text76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0021 begin`);
      const actual: string = itemTitleOf(75);
      logInfo(`itemTitleOf(index=75): actual=${actual}`);
      expect(actual).assertEqual('Text76');
      logInfo(`${BUNDLE}ItemTitleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0022
     * @tc.name      FilePreviewDLP_ItemTitleOf_0022
     * @tc.desc      itemTitleOf(index=80) returns "Text81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0022 begin`);
      const actual: string = itemTitleOf(80);
      logInfo(`itemTitleOf(index=80): actual=${actual}`);
      expect(actual).assertEqual('Text81');
      logInfo(`${BUNDLE}ItemTitleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0023
     * @tc.name      FilePreviewDLP_ItemTitleOf_0023
     * @tc.desc      itemTitleOf(index=85) returns "Text86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0023 begin`);
      const actual: string = itemTitleOf(85);
      logInfo(`itemTitleOf(index=85): actual=${actual}`);
      expect(actual).assertEqual('Text86');
      logInfo(`${BUNDLE}ItemTitleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0024
     * @tc.name      FilePreviewDLP_ItemTitleOf_0024
     * @tc.desc      itemTitleOf(index=90) returns "Text91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0024 begin`);
      const actual: string = itemTitleOf(90);
      logInfo(`itemTitleOf(index=90): actual=${actual}`);
      expect(actual).assertEqual('Text91');
      logInfo(`${BUNDLE}ItemTitleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0025
     * @tc.name      FilePreviewDLP_ItemTitleOf_0025
     * @tc.desc      itemTitleOf(index=95) returns "Text96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0025 begin`);
      const actual: string = itemTitleOf(95);
      logInfo(`itemTitleOf(index=95): actual=${actual}`);
      expect(actual).assertEqual('Text96');
      logInfo(`${BUNDLE}ItemTitleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0026
     * @tc.name      FilePreviewDLP_ItemTitleOf_0026
     * @tc.desc      itemTitleOf(index=105) returns "Text106"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0026 begin`);
      const actual: string = itemTitleOf(105);
      logInfo(`itemTitleOf(index=105): actual=${actual}`);
      expect(actual).assertEqual('Text106');
      logInfo(`${BUNDLE}ItemTitleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0027
     * @tc.name      FilePreviewDLP_ItemTitleOf_0027
     * @tc.desc      itemTitleOf(index=110) returns "Text111"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0027 begin`);
      const actual: string = itemTitleOf(110);
      logInfo(`itemTitleOf(index=110): actual=${actual}`);
      expect(actual).assertEqual('Text111');
      logInfo(`${BUNDLE}ItemTitleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0028
     * @tc.name      FilePreviewDLP_ItemTitleOf_0028
     * @tc.desc      itemTitleOf(index=115) returns "Text116"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0028 begin`);
      const actual: string = itemTitleOf(115);
      logInfo(`itemTitleOf(index=115): actual=${actual}`);
      expect(actual).assertEqual('Text116');
      logInfo(`${BUNDLE}ItemTitleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0029
     * @tc.name      FilePreviewDLP_ItemTitleOf_0029
     * @tc.desc      itemTitleOf(index=120) returns "Text121"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0029 begin`);
      const actual: string = itemTitleOf(120);
      logInfo(`itemTitleOf(index=120): actual=${actual}`);
      expect(actual).assertEqual('Text121');
      logInfo(`${BUNDLE}ItemTitleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0030
     * @tc.name      FilePreviewDLP_ItemTitleOf_0030
     * @tc.desc      itemTitleOf(index=125) returns "Text126"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0030 begin`);
      const actual: string = itemTitleOf(125);
      logInfo(`itemTitleOf(index=125): actual=${actual}`);
      expect(actual).assertEqual('Text126');
      logInfo(`${BUNDLE}ItemTitleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0031
     * @tc.name      FilePreviewDLP_ItemTitleOf_0031
     * @tc.desc      itemTitleOf(index=130) returns "Text131"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0031 begin`);
      const actual: string = itemTitleOf(130);
      logInfo(`itemTitleOf(index=130): actual=${actual}`);
      expect(actual).assertEqual('Text131');
      logInfo(`${BUNDLE}ItemTitleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0032
     * @tc.name      FilePreviewDLP_ItemTitleOf_0032
     * @tc.desc      itemTitleOf(index=135) returns "Text136"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0032 begin`);
      const actual: string = itemTitleOf(135);
      logInfo(`itemTitleOf(index=135): actual=${actual}`);
      expect(actual).assertEqual('Text136');
      logInfo(`${BUNDLE}ItemTitleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0033
     * @tc.name      FilePreviewDLP_ItemTitleOf_0033
     * @tc.desc      itemTitleOf(index=140) returns "Text141"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0033 begin`);
      const actual: string = itemTitleOf(140);
      logInfo(`itemTitleOf(index=140): actual=${actual}`);
      expect(actual).assertEqual('Text141');
      logInfo(`${BUNDLE}ItemTitleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0034
     * @tc.name      FilePreviewDLP_ItemTitleOf_0034
     * @tc.desc      itemTitleOf(index=145) returns "Text146"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0034 begin`);
      const actual: string = itemTitleOf(145);
      logInfo(`itemTitleOf(index=145): actual=${actual}`);
      expect(actual).assertEqual('Text146');
      logInfo(`${BUNDLE}ItemTitleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0035
     * @tc.name      FilePreviewDLP_ItemTitleOf_0035
     * @tc.desc      itemTitleOf(index=150) returns "Text151"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0035 begin`);
      const actual: string = itemTitleOf(150);
      logInfo(`itemTitleOf(index=150): actual=${actual}`);
      expect(actual).assertEqual('Text151');
      logInfo(`${BUNDLE}ItemTitleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0036
     * @tc.name      FilePreviewDLP_ItemTitleOf_0036
     * @tc.desc      itemTitleOf(index=155) returns "Text156"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0036 begin`);
      const actual: string = itemTitleOf(155);
      logInfo(`itemTitleOf(index=155): actual=${actual}`);
      expect(actual).assertEqual('Text156');
      logInfo(`${BUNDLE}ItemTitleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0037
     * @tc.name      FilePreviewDLP_ItemTitleOf_0037
     * @tc.desc      itemTitleOf(index=160) returns "Text161"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0037 begin`);
      const actual: string = itemTitleOf(160);
      logInfo(`itemTitleOf(index=160): actual=${actual}`);
      expect(actual).assertEqual('Text161');
      logInfo(`${BUNDLE}ItemTitleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0038
     * @tc.name      FilePreviewDLP_ItemTitleOf_0038
     * @tc.desc      itemTitleOf(index=165) returns "Text166"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0038 begin`);
      const actual: string = itemTitleOf(165);
      logInfo(`itemTitleOf(index=165): actual=${actual}`);
      expect(actual).assertEqual('Text166');
      logInfo(`${BUNDLE}ItemTitleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0039
     * @tc.name      FilePreviewDLP_ItemTitleOf_0039
     * @tc.desc      itemTitleOf(index=170) returns "Text171"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0039 begin`);
      const actual: string = itemTitleOf(170);
      logInfo(`itemTitleOf(index=170): actual=${actual}`);
      expect(actual).assertEqual('Text171');
      logInfo(`${BUNDLE}ItemTitleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0040
     * @tc.name      FilePreviewDLP_ItemTitleOf_0040
     * @tc.desc      itemTitleOf(index=175) returns "Text176"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0040 begin`);
      const actual: string = itemTitleOf(175);
      logInfo(`itemTitleOf(index=175): actual=${actual}`);
      expect(actual).assertEqual('Text176');
      logInfo(`${BUNDLE}ItemTitleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0041
     * @tc.name      FilePreviewDLP_ItemTitleOf_0041
     * @tc.desc      itemTitleOf(index=180) returns "Text181"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0041 begin`);
      const actual: string = itemTitleOf(180);
      logInfo(`itemTitleOf(index=180): actual=${actual}`);
      expect(actual).assertEqual('Text181');
      logInfo(`${BUNDLE}ItemTitleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0042
     * @tc.name      FilePreviewDLP_ItemTitleOf_0042
     * @tc.desc      itemTitleOf(index=185) returns "Text186"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0042 begin`);
      const actual: string = itemTitleOf(185);
      logInfo(`itemTitleOf(index=185): actual=${actual}`);
      expect(actual).assertEqual('Text186');
      logInfo(`${BUNDLE}ItemTitleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0043
     * @tc.name      FilePreviewDLP_ItemTitleOf_0043
     * @tc.desc      itemTitleOf(index=190) returns "Text191"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0043 begin`);
      const actual: string = itemTitleOf(190);
      logInfo(`itemTitleOf(index=190): actual=${actual}`);
      expect(actual).assertEqual('Text191');
      logInfo(`${BUNDLE}ItemTitleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0044
     * @tc.name      FilePreviewDLP_ItemTitleOf_0044
     * @tc.desc      itemTitleOf(index=195) returns "Text196"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0044 begin`);
      const actual: string = itemTitleOf(195);
      logInfo(`itemTitleOf(index=195): actual=${actual}`);
      expect(actual).assertEqual('Text196');
      logInfo(`${BUNDLE}ItemTitleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0045
     * @tc.name      FilePreviewDLP_ItemTitleOf_0045
     * @tc.desc      itemTitleOf(index=200) returns "Text201"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0045 begin`);
      const actual: string = itemTitleOf(200);
      logInfo(`itemTitleOf(index=200): actual=${actual}`);
      expect(actual).assertEqual('Text201');
      logInfo(`${BUNDLE}ItemTitleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0046
     * @tc.name      FilePreviewDLP_ItemTitleOf_0046
     * @tc.desc      itemTitleOf(index=-91) returns "Text-90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0046 begin`);
      const actual: string = itemTitleOf(-91);
      logInfo(`itemTitleOf(index=-91): actual=${actual}`);
      expect(actual).assertEqual('Text-90');
      logInfo(`${BUNDLE}ItemTitleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0047
     * @tc.name      FilePreviewDLP_ItemTitleOf_0047
     * @tc.desc      itemTitleOf(index=50.55) returns "Text51.55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0047 begin`);
      const actual: string = itemTitleOf(50.55);
      logInfo(`itemTitleOf(index=50.55): actual=${actual}`);
      expect(actual).assertEqual('Text51.55');
      logInfo(`${BUNDLE}ItemTitleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0048
     * @tc.name      FilePreviewDLP_ItemTitleOf_0048
     * @tc.desc      itemTitleOf(index=65.65) returns "Text66.65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0048 begin`);
      const actual: string = itemTitleOf(65.65);
      logInfo(`itemTitleOf(index=65.65): actual=${actual}`);
      expect(actual).assertEqual('Text66.65');
      logInfo(`${BUNDLE}ItemTitleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0049
     * @tc.name      FilePreviewDLP_ItemTitleOf_0049
     * @tc.desc      itemTitleOf(index=14.8) returns "Text15.8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0049 begin`);
      const actual: string = itemTitleOf(14.8);
      logInfo(`itemTitleOf(index=14.8): actual=${actual}`);
      expect(actual).assertEqual('Text15.8');
      logInfo(`${BUNDLE}ItemTitleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0050
     * @tc.name      FilePreviewDLP_ItemTitleOf_0050
     * @tc.desc      itemTitleOf(index=59.29) returns "Text60.29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0050 begin`);
      const actual: string = itemTitleOf(59.29);
      logInfo(`itemTitleOf(index=59.29): actual=${actual}`);
      expect(actual).assertEqual('Text60.29');
      logInfo(`${BUNDLE}ItemTitleOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0051
     * @tc.name      FilePreviewDLP_ItemTitleOf_0051
     * @tc.desc      itemTitleOf(index=84) returns "Text85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0051 begin`);
      const actual: string = itemTitleOf(84);
      logInfo(`itemTitleOf(index=84): actual=${actual}`);
      expect(actual).assertEqual('Text85');
      logInfo(`${BUNDLE}ItemTitleOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0052
     * @tc.name      FilePreviewDLP_ItemTitleOf_0052
     * @tc.desc      itemTitleOf(index=114) returns "Text115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0052 begin`);
      const actual: string = itemTitleOf(114);
      logInfo(`itemTitleOf(index=114): actual=${actual}`);
      expect(actual).assertEqual('Text115');
      logInfo(`${BUNDLE}ItemTitleOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0053
     * @tc.name      FilePreviewDLP_ItemTitleOf_0053
     * @tc.desc      itemTitleOf(index=-48) returns "Text-47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0053 begin`);
      const actual: string = itemTitleOf(-48);
      logInfo(`itemTitleOf(index=-48): actual=${actual}`);
      expect(actual).assertEqual('Text-47');
      logInfo(`${BUNDLE}ItemTitleOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0054
     * @tc.name      FilePreviewDLP_ItemTitleOf_0054
     * @tc.desc      itemTitleOf(index=78) returns "Text79"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0054 begin`);
      const actual: string = itemTitleOf(78);
      logInfo(`itemTitleOf(index=78): actual=${actual}`);
      expect(actual).assertEqual('Text79');
      logInfo(`${BUNDLE}ItemTitleOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0055
     * @tc.name      FilePreviewDLP_ItemTitleOf_0055
     * @tc.desc      itemTitleOf(index=171) returns "Text172"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0055 begin`);
      const actual: string = itemTitleOf(171);
      logInfo(`itemTitleOf(index=171): actual=${actual}`);
      expect(actual).assertEqual('Text172');
      logInfo(`${BUNDLE}ItemTitleOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0056
     * @tc.name      FilePreviewDLP_ItemTitleOf_0056
     * @tc.desc      itemTitleOf(index=109) returns "Text110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0056 begin`);
      const actual: string = itemTitleOf(109);
      logInfo(`itemTitleOf(index=109): actual=${actual}`);
      expect(actual).assertEqual('Text110');
      logInfo(`${BUNDLE}ItemTitleOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0057
     * @tc.name      FilePreviewDLP_ItemTitleOf_0057
     * @tc.desc      itemTitleOf(index=11) returns "Text12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0057 begin`);
      const actual: string = itemTitleOf(11);
      logInfo(`itemTitleOf(index=11): actual=${actual}`);
      expect(actual).assertEqual('Text12');
      logInfo(`${BUNDLE}ItemTitleOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0058
     * @tc.name      FilePreviewDLP_ItemTitleOf_0058
     * @tc.desc      itemTitleOf(index=52) returns "Text53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0058 begin`);
      const actual: string = itemTitleOf(52);
      logInfo(`itemTitleOf(index=52): actual=${actual}`);
      expect(actual).assertEqual('Text53');
      logInfo(`${BUNDLE}ItemTitleOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0059
     * @tc.name      FilePreviewDLP_ItemTitleOf_0059
     * @tc.desc      itemTitleOf(index=13.17) returns "Text14.17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0059 begin`);
      const actual: string = itemTitleOf(13.17);
      logInfo(`itemTitleOf(index=13.17): actual=${actual}`);
      expect(actual).assertEqual('Text14.17');
      logInfo(`${BUNDLE}ItemTitleOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0060
     * @tc.name      FilePreviewDLP_ItemTitleOf_0060
     * @tc.desc      itemTitleOf(index=-42) returns "Text-41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0060 begin`);
      const actual: string = itemTitleOf(-42);
      logInfo(`itemTitleOf(index=-42): actual=${actual}`);
      expect(actual).assertEqual('Text-41');
      logInfo(`${BUNDLE}ItemTitleOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0061
     * @tc.name      FilePreviewDLP_ItemTitleOf_0061
     * @tc.desc      itemTitleOf(index=-79) returns "Text-78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0061 begin`);
      const actual: string = itemTitleOf(-79);
      logInfo(`itemTitleOf(index=-79): actual=${actual}`);
      expect(actual).assertEqual('Text-78');
      logInfo(`${BUNDLE}ItemTitleOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0062
     * @tc.name      FilePreviewDLP_ItemTitleOf_0062
     * @tc.desc      itemTitleOf(index=49) returns "Text50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0062 begin`);
      const actual: string = itemTitleOf(49);
      logInfo(`itemTitleOf(index=49): actual=${actual}`);
      expect(actual).assertEqual('Text50');
      logInfo(`${BUNDLE}ItemTitleOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0063
     * @tc.name      FilePreviewDLP_ItemTitleOf_0063
     * @tc.desc      itemTitleOf(index=42.78) returns "Text43.78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0063 begin`);
      const actual: string = itemTitleOf(42.78);
      logInfo(`itemTitleOf(index=42.78): actual=${actual}`);
      expect(actual).assertEqual('Text43.78');
      logInfo(`${BUNDLE}ItemTitleOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0064
     * @tc.name      FilePreviewDLP_ItemTitleOf_0064
     * @tc.desc      itemTitleOf(index=157) returns "Text158"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0064 begin`);
      const actual: string = itemTitleOf(157);
      logInfo(`itemTitleOf(index=157): actual=${actual}`);
      expect(actual).assertEqual('Text158');
      logInfo(`${BUNDLE}ItemTitleOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0065
     * @tc.name      FilePreviewDLP_ItemTitleOf_0065
     * @tc.desc      itemTitleOf(index=82) returns "Text83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0065 begin`);
      const actual: string = itemTitleOf(82);
      logInfo(`itemTitleOf(index=82): actual=${actual}`);
      expect(actual).assertEqual('Text83');
      logInfo(`${BUNDLE}ItemTitleOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0066
     * @tc.name      FilePreviewDLP_ItemTitleOf_0066
     * @tc.desc      itemTitleOf(index=104) returns "Text105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0066 begin`);
      const actual: string = itemTitleOf(104);
      logInfo(`itemTitleOf(index=104): actual=${actual}`);
      expect(actual).assertEqual('Text105');
      logInfo(`${BUNDLE}ItemTitleOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0067
     * @tc.name      FilePreviewDLP_ItemTitleOf_0067
     * @tc.desc      itemTitleOf(index=-12) returns "Text-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0067 begin`);
      const actual: string = itemTitleOf(-12);
      logInfo(`itemTitleOf(index=-12): actual=${actual}`);
      expect(actual).assertEqual('Text-11');
      logInfo(`${BUNDLE}ItemTitleOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0068
     * @tc.name      FilePreviewDLP_ItemTitleOf_0068
     * @tc.desc      itemTitleOf(index=82.7) returns "Text83.7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0068 begin`);
      const actual: string = itemTitleOf(82.7);
      logInfo(`itemTitleOf(index=82.7): actual=${actual}`);
      expect(actual).assertEqual('Text83.7');
      logInfo(`${BUNDLE}ItemTitleOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0069
     * @tc.name      FilePreviewDLP_ItemTitleOf_0069
     * @tc.desc      itemTitleOf(index=134) returns "Text135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0069 begin`);
      const actual: string = itemTitleOf(134);
      logInfo(`itemTitleOf(index=134): actual=${actual}`);
      expect(actual).assertEqual('Text135');
      logInfo(`${BUNDLE}ItemTitleOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0070
     * @tc.name      FilePreviewDLP_ItemTitleOf_0070
     * @tc.desc      itemTitleOf(index=7.26) returns "Text8.26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0070 begin`);
      const actual: string = itemTitleOf(7.26);
      logInfo(`itemTitleOf(index=7.26): actual=${actual}`);
      expect(actual).assertEqual('Text8.26');
      logInfo(`${BUNDLE}ItemTitleOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0071
     * @tc.name      FilePreviewDLP_ItemTitleOf_0071
     * @tc.desc      itemTitleOf(index=194) returns "Text195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0071 begin`);
      const actual: string = itemTitleOf(194);
      logInfo(`itemTitleOf(index=194): actual=${actual}`);
      expect(actual).assertEqual('Text195');
      logInfo(`${BUNDLE}ItemTitleOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0072
     * @tc.name      FilePreviewDLP_ItemTitleOf_0072
     * @tc.desc      itemTitleOf(index=16) returns "Text17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0072 begin`);
      const actual: string = itemTitleOf(16);
      logInfo(`itemTitleOf(index=16): actual=${actual}`);
      expect(actual).assertEqual('Text17');
      logInfo(`${BUNDLE}ItemTitleOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0073
     * @tc.name      FilePreviewDLP_ItemTitleOf_0073
     * @tc.desc      itemTitleOf(index=-23) returns "Text-22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0073 begin`);
      const actual: string = itemTitleOf(-23);
      logInfo(`itemTitleOf(index=-23): actual=${actual}`);
      expect(actual).assertEqual('Text-22');
      logInfo(`${BUNDLE}ItemTitleOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0074
     * @tc.name      FilePreviewDLP_ItemTitleOf_0074
     * @tc.desc      itemTitleOf(index=14) returns "Text15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0074 begin`);
      const actual: string = itemTitleOf(14);
      logInfo(`itemTitleOf(index=14): actual=${actual}`);
      expect(actual).assertEqual('Text15');
      logInfo(`${BUNDLE}ItemTitleOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0075
     * @tc.name      FilePreviewDLP_ItemTitleOf_0075
     * @tc.desc      itemTitleOf(index=117) returns "Text118"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0075 begin`);
      const actual: string = itemTitleOf(117);
      logInfo(`itemTitleOf(index=117): actual=${actual}`);
      expect(actual).assertEqual('Text118');
      logInfo(`${BUNDLE}ItemTitleOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0076
     * @tc.name      FilePreviewDLP_ItemTitleOf_0076
     * @tc.desc      itemTitleOf(index=-68) returns "Text-67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0076 begin`);
      const actual: string = itemTitleOf(-68);
      logInfo(`itemTitleOf(index=-68): actual=${actual}`);
      expect(actual).assertEqual('Text-67');
      logInfo(`${BUNDLE}ItemTitleOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0077
     * @tc.name      FilePreviewDLP_ItemTitleOf_0077
     * @tc.desc      itemTitleOf(index=67.99) returns "Text68.99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0077 begin`);
      const actual: string = itemTitleOf(67.99);
      logInfo(`itemTitleOf(index=67.99): actual=${actual}`);
      expect(actual).assertEqual('Text68.99');
      logInfo(`${BUNDLE}ItemTitleOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0078
     * @tc.name      FilePreviewDLP_ItemTitleOf_0078
     * @tc.desc      itemTitleOf(index=49.4) returns "Text50.4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0078 begin`);
      const actual: string = itemTitleOf(49.4);
      logInfo(`itemTitleOf(index=49.4): actual=${actual}`);
      expect(actual).assertEqual('Text50.4');
      logInfo(`${BUNDLE}ItemTitleOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0079
     * @tc.name      FilePreviewDLP_ItemTitleOf_0079
     * @tc.desc      itemTitleOf(index=13.29) returns "Text14.29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0079 begin`);
      const actual: string = itemTitleOf(13.29);
      logInfo(`itemTitleOf(index=13.29): actual=${actual}`);
      expect(actual).assertEqual('Text14.29');
      logInfo(`${BUNDLE}ItemTitleOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0080
     * @tc.name      FilePreviewDLP_ItemTitleOf_0080
     * @tc.desc      itemTitleOf(index=177) returns "Text178"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0080 begin`);
      const actual: string = itemTitleOf(177);
      logInfo(`itemTitleOf(index=177): actual=${actual}`);
      expect(actual).assertEqual('Text178');
      logInfo(`${BUNDLE}ItemTitleOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0081
     * @tc.name      FilePreviewDLP_ItemTitleOf_0081
     * @tc.desc      itemTitleOf(index=19) returns "Text20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0081 begin`);
      const actual: string = itemTitleOf(19);
      logInfo(`itemTitleOf(index=19): actual=${actual}`);
      expect(actual).assertEqual('Text20');
      logInfo(`${BUNDLE}ItemTitleOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0082
     * @tc.name      FilePreviewDLP_ItemTitleOf_0082
     * @tc.desc      itemTitleOf(index=7) returns "Text8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0082 begin`);
      const actual: string = itemTitleOf(7);
      logInfo(`itemTitleOf(index=7): actual=${actual}`);
      expect(actual).assertEqual('Text8');
      logInfo(`${BUNDLE}ItemTitleOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0083
     * @tc.name      FilePreviewDLP_ItemTitleOf_0083
     * @tc.desc      itemTitleOf(index=102) returns "Text103"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0083 begin`);
      const actual: string = itemTitleOf(102);
      logInfo(`itemTitleOf(index=102): actual=${actual}`);
      expect(actual).assertEqual('Text103');
      logInfo(`${BUNDLE}ItemTitleOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0084
     * @tc.name      FilePreviewDLP_ItemTitleOf_0084
     * @tc.desc      itemTitleOf(index=6) returns "Text7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0084 begin`);
      const actual: string = itemTitleOf(6);
      logInfo(`itemTitleOf(index=6): actual=${actual}`);
      expect(actual).assertEqual('Text7');
      logInfo(`${BUNDLE}ItemTitleOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0085
     * @tc.name      FilePreviewDLP_ItemTitleOf_0085
     * @tc.desc      itemTitleOf(index=151) returns "Text152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0085 begin`);
      const actual: string = itemTitleOf(151);
      logInfo(`itemTitleOf(index=151): actual=${actual}`);
      expect(actual).assertEqual('Text152');
      logInfo(`${BUNDLE}ItemTitleOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0086
     * @tc.name      FilePreviewDLP_ItemTitleOf_0086
     * @tc.desc      itemTitleOf(index=182) returns "Text183"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0086 begin`);
      const actual: string = itemTitleOf(182);
      logInfo(`itemTitleOf(index=182): actual=${actual}`);
      expect(actual).assertEqual('Text183');
      logInfo(`${BUNDLE}ItemTitleOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0087
     * @tc.name      FilePreviewDLP_ItemTitleOf_0087
     * @tc.desc      itemTitleOf(index=39.5) returns "Text40.5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0087 begin`);
      const actual: string = itemTitleOf(39.5);
      logInfo(`itemTitleOf(index=39.5): actual=${actual}`);
      expect(actual).assertEqual('Text40.5');
      logInfo(`${BUNDLE}ItemTitleOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0088
     * @tc.name      FilePreviewDLP_ItemTitleOf_0088
     * @tc.desc      itemTitleOf(index=44) returns "Text45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0088 begin`);
      const actual: string = itemTitleOf(44);
      logInfo(`itemTitleOf(index=44): actual=${actual}`);
      expect(actual).assertEqual('Text45');
      logInfo(`${BUNDLE}ItemTitleOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0089
     * @tc.name      FilePreviewDLP_ItemTitleOf_0089
     * @tc.desc      itemTitleOf(index=54.13) returns "Text55.13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0089 begin`);
      const actual: string = itemTitleOf(54.13);
      logInfo(`itemTitleOf(index=54.13): actual=${actual}`);
      expect(actual).assertEqual('Text55.13');
      logInfo(`${BUNDLE}ItemTitleOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0090
     * @tc.name      FilePreviewDLP_ItemTitleOf_0090
     * @tc.desc      itemTitleOf(index=-13) returns "Text-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0090 begin`);
      const actual: string = itemTitleOf(-13);
      logInfo(`itemTitleOf(index=-13): actual=${actual}`);
      expect(actual).assertEqual('Text-12');
      logInfo(`${BUNDLE}ItemTitleOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0091
     * @tc.name      FilePreviewDLP_ItemTitleOf_0091
     * @tc.desc      itemTitleOf(index=71.15) returns "Text72.15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0091 begin`);
      const actual: string = itemTitleOf(71.15);
      logInfo(`itemTitleOf(index=71.15): actual=${actual}`);
      expect(actual).assertEqual('Text72.15');
      logInfo(`${BUNDLE}ItemTitleOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0092
     * @tc.name      FilePreviewDLP_ItemTitleOf_0092
     * @tc.desc      itemTitleOf(index=108) returns "Text109"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0092 begin`);
      const actual: string = itemTitleOf(108);
      logInfo(`itemTitleOf(index=108): actual=${actual}`);
      expect(actual).assertEqual('Text109');
      logInfo(`${BUNDLE}ItemTitleOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0093
     * @tc.name      FilePreviewDLP_ItemTitleOf_0093
     * @tc.desc      itemTitleOf(index=25.38) returns "Text26.38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0093 begin`);
      const actual: string = itemTitleOf(25.38);
      logInfo(`itemTitleOf(index=25.38): actual=${actual}`);
      expect(actual).assertEqual('Text26.38');
      logInfo(`${BUNDLE}ItemTitleOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0094
     * @tc.name      FilePreviewDLP_ItemTitleOf_0094
     * @tc.desc      itemTitleOf(index=94) returns "Text95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0094 begin`);
      const actual: string = itemTitleOf(94);
      logInfo(`itemTitleOf(index=94): actual=${actual}`);
      expect(actual).assertEqual('Text95');
      logInfo(`${BUNDLE}ItemTitleOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0095
     * @tc.name      FilePreviewDLP_ItemTitleOf_0095
     * @tc.desc      itemTitleOf(index=-98) returns "Text-97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemTitleOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0095 begin`);
      const actual: string = itemTitleOf(-98);
      logInfo(`itemTitleOf(index=-98): actual=${actual}`);
      expect(actual).assertEqual('Text-97');
      logInfo(`${BUNDLE}ItemTitleOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_TITLE_OF_0096
     * @tc.name      FilePreviewDLP_ItemTitleOf_0096
     * @tc.desc      itemTitleOf(index=17) returns "Text18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemTitleOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemTitleOf_0096 begin`);
      const actual: string = itemTitleOf(17);
      logInfo(`itemTitleOf(index=17): actual=${actual}`);
      expect(actual).assertEqual('Text18');
      logInfo(`${BUNDLE}ItemTitleOf_0096 end`);
    });
  });
}
