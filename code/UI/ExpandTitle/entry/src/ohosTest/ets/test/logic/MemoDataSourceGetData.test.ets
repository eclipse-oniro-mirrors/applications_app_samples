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

/** Logic checks for MemoDataSource.getData (87 cases). */
export default function memoDataSourceGetDataTest(): void {
  describe('MemoDataSourceGetDataTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0001
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0001
     * @tc.desc      MemoDataSource.getData(index=0) yields "1646121972443"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_MemoDataSourceGetData_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0001 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(0);
      logInfo(`getData(index=0): actual.memoId=${actual.memoId}`);
      expect(actual.memoId).assertEqual('1646121972443');
      logInfo(`getData(index=0): actual.title=${actual.title}`);
      expect(actual.title).assertEqual('One step');
      logInfo(`getData(index=0): actual.time=${actual.time}`);
      expect(actual.time).assertEqual('Just now');
      logInfo(`getData(index=0): actual.imageSrc=${actual.imageSrc}`);
      expect(actual.imageSrc).assertEqual('app.media.expanded_title_ic_public_app5');
      logInfo(`getData(index=0): actual.content=${actual.content}`);
      expect(actual.content).assertEqual('For analyzing the data gathered in the previous experiment.');
      logInfo(`${BUNDLE}MemoDataSourceGetData_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0002
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0002
     * @tc.desc      MemoDataSource.getData(index=1) yields "1646121972444"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_MemoDataSourceGetData_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0002 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(1);
      logInfo(`getData(index=1): actual.memoId=${actual.memoId}`);
      expect(actual.memoId).assertEqual('1646121972444');
      logInfo(`getData(index=1): actual.title=${actual.title}`);
      expect(actual.title).assertEqual('Love is love');
      logInfo(`getData(index=1): actual.time=${actual.time}`);
      expect(actual.time).assertEqual('5 min ago');
      logInfo(`getData(index=1): actual.imageSrc=${actual.imageSrc}`);
      expect(actual.imageSrc).assertEqual('');
      logInfo(`getData(index=1): actual.content=${actual.content}`);
      expect(actual.content).assertEqual('Start whenever you want.');
      logInfo(`${BUNDLE}MemoDataSourceGetData_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0003
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0003
     * @tc.desc      MemoDataSource.getData(index=2) yields "1646121972445"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_MemoDataSourceGetData_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0003 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(2);
      logInfo(`getData(index=2): actual.memoId=${actual.memoId}`);
      expect(actual.memoId).assertEqual('1646121972445');
      logInfo(`getData(index=2): actual.title=${actual.title}`);
      expect(actual.title).assertEqual('To solve a problem');
      logInfo(`getData(index=2): actual.time=${actual.time}`);
      expect(actual.time).assertEqual('Yesterday');
      logInfo(`getData(index=2): actual.imageSrc=${actual.imageSrc}`);
      expect(actual.imageSrc).assertEqual('app.media.expanded_title_drink_coffee');
      logInfo(`getData(index=2): actual.content=${actual.content}`);
      expect(actual.content).assertEqual('To solve a problem. First, you need to gain empty mind.');
      logInfo(`${BUNDLE}MemoDataSourceGetData_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0004
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0004
     * @tc.desc      MemoDataSource.getData(index=-1) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0004 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-1);
      logInfo(`getData(index=-1): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0005
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0005
     * @tc.desc      MemoDataSource.getData(index=5) yields "1646121972448"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0005 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(5);
      logInfo(`getData(index=5): actual.memoId=${actual.memoId}`);
      expect(actual.memoId).assertEqual('1646121972448');
      logInfo(`getData(index=5): actual.title=${actual.title}`);
      expect(actual.title).assertEqual('Morning Exercise');
      logInfo(`getData(index=5): actual.time=${actual.time}`);
      expect(actual.time).assertEqual('02.20.2024');
      logInfo(`getData(index=5): actual.imageSrc=${actual.imageSrc}`);
      expect(actual.imageSrc).assertEqual('app.media.expanded_title_ic_public_app12');
      logInfo(`getData(index=5): actual.content=${actual.content}`);
      expect(actual.content).assertEqual('Long run 3 km');
      logInfo(`${BUNDLE}MemoDataSourceGetData_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0006
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0006
     * @tc.desc      MemoDataSource.getData(index=3) yields "1646121972446"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0006 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(3);
      logInfo(`getData(index=3): actual.memoId=${actual.memoId}`);
      expect(actual.memoId).assertEqual('1646121972446');
      logInfo(`getData(index=3): actual.title=${actual.title}`);
      expect(actual.title).assertEqual('Lunches');
      logInfo(`getData(index=3): actual.time=${actual.time}`);
      expect(actual.time).assertEqual('02.18.2024');
      logInfo(`getData(index=3): actual.imageSrc=${actual.imageSrc}`);
      expect(actual.imageSrc).assertEqual('app.media.expanded_title_cook_picture');
      logInfo(`getData(index=3): actual.content=${actual.content}`);
      expect(actual.content).assertEqual('Sweet and sour ribs potato shreds');
      logInfo(`${BUNDLE}MemoDataSourceGetData_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0007
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0007
     * @tc.desc      MemoDataSource.getData(index=6) yields "1646121972449"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0007 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(6);
      logInfo(`getData(index=6): actual.memoId=${actual.memoId}`);
      expect(actual.memoId).assertEqual('1646121972449');
      logInfo(`getData(index=6): actual.title=${actual.title}`);
      expect(actual.title).assertEqual('Breakfast');
      logInfo(`getData(index=6): actual.time=${actual.time}`);
      expect(actual.time).assertEqual('02.17.2024');
      logInfo(`getData(index=6): actual.imageSrc=${actual.imageSrc}`);
      expect(actual.imageSrc).assertEqual('app.media.expanded_title_dinner_food');
      logInfo(`getData(index=6): actual.content=${actual.content}`);
      expect(actual.content).assertEqual('Milk and bread');
      logInfo(`${BUNDLE}MemoDataSourceGetData_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0008
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0008
     * @tc.desc      MemoDataSource.getData(index=10) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0008 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(10);
      logInfo(`getData(index=10): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0009
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0009
     * @tc.desc      MemoDataSource.getData(index=100) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0009 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(100);
      logInfo(`getData(index=100): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0010
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0010
     * @tc.desc      MemoDataSource.getData(index=15) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0010 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(15);
      logInfo(`getData(index=15): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0011
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0011
     * @tc.desc      MemoDataSource.getData(index=20) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0011 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(20);
      logInfo(`getData(index=20): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0012
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0012
     * @tc.desc      MemoDataSource.getData(index=25) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0012 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(25);
      logInfo(`getData(index=25): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0013
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0013
     * @tc.desc      MemoDataSource.getData(index=30) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0013 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(30);
      logInfo(`getData(index=30): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0014
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0014
     * @tc.desc      MemoDataSource.getData(index=35) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0014 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(35);
      logInfo(`getData(index=35): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0015
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0015
     * @tc.desc      MemoDataSource.getData(index=40) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0015 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(40);
      logInfo(`getData(index=40): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0016
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0016
     * @tc.desc      MemoDataSource.getData(index=45) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0016 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(45);
      logInfo(`getData(index=45): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0017
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0017
     * @tc.desc      MemoDataSource.getData(index=50) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0017 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(50);
      logInfo(`getData(index=50): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0018
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0018
     * @tc.desc      MemoDataSource.getData(index=55) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0018 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(55);
      logInfo(`getData(index=55): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0019
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0019
     * @tc.desc      MemoDataSource.getData(index=60) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0019 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(60);
      logInfo(`getData(index=60): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0020
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0020
     * @tc.desc      MemoDataSource.getData(index=65) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0020 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(65);
      logInfo(`getData(index=65): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0021
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0021
     * @tc.desc      MemoDataSource.getData(index=70) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0021 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(70);
      logInfo(`getData(index=70): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0022
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0022
     * @tc.desc      MemoDataSource.getData(index=75) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0022 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(75);
      logInfo(`getData(index=75): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0023
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0023
     * @tc.desc      MemoDataSource.getData(index=80) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0023 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(80);
      logInfo(`getData(index=80): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0024
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0024
     * @tc.desc      MemoDataSource.getData(index=85) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0024 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(85);
      logInfo(`getData(index=85): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0025
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0025
     * @tc.desc      MemoDataSource.getData(index=90) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0025 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(90);
      logInfo(`getData(index=90): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0026
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0026
     * @tc.desc      MemoDataSource.getData(index=95) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0026 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(95);
      logInfo(`getData(index=95): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0027
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0027
     * @tc.desc      MemoDataSource.getData(index=105) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0027 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(105);
      logInfo(`getData(index=105): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0028
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0028
     * @tc.desc      MemoDataSource.getData(index=110) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0028 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(110);
      logInfo(`getData(index=110): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0029
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0029
     * @tc.desc      MemoDataSource.getData(index=115) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0029 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(115);
      logInfo(`getData(index=115): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0030
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0030
     * @tc.desc      MemoDataSource.getData(index=120) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0030 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(120);
      logInfo(`getData(index=120): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0031
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0031
     * @tc.desc      MemoDataSource.getData(index=125) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0031 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(125);
      logInfo(`getData(index=125): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0032
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0032
     * @tc.desc      MemoDataSource.getData(index=130) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0032 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(130);
      logInfo(`getData(index=130): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0033
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0033
     * @tc.desc      MemoDataSource.getData(index=135) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0033 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(135);
      logInfo(`getData(index=135): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0034
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0034
     * @tc.desc      MemoDataSource.getData(index=140) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0034 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(140);
      logInfo(`getData(index=140): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0035
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0035
     * @tc.desc      MemoDataSource.getData(index=145) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0035 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(145);
      logInfo(`getData(index=145): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0036
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0036
     * @tc.desc      MemoDataSource.getData(index=150) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0036 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(150);
      logInfo(`getData(index=150): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0037
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0037
     * @tc.desc      MemoDataSource.getData(index=155) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0037 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(155);
      logInfo(`getData(index=155): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0038
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0038
     * @tc.desc      MemoDataSource.getData(index=160) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0038 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(160);
      logInfo(`getData(index=160): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0039
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0039
     * @tc.desc      MemoDataSource.getData(index=165) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0039 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(165);
      logInfo(`getData(index=165): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0040
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0040
     * @tc.desc      MemoDataSource.getData(index=170) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0040 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(170);
      logInfo(`getData(index=170): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0041
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0041
     * @tc.desc      MemoDataSource.getData(index=175) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0041 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(175);
      logInfo(`getData(index=175): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0042
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0042
     * @tc.desc      MemoDataSource.getData(index=180) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0042 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(180);
      logInfo(`getData(index=180): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0043
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0043
     * @tc.desc      MemoDataSource.getData(index=185) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0043 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(185);
      logInfo(`getData(index=185): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0044
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0044
     * @tc.desc      MemoDataSource.getData(index=190) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0044 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(190);
      logInfo(`getData(index=190): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0045
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0045
     * @tc.desc      MemoDataSource.getData(index=195) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0045 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(195);
      logInfo(`getData(index=195): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0046
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0046
     * @tc.desc      MemoDataSource.getData(index=200) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0046 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(200);
      logInfo(`getData(index=200): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0047
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0047
     * @tc.desc      MemoDataSource.getData(index=99.73) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0047 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(99.73);
      logInfo(`getData(index=99.73): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0048
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0048
     * @tc.desc      MemoDataSource.getData(index=-69) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0048 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-69);
      logInfo(`getData(index=-69): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0049
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0049
     * @tc.desc      MemoDataSource.getData(index=163) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0049 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(163);
      logInfo(`getData(index=163): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0050
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0050
     * @tc.desc      MemoDataSource.getData(index=55.8) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0050 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(55.8);
      logInfo(`getData(index=55.8): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0051
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0051
     * @tc.desc      MemoDataSource.getData(index=-4) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0051 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-4);
      logInfo(`getData(index=-4): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0052
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0052
     * @tc.desc      MemoDataSource.getData(index=0.97) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0052 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(0.97);
      logInfo(`getData(index=0.97): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0053
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0053
     * @tc.desc      MemoDataSource.getData(index=94) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0053 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(94);
      logInfo(`getData(index=94): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0054
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0054
     * @tc.desc      MemoDataSource.getData(index=-79) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0054 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-79);
      logInfo(`getData(index=-79): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0055
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0055
     * @tc.desc      MemoDataSource.getData(index=-41) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0055 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-41);
      logInfo(`getData(index=-41): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0056
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0056
     * @tc.desc      MemoDataSource.getData(index=-98) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0056 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-98);
      logInfo(`getData(index=-98): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0057
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0057
     * @tc.desc      MemoDataSource.getData(index=13.28) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0057 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(13.28);
      logInfo(`getData(index=13.28): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0058
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0058
     * @tc.desc      MemoDataSource.getData(index=23) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0058 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(23);
      logInfo(`getData(index=23): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0059
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0059
     * @tc.desc      MemoDataSource.getData(index=58) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0059 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(58);
      logInfo(`getData(index=58): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0060
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0060
     * @tc.desc      MemoDataSource.getData(index=171) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0060 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(171);
      logInfo(`getData(index=171): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0061
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0061
     * @tc.desc      MemoDataSource.getData(index=187) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0061 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(187);
      logInfo(`getData(index=187): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0062
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0062
     * @tc.desc      MemoDataSource.getData(index=53) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0062 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(53);
      logInfo(`getData(index=53): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0063
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0063
     * @tc.desc      MemoDataSource.getData(index=-29) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0063 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-29);
      logInfo(`getData(index=-29): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0064
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0064
     * @tc.desc      MemoDataSource.getData(index=91) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0064 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(91);
      logInfo(`getData(index=91): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0065
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0065
     * @tc.desc      MemoDataSource.getData(index=172) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0065 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(172);
      logInfo(`getData(index=172): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0066
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0066
     * @tc.desc      MemoDataSource.getData(index=69.59) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0066 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(69.59);
      logInfo(`getData(index=69.59): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0067
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0067
     * @tc.desc      MemoDataSource.getData(index=-76) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0067 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-76);
      logInfo(`getData(index=-76): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0068
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0068
     * @tc.desc      MemoDataSource.getData(index=-92) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0068 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-92);
      logInfo(`getData(index=-92): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0069
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0069
     * @tc.desc      MemoDataSource.getData(index=104) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0069 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(104);
      logInfo(`getData(index=104): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0070
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0070
     * @tc.desc      MemoDataSource.getData(index=-19) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0070 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-19);
      logInfo(`getData(index=-19): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0071
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0071
     * @tc.desc      MemoDataSource.getData(index=164) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0071 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(164);
      logInfo(`getData(index=164): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0072
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0072
     * @tc.desc      MemoDataSource.getData(index=9) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0072 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(9);
      logInfo(`getData(index=9): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0073
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0073
     * @tc.desc      MemoDataSource.getData(index=36) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0073 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(36);
      logInfo(`getData(index=36): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0074
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0074
     * @tc.desc      MemoDataSource.getData(index=50.62) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0074 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(50.62);
      logInfo(`getData(index=50.62): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0075
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0075
     * @tc.desc      MemoDataSource.getData(index=89.14) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0075 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(89.14);
      logInfo(`getData(index=89.14): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0076
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0076
     * @tc.desc      MemoDataSource.getData(index=96.34) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0076 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(96.34);
      logInfo(`getData(index=96.34): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0077
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0077
     * @tc.desc      MemoDataSource.getData(index=-93) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0077 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-93);
      logInfo(`getData(index=-93): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0078
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0078
     * @tc.desc      MemoDataSource.getData(index=47.4) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0078 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(47.4);
      logInfo(`getData(index=47.4): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0079
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0079
     * @tc.desc      MemoDataSource.getData(index=101) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0079 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(101);
      logInfo(`getData(index=101): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0080
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0080
     * @tc.desc      MemoDataSource.getData(index=199) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0080 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(199);
      logInfo(`getData(index=199): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0081
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0081
     * @tc.desc      MemoDataSource.getData(index=-42) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0081 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-42);
      logInfo(`getData(index=-42): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0082
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0082
     * @tc.desc      MemoDataSource.getData(index=25.5) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0082 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(25.5);
      logInfo(`getData(index=25.5): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0083
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0083
     * @tc.desc      MemoDataSource.getData(index=-21) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0083 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-21);
      logInfo(`getData(index=-21): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0084
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0084
     * @tc.desc      MemoDataSource.getData(index=82) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0084 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(82);
      logInfo(`getData(index=82): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0085
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0085
     * @tc.desc      MemoDataSource.getData(index=116) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0085 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(116);
      logInfo(`getData(index=116): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0086
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0086
     * @tc.desc      MemoDataSource.getData(index=-2) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_MemoDataSourceGetData_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0086 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(-2);
      logInfo(`getData(index=-2): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MEMO_DATA_SOURCE_GET_DATA_0087
     * @tc.name      ExpandTitle_MemoDataSourceGetData_0087
     * @tc.desc      MemoDataSource.getData(index=158) yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_MemoDataSourceGetData_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MemoDataSourceGetData_0087 begin`);
      const subject: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = subject.getData(158);
      logInfo(`getData(index=158): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}MemoDataSourceGetData_0087 end`);
    });
  });
}
