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

/** Logic checks for KeyboardDataSource flow (78 cases). */
export default function keyboardDataSourceFlow2Test(): void {
  describe('KeyboardDataSourceFlow2Test', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0072
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0072
     * @tc.desc      KeyboardDataSource call flow addItem > delete2ndItem > reload > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0072 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.addItem(32);
      subject.delete2ndItem();
      subject.reload();
      const step4: string = subject.getData(-69);
      logInfo(`step4 getData(-69): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0073
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0073
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > reload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0073 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(50);
      logInfo(`step1 getData(50): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(-12);
      subject.reload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0074
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0074
     * @tc.desc      KeyboardDataSource call flow addItem > getData > add1stItem > reload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0074 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.addItem(150);
      const step2: string = subject.getData(195);
      logInfo(`step2 getData(195): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.add1stItem();
      subject.reload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0075
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0075
     * @tc.desc      KeyboardDataSource call flow totalCount > delete2ndItem > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0075 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.delete2ndItem();
      subject.notifyDataAdd(179);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0076
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0076
     * @tc.desc      KeyboardDataSource call flow add1stItem > totalCount > notifyDataChange > modifyAllData > notify...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0076 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.add1stItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.notifyDataChange(48);
      subject.modifyAllData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      subject.notifyDataChange(52.67);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0077
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0077
     * @tc.desc      KeyboardDataSource call flow reload > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0077 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.reload();
      const step2: string = subject.getData(94.54);
      logInfo(`step2 getData(94.54): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0078
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0078
     * @tc.desc      KeyboardDataSource call flow add1stItem > notifyDataMove > addLastItem > getData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0078 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.add1stItem();
      subject.notifyDataMove(10, 35);
      subject.addLastItem();
      const step4: string = subject.getData(-31);
      logInfo(`step4 getData(-31): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0079
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0079
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > notifyDataReload > notifyDataChange ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0079 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(174);
      logInfo(`step1 getData(174): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(-94);
      subject.notifyDataReload();
      subject.notifyDataChange(-27);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0080
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0080
     * @tc.desc      KeyboardDataSource call flow addLastItem > notifyDataMove > totalCount > addLastItem keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0080 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.addLastItem();
      subject.notifyDataMove(30, 105);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0081
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0081
     * @tc.desc      KeyboardDataSource call flow totalCount > addItem > deleteLastItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0081 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.addItem(-20);
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0082
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0082
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0082 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataDelete(12.48);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0083
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0083
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0083 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataDelete(120);
      const step2: string = subject.getData(116);
      logInfo(`step2 getData(116): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0084
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0084
     * @tc.desc      KeyboardDataSource call flow delete1stItem > totalCount > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0084 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.delete1stItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataChange(80);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0085
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0085
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataAdd > deleteLastItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0085 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(69);
      logInfo(`step1 getData(69): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataAdd(15);
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0086
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0086
     * @tc.desc      KeyboardDataSource call flow totalCount > addLastItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0086 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0087
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0087
     * @tc.desc      KeyboardDataSource call flow reload > delete1stItem > notifyDataMove > totalCount > notifyDataDe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0087 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.reload();
      subject.delete1stItem();
      subject.notifyDataMove(80, 0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataDelete(125);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0088
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0088
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > getData > addLastItem > add1stItem > delete2ndIt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0088 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataReload();
      const step2: string = subject.getData(42.56);
      logInfo(`step2 getData(42.56): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addLastItem();
      subject.add1stItem();
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0089
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0089
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > getData > notifyDataChange > notifyDataReload > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0089 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataReload();
      const step2: string = subject.getData(-40);
      logInfo(`step2 getData(-40): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataChange(163);
      subject.notifyDataReload();
      subject.notifyDataChange(130);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0090
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0090
     * @tc.desc      KeyboardDataSource call flow notifyDataMove > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0090 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataMove(100, 15);
      const step2: string = subject.getData(40.23);
      logInfo(`step2 getData(40.23): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0091
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0091
     * @tc.desc      KeyboardDataSource call flow modifyAllData > totalCount > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0091 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.modifyAllData(['', 'a']);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.notifyDataChange(120);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0092
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0092
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > getData > deleteLastItem > notifyDataAdd > delete2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0092 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.deleteLastItem();
      const step2: string = subject.getData(26);
      logInfo(`step2 getData(26): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.deleteLastItem();
      subject.notifyDataAdd(40.48);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0093
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0093
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > totalCount > notifyDataChange > notifyDataMove > ad...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0093 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.delete2ndItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataChange(181);
      subject.notifyDataMove(0, 182);
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0094
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0094
     * @tc.desc      KeyboardDataSource call flow modifyAllData > addItem > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0094 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.modifyAllData(['', 'a']);
      subject.addItem(155);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0095
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0095
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > add1stItem > addLastItem > getData keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0095 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataDelete(5);
      subject.add1stItem();
      subject.addLastItem();
      const step4: string = subject.getData(180);
      logInfo(`step4 getData(180): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0096
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0096
     * @tc.desc      KeyboardDataSource call flow delete1stItem > getData > deleteLastItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0096 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.delete1stItem();
      const step2: string = subject.getData(54.19);
      logInfo(`step2 getData(54.19): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0097
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0097
     * @tc.desc      KeyboardDataSource call flow reload > deleteLastItem > deleteLastItem > getData > modifyAllData ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0097 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.reload();
      subject.deleteLastItem();
      subject.deleteLastItem();
      const step4: string = subject.getData(44.99);
      logInfo(`step4 getData(44.99): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.modifyAllData(['a', '', 'abc']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0098
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0098
     * @tc.desc      KeyboardDataSource call flow addItem > notifyDataAdd > getData > addItem > notifyDataReload keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0098 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.addItem(-7);
      subject.notifyDataAdd(45);
      const step3: string = subject.getData(-50);
      logInfo(`step3 getData(-50): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addItem(181);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0099
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0099
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0099 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.deleteLastItem();
      const step2: string = subject.getData(-47);
      logInfo(`step2 getData(-47): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0100
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0100
     * @tc.desc      KeyboardDataSource call flow getData > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0100 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(60);
      logInfo(`step1 getData(60): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addItem(70.33);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0101
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0101
     * @tc.desc      KeyboardDataSource call flow modifyAllData > delete2ndItem > getData > notifyDataDelete keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0101 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.delete2ndItem();
      const step3: string = subject.getData(60.23);
      logInfo(`step3 getData(60.23): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataDelete(-12);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0102
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0102
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataChange > notifyDataDelete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0102 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataChange(-36);
      subject.notifyDataDelete(195);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0103
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0103
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > totalCount > modifyAllData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0103 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataAdd(45.4);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.modifyAllData(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0104
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0104
     * @tc.desc      KeyboardDataSource call flow delete1stItem > totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0104 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.delete1stItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0105
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0105
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataChange > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0105 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataChange(75.89);
      subject.addItem(15);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0106
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0106
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0106 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataReload();
      const step2: string = subject.getData(165);
      logInfo(`step2 getData(165): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0107
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0107
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > notifyDataMove > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0107 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataAdd(198);
      subject.notifyDataMove(2, 35);
      const step3: string = subject.getData(7);
      logInfo(`step3 getData(7): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0108
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0108
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > delete1stItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0108 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(171);
      logInfo(`step1 getData(171): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(125);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0109
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0109
     * @tc.desc      KeyboardDataSource call flow getData > addItem > add1stItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0109 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(105);
      logInfo(`step1 getData(105): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addItem(52.75);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0110
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0110
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0110 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataChange(20);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0111
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0111
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0111 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(178);
      logInfo(`step1 getData(178): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataAdd(30);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0112
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0112
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > deleteLastItem > notifyDataMove > totalCount keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0112 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.deleteLastItem();
      subject.deleteLastItem();
      subject.notifyDataMove(100, 115);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0113
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0113
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataMove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0113 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataMove(55, 0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0114
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0114
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataAdd > addLastItem > addLastItem keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0114 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(16.57);
      logInfo(`step1 getData(16.57): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataAdd(93.74);
      subject.addLastItem();
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0115
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0115
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > notifyDataReload > getData > reload > deleteLastIte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0115 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataAdd(-13);
      subject.notifyDataReload();
      const step3: string = subject.getData(94.54);
      logInfo(`step3 getData(94.54): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.reload();
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0116
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0116
     * @tc.desc      KeyboardDataSource call flow totalCount > delete2ndItem > delete1stItem > modifyAllData keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0116 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.delete2ndItem();
      subject.delete1stItem();
      subject.modifyAllData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0117
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0117
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataChange > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0117 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataChange(9);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0118
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0118
     * @tc.desc      KeyboardDataSource call flow addLastItem > getData > addLastItem > deleteLastItem > notifyDataCh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0118 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.addLastItem();
      const step2: string = subject.getData(85);
      logInfo(`step2 getData(85): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addLastItem();
      subject.deleteLastItem();
      subject.notifyDataChange(64.66);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0119
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0119
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > reload > getData > notifyDataDelete > notifyData...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0119 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataDelete(23);
      subject.reload();
      const step3: string = subject.getData(155);
      logInfo(`step3 getData(155): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataDelete(67.09);
      subject.notifyDataMove(85, 115);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0120
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0120
     * @tc.desc      KeyboardDataSource call flow getData > delete2ndItem > modifyAllData > reload > deleteLastItem k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0120 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(140);
      logInfo(`step1 getData(140): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete2ndItem();
      subject.modifyAllData(['a', '', 'abc']);
      subject.reload();
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0121
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0121
     * @tc.desc      KeyboardDataSource call flow delete1stItem > getData > notifyDataMove > delete2ndItem keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0121 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.delete1stItem();
      const step2: string = subject.getData(-38);
      logInfo(`step2 getData(-38): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataMove(1, 10);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0122
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0122
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataDelete > reload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0122 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataDelete(110);
      subject.reload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0123
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0123
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > notifyDataDelete > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0123 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataAdd(2);
      subject.notifyDataDelete(185);
      const step3: string = subject.getData(186);
      logInfo(`step3 getData(186): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0124
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0124
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataChange keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0124 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(44.99);
      logInfo(`step1 getData(44.99): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataChange(45);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0125
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0125
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > getData > notifyDataDelete > notifyDataDelete > not...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0125 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataAdd(123);
      const step2: string = subject.getData(190);
      logInfo(`step2 getData(190): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataDelete(-52);
      subject.notifyDataDelete(135);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0126
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0126
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > getData > deleteLastItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0126 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataAdd(180);
      const step2: string = subject.getData(6);
      logInfo(`step2 getData(6): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0127
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0127
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > getData > reload > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0127 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataChange(63.8);
      const step2: string = subject.getData(90.97);
      logInfo(`step2 getData(90.97): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.reload();
      subject.addItem(188);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0128
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0128
     * @tc.desc      KeyboardDataSource call flow add1stItem > totalCount > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0128 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.add1stItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0129
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0129
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0129 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataChange(29);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0130
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0130
     * @tc.desc      KeyboardDataSource call flow add1stItem > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0130 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.add1stItem();
      const step2: string = subject.getData(35);
      logInfo(`step2 getData(35): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0131
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0131
     * @tc.desc      KeyboardDataSource call flow totalCount > modifyAllData > notifyDataReload > modifyAllData > not...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0131 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.modifyAllData(['', 'a', 'abc', 'Hello World', ' ']);
      subject.notifyDataReload();
      subject.modifyAllData([]);
      subject.notifyDataAdd(157);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0132
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0132
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > totalCount > notifyDataMove > notifyDataMove > noti...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0132 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.delete2ndItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.notifyDataMove(30, 105);
      subject.notifyDataMove(70, 0);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0133
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0133
     * @tc.desc      KeyboardDataSource call flow totalCount > delete1stItem > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0133 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.delete1stItem();
      subject.notifyDataDelete(97.97);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0134
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0134
     * @tc.desc      KeyboardDataSource call flow totalCount > reload > add1stItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0134 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.reload();
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0135
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0135
     * @tc.desc      KeyboardDataSource call flow getData > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0135 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(190);
      logInfo(`step1 getData(190): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addItem(109);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0136
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0136
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataChange > notifyDataAdd > notifyDataAdd > addIte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0136 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(8);
      logInfo(`step1 getData(8): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataChange(99.23);
      subject.notifyDataAdd(-22);
      subject.notifyDataAdd(58.29);
      subject.addItem(38);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0137
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0137
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > delete2ndItem > getData > delete1stItem keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0137 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.deleteLastItem();
      subject.delete2ndItem();
      const step3: string = subject.getData(135);
      logInfo(`step3 getData(135): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0138
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0138
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > delete1stItem > notifyDataMove > total...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0138 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(-16);
      logInfo(`step1 getData(-16): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(175);
      subject.delete1stItem();
      subject.notifyDataMove(10, 99);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0139
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0139
     * @tc.desc      KeyboardDataSource call flow getData > getData > notifyDataMove > modifyAllData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0139 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(-3);
      logInfo(`step1 getData(-3): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string = subject.getData(55);
      logInfo(`step2 getData(55): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataMove(115, 90);
      subject.modifyAllData(['', 'a']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0140
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0140
     * @tc.desc      KeyboardDataSource call flow reload > totalCount > delete1stItem > notifyDataDelete keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0140 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.reload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.delete1stItem();
      subject.notifyDataDelete(175);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0141
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0141
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0141 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.notifyDataAdd(94);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0142
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0142
     * @tc.desc      KeyboardDataSource call flow addItem > totalCount > delete2ndItem > notifyDataDelete > delete1st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0142 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.addItem(-61);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.delete2ndItem();
      subject.notifyDataDelete(-89);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0143
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0143
     * @tc.desc      KeyboardDataSource call flow addLastItem > totalCount > addItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0143 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.addLastItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addItem(10);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0144
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0144
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > getData > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0144 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataReload();
      const step2: string = subject.getData(116);
      logInfo(`step2 getData(116): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0145
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0145
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataMove > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0145 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(10);
      logInfo(`step1 getData(10): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataMove(0, 40);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0146
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0146
     * @tc.desc      KeyboardDataSource call flow notifyDataMove > getData > addItem > notifyDataDelete keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0146 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataMove(-90, 60);
      const step2: string = subject.getData(-73);
      logInfo(`step2 getData(-73): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addItem(113);
      subject.notifyDataDelete(151);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0147
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0147
     * @tc.desc      KeyboardDataSource call flow addItem > totalCount > delete1stItem > notifyDataChange keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0147 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.addItem(198);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.delete1stItem();
      subject.notifyDataChange(-51);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0148
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0148
     * @tc.desc      KeyboardDataSource call flow modifyAllData > notifyDataDelete > addLastItem > getData keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0148 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.modifyAllData(['a', '', 'abc']);
      subject.notifyDataDelete(11);
      subject.addLastItem();
      const step4: string = subject.getData(106);
      logInfo(`step4 getData(106): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0149
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0149
     * @tc.desc      KeyboardDataSource call flow totalCount > addItem > delete2ndItem > delete1stItem > modifyAllDat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0149 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.addItem(120);
      subject.delete2ndItem();
      subject.delete1stItem();
      subject.modifyAllData(['']);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0149 end`);
    });
  });
}
