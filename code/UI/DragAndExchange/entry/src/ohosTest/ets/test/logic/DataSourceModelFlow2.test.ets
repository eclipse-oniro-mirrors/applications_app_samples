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

/** Logic checks for DataSourceModel flow (63 cases). */
export default function dataSourceModelFlow2Test(): void {
  describe('DataSourceModelFlow2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0070
     * @tc.name      DragAndExchange_DataSourceModelFlow_0070
     * @tc.desc      DataSourceModel call flow pushData > setData > totalCount > pushData > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0070 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('UpjYXV7ifr');
      subject.setData(40, 'xhello world');
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(41);
      subject.pushData('Dh1pbMZHm');
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(42);
      logInfo(`${BUNDLE}DataSourceModelFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0071
     * @tc.name      DragAndExchange_DataSourceModelFlow_0071
     * @tc.desc      DataSourceModel call flow notifyDataAdd > getData > notifyDataAdd > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0071 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataAdd(160);
      const step2: string = subject.getData(17);
      logInfo(`step2 getData(17): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataAdd(-64);
      const step4: string = subject.getData(-50);
      logInfo(`step4 getData(-50): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0072
     * @tc.name      DragAndExchange_DataSourceModelFlow_0072
     * @tc.desc      DataSourceModel call flow notifyDataAdd > events > notifyDataChange > unregisterDataChangeListen...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0072 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataAdd(35);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.notifyDataChange(167);
      subject.unregisterDataChangeListener('');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0073
     * @tc.name      DragAndExchange_DataSourceModelFlow_0073
     * @tc.desc      DataSourceModel call flow totalCount > totalCount > registerDataChangeListener > order > setData...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0073 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.registerDataChangeListener(' 123 ');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.setData(0, 'A');
      logInfo(`${BUNDLE}DataSourceModelFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0074
     * @tc.name      DragAndExchange_DataSourceModelFlow_0074
     * @tc.desc      DataSourceModel call flow getData > setData > pushData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0074 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(68.24);
      logInfo(`step1 getData(68.24): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.setData(0, 'a');
      subject.pushData('KHk1vYPzd7');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["a","KHk1vYPzd7"]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0075
     * @tc.name      DragAndExchange_DataSourceModelFlow_0075
     * @tc.desc      DataSourceModel call flow order > notifyDataAdd > setData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0075 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataAdd(110);
      subject.setData(0, 'hello world');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["hello world"]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0076
     * @tc.name      DragAndExchange_DataSourceModelFlow_0076
     * @tc.desc      DataSourceModel call flow listenerCount > totalCount > getData > totalCount > order keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0076 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.getData(175);
      logInfo(`step3 getData(175): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0077
     * @tc.name      DragAndExchange_DataSourceModelFlow_0077
     * @tc.desc      DataSourceModel call flow listenerCount > unregisterDataChangeListener > notifyDataAdd > notifyD...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0077 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.unregisterDataChangeListener('dxCQjvFjC3KE');
      subject.notifyDataAdd(145);
      subject.notifyDataAdd(81);
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0078
     * @tc.name      DragAndExchange_DataSourceModelFlow_0078
     * @tc.desc      DataSourceModel call flow notifyDataChange > setData > order > notifyDataChange > registerDataCh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0078 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(7);
      subject.setData(85, 'Sample Title 123');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(86);
      logInfo(`step3 order(): JSON.stringify(step3.slice(0, 11))=${JSON.stringify(step3.slice(0, 11))}`);
      expect(JSON.stringify(step3.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      subject.notifyDataChange(34.44);
      subject.registerDataChangeListener('fRFqBB');
      logInfo(`${BUNDLE}DataSourceModelFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0079
     * @tc.name      DragAndExchange_DataSourceModelFlow_0079
     * @tc.desc      DataSourceModel call flow order > order > events > events > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0079 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.notifyDataMove(45, 40);
      logInfo(`${BUNDLE}DataSourceModelFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0080
     * @tc.name      DragAndExchange_DataSourceModelFlow_0080
     * @tc.desc      DataSourceModel call flow totalCount > setData > registerDataChangeListener > notifyDataReload >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0080 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.setData(60, ' ');
      subject.registerDataChangeListener('V');
      subject.notifyDataReload();
      const step5: string = subject.getData(160);
      logInfo(`step5 getData(160): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0081
     * @tc.name      DragAndExchange_DataSourceModelFlow_0081
     * @tc.desc      DataSourceModel call flow totalCount > listenerCount > setData > listenerCount > setData keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0081 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.setData(25, 'Hello');
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.setData(75, ' _1');
      logInfo(`${BUNDLE}DataSourceModelFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0082
     * @tc.name      DragAndExchange_DataSourceModelFlow_0082
     * @tc.desc      DataSourceModel call flow order > listenerCount > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0082 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0083
     * @tc.name      DragAndExchange_DataSourceModelFlow_0083
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > getData > setData > events > notifyDataCh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0083 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('xabc');
      const step2: string = subject.getData(68.24);
      logInfo(`step2 getData(68.24): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.setData(0, 'hello world_1');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.notifyDataChange(5.25);
      logInfo(`${BUNDLE}DataSourceModelFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0084
     * @tc.name      DragAndExchange_DataSourceModelFlow_0084
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > notifyDataAdd > events > registerDataChan...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0084 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('pdy8HF');
      subject.notifyDataAdd(-16);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["pdy8HF:add-16"]');
      subject.registerDataChangeListener('');
      subject.pushData(' _1');
      logInfo(`${BUNDLE}DataSourceModelFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0085
     * @tc.name      DragAndExchange_DataSourceModelFlow_0085
     * @tc.desc      DataSourceModel call flow events > setData > getData > unregisterDataChangeListener > order keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0085 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.setData(15, '\u4e2d\u6587');
      const step3: string = subject.getData(177);
      logInfo(`step3 getData(177): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.unregisterDataChangeListener('iLQ9oQA');
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(16);
      logInfo(`step5 order(): JSON.stringify(step5.slice(0, 11))=${JSON.stringify(step5.slice(0, 11))}`);
      expect(JSON.stringify(step5.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0086
     * @tc.name      DragAndExchange_DataSourceModelFlow_0086
     * @tc.desc      DataSourceModel call flow getData > events > events > listenerCount > setData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0086 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(183);
      logInfo(`step1 getData(183): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.setData(75, 'Hello World');
      logInfo(`${BUNDLE}DataSourceModelFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0087
     * @tc.name      DragAndExchange_DataSourceModelFlow_0087
     * @tc.desc      DataSourceModel call flow order > order > order > listenerCount > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0087 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0088
     * @tc.name      DragAndExchange_DataSourceModelFlow_0088
     * @tc.desc      DataSourceModel call flow listenerCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0088 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.getData(110);
      logInfo(`step2 getData(110): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string = subject.getData(13);
      logInfo(`step3 getData(13): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0089
     * @tc.name      DragAndExchange_DataSourceModelFlow_0089
     * @tc.desc      DataSourceModel call flow notifyDataMove > events > totalCount > setData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0089 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataMove(0, 75);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.setData(25, 'Hello');
      logInfo(`${BUNDLE}DataSourceModelFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0090
     * @tc.name      DragAndExchange_DataSourceModelFlow_0090
     * @tc.desc      DataSourceModel call flow setData > order > notifyDataMove > totalCount > notifyDataReload keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0090 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(0, 'x ');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["x "]');
      subject.notifyDataMove(5, 5);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0091
     * @tc.name      DragAndExchange_DataSourceModelFlow_0091
     * @tc.desc      DataSourceModel call flow setData > pushData > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0091 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(25, 'Hello');
      subject.pushData(' 123 ');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(27);
      logInfo(`step3 order(): JSON.stringify(step3.slice(0, 11))=${JSON.stringify(step3.slice(0, 11))}`);
      expect(JSON.stringify(step3.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0092
     * @tc.name      DragAndExchange_DataSourceModelFlow_0092
     * @tc.desc      DataSourceModel call flow getData > events > listenerCount > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0092 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(133);
      logInfo(`step1 getData(133): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0093
     * @tc.name      DragAndExchange_DataSourceModelFlow_0093
     * @tc.desc      DataSourceModel call flow totalCount > notifyDataReload > listenerCount > order keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0093 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataReload();
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0094
     * @tc.name      DragAndExchange_DataSourceModelFlow_0094
     * @tc.desc      DataSourceModel call flow getData > notifyDataAdd > setData > getData > notifyDataAdd keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0094 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(146);
      logInfo(`step1 getData(146): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataAdd(145);
      subject.setData(30, 'hello world');
      const step4: string = subject.getData(200);
      logInfo(`step4 getData(200): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.notifyDataAdd(-63);
      logInfo(`${BUNDLE}DataSourceModelFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0095
     * @tc.name      DragAndExchange_DataSourceModelFlow_0095
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > registerDataChangeListener > setData > or...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0095 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('MguaQ1vO9');
      subject.registerDataChangeListener('0T6R');
      subject.setData(95, 'a');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(96);
      logInfo(`step4 order(): JSON.stringify(step4.slice(0, 11))=${JSON.stringify(step4.slice(0, 11))}`);
      expect(JSON.stringify(step4.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0096
     * @tc.name      DragAndExchange_DataSourceModelFlow_0096
     * @tc.desc      DataSourceModel call flow notifyDataReload > getData > totalCount > events > setData keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0096 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      const step2: string = subject.getData(105);
      logInfo(`step2 getData(105): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.setData(-1, ' A ');
      logInfo(`${BUNDLE}DataSourceModelFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0097
     * @tc.name      DragAndExchange_DataSourceModelFlow_0097
     * @tc.desc      DataSourceModel call flow getData > order > getData > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0097 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(102);
      logInfo(`step1 getData(102): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.getData(73);
      logInfo(`step3 getData(73): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataAdd(180);
      logInfo(`${BUNDLE}DataSourceModelFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0098
     * @tc.name      DragAndExchange_DataSourceModelFlow_0098
     * @tc.desc      DataSourceModel call flow getData > setData > getData > notifyDataAdd > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0098 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(125);
      logInfo(`step1 getData(125): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.setData(75, 'Hello');
      const step3: string = subject.getData(55);
      logInfo(`step3 getData(55): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataAdd(38);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(76);
      logInfo(`${BUNDLE}DataSourceModelFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0099
     * @tc.name      DragAndExchange_DataSourceModelFlow_0099
     * @tc.desc      DataSourceModel call flow unregisterDataChangeListener > listenerCount > listenerCount > notifyD...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0099 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.unregisterDataChangeListener('OKbxa6KAUrMG');
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.notifyDataMove(5, 0);
      subject.notifyDataMove(30, 1);
      logInfo(`${BUNDLE}DataSourceModelFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0100
     * @tc.name      DragAndExchange_DataSourceModelFlow_0100
     * @tc.desc      DataSourceModel call flow totalCount > totalCount > registerDataChangeListener > unregisterDataC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0100 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.registerDataChangeListener('JE');
      subject.unregisterDataChangeListener('123_1');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0101
     * @tc.name      DragAndExchange_DataSourceModelFlow_0101
     * @tc.desc      DataSourceModel call flow totalCount > events > notifyDataAdd > listenerCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0101 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.notifyDataAdd(20.83);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0102
     * @tc.name      DragAndExchange_DataSourceModelFlow_0102
     * @tc.desc      DataSourceModel call flow events > events > listenerCount > pushData > events keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0102 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushData('aetT5DgW');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0103
     * @tc.name      DragAndExchange_DataSourceModelFlow_0103
     * @tc.desc      DataSourceModel call flow notifyDataReload > setData > totalCount > listenerCount > notifyDataMo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0103 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      subject.setData(70, 'Hello');
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(71);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataMove(110, 100);
      logInfo(`${BUNDLE}DataSourceModelFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0104
     * @tc.name      DragAndExchange_DataSourceModelFlow_0104
     * @tc.desc      DataSourceModel call flow order > notifyDataAdd > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0104 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.notifyDataAdd(195);
      const step3: string = subject.getData(25);
      logInfo(`step3 getData(25): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0105
     * @tc.name      DragAndExchange_DataSourceModelFlow_0105
     * @tc.desc      DataSourceModel call flow notifyDataMove > notifyDataMove > notifyDataAdd > notifyDataAdd > even...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0105 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataMove(0, 5);
      subject.notifyDataMove(110, 2);
      subject.notifyDataAdd(-32);
      subject.notifyDataAdd(-32);
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0106
     * @tc.name      DragAndExchange_DataSourceModelFlow_0106
     * @tc.desc      DataSourceModel call flow events > listenerCount > notifyDataReload > registerDataChangeListener...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0106 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      subject.registerDataChangeListener('J');
      const step5: string = subject.getData(145);
      logInfo(`step5 getData(145): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0107
     * @tc.name      DragAndExchange_DataSourceModelFlow_0107
     * @tc.desc      DataSourceModel call flow unregisterDataChangeListener > order > notifyDataChange > getData > pu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0107 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.unregisterDataChangeListener('123123');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.notifyDataChange(-72);
      const step4: string = subject.getData(8.68);
      logInfo(`step4 getData(8.68): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData('xA');
      logInfo(`${BUNDLE}DataSourceModelFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0108
     * @tc.name      DragAndExchange_DataSourceModelFlow_0108
     * @tc.desc      DataSourceModel call flow listenerCount > getData > order > notifyDataAdd > getData keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0108 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.getData(115);
      logInfo(`step2 getData(115): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.notifyDataAdd(71);
      const step5: string = subject.getData(-35);
      logInfo(`step5 getData(-35): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0109
     * @tc.name      DragAndExchange_DataSourceModelFlow_0109
     * @tc.desc      DataSourceModel call flow totalCount > pushData > order > registerDataChangeListener > listenerC...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0109 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData('123123');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["123123"]');
      subject.registerDataChangeListener('Hello World_1');
      const step5: number = subject.listenerCount();
      logInfo(`step5 listenerCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceModelFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0110
     * @tc.name      DragAndExchange_DataSourceModelFlow_0110
     * @tc.desc      DataSourceModel call flow getData > totalCount > notifyDataReload > setData > listenerCount keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0110 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(130);
      logInfo(`step1 getData(130): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      subject.setData(90, 'Sample Title 123');
      const step5: number = subject.listenerCount();
      logInfo(`step5 listenerCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0111
     * @tc.name      DragAndExchange_DataSourceModelFlow_0111
     * @tc.desc      DataSourceModel call flow listenerCount > notifyDataMove > setData > events > notifyDataReload k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0111 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataMove(30, 5);
      subject.setData(0, '   ');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0112
     * @tc.name      DragAndExchange_DataSourceModelFlow_0112
     * @tc.desc      DataSourceModel call flow listenerCount > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0112 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0113
     * @tc.name      DragAndExchange_DataSourceModelFlow_0113
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > listenerCount > events keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0113 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener(' ');
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0114
     * @tc.name      DragAndExchange_DataSourceModelFlow_0114
     * @tc.desc      DataSourceModel call flow pushData > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0114 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('xSample Title 123');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["xSample Title 123"]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0115
     * @tc.name      DragAndExchange_DataSourceModelFlow_0115
     * @tc.desc      DataSourceModel call flow getData > notifyDataMove > registerDataChangeListener > events > notif...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0115 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(185);
      logInfo(`step1 getData(185): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataMove(105, 15);
      subject.registerDataChangeListener('pdy8HF');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.notifyDataMove(10, 0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0116
     * @tc.name      DragAndExchange_DataSourceModelFlow_0116
     * @tc.desc      DataSourceModel call flow listenerCount > getData > notifyDataChange > events keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0116 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.getData(1);
      logInfo(`step2 getData(1): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataChange(49.63);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0117
     * @tc.name      DragAndExchange_DataSourceModelFlow_0117
     * @tc.desc      DataSourceModel call flow unregisterDataChangeListener > unregisterDataChangeListener > order > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0117 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.unregisterDataChangeListener('x123');
      subject.unregisterDataChangeListener('RhezNFnF2do5');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.registerDataChangeListener('sk54oycVQ');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0118
     * @tc.name      DragAndExchange_DataSourceModelFlow_0118
     * @tc.desc      DataSourceModel call flow getData > pushData > notifyDataChange > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0118 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(70);
      logInfo(`step1 getData(70): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData('TI2xE');
      subject.notifyDataChange(-8);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}DataSourceModelFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0119
     * @tc.name      DragAndExchange_DataSourceModelFlow_0119
     * @tc.desc      DataSourceModel call flow pushData > order > unregisterDataChangeListener > getData > unregister...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0119 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('\u4e2d\u6587\u4e2d\u6587');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["\u4e2d\u6587\u4e2d\u6587"]');
      subject.unregisterDataChangeListener('7aPbHihcW3');
      const step4: string = subject.getData(-19);
      logInfo(`step4 getData(-19): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.unregisterDataChangeListener('abc_1');
      logInfo(`${BUNDLE}DataSourceModelFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0120
     * @tc.name      DragAndExchange_DataSourceModelFlow_0120
     * @tc.desc      DataSourceModel call flow listenerCount > registerDataChangeListener > listenerCount > registerD...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0120 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.registerDataChangeListener('6TfG');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.registerDataChangeListener('k8e7N');
      logInfo(`${BUNDLE}DataSourceModelFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0121
     * @tc.name      DragAndExchange_DataSourceModelFlow_0121
     * @tc.desc      DataSourceModel call flow setData > unregisterDataChangeListener > totalCount > unregisterDataCh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0121 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(50, 'xHello');
      subject.unregisterDataChangeListener('ta8L6Q7');
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(51);
      subject.unregisterDataChangeListener('XQ0dK');
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(51);
      logInfo(`step5 order(): JSON.stringify(step5.slice(0, 11))=${JSON.stringify(step5.slice(0, 11))}`);
      expect(JSON.stringify(step5.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0122
     * @tc.name      DragAndExchange_DataSourceModelFlow_0122
     * @tc.desc      DataSourceModel call flow pushData > totalCount > notifyDataMove > order > order keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0122 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('i28');
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.notifyDataMove(70, 55);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["i28"]');
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["i28"]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0123
     * @tc.name      DragAndExchange_DataSourceModelFlow_0123
     * @tc.desc      DataSourceModel call flow listenerCount > unregisterDataChangeListener > setData > order keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0123 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.unregisterDataChangeListener('123_1');
      subject.setData(50, ' A ');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(51);
      logInfo(`step4 order(): JSON.stringify(step4.slice(0, 11))=${JSON.stringify(step4.slice(0, 11))}`);
      expect(JSON.stringify(step4.slice(0, 11)))
        .assertEqual('[null,null,null,null,null,null,null,null,null,null,null]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0124
     * @tc.name      DragAndExchange_DataSourceModelFlow_0124
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > notifyDataMove > notifyDataReload > total...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0124 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('ZT231Td');
      subject.notifyDataMove(100, 0);
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["ZT231Td:move100-0","ZT231Td:reload"]');
      logInfo(`${BUNDLE}DataSourceModelFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0125
     * @tc.name      DragAndExchange_DataSourceModelFlow_0125
     * @tc.desc      DataSourceModel call flow registerDataChangeListener > registerDataChangeListener > listenerCoun...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0125 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.registerDataChangeListener('J');
      subject.registerDataChangeListener('lq');
      const step3: number = subject.listenerCount();
      logInfo(`step3 listenerCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0126
     * @tc.name      DragAndExchange_DataSourceModelFlow_0126
     * @tc.desc      DataSourceModel call flow notifyDataReload > notifyDataChange > unregisterDataChangeListener > e...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0126 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      subject.notifyDataChange(-44);
      subject.unregisterDataChangeListener('r');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0127
     * @tc.name      DragAndExchange_DataSourceModelFlow_0127
     * @tc.desc      DataSourceModel call flow totalCount > getData > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0127 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.getData(198);
      logInfo(`step2 getData(198): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0128
     * @tc.name      DragAndExchange_DataSourceModelFlow_0128
     * @tc.desc      DataSourceModel call flow notifyDataChange > events > notifyDataAdd > order > order keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0128 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(2);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.notifyDataAdd(200);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0129
     * @tc.name      DragAndExchange_DataSourceModelFlow_0129
     * @tc.desc      DataSourceModel call flow setData > registerDataChangeListener > unregisterDataChangeListener > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0129 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.setData(0, ' _1');
      subject.registerDataChangeListener('0T6R');
      subject.unregisterDataChangeListener('jZksr5iI8Gas');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('[" _1"]');
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0130
     * @tc.name      DragAndExchange_DataSourceModelFlow_0130
     * @tc.desc      DataSourceModel call flow pushData > notifyDataMove > pushData > notifyDataAdd > getData keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0130 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.pushData('HelloHello');
      subject.notifyDataMove(95, 10);
      subject.pushData('nqtW5we0YH');
      subject.notifyDataAdd(90);
      const step5: string = subject.getData(1);
      logInfo(`step5 getData(1): step5=${step5}`);
      expect(step5).assertEqual('nqtW5we0YH');
      logInfo(`${BUNDLE}DataSourceModelFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0131
     * @tc.name      DragAndExchange_DataSourceModelFlow_0131
     * @tc.desc      DataSourceModel call flow order > unregisterDataChangeListener > totalCount > pushData > getData...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0131 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.unregisterDataChangeListener('  ');
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushData('HelloHello');
      const step5: string = subject.getData(-32);
      logInfo(`step5 getData(-32): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}DataSourceModelFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0132
     * @tc.name      DragAndExchange_DataSourceModelFlow_0132
     * @tc.desc      DataSourceModel call flow listenerCount > notifyDataChange > notifyDataChange > listenerCount ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0132 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: number = subject.listenerCount();
      logInfo(`step1 listenerCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(140);
      subject.notifyDataChange(198);
      const step4: number = subject.listenerCount();
      logInfo(`step4 listenerCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0132 end`);
    });
  });
}
