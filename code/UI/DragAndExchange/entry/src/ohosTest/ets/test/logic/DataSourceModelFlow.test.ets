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
import { DataSourceModel } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for DataSourceModel flow (69 cases). */
export default function dataSourceModelFlowTest(): void {
  describe('DataSourceModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0001
     * @tc.name      DragAndExchange_DataSourceModelFlow_0001
     * @tc.desc      DataSourceModel call flow pushData > order > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DataSourceModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0001 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('u');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["u"]');
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0002
     * @tc.name      DragAndExchange_DataSourceModelFlow_0002
     * @tc.desc      DataSourceModel call flow order > listenerCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_DataSourceModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0002 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0003
     * @tc.name      DragAndExchange_DataSourceModelFlow_0003
     * @tc.desc      DataSourceModel call flow notifyDataReload > getData > unregisterDataChangeListener keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0003 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      const step2: string = subject.getData(36);
      logInfo(`step2 getData(36): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.unregisterDataChangeListener('O');
      logInfo(`${BUNDLE}DataSourceModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0004
     * @tc.name      DragAndExchange_DataSourceModelFlow_0004
     * @tc.desc      DataSourceModel call flow notifyDataChange > totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0004 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(92);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0005
     * @tc.name      DragAndExchange_DataSourceModelFlow_0005
     * @tc.desc      DataSourceModel call flow events > notifyDataChange > notifyDataReload > totalCount > registerDa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0005 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataChange(130);
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.registerDataChangeListener('Hello World');
      logInfo(`${BUNDLE}DataSourceModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0006
     * @tc.name      DragAndExchange_DataSourceModelFlow_0006
     * @tc.desc      DataSourceModel call flow getData > notifyDataMove > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0006 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(80);
      logInfo(`step1 getData(80): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataMove(0, 20);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0007
     * @tc.name      DragAndExchange_DataSourceModelFlow_0007
     * @tc.desc      DataSourceModel call flow listenerCount > unregisterDataChangeListener > notifyDataReload > noti...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0007 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.unregisterDataChangeListener('gDEjfF');
      subject.notifyDataReload();
      subject.notifyDataMove(-1, 0);
      subject.notifyDataMove(-56, 0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0008
     * @tc.name      DragAndExchange_DataSourceModelFlow_0008
     * @tc.desc      DataSourceModel call flow events > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0008 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataMove(0, 10);
      logInfo(`${BUNDLE}DataSourceModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0009
     * @tc.name      DragAndExchange_DataSourceModelFlow_0009
     * @tc.desc      DataSourceModel call flow pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0009 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('  ');
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0010
     * @tc.name      DragAndExchange_DataSourceModelFlow_0010
     * @tc.desc      DataSourceModel call flow getData > registerDataChangeListener > getData > getData > getData kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0010 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(-19);
      logInfo(`step1 getData(-19): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.registerDataChangeListener('xabc');
      const step3: string = subject.getData(45);
      logInfo(`step3 getData(45): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string = subject.getData(120);
      logInfo(`step4 getData(120): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string = subject.getData(10);
      logInfo(`step5 getData(10): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0011
     * @tc.name      DragAndExchange_DataSourceModelFlow_0011
     * @tc.desc      DataSourceModel call flow notifyDataReload > events > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0011 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.notifyDataMove(0, 0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0012
     * @tc.name      DragAndExchange_DataSourceModelFlow_0012
     * @tc.desc      DataSourceModel call flow order > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0012 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.getData(-2);
      logInfo(`step3 getData(-2): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0013
     * @tc.name      DragAndExchange_DataSourceModelFlow_0013
     * @tc.desc      DataSourceModel call flow pushData > notifyDataReload > unregisterDataChangeListener > getData k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0013 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData(' \u4e2d\u6587 ');
      subject.notifyDataReload();
      subject.unregisterDataChangeListener('SrTkZZ');
      const step4: string = subject.getData(65);
      logInfo(`step4 getData(65): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0014
     * @tc.name      DragAndExchange_DataSourceModelFlow_0014
     * @tc.desc      DataSourceModel call flow getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0014 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(-43);
      logInfo(`step1 getData(-43): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string = subject.getData(29);
      logInfo(`step2 getData(29): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0015
     * @tc.name      DragAndExchange_DataSourceModelFlow_0015
     * @tc.desc      DataSourceModel call flow notifyDataReload > setData > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0015 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      subject.setData(40, 'Hello');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0016
     * @tc.name      DragAndExchange_DataSourceModelFlow_0016
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > registerDataChangeListener > listenerCoun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0016 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('a');
      subject.registerDataChangeListener('C');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}DataSourceModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0017
     * @tc.name      DragAndExchange_DataSourceModelFlow_0017
     * @tc.desc      DataSourceModel call flow listenerCount > order > notifyDataChange > unregisterDataChangeListene...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0017 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.notifyDataChange(90);
      subject.unregisterDataChangeListener('iLQ9oQA');
      logInfo(`${BUNDLE}DataSourceModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0018
     * @tc.name      DragAndExchange_DataSourceModelFlow_0018
     * @tc.desc      DataSourceModel call flow pushData > registerDataChangeListener > listenerCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0018 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('HelloHello');
      subject.registerDataChangeListener('j6');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0019
     * @tc.name      DragAndExchange_DataSourceModelFlow_0019
     * @tc.desc      DataSourceModel call flow events > listenerCount > order > order > notifyDataReload keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0019 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0020
     * @tc.name      DragAndExchange_DataSourceModelFlow_0020
     * @tc.desc      DataSourceModel call flow getData > unregisterDataChangeListener keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0020 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(59);
      logInfo(`step1 getData(59): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.unregisterDataChangeListener('N6GIlYO');
      logInfo(`${BUNDLE}DataSourceModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0021
     * @tc.name      DragAndExchange_DataSourceModelFlow_0021
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > setData > pushData > listenerCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0021 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('Hello WorldHello World');
      subject.setData(35, 'Hello');
      subject.pushData('  ');
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0022
     * @tc.name      DragAndExchange_DataSourceModelFlow_0022
     * @tc.desc      DataSourceModel call flow events > notifyDataChange > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0022 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataChange(86);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0023
     * @tc.name      DragAndExchange_DataSourceModelFlow_0023
     * @tc.desc      DataSourceModel call flow order > notifyDataChange > unregisterDataChangeListener > order > noti...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0023 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataChange(14);
      subject.unregisterDataChangeListener('jZksr5iI8Gas');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.notifyDataAdd(145);
      logInfo(`${BUNDLE}DataSourceModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0024
     * @tc.name      DragAndExchange_DataSourceModelFlow_0024
     * @tc.desc      DataSourceModel call flow events > order > listenerCount > listenerCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0024 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0025
     * @tc.name      DragAndExchange_DataSourceModelFlow_0025
     * @tc.desc      DataSourceModel call flow notifyDataMove > setData > order > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0025 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataMove(65, 110);
      subject.setData(90, 'Sample Title 123');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(91);
      logInfo(`step3 order(): JSON.stringify(step3.slice(0, 11))=${JSON.stringify(step3.slice(0, 11))}`);
      expect(JSON.stringify(step3.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      subject.notifyDataAdd(5);
      logInfo(`${BUNDLE}DataSourceModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0026
     * @tc.name      DragAndExchange_DataSourceModelFlow_0026
     * @tc.desc      DataSourceModel call flow totalCount > notifyDataMove > notifyDataReload > notifyDataChange > to...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0026 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(40, 115);
      subject.notifyDataReload();
      subject.notifyDataChange(189);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0027
     * @tc.name      DragAndExchange_DataSourceModelFlow_0027
     * @tc.desc      DataSourceModel call flow getData > order > totalCount > unregisterDataChangeListener keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0027 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(69.28);
      logInfo(`step1 getData(69.28): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.unregisterDataChangeListener('abc_1');
      logInfo(`${BUNDLE}DataSourceModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0028
     * @tc.name      DragAndExchange_DataSourceModelFlow_0028
     * @tc.desc      DataSourceModel call flow notifyDataChange > unregisterDataChangeListener > events > listenerCou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0028 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(84.2);
      subject.unregisterDataChangeListener('fnc92cvPxSh');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.registerDataChangeListener('xa');
      logInfo(`${BUNDLE}DataSourceModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0029
     * @tc.name      DragAndExchange_DataSourceModelFlow_0029
     * @tc.desc      DataSourceModel call flow totalCount > listenerCount > setData > registerDataChangeListener > se...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0029 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.setData(2, 'Hello');
      subject.registerDataChangeListener('lq');
      subject.setData(174, ' hello world ');
      logInfo(`${BUNDLE}DataSourceModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0030
     * @tc.name      DragAndExchange_DataSourceModelFlow_0030
     * @tc.desc      DataSourceModel call flow getData > pushData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0030 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(140);
      logInfo(`step1 getData(140): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData('Hello');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["Hello"]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0031
     * @tc.name      DragAndExchange_DataSourceModelFlow_0031
     * @tc.desc      DataSourceModel call flow notifyDataMove > totalCount > setData > totalCount > order keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0031 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataMove(50, 110);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.setData(174, 'Hello');
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(175);
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(175);
      logInfo(`step5 order(): JSON.stringify(step5.slice(0, 11))=${JSON.stringify(step5.slice(0, 11))}`);
      expect(JSON.stringify(step5.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0032
     * @tc.name      DragAndExchange_DataSourceModelFlow_0032
     * @tc.desc      DataSourceModel call flow listenerCount > listenerCount > notifyDataAdd > pushData > listenerCou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0032 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataAdd(145);
      subject.pushData('x\u4e2d\u6587');
      const step5: number = subject.listenerCount();
      logInfo(`step5 listenerCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0033
     * @tc.name      DragAndExchange_DataSourceModelFlow_0033
     * @tc.desc      DataSourceModel call flow order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0033 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0034
     * @tc.name      DragAndExchange_DataSourceModelFlow_0034
     * @tc.desc      DataSourceModel call flow notifyDataChange > getData > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0034 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(114);
      const step2: string = subject.getData(10);
      logInfo(`step2 getData(10): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0035
     * @tc.name      DragAndExchange_DataSourceModelFlow_0035
     * @tc.desc      DataSourceModel call flow notifyDataMove > notifyDataChange > notifyDataMove > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0035 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataMove(105, 85);
      subject.notifyDataChange(49);
      subject.notifyDataMove(75, 45);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0036
     * @tc.name      DragAndExchange_DataSourceModelFlow_0036
     * @tc.desc      DataSourceModel call flow events > setData > listenerCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0036 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.setData(60, ' ');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0037
     * @tc.name      DragAndExchange_DataSourceModelFlow_0037
     * @tc.desc      DataSourceModel call flow notifyDataAdd > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0037 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataAdd(-5);
      const step2: string = subject.getData(175);
      logInfo(`step2 getData(175): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string = subject.getData(189);
      logInfo(`step3 getData(189): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0038
     * @tc.name      DragAndExchange_DataSourceModelFlow_0038
     * @tc.desc      DataSourceModel call flow notifyDataChange > totalCount > notifyDataAdd > events > pushData keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0038 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(185);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataAdd(90);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.pushData('a');
      logInfo(`${BUNDLE}DataSourceModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0039
     * @tc.name      DragAndExchange_DataSourceModelFlow_0039
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > order > notifyDataMove > order > unregist...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0039 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('MA');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.notifyDataMove(105, 85);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.unregisterDataChangeListener('123123');
      logInfo(`${BUNDLE}DataSourceModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0040
     * @tc.name      DragAndExchange_DataSourceModelFlow_0040
     * @tc.desc      DataSourceModel call flow getData > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0040 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(88.68);
      logInfo(`step1 getData(88.68): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0041
     * @tc.name      DragAndExchange_DataSourceModelFlow_0041
     * @tc.desc      DataSourceModel call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0041 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.getData(28);
      logInfo(`step2 getData(28): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0042
     * @tc.name      DragAndExchange_DataSourceModelFlow_0042
     * @tc.desc      DataSourceModel call flow notifyDataChange > totalCount > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0042 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(35);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0043
     * @tc.name      DragAndExchange_DataSourceModelFlow_0043
     * @tc.desc      DataSourceModel call flow events > notifyDataMove > getData > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0043 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataMove(105, 45);
      const step3: string = subject.getData(115);
      logInfo(`step3 getData(115): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataAdd(77);
      logInfo(`${BUNDLE}DataSourceModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0044
     * @tc.name      DragAndExchange_DataSourceModelFlow_0044
     * @tc.desc      DataSourceModel call flow setData > setData > listenerCount > unregisterDataChangeListener keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0044 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(30, 'hello worldhello world');
      subject.setData(0, 'x ');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.unregisterDataChangeListener('Hello World');
      logInfo(`${BUNDLE}DataSourceModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0045
     * @tc.name      DragAndExchange_DataSourceModelFlow_0045
     * @tc.desc      DataSourceModel call flow listenerCount > setData > notifyDataChange > notifyDataReload > order ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0045 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setData(100, 'HelloHello');
      subject.notifyDataChange(171);
      subject.notifyDataReload();
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(101);
      logInfo(`step5 order(): JSON.stringify(step5.slice(0, 11))=${JSON.stringify(step5.slice(0, 11))}`);
      expect(JSON.stringify(step5.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0046
     * @tc.name      DragAndExchange_DataSourceModelFlow_0046
     * @tc.desc      DataSourceModel call flow listenerCount > setData > listenerCount > unregisterDataChangeListener...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0046 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setData(0, 'a');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.unregisterDataChangeListener('iDaVt8j');
      logInfo(`${BUNDLE}DataSourceModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0047
     * @tc.name      DragAndExchange_DataSourceModelFlow_0047
     * @tc.desc      DataSourceModel call flow unregisterDataChangeListener > unregisterDataChangeListener > listener...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0047 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.unregisterDataChangeListener('Hello World_1');
      subject.unregisterDataChangeListener('8');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0048
     * @tc.name      DragAndExchange_DataSourceModelFlow_0048
     * @tc.desc      DataSourceModel call flow totalCount > notifyDataAdd > notifyDataReload > order > listenerCount ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0048 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(-22);
      subject.notifyDataReload();
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: number = subject.listenerCount();
      logInfo(`step5 listenerCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0049
     * @tc.name      DragAndExchange_DataSourceModelFlow_0049
     * @tc.desc      DataSourceModel call flow notifyDataAdd > listenerCount > getData > setData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0049 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataAdd(134);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.getData(177);
      logInfo(`step3 getData(177): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.setData(100, 'HelloHello');
      logInfo(`${BUNDLE}DataSourceModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0050
     * @tc.name      DragAndExchange_DataSourceModelFlow_0050
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > notifyDataChange > order > order > notify...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0050 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('KmyConTcA');
      subject.notifyDataChange(49);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.notifyDataChange(34.44);
      logInfo(`${BUNDLE}DataSourceModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0051
     * @tc.name      DragAndExchange_DataSourceModelFlow_0051
     * @tc.desc      DataSourceModel call flow getData > listenerCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0051 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(-98);
      logInfo(`step1 getData(-98): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0052
     * @tc.name      DragAndExchange_DataSourceModelFlow_0052
     * @tc.desc      DataSourceModel call flow listenerCount > order > registerDataChangeListener > listenerCount kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0052 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.registerDataChangeListener(' _1');
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0053
     * @tc.name      DragAndExchange_DataSourceModelFlow_0053
     * @tc.desc      DataSourceModel call flow setData > notifyDataAdd > unregisterDataChangeListener > notifyDataCha...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0053 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(30, ' Hello ');
      subject.notifyDataAdd(100);
      subject.unregisterDataChangeListener('9HHfmveX0cf');
      subject.notifyDataChange(160);
      const step5: number = subject.listenerCount();
      logInfo(`step5 listenerCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0054
     * @tc.name      DragAndExchange_DataSourceModelFlow_0054
     * @tc.desc      DataSourceModel call flow notifyDataAdd > totalCount > events > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0054 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataAdd(193);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0055
     * @tc.name      DragAndExchange_DataSourceModelFlow_0055
     * @tc.desc      DataSourceModel call flow setData > order > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0055 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(90, 'Sample Title 123');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(91);
      logInfo(`step2 order(): JSON.stringify(step2.slice(0, 11))=${JSON.stringify(step2.slice(0, 11))}`);
      expect(JSON.stringify(step2.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      subject.notifyDataAdd(58.23);
      logInfo(`${BUNDLE}DataSourceModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0056
     * @tc.name      DragAndExchange_DataSourceModelFlow_0056
     * @tc.desc      DataSourceModel call flow setData > order > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0056 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(0, '   ');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["   "]');
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0057
     * @tc.name      DragAndExchange_DataSourceModelFlow_0057
     * @tc.desc      DataSourceModel call flow getData > notifyDataMove > getData > notifyDataChange keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0057 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(165);
      logInfo(`step1 getData(165): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataMove(5, 15);
      const step3: string = subject.getData(100);
      logInfo(`step3 getData(100): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataChange(65.61);
      logInfo(`${BUNDLE}DataSourceModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0058
     * @tc.name      DragAndExchange_DataSourceModelFlow_0058
     * @tc.desc      DataSourceModel call flow notifyDataReload > events > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0058 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.getData(175);
      logInfo(`step3 getData(175): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0059
     * @tc.name      DragAndExchange_DataSourceModelFlow_0059
     * @tc.desc      DataSourceModel call flow notifyDataChange > notifyDataAdd > setData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0059 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(55.23);
      subject.notifyDataAdd(19.52);
      subject.setData(174, '  ');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(175);
      logInfo(`step4 order(): JSON.stringify(step4.slice(0, 11))=${JSON.stringify(step4.slice(0, 11))}`);
      expect(JSON.stringify(step4.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0060
     * @tc.name      DragAndExchange_DataSourceModelFlow_0060
     * @tc.desc      DataSourceModel call flow listenerCount > listenerCount > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0060 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0061
     * @tc.name      DragAndExchange_DataSourceModelFlow_0061
     * @tc.desc      DataSourceModel call flow notifyDataAdd > notifyDataAdd > order > getData > setData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0061 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataAdd(-63);
      subject.notifyDataAdd(174);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string = subject.getData(-65);
      logInfo(`step4 getData(-65): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.setData(25, ' ');
      logInfo(`${BUNDLE}DataSourceModelFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0062
     * @tc.name      DragAndExchange_DataSourceModelFlow_0062
     * @tc.desc      DataSourceModel call flow totalCount > setData > listenerCount > listenerCount > notifyDataReloa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0062 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setData(-1, ' _1');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0063
     * @tc.name      DragAndExchange_DataSourceModelFlow_0063
     * @tc.desc      DataSourceModel call flow setData > notifyDataAdd > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0063 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(0, 'HelloHello');
      subject.notifyDataAdd(70);
      const step3: string = subject.getData(9);
      logInfo(`step3 getData(9): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0064
     * @tc.name      DragAndExchange_DataSourceModelFlow_0064
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > notifyDataAdd > notifyDataAdd > registerD...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0064 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('KmyConTcA');
      subject.notifyDataAdd(31);
      subject.notifyDataAdd(16);
      subject.registerDataChangeListener('x123');
      const step5: string = subject.getData(165);
      logInfo(`step5 getData(165): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0065
     * @tc.name      DragAndExchange_DataSourceModelFlow_0065
     * @tc.desc      DataSourceModel call flow setData > order > events > events > listenerCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0065 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(2, 'hello world');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(3);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('[null,null,"hello world"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: number = subject.listenerCount();
      logInfo(`step5 listenerCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0066
     * @tc.name      DragAndExchange_DataSourceModelFlow_0066
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > events > events > notifyDataChange keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0066 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('A9Pz');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.notifyDataChange(116);
      logInfo(`${BUNDLE}DataSourceModelFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0067
     * @tc.name      DragAndExchange_DataSourceModelFlow_0067
     * @tc.desc      DataSourceModel call flow setData > totalCount > notifyDataChange > notifyDataMove keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0067 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(105, 'Hello');
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(106);
      subject.notifyDataChange(171);
      subject.notifyDataMove(45, 40);
      logInfo(`${BUNDLE}DataSourceModelFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0068
     * @tc.name      DragAndExchange_DataSourceModelFlow_0068
     * @tc.desc      DataSourceModel call flow notifyDataMove > order > pushData > listenerCount > getData keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0068 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataMove(-1, 151);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.pushData('e4m');
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.getData(68.24);
      logInfo(`step5 getData(68.24): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0069
     * @tc.name      DragAndExchange_DataSourceModelFlow_0069
     * @tc.desc      DataSourceModel call flow events > notifyDataChange > events > totalCount > registerDataChangeLi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0069 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataChange(190);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.registerDataChangeListener('9RWqY6CTxlc6');
      logInfo(`${BUNDLE}DataSourceModelFlow_0069 end`);
    });
  });
}
