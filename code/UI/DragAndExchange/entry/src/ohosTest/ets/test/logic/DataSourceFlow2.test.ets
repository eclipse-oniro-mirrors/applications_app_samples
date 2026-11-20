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
import { AppInfo, DataSource } from '../../../../main/ets/bridge/DragAndExchangeBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for DataSource flow (66 cases). */
export default function dataSourceFlow2Test(): void {
  describe('DataSourceFlow2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0071
     * @tc.name      DragAndExchange_DataSourceFlow_0071
     * @tc.desc      DataSource call flow getData > setData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0071 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(-47);
      logInfo(`step1 getData(-47): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.setData(65, new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(66);
      logInfo(`${BUNDLE}DataSourceFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0072
     * @tc.name      DragAndExchange_DataSourceFlow_0072
     * @tc.desc      DataSource call flow totalCount > pushData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0072 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0073
     * @tc.name      DragAndExchange_DataSourceFlow_0073
     * @tc.desc      DataSource call flow notifyDataMove > getData > setData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0073 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(90, 2);
      const step2: AppInfo = subject.getData(74);
      logInfo(`step2 getData(74): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.setData(90, new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(91);
      logInfo(`${BUNDLE}DataSourceFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0074
     * @tc.name      DragAndExchange_DataSourceFlow_0074
     * @tc.desc      DataSource call flow pushData > notifyDataMove > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0074 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.notifyDataMove(55, 70);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0075
     * @tc.name      DragAndExchange_DataSourceFlow_0075
     * @tc.desc      DataSource call flow getData > getData > notifyDataMove > notifyDataChange > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0075 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(129);
      logInfo(`step1 getData(129): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: AppInfo = subject.getData(180);
      logInfo(`step2 getData(180): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataMove(0, 104);
      subject.notifyDataChange(195);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0076
     * @tc.name      DragAndExchange_DataSourceFlow_0076
     * @tc.desc      DataSource call flow totalCount > notifyDataReload > totalCount > totalCount > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0076 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataReload();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: AppInfo = subject.getData(23.14);
      logInfo(`step5 getData(23.14): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0077
     * @tc.name      DragAndExchange_DataSourceFlow_0077
     * @tc.desc      DataSource call flow totalCount > totalCount > notifyDataChange > totalCount > notifyDataAdd kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0077 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataChange(-9);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataAdd(75.52);
      logInfo(`${BUNDLE}DataSourceFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0078
     * @tc.name      DragAndExchange_DataSourceFlow_0078
     * @tc.desc      DataSource call flow notifyDataReload > setData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0078 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      subject.setData(70, new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(71);
      logInfo(`${BUNDLE}DataSourceFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0079
     * @tc.name      DragAndExchange_DataSourceFlow_0079
     * @tc.desc      DataSource call flow notifyDataAdd > notifyDataReload > setData > getData > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0079 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(170);
      subject.notifyDataReload();
      subject.setData(0.65, new AppInfo());
      const step4: AppInfo = subject.getData(-33);
      logInfo(`step4 getData(-33): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: AppInfo = subject.getData(5);
      logInfo(`step5 getData(5): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0080
     * @tc.name      DragAndExchange_DataSourceFlow_0080
     * @tc.desc      DataSource call flow pushData > notifyDataAdd > notifyDataReload > setData > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0080 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.notifyDataAdd(-20);
      subject.notifyDataReload();
      subject.setData(50, new AppInfo());
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(51);
      logInfo(`${BUNDLE}DataSourceFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0081
     * @tc.name      DragAndExchange_DataSourceFlow_0081
     * @tc.desc      DataSource call flow totalCount > getData > totalCount > notifyDataChange > notifyDataChange kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0081 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: AppInfo = subject.getData(3.34);
      logInfo(`step2 getData(3.34): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataChange(83);
      subject.notifyDataChange(84.66);
      logInfo(`${BUNDLE}DataSourceFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0082
     * @tc.name      DragAndExchange_DataSourceFlow_0082
     * @tc.desc      DataSource call flow notifyDataChange > notifyDataMove > pushData > notifyDataReload > totalCoun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0082 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(190);
      subject.notifyDataMove(35, 100);
      subject.pushData(new AppInfo());
      subject.notifyDataReload();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0083
     * @tc.name      DragAndExchange_DataSourceFlow_0083
     * @tc.desc      DataSource call flow pushData > totalCount > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0083 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushData(new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}DataSourceFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0084
     * @tc.name      DragAndExchange_DataSourceFlow_0084
     * @tc.desc      DataSource call flow pushData > notifyDataMove > totalCount > pushData > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0084 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.notifyDataMove(20, 95);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new AppInfo());
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}DataSourceFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0085
     * @tc.name      DragAndExchange_DataSourceFlow_0085
     * @tc.desc      DataSource call flow getData > getData > getData > setData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0085 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(42.65);
      logInfo(`step1 getData(42.65): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: AppInfo = subject.getData(175);
      logInfo(`step2 getData(175): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: AppInfo = subject.getData(33);
      logInfo(`step3 getData(33): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.setData(50, new AppInfo());
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0086
     * @tc.name      DragAndExchange_DataSourceFlow_0086
     * @tc.desc      DataSource call flow setData > notifyDataMove > totalCount > getData > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0086 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(45, new AppInfo());
      subject.notifyDataMove(0, 3);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(46);
      const step4: AppInfo = subject.getData(55);
      logInfo(`step4 getData(55): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(46);
      logInfo(`${BUNDLE}DataSourceFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0087
     * @tc.name      DragAndExchange_DataSourceFlow_0087
     * @tc.desc      DataSource call flow totalCount > notifyDataChange > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0087 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(17);
      const step3: AppInfo = subject.getData(-83);
      logInfo(`step3 getData(-83): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0088
     * @tc.name      DragAndExchange_DataSourceFlow_0088
     * @tc.desc      DataSource call flow getData > pushData > notifyDataReload > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0088 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(90.15);
      logInfo(`step1 getData(90.15): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new AppInfo());
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0089
     * @tc.name      DragAndExchange_DataSourceFlow_0089
     * @tc.desc      DataSource call flow notifyDataMove > pushData > totalCount > getData > notifyDataChange keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0089 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(-68, 15);
      subject.pushData(new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: AppInfo = subject.getData(74.97);
      logInfo(`step4 getData(74.97): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.notifyDataChange(56);
      logInfo(`${BUNDLE}DataSourceFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0090
     * @tc.name      DragAndExchange_DataSourceFlow_0090
     * @tc.desc      DataSource call flow getData > notifyDataMove > totalCount > setData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0090 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(25);
      logInfo(`step1 getData(25): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataMove(15, 20);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.setData(55, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0091
     * @tc.name      DragAndExchange_DataSourceFlow_0091
     * @tc.desc      DataSource call flow notifyDataMove > setData > notifyDataReload > totalCount > pushData keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0091 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(0, 115);
      subject.setData(35, new AppInfo());
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(36);
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0092
     * @tc.name      DragAndExchange_DataSourceFlow_0092
     * @tc.desc      DataSource call flow setData > setData > getData > totalCount > notifyDataChange keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0092 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(0.65, new AppInfo());
      subject.setData(1, new AppInfo());
      const step3: AppInfo = subject.getData(79.01);
      logInfo(`step3 getData(79.01): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.notifyDataChange(172);
      logInfo(`${BUNDLE}DataSourceFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0093
     * @tc.name      DragAndExchange_DataSourceFlow_0093
     * @tc.desc      DataSource call flow notifyDataReload > getData > notifyDataMove > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0093 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      const step2: AppInfo = subject.getData(90.15);
      logInfo(`step2 getData(90.15): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataMove(50, 55);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0094
     * @tc.name      DragAndExchange_DataSourceFlow_0094
     * @tc.desc      DataSource call flow setData > totalCount > notifyDataChange > notifyDataReload keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0094 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(65, new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(66);
      subject.notifyDataChange(83);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0095
     * @tc.name      DragAndExchange_DataSourceFlow_0095
     * @tc.desc      DataSource call flow getData > notifyDataReload > totalCount > getData > pushData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0095 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(129);
      logInfo(`step1 getData(129): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataReload();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: AppInfo = subject.getData(45);
      logInfo(`step4 getData(45): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0096
     * @tc.name      DragAndExchange_DataSourceFlow_0096
     * @tc.desc      DataSource call flow notifyDataChange > setData > notifyDataAdd > totalCount > notifyDataAdd kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0096 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(165);
      subject.setData(3, new AppInfo());
      subject.notifyDataAdd(5);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      subject.notifyDataAdd(22);
      logInfo(`${BUNDLE}DataSourceFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0097
     * @tc.name      DragAndExchange_DataSourceFlow_0097
     * @tc.desc      DataSource call flow totalCount > pushData > setData > totalCount > notifyDataChange keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0097 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new AppInfo());
      subject.setData(0, new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.notifyDataChange(110);
      logInfo(`${BUNDLE}DataSourceFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0098
     * @tc.name      DragAndExchange_DataSourceFlow_0098
     * @tc.desc      DataSource call flow getData > getData > totalCount > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0098 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(165);
      logInfo(`step1 getData(165): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: AppInfo = subject.getData(160);
      logInfo(`step2 getData(160): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataAdd(50);
      logInfo(`${BUNDLE}DataSourceFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0099
     * @tc.name      DragAndExchange_DataSourceFlow_0099
     * @tc.desc      DataSource call flow notifyDataAdd > totalCount > totalCount > getData > pushData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0099 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(10);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: AppInfo = subject.getData(17);
      logInfo(`step4 getData(17): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0100
     * @tc.name      DragAndExchange_DataSourceFlow_0100
     * @tc.desc      DataSource call flow getData > notifyDataChange > setData > notifyDataChange > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0100 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(47);
      logInfo(`step1 getData(47): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataChange(1);
      subject.setData(80, new AppInfo());
      subject.notifyDataChange(-31);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(81);
      logInfo(`${BUNDLE}DataSourceFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0101
     * @tc.name      DragAndExchange_DataSourceFlow_0101
     * @tc.desc      DataSource call flow getData > setData > notifyDataMove > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0101 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(74.97);
      logInfo(`step1 getData(74.97): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.setData(15, new AppInfo());
      subject.notifyDataMove(0, 35);
      const step4: AppInfo = subject.getData(-21);
      logInfo(`step4 getData(-21): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: AppInfo = subject.getData(-36);
      logInfo(`step5 getData(-36): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0102
     * @tc.name      DragAndExchange_DataSourceFlow_0102
     * @tc.desc      DataSource call flow notifyDataMove > setData > notifyDataChange > totalCount > totalCount keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0102 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(15, 20);
      subject.setData(0.65, new AppInfo());
      subject.notifyDataChange(23.37);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0103
     * @tc.name      DragAndExchange_DataSourceFlow_0103
     * @tc.desc      DataSource call flow pushData > totalCount > totalCount > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0103 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.notifyDataMove(15, 20);
      logInfo(`${BUNDLE}DataSourceFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0104
     * @tc.name      DragAndExchange_DataSourceFlow_0104
     * @tc.desc      DataSource call flow setData > totalCount > notifyDataReload > notifyDataAdd > notifyDataReload ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0104 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(35, new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(36);
      subject.notifyDataReload();
      subject.notifyDataAdd(23);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0105
     * @tc.name      DragAndExchange_DataSourceFlow_0105
     * @tc.desc      DataSource call flow setData > notifyDataReload > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0105 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(110, new AppInfo());
      subject.notifyDataReload();
      subject.pushData(new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(112);
      logInfo(`${BUNDLE}DataSourceFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0106
     * @tc.name      DragAndExchange_DataSourceFlow_0106
     * @tc.desc      DataSource call flow notifyDataChange > totalCount > totalCount > pushData > notifyDataChange ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0106 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(90);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushData(new AppInfo());
      subject.notifyDataChange(10);
      logInfo(`${BUNDLE}DataSourceFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0107
     * @tc.name      DragAndExchange_DataSourceFlow_0107
     * @tc.desc      DataSource call flow setData > totalCount > notifyDataMove > notifyDataReload > notifyDataChange...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0107 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(3, new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(4);
      subject.notifyDataMove(0, 95);
      subject.notifyDataReload();
      subject.notifyDataChange(-70);
      logInfo(`${BUNDLE}DataSourceFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0108
     * @tc.name      DragAndExchange_DataSourceFlow_0108
     * @tc.desc      DataSource call flow notifyDataAdd > setData > notifyDataReload > totalCount > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0108 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(160);
      subject.setData(2, new AppInfo());
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}DataSourceFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0109
     * @tc.name      DragAndExchange_DataSourceFlow_0109
     * @tc.desc      DataSource call flow totalCount > totalCount > getData > totalCount > notifyDataChange keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0109 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: AppInfo = subject.getData(74.97);
      logInfo(`step3 getData(74.97): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataChange(-17);
      logInfo(`${BUNDLE}DataSourceFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0110
     * @tc.name      DragAndExchange_DataSourceFlow_0110
     * @tc.desc      DataSource call flow totalCount > notifyDataReload > notifyDataChange > totalCount > getData kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0110 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataReload();
      subject.notifyDataChange(-16);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: AppInfo = subject.getData(42.65);
      logInfo(`step5 getData(42.65): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0111
     * @tc.name      DragAndExchange_DataSourceFlow_0111
     * @tc.desc      DataSource call flow getData > notifyDataReload > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0111 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(141);
      logInfo(`step1 getData(141): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataReload();
      subject.notifyDataChange(95);
      logInfo(`${BUNDLE}DataSourceFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0112
     * @tc.name      DragAndExchange_DataSourceFlow_0112
     * @tc.desc      DataSource call flow getData > notifyDataReload > notifyDataMove > setData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0112 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(130);
      logInfo(`step1 getData(130): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataReload();
      subject.notifyDataMove(0, 2);
      subject.setData(90, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0113
     * @tc.name      DragAndExchange_DataSourceFlow_0113
     * @tc.desc      DataSource call flow pushData > notifyDataAdd > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0113 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.notifyDataAdd(67);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0114
     * @tc.name      DragAndExchange_DataSourceFlow_0114
     * @tc.desc      DataSource call flow totalCount > setData > notifyDataAdd > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0114 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setData(105, new AppInfo());
      subject.notifyDataAdd(80);
      subject.notifyDataAdd(40);
      logInfo(`${BUNDLE}DataSourceFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0115
     * @tc.name      DragAndExchange_DataSourceFlow_0115
     * @tc.desc      DataSource call flow totalCount > notifyDataChange > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0115 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(150);
      subject.notifyDataAdd(95.65);
      logInfo(`${BUNDLE}DataSourceFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0116
     * @tc.name      DragAndExchange_DataSourceFlow_0116
     * @tc.desc      DataSource call flow totalCount > notifyDataChange > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0116 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(54.54);
      subject.pushData(new AppInfo());
      const step4: AppInfo = subject.getData(195);
      logInfo(`step4 getData(195): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0117
     * @tc.name      DragAndExchange_DataSourceFlow_0117
     * @tc.desc      DataSource call flow totalCount > setData > notifyDataAdd > notifyDataReload > notifyDataAdd kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0117 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setData(20, new AppInfo());
      subject.notifyDataAdd(160);
      subject.notifyDataReload();
      subject.notifyDataAdd(93.96);
      logInfo(`${BUNDLE}DataSourceFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0118
     * @tc.name      DragAndExchange_DataSourceFlow_0118
     * @tc.desc      DataSource call flow getData > pushData > notifyDataMove > notifyDataReload > setData keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0118 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(15);
      logInfo(`step1 getData(15): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new AppInfo());
      subject.notifyDataMove(45.68, 100);
      subject.notifyDataReload();
      subject.setData(10, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0119
     * @tc.name      DragAndExchange_DataSourceFlow_0119
     * @tc.desc      DataSource call flow notifyDataMove > totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0119 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(-68, 15);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0120
     * @tc.name      DragAndExchange_DataSourceFlow_0120
     * @tc.desc      DataSource call flow pushData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0120 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0121
     * @tc.name      DragAndExchange_DataSourceFlow_0121
     * @tc.desc      DataSource call flow notifyDataAdd > notifyDataMove > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0121 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(96.89);
      subject.notifyDataMove(50, 60);
      const step3: AppInfo = subject.getData(166);
      logInfo(`step3 getData(166): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0122
     * @tc.name      DragAndExchange_DataSourceFlow_0122
     * @tc.desc      DataSource call flow getData > notifyDataReload > notifyDataMove > notifyDataAdd keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0122 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(72);
      logInfo(`step1 getData(72): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataReload();
      subject.notifyDataMove(45.68, 0);
      subject.notifyDataAdd(10);
      logInfo(`${BUNDLE}DataSourceFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0123
     * @tc.name      DragAndExchange_DataSourceFlow_0123
     * @tc.desc      DataSource call flow getData > setData > notifyDataAdd > getData > notifyDataMove keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0123 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(42.65);
      logInfo(`step1 getData(42.65): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.setData(100, new AppInfo());
      subject.notifyDataAdd(114);
      const step4: AppInfo = subject.getData(15.06);
      logInfo(`step4 getData(15.06): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.notifyDataMove(50, 0);
      logInfo(`${BUNDLE}DataSourceFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0124
     * @tc.name      DragAndExchange_DataSourceFlow_0124
     * @tc.desc      DataSource call flow setData > notifyDataChange > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0124 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(85, new AppInfo());
      subject.notifyDataChange(35.05);
      const step3: AppInfo = subject.getData(54);
      logInfo(`step3 getData(54): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0125
     * @tc.name      DragAndExchange_DataSourceFlow_0125
     * @tc.desc      DataSource call flow getData > notifyDataReload > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0125 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(0);
      logInfo(`step1 getData(0): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataReload();
      subject.notifyDataChange(50);
      logInfo(`${BUNDLE}DataSourceFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0126
     * @tc.name      DragAndExchange_DataSourceFlow_0126
     * @tc.desc      DataSource call flow notifyDataChange > pushData > notifyDataChange > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0126 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(56);
      subject.pushData(new AppInfo());
      subject.notifyDataChange(-15);
      const step4: AppInfo = subject.getData(125);
      logInfo(`step4 getData(125): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0127
     * @tc.name      DragAndExchange_DataSourceFlow_0127
     * @tc.desc      DataSource call flow notifyDataChange > getData > notifyDataAdd > notifyDataChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0127 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(86.56);
      const step2: AppInfo = subject.getData(90.15);
      logInfo(`step2 getData(90.15): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataAdd(7.81);
      subject.notifyDataChange(84.66);
      logInfo(`${BUNDLE}DataSourceFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0128
     * @tc.name      DragAndExchange_DataSourceFlow_0128
     * @tc.desc      DataSource call flow notifyDataMove > notifyDataAdd > notifyDataChange > getData > notifyDataMov...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0128 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(15, 20);
      subject.notifyDataAdd(2);
      subject.notifyDataChange(135);
      const step4: AppInfo = subject.getData(13.59);
      logInfo(`step4 getData(13.59): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.notifyDataMove(20, 39);
      logInfo(`${BUNDLE}DataSourceFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0129
     * @tc.name      DragAndExchange_DataSourceFlow_0129
     * @tc.desc      DataSource call flow getData > totalCount > notifyDataAdd > notifyDataChange > setData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0129 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(46);
      logInfo(`step1 getData(46): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataAdd(85);
      subject.notifyDataChange(-84);
      subject.setData(65, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0130
     * @tc.name      DragAndExchange_DataSourceFlow_0130
     * @tc.desc      DataSource call flow getData > notifyDataMove > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0130 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(110);
      logInfo(`step1 getData(110): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataMove(0, 75);
      subject.notifyDataAdd(95);
      logInfo(`${BUNDLE}DataSourceFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0131
     * @tc.name      DragAndExchange_DataSourceFlow_0131
     * @tc.desc      DataSource call flow totalCount > totalCount > pushData > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0131 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new AppInfo());
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0132
     * @tc.name      DragAndExchange_DataSourceFlow_0132
     * @tc.desc      DataSource call flow totalCount > notifyDataAdd > notifyDataMove > setData > notifyDataReload ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0132 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(2);
      subject.notifyDataMove(70, 110);
      subject.setData(1, new AppInfo());
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0133
     * @tc.name      DragAndExchange_DataSourceFlow_0133
     * @tc.desc      DataSource call flow notifyDataAdd > setData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0133 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(2);
      subject.setData(65, new AppInfo());
      const step3: AppInfo = subject.getData(110);
      logInfo(`step3 getData(110): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0134
     * @tc.name      DragAndExchange_DataSourceFlow_0134
     * @tc.desc      DataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0134 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0135
     * @tc.name      DragAndExchange_DataSourceFlow_0135
     * @tc.desc      DataSource call flow getData > notifyDataChange > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0135 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(90);
      logInfo(`step1 getData(90): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataChange(165);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0136
     * @tc.name      DragAndExchange_DataSourceFlow_0136
     * @tc.desc      DataSource call flow totalCount > getData > notifyDataReload > notifyDataReload keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0136 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: AppInfo = subject.getData(140);
      logInfo(`step2 getData(140): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataReload();
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0136 end`);
    });
  });
}
