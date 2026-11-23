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
import { KeyboardDataSource } from '../../../../main/ets/bridge/KeyboardAvoidBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for KeyboardDataSource flow (63 cases). */
export default function keyboardDataSourceFlow3Test(): void {
  describe('KeyboardDataSourceFlow3Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0150
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0150
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataAdd > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0150 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(166);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0151
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0151
     * @tc.desc      KeyboardDataSource call flow totalCount > delete2ndItem > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0151 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.delete2ndItem();
      subject.notifyDataAdd(88);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0152
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0152
     * @tc.desc      KeyboardDataSource call flow delete1stItem > reload > addItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0152 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.delete1stItem();
      subject.reload();
      subject.addItem(53.24);
      const step4: string = subject.getData(4);
      logInfo(`step4 getData(4): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0153
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0153
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > deleteLastItem > notifyDataReload > modifyAllData >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0153 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.delete2ndItem();
      subject.deleteLastItem();
      subject.notifyDataReload();
      subject.modifyAllData(['']);
      const step5: string = subject.getData(120);
      logInfo(`step5 getData(120): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0154
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0154
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > addLastItem > getData > notifyDataDelete > getData ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0154 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataAdd(75);
      subject.addLastItem();
      const step3: string = subject.getData(-52);
      logInfo(`step3 getData(-52): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataDelete(-74);
      const step5: string = subject.getData(145);
      logInfo(`step5 getData(145): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0155
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0155
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > notifyDataChange > getData > addLastItem > delete1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0155 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.deleteLastItem();
      subject.notifyDataChange(64.69);
      const step3: string = subject.getData(70);
      logInfo(`step3 getData(70): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addLastItem();
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0156
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0156
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataDelete > add1stItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0156 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataDelete(88);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0157
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0157
     * @tc.desc      KeyboardDataSource call flow delete1stItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0157 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.delete1stItem();
      const step2: string = subject.getData(116);
      logInfo(`step2 getData(116): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0158
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0158
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataAdd > deleteLastItem > add1stItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0158 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(105);
      logInfo(`step1 getData(105): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataAdd(-22);
      subject.deleteLastItem();
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0159
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0159
     * @tc.desc      KeyboardDataSource call flow notifyDataMove > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0159 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataMove(45, 95);
      const step2: string = subject.getData(52);
      logInfo(`step2 getData(52): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0160
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0160
     * @tc.desc      KeyboardDataSource call flow notifyDataMove > addItem > modifyAllData > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0160 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataMove(75, 0);
      subject.addItem(109);
      subject.modifyAllData([]);
      const step4: string = subject.getData(-9);
      logInfo(`step4 getData(-9): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0161
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0161
     * @tc.desc      KeyboardDataSource call flow addItem > getData > notifyDataMove > notifyDataMove > notifyDataMov...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0161 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.addItem(90.49);
      const step2: string = subject.getData(-68);
      logInfo(`step2 getData(-68): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataMove(50, 99);
      subject.notifyDataMove(35, 80);
      subject.notifyDataMove(110, 5);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0162
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0162
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > totalCount > deleteLastItem > notifyDataDelete k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0162 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.deleteLastItem();
      subject.notifyDataDelete(-51);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0163
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0163
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > deleteLastItem > getData > add1stItem keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0163 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataDelete(-51);
      subject.deleteLastItem();
      const step3: string = subject.getData(170);
      logInfo(`step3 getData(170): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0164
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0164
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > notifyDataReload > getData > deleteLastItem > modi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0164 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.deleteLastItem();
      subject.notifyDataReload();
      const step3: string = subject.getData(165);
      logInfo(`step3 getData(165): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.deleteLastItem();
      subject.modifyAllData(['', 'a']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0165
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0165
     * @tc.desc      KeyboardDataSource call flow totalCount > modifyAllData > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0165 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.notifyDataDelete(95.24);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0166
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0166
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > totalCount > delete2ndItem > notifyDataMove > modif...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0166 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.delete2ndItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.delete2ndItem();
      subject.notifyDataMove(-90, 90);
      subject.modifyAllData(['', 'a']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0167
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0167
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0167 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(-1);
      logInfo(`step1 getData(-1): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(97.97);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0168
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0168
     * @tc.desc      KeyboardDataSource call flow add1stItem > notifyDataChange > notifyDataReload > notifyDataAdd > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0168 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.add1stItem();
      subject.notifyDataChange(162);
      subject.notifyDataReload();
      subject.notifyDataAdd(68);
      const step5: string = subject.getData(7);
      logInfo(`step5 getData(7): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0169
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0169
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > modifyAllData > totalCount > delete1stItem keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0169 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataChange(110);
      subject.modifyAllData(['', 'a']);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0170
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0170
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > notifyDataChange > delete2ndItem > notifyDataDelete...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0170 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.delete2ndItem();
      subject.notifyDataChange(3);
      subject.delete2ndItem();
      subject.notifyDataDelete(78.73);
      const step5: string = subject.getData(174);
      logInfo(`step5 getData(174): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0171
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0171
     * @tc.desc      KeyboardDataSource call flow totalCount > addItem > notifyDataMove > modifyAllData > delete2ndIt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0171 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.addItem(23.11);
      subject.notifyDataMove(0, 45);
      subject.modifyAllData(['', 'a']);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0172
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0172
     * @tc.desc      KeyboardDataSource call flow totalCount > modifyAllData > reload > deleteLastItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0172 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.modifyAllData(['', 'a', 'abc', 'Hello World', ' ']);
      subject.reload();
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0173
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0173
     * @tc.desc      KeyboardDataSource call flow add1stItem > getData > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0173 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.add1stItem();
      const step2: string = subject.getData(-73);
      logInfo(`step2 getData(-73): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataChange(83.94);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0174
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0174
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > totalCount > notifyDataReload > notifyDataReload k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0174 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.deleteLastItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0175
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0175
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0175 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(120);
      logInfo(`step1 getData(120): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataChange(3);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0176
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0176
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0176 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.delete2ndItem();
      const step2: string = subject.getData(151);
      logInfo(`step2 getData(151): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0177
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0177
     * @tc.desc      KeyboardDataSource call flow getData > deleteLastItem > addLastItem > notifyDataChange keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0177 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(-12);
      logInfo(`step1 getData(-12): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.deleteLastItem();
      subject.addLastItem();
      subject.notifyDataChange(96);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0178
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0178
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > notifyDataDelete > add1stItem keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0178 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(-20);
      logInfo(`step1 getData(-20): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(-21);
      subject.notifyDataDelete(95.24);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0179
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0179
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > addLastItem > totalCount > notifyDataDelete > noti...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0179 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.deleteLastItem();
      subject.addLastItem();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.notifyDataDelete(60.42);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0180
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0180
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > notifyDataReload > delete1stItem > getData > add...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0180 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataReload();
      subject.notifyDataReload();
      subject.delete1stItem();
      const step4: string = subject.getData(60.23);
      logInfo(`step4 getData(60.23): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addItem(-94);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0181
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0181
     * @tc.desc      KeyboardDataSource call flow totalCount > delete1stItem > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0181 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.delete1stItem();
      subject.notifyDataChange(155);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0182
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0182
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0182 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(-5);
      logInfo(`step1 getData(-5): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(-46);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0183
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0183
     * @tc.desc      KeyboardDataSource call flow notifyDataMove > delete2ndItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0183 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataMove(-1, 15);
      subject.delete2ndItem();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0184
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0184
     * @tc.desc      KeyboardDataSource call flow totalCount > add1stItem > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0184 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.add1stItem();
      subject.notifyDataMove(-90, 5);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0185
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0185
     * @tc.desc      KeyboardDataSource call flow totalCount > add1stItem > delete1stItem > addLastItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0185 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.add1stItem();
      subject.delete1stItem();
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0186
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0186
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataAdd > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0186 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(94);
      const step3: string = subject.getData(-52);
      logInfo(`step3 getData(-52): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0187
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0187
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > notifyDataReload > reload > notifyDataReload > g...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0187 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataChange(48);
      subject.notifyDataReload();
      subject.reload();
      subject.notifyDataReload();
      const step5: string = subject.getData(40);
      logInfo(`step5 getData(40): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0188
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0188
     * @tc.desc      KeyboardDataSource call flow getData > totalCount > delete1stItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0188 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(-20);
      logInfo(`step1 getData(-20): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0189
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0189
     * @tc.desc      KeyboardDataSource call flow totalCount > delete1stItem > notifyDataDelete > add1stItem > delete...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0189 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.delete1stItem();
      subject.notifyDataDelete(10);
      subject.add1stItem();
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0190
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0190
     * @tc.desc      KeyboardDataSource call flow totalCount > modifyAllData > addItem > addLastItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0190 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.modifyAllData(['a', '', 'abc']);
      subject.addItem(-40);
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0191
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0191
     * @tc.desc      KeyboardDataSource call flow getData > delete2ndItem > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0191 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(69);
      logInfo(`step1 getData(69): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete2ndItem();
      subject.notifyDataDelete(155);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0192
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0192
     * @tc.desc      KeyboardDataSource call flow totalCount > modifyAllData > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0192 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.notifyDataAdd(82);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0193
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0193
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > add1stItem > deleteLastItem > totalCount keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0193 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.deleteLastItem();
      subject.add1stItem();
      subject.deleteLastItem();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0194
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0194
     * @tc.desc      KeyboardDataSource call flow getData > reload > notifyDataChange > add1stItem > delete1stItem ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0194 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(15);
      logInfo(`step1 getData(15): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.reload();
      subject.notifyDataChange(158);
      subject.add1stItem();
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0195
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0195
     * @tc.desc      KeyboardDataSource call flow reload > notifyDataChange > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0195 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.reload();
      subject.notifyDataChange(36.31);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0196
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0196
     * @tc.desc      KeyboardDataSource call flow totalCount > addItem > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0196 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.addItem(115);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0197
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0197
     * @tc.desc      KeyboardDataSource call flow modifyAllData > getData > getData > delete1stItem keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0197 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.modifyAllData(['', 'a', 'abc', 'Hello World', ' ']);
      const step2: string = subject.getData(0.86);
      logInfo(`step2 getData(0.86): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string = subject.getData(-38);
      logInfo(`step3 getData(-38): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0198
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0198
     * @tc.desc      KeyboardDataSource call flow reload > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0198 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.reload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0199
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0199
     * @tc.desc      KeyboardDataSource call flow add1stItem > getData > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0199 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.add1stItem();
      const step2: string = subject.getData(100);
      logInfo(`step2 getData(100): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataMove(15, 55);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0200
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0200
     * @tc.desc      KeyboardDataSource call flow addItem > notifyDataDelete > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0200 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.addItem(160);
      subject.notifyDataDelete(155);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0201
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0201
     * @tc.desc      KeyboardDataSource call flow modifyAllData > totalCount > addLastItem > notifyDataAdd keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0201 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.modifyAllData(['a', '', 'abc']);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.addLastItem();
      subject.notifyDataAdd(157);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0202
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0202
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > totalCount > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0202 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataAdd(100);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataDelete(17);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0203
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0203
     * @tc.desc      KeyboardDataSource call flow addLastItem > add1stItem > notifyDataReload > totalCount > deleteLa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0203 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.addLastItem();
      subject.add1stItem();
      subject.notifyDataReload();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0204
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0204
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0204 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(0.86);
      logInfo(`step1 getData(0.86): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(130);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0205
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0205
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > getData > notifyDataReload > addItem keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0205 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataDelete(90);
      const step2: string = subject.getData(10);
      logInfo(`step2 getData(10): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataReload();
      subject.addItem(40);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0206
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0206
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataReload > addLastItem > notifyDataReload > no...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0206 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataReload();
      subject.addLastItem();
      subject.notifyDataReload();
      subject.notifyDataDelete(-39);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0207
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0207
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0207 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(65);
      logInfo(`step1 getData(65): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(2);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0208
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0208
     * @tc.desc      KeyboardDataSource call flow getData > modifyAllData > add1stItem > modifyAllData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0208 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(100);
      logInfo(`step1 getData(100): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.modifyAllData(['abc', 'abc']);
      subject.add1stItem();
      subject.modifyAllData(['abc', 'abc']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0209
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0209
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > modifyAllData > totalCount > add1stItem keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0209 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.deleteLastItem();
      subject.modifyAllData(['', 'a']);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0210
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0210
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > notifyDataMove > totalCount > notifyDataMove > noti...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0210 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.delete2ndItem();
      subject.notifyDataMove(115, 90);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.notifyDataMove(25, 0);
      subject.notifyDataChange(59);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0211
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0211
     * @tc.desc      KeyboardDataSource call flow modifyAllData > getData > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0211 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.modifyAllData([]);
      const step2: string = subject.getData(81);
      logInfo(`step2 getData(81): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0212
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0212
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > getData > add1stItem > getData > delete1stItem k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0212 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataChange(75.37);
      const step2: string = subject.getData(100);
      logInfo(`step2 getData(100): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.add1stItem();
      const step4: string = subject.getData(64.48);
      logInfo(`step4 getData(64.48): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0212 end`);
    });
  });
}
