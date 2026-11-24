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
import { itemKeyOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for itemKeyOf (96 cases). */
export default function itemKeyOfTest(): void {
  describe('ItemKeyOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0001
     * @tc.name      FilePreviewDLP_ItemKeyOf_0001
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=0) returns "0__https://example.com/me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ItemKeyOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0001 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 0);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('0__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0002
     * @tc.name      FilePreviewDLP_ItemKeyOf_0002
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=1) returns "1__https://example.com/me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FilePreviewDLP_ItemKeyOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0002 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 1);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('1__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0003
     * @tc.name      FilePreviewDLP_ItemKeyOf_0003
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=2) returns "2__https://example.com/me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0003 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 2);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('2__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0004
     * @tc.name      FilePreviewDLP_ItemKeyOf_0004
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=-1) returns "-1__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0004 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', -1);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('-1__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0005
     * @tc.name      FilePreviewDLP_ItemKeyOf_0005
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=5) returns "5__https://example.com/me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0005 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 5);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('5__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0006
     * @tc.name      FilePreviewDLP_ItemKeyOf_0006
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=10) returns "10__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0006 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 10);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('10__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0007
     * @tc.name      FilePreviewDLP_ItemKeyOf_0007
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=3) returns "3__https://example.com/me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0007 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 3);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('3__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0008
     * @tc.name      FilePreviewDLP_ItemKeyOf_0008
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=100) returns "100__https://example.co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0008 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 100);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('100__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0009
     * @tc.name      FilePreviewDLP_ItemKeyOf_0009
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=15) returns "15__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0009 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 15);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('15__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0010
     * @tc.name      FilePreviewDLP_ItemKeyOf_0010
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=20) returns "20__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0010 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 20);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('20__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0011
     * @tc.name      FilePreviewDLP_ItemKeyOf_0011
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=25) returns "25__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0011 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 25);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('25__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0012
     * @tc.name      FilePreviewDLP_ItemKeyOf_0012
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=30) returns "30__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0012 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 30);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('30__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0013
     * @tc.name      FilePreviewDLP_ItemKeyOf_0013
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=35) returns "35__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0013 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 35);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('35__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0014
     * @tc.name      FilePreviewDLP_ItemKeyOf_0014
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=40) returns "40__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0014 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 40);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('40__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0015
     * @tc.name      FilePreviewDLP_ItemKeyOf_0015
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=45) returns "45__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0015 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 45);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('45__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0016
     * @tc.name      FilePreviewDLP_ItemKeyOf_0016
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=50) returns "50__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0016 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 50);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('50__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0017
     * @tc.name      FilePreviewDLP_ItemKeyOf_0017
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=55) returns "55__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0017 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 55);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('55__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0018
     * @tc.name      FilePreviewDLP_ItemKeyOf_0018
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=60) returns "60__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0018 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 60);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('60__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0019
     * @tc.name      FilePreviewDLP_ItemKeyOf_0019
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=65) returns "65__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0019 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 65);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('65__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0020
     * @tc.name      FilePreviewDLP_ItemKeyOf_0020
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=70) returns "70__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0020 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 70);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('70__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0021
     * @tc.name      FilePreviewDLP_ItemKeyOf_0021
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=75) returns "75__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0021 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 75);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('75__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0022
     * @tc.name      FilePreviewDLP_ItemKeyOf_0022
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=80) returns "80__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0022 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 80);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('80__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0023
     * @tc.name      FilePreviewDLP_ItemKeyOf_0023
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=85) returns "85__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0023 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 85);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('85__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0024
     * @tc.name      FilePreviewDLP_ItemKeyOf_0024
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=90) returns "90__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0024 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 90);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('90__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0025
     * @tc.name      FilePreviewDLP_ItemKeyOf_0025
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=95) returns "95__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0025 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 95);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('95__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0026
     * @tc.name      FilePreviewDLP_ItemKeyOf_0026
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=105) returns "105__https://example.co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0026 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 105);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('105__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0027
     * @tc.name      FilePreviewDLP_ItemKeyOf_0027
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=110) returns "110__https://example.co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0027 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 110);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('110__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0028
     * @tc.name      FilePreviewDLP_ItemKeyOf_0028
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=12.14) returns "12.14__https://exampl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0028 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 12.14);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('12.14__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0029
     * @tc.name      FilePreviewDLP_ItemKeyOf_0029
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=99.84) returns "99.84__https://exampl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0029 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', 99.84);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('99.84__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0030
     * @tc.name      FilePreviewDLP_ItemKeyOf_0030
     * @tc.desc      itemKeyOf(uri="https://example.com/media/video.mp4", index=-3) returns "-3__https://example.com/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0030 begin`);
      const actual: string = itemKeyOf('https://example.com/media/video.mp4', -3);
      logInfo(`itemKeyOf(uri="https://example.com/media/...: actual=${actual}`);
      expect(actual).assertEqual('-3__https://example.com/media/video.mp4');
      logInfo(`${BUNDLE}ItemKeyOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0031
     * @tc.name      FilePreviewDLP_ItemKeyOf_0031
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=0) returns "0__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0031 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 0);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('0__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0032
     * @tc.name      FilePreviewDLP_ItemKeyOf_0032
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=1) returns "1__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0032 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 1);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('1__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0033
     * @tc.name      FilePreviewDLP_ItemKeyOf_0033
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=2) returns "2__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0033 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 2);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('2__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0034
     * @tc.name      FilePreviewDLP_ItemKeyOf_0034
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=-1) returns "-1__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0034 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', -1);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('-1__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0035
     * @tc.name      FilePreviewDLP_ItemKeyOf_0035
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=5) returns "5__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0035 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 5);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('5__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0036
     * @tc.name      FilePreviewDLP_ItemKeyOf_0036
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=10) returns "10__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0036 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 10);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('10__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0037
     * @tc.name      FilePreviewDLP_ItemKeyOf_0037
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=3) returns "3__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0037 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 3);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('3__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0038
     * @tc.name      FilePreviewDLP_ItemKeyOf_0038
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=100) returns "100__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0038 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 100);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('100__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0039
     * @tc.name      FilePreviewDLP_ItemKeyOf_0039
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=15) returns "15__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0039 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 15);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('15__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0040
     * @tc.name      FilePreviewDLP_ItemKeyOf_0040
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=20) returns "20__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0040 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 20);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('20__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0041
     * @tc.name      FilePreviewDLP_ItemKeyOf_0041
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=25) returns "25__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0041 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 25);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('25__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0042
     * @tc.name      FilePreviewDLP_ItemKeyOf_0042
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=30) returns "30__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0042 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 30);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('30__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0043
     * @tc.name      FilePreviewDLP_ItemKeyOf_0043
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=35) returns "35__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0043 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 35);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('35__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0044
     * @tc.name      FilePreviewDLP_ItemKeyOf_0044
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=40) returns "40__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0044 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 40);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('40__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0045
     * @tc.name      FilePreviewDLP_ItemKeyOf_0045
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=45) returns "45__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0045 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 45);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('45__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0046
     * @tc.name      FilePreviewDLP_ItemKeyOf_0046
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=50) returns "50__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0046 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 50);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('50__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0047
     * @tc.name      FilePreviewDLP_ItemKeyOf_0047
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=55) returns "55__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0047 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 55);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('55__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0048
     * @tc.name      FilePreviewDLP_ItemKeyOf_0048
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=60) returns "60__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0048 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 60);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('60__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0049
     * @tc.name      FilePreviewDLP_ItemKeyOf_0049
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=65) returns "65__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0049 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 65);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('65__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0050
     * @tc.name      FilePreviewDLP_ItemKeyOf_0050
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=70) returns "70__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0050 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 70);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('70__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0051
     * @tc.name      FilePreviewDLP_ItemKeyOf_0051
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=75) returns "75__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0051 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 75);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('75__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0052
     * @tc.name      FilePreviewDLP_ItemKeyOf_0052
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=80) returns "80__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0052 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 80);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('80__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0053
     * @tc.name      FilePreviewDLP_ItemKeyOf_0053
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=85) returns "85__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0053 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 85);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('85__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0054
     * @tc.name      FilePreviewDLP_ItemKeyOf_0054
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=90) returns "90__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0054 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 90);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('90__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0055
     * @tc.name      FilePreviewDLP_ItemKeyOf_0055
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=95) returns "95__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0055 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 95);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('95__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0056
     * @tc.name      FilePreviewDLP_ItemKeyOf_0056
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=105) returns "105__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0056 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 105);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('105__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0057
     * @tc.name      FilePreviewDLP_ItemKeyOf_0057
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=110) returns "110__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0057 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 110);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('110__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0058
     * @tc.name      FilePreviewDLP_ItemKeyOf_0058
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=12.14) returns "12.14__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0058 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 12.14);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('12.14__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0059
     * @tc.name      FilePreviewDLP_ItemKeyOf_0059
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=99.84) returns "99.84__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0059 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', 99.84);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('99.84__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0060
     * @tc.name      FilePreviewDLP_ItemKeyOf_0060
     * @tc.desc      itemKeyOf(uri="http://example.com/a.mp3", index=-3) returns "-3__http://example.com/a.mp3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0060 begin`);
      const actual: string = itemKeyOf('http://example.com/a.mp3', -3);
      logInfo(`itemKeyOf(uri="http://example.com/a.mp3",...: actual=${actual}`);
      expect(actual).assertEqual('-3__http://example.com/a.mp3');
      logInfo(`${BUNDLE}ItemKeyOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0061
     * @tc.name      FilePreviewDLP_ItemKeyOf_0061
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=0) returns "0__file://media/Photo/1/IMG_1....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0061 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 0);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('0__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0062
     * @tc.name      FilePreviewDLP_ItemKeyOf_0062
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=1) returns "1__file://media/Photo/1/IMG_1....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0062 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 1);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('1__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0063
     * @tc.name      FilePreviewDLP_ItemKeyOf_0063
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=2) returns "2__file://media/Photo/1/IMG_1....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0063 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 2);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('2__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0064
     * @tc.name      FilePreviewDLP_ItemKeyOf_0064
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=-1) returns "-1__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0064 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', -1);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('-1__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0065
     * @tc.name      FilePreviewDLP_ItemKeyOf_0065
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=5) returns "5__file://media/Photo/1/IMG_1....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0065 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 5);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('5__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0066
     * @tc.name      FilePreviewDLP_ItemKeyOf_0066
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=10) returns "10__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0066 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 10);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('10__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0067
     * @tc.name      FilePreviewDLP_ItemKeyOf_0067
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=3) returns "3__file://media/Photo/1/IMG_1....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0067 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 3);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('3__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0068
     * @tc.name      FilePreviewDLP_ItemKeyOf_0068
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=100) returns "100__file://media/Photo/1/IM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0068 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 100);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('100__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0069
     * @tc.name      FilePreviewDLP_ItemKeyOf_0069
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=15) returns "15__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0069 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 15);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('15__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0070
     * @tc.name      FilePreviewDLP_ItemKeyOf_0070
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=20) returns "20__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0070 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 20);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('20__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0071
     * @tc.name      FilePreviewDLP_ItemKeyOf_0071
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=25) returns "25__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0071 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 25);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('25__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0072
     * @tc.name      FilePreviewDLP_ItemKeyOf_0072
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=30) returns "30__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0072 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 30);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('30__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0073
     * @tc.name      FilePreviewDLP_ItemKeyOf_0073
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=35) returns "35__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0073 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 35);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('35__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0074
     * @tc.name      FilePreviewDLP_ItemKeyOf_0074
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=40) returns "40__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0074 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 40);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('40__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0075
     * @tc.name      FilePreviewDLP_ItemKeyOf_0075
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=45) returns "45__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0075 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 45);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('45__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0076
     * @tc.name      FilePreviewDLP_ItemKeyOf_0076
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=50) returns "50__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0076 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 50);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('50__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0077
     * @tc.name      FilePreviewDLP_ItemKeyOf_0077
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=55) returns "55__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0077 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 55);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('55__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0078
     * @tc.name      FilePreviewDLP_ItemKeyOf_0078
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=60) returns "60__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0078 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 60);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('60__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0079
     * @tc.name      FilePreviewDLP_ItemKeyOf_0079
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=65) returns "65__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0079 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 65);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('65__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0080
     * @tc.name      FilePreviewDLP_ItemKeyOf_0080
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=70) returns "70__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0080 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 70);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('70__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0081
     * @tc.name      FilePreviewDLP_ItemKeyOf_0081
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=75) returns "75__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0081 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 75);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('75__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0082
     * @tc.name      FilePreviewDLP_ItemKeyOf_0082
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=80) returns "80__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0082 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 80);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('80__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0083
     * @tc.name      FilePreviewDLP_ItemKeyOf_0083
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=85) returns "85__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0083 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 85);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('85__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0084
     * @tc.name      FilePreviewDLP_ItemKeyOf_0084
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=90) returns "90__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0084 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 90);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('90__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0085
     * @tc.name      FilePreviewDLP_ItemKeyOf_0085
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=95) returns "95__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0085 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 95);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('95__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0086
     * @tc.name      FilePreviewDLP_ItemKeyOf_0086
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=105) returns "105__file://media/Photo/1/IM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0086 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 105);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('105__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0087
     * @tc.name      FilePreviewDLP_ItemKeyOf_0087
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=110) returns "110__file://media/Photo/1/IM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0087 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 110);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('110__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0088
     * @tc.name      FilePreviewDLP_ItemKeyOf_0088
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=12.14) returns "12.14__file://media/Photo/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0088 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 12.14);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('12.14__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0089
     * @tc.name      FilePreviewDLP_ItemKeyOf_0089
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=99.84) returns "99.84__file://media/Photo/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0089 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', 99.84);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('99.84__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0090
     * @tc.name      FilePreviewDLP_ItemKeyOf_0090
     * @tc.desc      itemKeyOf(uri="file://media/Photo/1/IMG_1.jpg", index=-3) returns "-3__file://media/Photo/1/IMG_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0090 begin`);
      const actual: string = itemKeyOf('file://media/Photo/1/IMG_1.jpg', -3);
      logInfo(`itemKeyOf(uri="file://media/Photo/1/IMG_1...: actual=${actual}`);
      expect(actual).assertEqual('-3__file://media/Photo/1/IMG_1.jpg');
      logInfo(`${BUNDLE}ItemKeyOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0091
     * @tc.name      FilePreviewDLP_ItemKeyOf_0091
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=0) returns "0__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0091 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 0);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('0__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0092
     * @tc.name      FilePreviewDLP_ItemKeyOf_0092
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=1) returns "1__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0092 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 1);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('1__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0093
     * @tc.name      FilePreviewDLP_ItemKeyOf_0093
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=2) returns "2__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0093 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 2);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('2__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0094
     * @tc.name      FilePreviewDLP_ItemKeyOf_0094
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=-1) returns "-1__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0094 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', -1);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('-1__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0095
     * @tc.name      FilePreviewDLP_ItemKeyOf_0095
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=5) returns "5__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0095 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 5);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('5__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0096
     * @tc.name      FilePreviewDLP_ItemKeyOf_0096
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=10) returns "10__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0096 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 10);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('10__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0096 end`);
    });
  });
}
