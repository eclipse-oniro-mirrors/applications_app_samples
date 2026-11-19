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

/** Logic checks for DataSource flow (70 cases). */
export default function dataSourceFlowTest(): void {
  describe('DataSourceFlowTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0001
     * @tc.name      DragAndExchange_DataSourceFlow_0001
     * @tc.desc      DataSource call flow totalCount > totalCount > pushData > setData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DataSourceFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0001 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new AppInfo());
      subject.setData(-6, new AppInfo());
      const step5: AppInfo = subject.getData(133);
      logInfo(`step5 getData(133): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0002
     * @tc.name      DragAndExchange_DataSourceFlow_0002
     * @tc.desc      DataSource call flow totalCount > notifyDataChange > notifyDataReload > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DataSourceFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0002 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(50.7);
      subject.notifyDataReload();
      const step4: AppInfo = subject.getData(129);
      logInfo(`step4 getData(129): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0003
     * @tc.name      DragAndExchange_DataSourceFlow_0003
     * @tc.desc      DataSource call flow setData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0003 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(31.82, new AppInfo());
      subject.pushData(new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0004
     * @tc.name      DragAndExchange_DataSourceFlow_0004
     * @tc.desc      DataSource call flow notifyDataReload > notifyDataChange > getData > notifyDataMove > setData ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0004 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      subject.notifyDataChange(-15);
      const step3: AppInfo = subject.getData(72);
      logInfo(`step3 getData(72): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataMove(60, 0);
      subject.setData(0.65, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0005
     * @tc.name      DragAndExchange_DataSourceFlow_0005
     * @tc.desc      DataSource call flow notifyDataReload > totalCount > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0005 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0006
     * @tc.name      DragAndExchange_DataSourceFlow_0006
     * @tc.desc      DataSource call flow getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0006 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(-35);
      logInfo(`step1 getData(-35): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0007
     * @tc.name      DragAndExchange_DataSourceFlow_0007
     * @tc.desc      DataSource call flow totalCount > totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0007 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0008
     * @tc.name      DragAndExchange_DataSourceFlow_0008
     * @tc.desc      DataSource call flow notifyDataAdd > notifyDataReload > notifyDataReload > totalCount > setData ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0008 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(2);
      subject.notifyDataReload();
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.setData(25, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0009
     * @tc.name      DragAndExchange_DataSourceFlow_0009
     * @tc.desc      DataSource call flow getData > totalCount > notifyDataReload > pushData > notifyDataReload keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0009 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(54);
      logInfo(`step1 getData(54): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      subject.pushData(new AppInfo());
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0010
     * @tc.name      DragAndExchange_DataSourceFlow_0010
     * @tc.desc      DataSource call flow notifyDataAdd > getData > setData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0010 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(-20);
      const step2: AppInfo = subject.getData(90);
      logInfo(`step2 getData(90): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.setData(60, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0011
     * @tc.name      DragAndExchange_DataSourceFlow_0011
     * @tc.desc      DataSource call flow notifyDataChange > notifyDataReload > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0011 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(-16);
      subject.notifyDataReload();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0012
     * @tc.name      DragAndExchange_DataSourceFlow_0012
     * @tc.desc      DataSource call flow totalCount > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0012 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(17);
      logInfo(`${BUNDLE}DataSourceFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0013
     * @tc.name      DragAndExchange_DataSourceFlow_0013
     * @tc.desc      DataSource call flow totalCount > notifyDataMove > notifyDataAdd > totalCount > notifyDataReload...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0013 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(110, 2);
      subject.notifyDataAdd(88.41);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0014
     * @tc.name      DragAndExchange_DataSourceFlow_0014
     * @tc.desc      DataSource call flow notifyDataMove > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0014 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(40, 35);
      const step2: AppInfo = subject.getData(-72);
      logInfo(`step2 getData(-72): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0015
     * @tc.name      DragAndExchange_DataSourceFlow_0015
     * @tc.desc      DataSource call flow pushData > setData > setData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0015 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.setData(0.65, new AppInfo());
      subject.setData(55, new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(56);
      logInfo(`${BUNDLE}DataSourceFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0016
     * @tc.name      DragAndExchange_DataSourceFlow_0016
     * @tc.desc      DataSource call flow notifyDataMove > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0016 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(0, 30);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0017
     * @tc.name      DragAndExchange_DataSourceFlow_0017
     * @tc.desc      DataSource call flow pushData > totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0017 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0018
     * @tc.name      DragAndExchange_DataSourceFlow_0018
     * @tc.desc      DataSource call flow getData > setData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0018 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(45.56);
      logInfo(`step1 getData(45.56): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.setData(95, new AppInfo());
      subject.pushData(new AppInfo());
      const step4: AppInfo = subject.getData(145);
      logInfo(`step4 getData(145): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0019
     * @tc.name      DragAndExchange_DataSourceFlow_0019
     * @tc.desc      DataSource call flow notifyDataChange > setData > notifyDataReload > notifyDataReload > totalCou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0019 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(-96);
      subject.setData(31.82, new AppInfo());
      subject.notifyDataReload();
      subject.notifyDataReload();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0020
     * @tc.name      DragAndExchange_DataSourceFlow_0020
     * @tc.desc      DataSource call flow notifyDataChange > notifyDataAdd > setData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0020 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(-70);
      subject.notifyDataAdd(93.96);
      subject.setData(105, new AppInfo());
      const step4: AppInfo = subject.getData(15.06);
      logInfo(`step4 getData(15.06): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0021
     * @tc.name      DragAndExchange_DataSourceFlow_0021
     * @tc.desc      DataSource call flow getData > notifyDataReload > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0021 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(55.68);
      logInfo(`step1 getData(55.68): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataReload();
      const step3: AppInfo = subject.getData(15);
      logInfo(`step3 getData(15): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0022
     * @tc.name      DragAndExchange_DataSourceFlow_0022
     * @tc.desc      DataSource call flow totalCount > getData > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0022 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: AppInfo = subject.getData(92.86);
      logInfo(`step2 getData(92.86): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataAdd(2);
      logInfo(`${BUNDLE}DataSourceFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0023
     * @tc.name      DragAndExchange_DataSourceFlow_0023
     * @tc.desc      DataSource call flow setData > notifyDataReload > notifyDataReload > totalCount > totalCount kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0023 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(105, new AppInfo());
      subject.notifyDataReload();
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(106);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(106);
      logInfo(`${BUNDLE}DataSourceFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0024
     * @tc.name      DragAndExchange_DataSourceFlow_0024
     * @tc.desc      DataSource call flow setData > setData > setData > setData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0024 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(35, new AppInfo());
      subject.setData(60, new AppInfo());
      subject.setData(110, new AppInfo());
      subject.setData(15, new AppInfo());
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(111);
      logInfo(`${BUNDLE}DataSourceFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0025
     * @tc.name      DragAndExchange_DataSourceFlow_0025
     * @tc.desc      DataSource call flow getData > notifyDataMove > notifyDataChange > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0025 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(4.72);
      logInfo(`step1 getData(4.72): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataMove(95, 95);
      subject.notifyDataChange(170);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0026
     * @tc.name      DragAndExchange_DataSourceFlow_0026
     * @tc.desc      DataSource call flow notifyDataAdd > getData > getData > notifyDataReload > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0026 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(79);
      const step2: AppInfo = subject.getData(-21);
      logInfo(`step2 getData(-21): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: AppInfo = subject.getData(26.96);
      logInfo(`step3 getData(26.96): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataReload();
      const step5: AppInfo = subject.getData(75.24);
      logInfo(`step5 getData(75.24): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0027
     * @tc.name      DragAndExchange_DataSourceFlow_0027
     * @tc.desc      DataSource call flow totalCount > pushData > notifyDataChange > setData > totalCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0027 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new AppInfo());
      subject.notifyDataChange(7);
      subject.setData(50, new AppInfo());
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(51);
      logInfo(`${BUNDLE}DataSourceFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0028
     * @tc.name      DragAndExchange_DataSourceFlow_0028
     * @tc.desc      DataSource call flow getData > pushData > totalCount > notifyDataReload > notifyDataChange keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0028 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(91.03);
      logInfo(`step1 getData(91.03): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.notifyDataReload();
      subject.notifyDataChange(65);
      logInfo(`${BUNDLE}DataSourceFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0029
     * @tc.name      DragAndExchange_DataSourceFlow_0029
     * @tc.desc      DataSource call flow setData > notifyDataAdd > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0029 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(95, new AppInfo());
      subject.notifyDataAdd(34.62);
      subject.pushData(new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(97);
      logInfo(`${BUNDLE}DataSourceFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0030
     * @tc.name      DragAndExchange_DataSourceFlow_0030
     * @tc.desc      DataSource call flow pushData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0030 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0031
     * @tc.name      DragAndExchange_DataSourceFlow_0031
     * @tc.desc      DataSource call flow notifyDataAdd > getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0031 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(17);
      const step2: AppInfo = subject.getData(23.14);
      logInfo(`step2 getData(23.14): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0032
     * @tc.name      DragAndExchange_DataSourceFlow_0032
     * @tc.desc      DataSource call flow pushData > pushData > totalCount > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0032 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.pushData(new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.notifyDataAdd(35);
      logInfo(`${BUNDLE}DataSourceFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0033
     * @tc.name      DragAndExchange_DataSourceFlow_0033
     * @tc.desc      DataSource call flow notifyDataMove > totalCount > setData > getData > notifyDataAdd keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0033 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(0, 95);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.setData(55, new AppInfo());
      const step4: AppInfo = subject.getData(25.4);
      logInfo(`step4 getData(25.4): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.notifyDataAdd(190);
      logInfo(`${BUNDLE}DataSourceFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0034
     * @tc.name      DragAndExchange_DataSourceFlow_0034
     * @tc.desc      DataSource call flow totalCount > notifyDataAdd > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0034 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(-75);
      const step3: AppInfo = subject.getData(-47);
      logInfo(`step3 getData(-47): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0035
     * @tc.name      DragAndExchange_DataSourceFlow_0035
     * @tc.desc      DataSource call flow notifyDataAdd > setData > totalCount > notifyDataChange > getData keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0035 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(-20);
      subject.setData(0.65, new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataChange(-1);
      const step5: AppInfo = subject.getData(42.65);
      logInfo(`step5 getData(42.65): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0036
     * @tc.name      DragAndExchange_DataSourceFlow_0036
     * @tc.desc      DataSource call flow pushData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0036 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      const step2: AppInfo = subject.getData(155);
      logInfo(`step2 getData(155): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0037
     * @tc.name      DragAndExchange_DataSourceFlow_0037
     * @tc.desc      DataSource call flow setData > notifyDataReload > notifyDataMove > totalCount > notifyDataReload...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0037 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(50, new AppInfo());
      subject.notifyDataReload();
      subject.notifyDataMove(1, 15);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(51);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0038
     * @tc.name      DragAndExchange_DataSourceFlow_0038
     * @tc.desc      DataSource call flow notifyDataReload > notifyDataAdd > totalCount > totalCount > notifyDataAdd ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0038 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      subject.notifyDataAdd(155);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataAdd(158);
      logInfo(`${BUNDLE}DataSourceFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0039
     * @tc.name      DragAndExchange_DataSourceFlow_0039
     * @tc.desc      DataSource call flow notifyDataAdd > pushData > setData > notifyDataChange > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0039 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(-14);
      subject.pushData(new AppInfo());
      subject.setData(30, new AppInfo());
      subject.notifyDataChange(50);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(31);
      logInfo(`${BUNDLE}DataSourceFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0040
     * @tc.name      DragAndExchange_DataSourceFlow_0040
     * @tc.desc      DataSource call flow notifyDataReload > totalCount > getData > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0040 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: AppInfo = subject.getData(168);
      logInfo(`step3 getData(168): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataAdd(28.93);
      logInfo(`${BUNDLE}DataSourceFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0041
     * @tc.name      DragAndExchange_DataSourceFlow_0041
     * @tc.desc      DataSource call flow notifyDataReload > setData > getData > notifyDataMove > getData keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0041 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      subject.setData(30, new AppInfo());
      const step3: AppInfo = subject.getData(-33);
      logInfo(`step3 getData(-33): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataMove(50, 0);
      const step5: AppInfo = subject.getData(156);
      logInfo(`step5 getData(156): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0042
     * @tc.name      DragAndExchange_DataSourceFlow_0042
     * @tc.desc      DataSource call flow totalCount > getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0042 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: AppInfo = subject.getData(166);
      logInfo(`step2 getData(166): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0043
     * @tc.name      DragAndExchange_DataSourceFlow_0043
     * @tc.desc      DataSource call flow totalCount > pushData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0043 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0044
     * @tc.name      DragAndExchange_DataSourceFlow_0044
     * @tc.desc      DataSource call flow notifyDataMove > setData > totalCount > setData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0044 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(0, 30);
      subject.setData(45, new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(46);
      subject.setData(15, new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0045
     * @tc.name      DragAndExchange_DataSourceFlow_0045
     * @tc.desc      DataSource call flow notifyDataAdd > setData > setData > notifyDataAdd > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0045 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(39);
      subject.setData(100, new AppInfo());
      subject.setData(60, new AppInfo());
      subject.notifyDataAdd(10);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(101);
      logInfo(`${BUNDLE}DataSourceFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0046
     * @tc.name      DragAndExchange_DataSourceFlow_0046
     * @tc.desc      DataSource call flow notifyDataAdd > setData > setData > totalCount > notifyDataAdd keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0046 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(15);
      subject.setData(70, new AppInfo());
      subject.setData(15, new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(71);
      subject.notifyDataAdd(55);
      logInfo(`${BUNDLE}DataSourceFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0047
     * @tc.name      DragAndExchange_DataSourceFlow_0047
     * @tc.desc      DataSource call flow pushData > notifyDataChange > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0047 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.notifyDataChange(5);
      const step3: AppInfo = subject.getData(-72);
      logInfo(`step3 getData(-72): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: AppInfo = subject.getData(100);
      logInfo(`step4 getData(100): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0048
     * @tc.name      DragAndExchange_DataSourceFlow_0048
     * @tc.desc      DataSource call flow pushData > notifyDataAdd > notifyDataReload > notifyDataReload > getData ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0048 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.notifyDataAdd(-17);
      subject.notifyDataReload();
      subject.notifyDataReload();
      const step5: AppInfo = subject.getData(33);
      logInfo(`step5 getData(33): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0049
     * @tc.name      DragAndExchange_DataSourceFlow_0049
     * @tc.desc      DataSource call flow notifyDataAdd > notifyDataMove > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0049 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataAdd(100);
      subject.notifyDataMove(-1, 0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: AppInfo = subject.getData(120);
      logInfo(`step4 getData(120): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0050
     * @tc.name      DragAndExchange_DataSourceFlow_0050
     * @tc.desc      DataSource call flow pushData > pushData > getData > setData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0050 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.pushData(new AppInfo());
      const step3: AppInfo = subject.getData(0);
      logInfo(`step3 getData(0): step3.icon=${step3.icon}`);
      expect(step3.icon).assertEqual('');
      logInfo(`step3 getData(0): step3.name=${step3.name}`);
      expect(step3.name).assertEqual('');
      subject.setData(75, new AppInfo());
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0051
     * @tc.name      DragAndExchange_DataSourceFlow_0051
     * @tc.desc      DataSource call flow getData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0051 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(14.57);
      logInfo(`step1 getData(14.57): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0052
     * @tc.name      DragAndExchange_DataSourceFlow_0052
     * @tc.desc      DataSource call flow totalCount > notifyDataMove > totalCount > notifyDataAdd > getData keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0052 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(10, 50);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataAdd(112);
      const step5: AppInfo = subject.getData(70);
      logInfo(`step5 getData(70): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0053
     * @tc.name      DragAndExchange_DataSourceFlow_0053
     * @tc.desc      DataSource call flow notifyDataChange > notifyDataAdd > notifyDataReload > totalCount > getData ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0053 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(46);
      subject.notifyDataAdd(150);
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: AppInfo = subject.getData(-54);
      logInfo(`step5 getData(-54): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0054
     * @tc.name      DragAndExchange_DataSourceFlow_0054
     * @tc.desc      DataSource call flow pushData > notifyDataMove > setData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0054 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.notifyDataMove(40, 60);
      subject.setData(75, new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(76);
      logInfo(`${BUNDLE}DataSourceFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0055
     * @tc.name      DragAndExchange_DataSourceFlow_0055
     * @tc.desc      DataSource call flow setData > notifyDataReload > notifyDataChange > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0055 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(2, new AppInfo());
      subject.notifyDataReload();
      subject.notifyDataChange(196);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}DataSourceFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0056
     * @tc.name      DragAndExchange_DataSourceFlow_0056
     * @tc.desc      DataSource call flow setData > notifyDataReload > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0056 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(-6, new AppInfo());
      subject.notifyDataReload();
      const step3: AppInfo = subject.getData(92.86);
      logInfo(`step3 getData(92.86): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0057
     * @tc.name      DragAndExchange_DataSourceFlow_0057
     * @tc.desc      DataSource call flow getData > getData > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0057 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(-12);
      logInfo(`step1 getData(-12): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: AppInfo = subject.getData(118);
      logInfo(`step2 getData(118): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataAdd(90);
      logInfo(`${BUNDLE}DataSourceFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0058
     * @tc.name      DragAndExchange_DataSourceFlow_0058
     * @tc.desc      DataSource call flow notifyDataMove > getData > notifyDataAdd > totalCount > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0058 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(105, 25);
      const step2: AppInfo = subject.getData(20);
      logInfo(`step2 getData(20): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataAdd(22);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0059
     * @tc.name      DragAndExchange_DataSourceFlow_0059
     * @tc.desc      DataSource call flow notifyDataReload > notifyDataMove > getData > totalCount > getData keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0059 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataReload();
      subject.notifyDataMove(3, 0);
      const step3: AppInfo = subject.getData(15);
      logInfo(`step3 getData(15): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: AppInfo = subject.getData(-12);
      logInfo(`step5 getData(-12): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0060
     * @tc.name      DragAndExchange_DataSourceFlow_0060
     * @tc.desc      DataSource call flow pushData > setData > notifyDataMove > totalCount > notifyDataAdd keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0060 begin`);
      const subject: DataSource = new DataSource();
      subject.pushData(new AppInfo());
      subject.setData(-6, new AppInfo());
      subject.notifyDataMove(55, 110);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.notifyDataAdd(12);
      logInfo(`${BUNDLE}DataSourceFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0061
     * @tc.name      DragAndExchange_DataSourceFlow_0061
     * @tc.desc      DataSource call flow getData > notifyDataChange > getData > totalCount > notifyDataMove keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0061 begin`);
      const subject: DataSource = new DataSource();
      const step1: AppInfo = subject.getData(177);
      logInfo(`step1 getData(177): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataChange(149);
      const step3: AppInfo = subject.getData(175);
      logInfo(`step3 getData(175): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataMove(75, 75);
      logInfo(`${BUNDLE}DataSourceFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0062
     * @tc.name      DragAndExchange_DataSourceFlow_0062
     * @tc.desc      DataSource call flow notifyDataChange > getData > getData > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0062 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(175);
      const step2: AppInfo = subject.getData(130);
      logInfo(`step2 getData(130): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: AppInfo = subject.getData(91.03);
      logInfo(`step3 getData(91.03): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0063
     * @tc.name      DragAndExchange_DataSourceFlow_0063
     * @tc.desc      DataSource call flow setData > totalCount > setData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0063 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(85, new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(86);
      subject.setData(25, new AppInfo());
      const step4: AppInfo = subject.getData(19);
      logInfo(`step4 getData(19): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0064
     * @tc.name      DragAndExchange_DataSourceFlow_0064
     * @tc.desc      DataSource call flow totalCount > notifyDataMove > totalCount > notifyDataMove > notifyDataAdd k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0064 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(0, 5);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataMove(85, 85);
      subject.notifyDataAdd(190);
      logInfo(`${BUNDLE}DataSourceFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0065
     * @tc.name      DragAndExchange_DataSourceFlow_0065
     * @tc.desc      DataSource call flow totalCount > notifyDataChange > setData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0065 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(130);
      subject.setData(90, new AppInfo());
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(91);
      logInfo(`${BUNDLE}DataSourceFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0066
     * @tc.name      DragAndExchange_DataSourceFlow_0066
     * @tc.desc      DataSource call flow setData > totalCount > setData > notifyDataChange > pushData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0066 begin`);
      const subject: DataSource = new DataSource();
      subject.setData(75, new AppInfo());
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(76);
      subject.setData(30, new AppInfo());
      subject.notifyDataChange(133);
      subject.pushData(new AppInfo());
      logInfo(`${BUNDLE}DataSourceFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0067
     * @tc.name      DragAndExchange_DataSourceFlow_0067
     * @tc.desc      DataSource call flow totalCount > notifyDataReload > totalCount > totalCount > notifyDataReload ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0067 begin`);
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
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0068
     * @tc.name      DragAndExchange_DataSourceFlow_0068
     * @tc.desc      DataSource call flow totalCount > notifyDataReload > setData > pushData > totalCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0068 begin`);
      const subject: DataSource = new DataSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataReload();
      subject.setData(3, new AppInfo());
      subject.pushData(new AppInfo());
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(5);
      logInfo(`${BUNDLE}DataSourceFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0069
     * @tc.name      DragAndExchange_DataSourceFlow_0069
     * @tc.desc      DataSource call flow notifyDataMove > pushData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0069 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataMove(0, 50);
      subject.pushData(new AppInfo());
      const step3: AppInfo = subject.getData(-47);
      logInfo(`step3 getData(-47): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_FLOW_0070
     * @tc.name      DragAndExchange_DataSourceFlow_0070
     * @tc.desc      DataSource call flow notifyDataChange > setData > totalCount > notifyDataReload > totalCount kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceFlow_0070 begin`);
      const subject: DataSource = new DataSource();
      subject.notifyDataChange(-43);
      subject.setData(-6, new AppInfo());
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataReload();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceFlow_0070 end`);
    });
  });
}
