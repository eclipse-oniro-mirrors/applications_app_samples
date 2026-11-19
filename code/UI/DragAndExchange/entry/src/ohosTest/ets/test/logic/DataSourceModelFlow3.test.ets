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

/** Logic checks for DataSourceModel flow (3 cases). */
export default function dataSourceModelFlow3Test(): void {
  describe('DataSourceModelFlow3Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0133
     * @tc.name      DragAndExchange_DataSourceModelFlow_0133
     * @tc.desc      DataSourceModel call flow notifyDataReload > listenerCount > notifyDataMove > getData > events k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0133 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataReload();
      const step2: number = subject.listenerCount();
      logInfo(`step2 listenerCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataMove(15, 50);
      const step4: string = subject.getData(65);
      logInfo(`step4 getData(65): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}DataSourceModelFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0134
     * @tc.name      DragAndExchange_DataSourceModelFlow_0134
     * @tc.desc      DataSourceModel call flow notifyDataChange > setData > order > unregisterDataChangeListener > no...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0134 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      subject.notifyDataChange(45);
      subject.setData(1, 'Hello');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('[null,"Hello"]');
      subject.unregisterDataChangeListener('7aPbHihcW3');
      subject.notifyDataReload();
      logInfo(`${BUNDLE}DataSourceModelFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_DATA_SOURCE_MODEL_FLOW_0135
     * @tc.name      DragAndExchange_DataSourceModelFlow_0135
     * @tc.desc      DataSourceModel call flow getData > getData > unregisterDataChangeListener > registerDataChangeL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_DataSourceModelFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DataSourceModelFlow_0135 begin`);
      const subject: DataSourceModel = new DataSourceModel();
      const step1: string = subject.getData(155);
      logInfo(`step1 getData(155): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string = subject.getData(17);
      logInfo(`step2 getData(17): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.unregisterDataChangeListener('OzAYfsG0mu');
      subject.registerDataChangeListener('123123');
      subject.pushData('xa');
      logInfo(`${BUNDLE}DataSourceModelFlow_0135 end`);
    });
  });
}
