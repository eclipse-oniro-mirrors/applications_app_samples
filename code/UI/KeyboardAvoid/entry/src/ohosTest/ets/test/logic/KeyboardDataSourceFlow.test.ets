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

/** Logic checks for KeyboardDataSource flow (71 cases). */
export default function keyboardDataSourceFlowTest(): void {
  describe('KeyboardDataSourceFlowTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0001
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0001
     * @tc.desc      KeyboardDataSource call flow notifyDataMove > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0001 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataMove(0, 35);
      const step2: string = subject.getData(190);
      logInfo(`step2 getData(190): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0002
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0002
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > addItem > notifyDataMove > getData > reload keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0002 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataChange(56.64);
      subject.addItem(-40);
      subject.notifyDataMove(110, 182);
      const step4: string = subject.getData(-52);
      logInfo(`step4 getData(-52): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.reload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0003
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0003
     * @tc.desc      KeyboardDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0003 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0004
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0004
     * @tc.desc      KeyboardDataSource call flow getData > modifyAllData > notifyDataMove > notifyDataChange keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0004 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(174);
      logInfo(`step1 getData(174): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.modifyAllData(['', 'a', 'abc', 'Hello World', ' ']);
      subject.notifyDataMove(55, 75);
      subject.notifyDataChange(16.9);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0005
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0005
     * @tc.desc      KeyboardDataSource call flow addLastItem > totalCount > delete2ndItem > notifyDataAdd > add1stIt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0005 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.addLastItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.delete2ndItem();
      subject.notifyDataAdd(-66);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0006
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0006
     * @tc.desc      KeyboardDataSource call flow totalCount > deleteLastItem > notifyDataDelete > add1stItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0006 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.deleteLastItem();
      subject.notifyDataDelete(97.01);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0007
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0007
     * @tc.desc      KeyboardDataSource call flow totalCount > deleteLastItem > notifyDataAdd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0007 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.deleteLastItem();
      subject.notifyDataAdd(192);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0008
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0008
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > deleteLastItem > getData > delete1stItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0008 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataChange(164);
      subject.deleteLastItem();
      const step3: string = subject.getData(8);
      logInfo(`step3 getData(8): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0009
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0009
     * @tc.desc      KeyboardDataSource call flow reload > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0009 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.reload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0010
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0010
     * @tc.desc      KeyboardDataSource call flow modifyAllData > addItem > totalCount > delete1stItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0010 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.addItem(200);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(6);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0011
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0011
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataDelete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0011 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataDelete(60.42);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0012
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0012
     * @tc.desc      KeyboardDataSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0012 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(100);
      logInfo(`step1 getData(100): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string = subject.getData(54);
      logInfo(`step2 getData(54): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0013
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0013
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > addLastItem > totalCount > delete1stItem keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0013 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataAdd(82);
      subject.addLastItem();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(3);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0014
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0014
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > addLastItem > add1stItem > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0014 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataReload();
      subject.addLastItem();
      subject.add1stItem();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0015
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0015
     * @tc.desc      KeyboardDataSource call flow addLastItem > deleteLastItem > notifyDataDelete > totalCount > noti...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0015 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.addLastItem();
      subject.deleteLastItem();
      subject.notifyDataDelete(195);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.notifyDataAdd(88);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0016
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0016
     * @tc.desc      KeyboardDataSource call flow getData > totalCount > delete2ndItem > deleteLastItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0016 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(-47);
      logInfo(`step1 getData(-47): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.delete2ndItem();
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0017
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0017
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > totalCount > notifyDataReload > notifyDataMove kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0017 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.deleteLastItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataReload();
      subject.notifyDataMove(110, 85);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0018
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0018
     * @tc.desc      KeyboardDataSource call flow modifyAllData > notifyDataAdd > delete1stItem > totalCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0018 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.modifyAllData(['', 'a']);
      subject.notifyDataAdd(66);
      subject.delete1stItem();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0019
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0019
     * @tc.desc      KeyboardDataSource call flow addLastItem > notifyDataChange > getData > notifyDataMove > getData...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0019 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.addLastItem();
      subject.notifyDataChange(115);
      const step3: string = subject.getData(6);
      logInfo(`step3 getData(6): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataMove(5, -1);
      const step5: string = subject.getData(30);
      logInfo(`step5 getData(30): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0020
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0020
     * @tc.desc      KeyboardDataSource call flow modifyAllData > deleteLastItem > deleteLastItem > getData > getData...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0020 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.deleteLastItem();
      subject.deleteLastItem();
      const step4: string = subject.getData(-50);
      logInfo(`step4 getData(-50): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string = subject.getData(123);
      logInfo(`step5 getData(123): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0021
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0021
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > getData > totalCount > modifyAllData > delete2ndIte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0021 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.delete2ndItem();
      const step2: string = subject.getData(64);
      logInfo(`step2 getData(64): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.modifyAllData(['', 'a']);
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0022
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0022
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > getData > notifyDataChange > getData > notifyDataCh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0022 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.delete2ndItem();
      const step2: string = subject.getData(3);
      logInfo(`step2 getData(3): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataChange(-48);
      const step4: string = subject.getData(-4);
      logInfo(`step4 getData(-4): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.notifyDataChange(-50);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0023
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0023
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataAdd > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0023 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.notifyDataAdd(86.39);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0024
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0024
     * @tc.desc      KeyboardDataSource call flow reload > deleteLastItem > deleteLastItem > notifyDataDelete > total...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0024 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.reload();
      subject.deleteLastItem();
      subject.deleteLastItem();
      subject.notifyDataDelete(160);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0025
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0025
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > add1stItem > getData > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0025 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataReload();
      subject.add1stItem();
      const step3: string = subject.getData(5);
      logInfo(`step3 getData(5): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0026
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0026
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > getData > getData > notifyDataChange keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0026 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.deleteLastItem();
      const step2: string = subject.getData(-47);
      logInfo(`step2 getData(-47): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string = subject.getData(60);
      logInfo(`step3 getData(60): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataChange(91);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0027
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0027
     * @tc.desc      KeyboardDataSource call flow totalCount > modifyAllData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0027 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.modifyAllData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      const step3: string = subject.getData(165);
      logInfo(`step3 getData(165): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0028
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0028
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > notifyDataChange > notifyDataMove > to...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0028 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(151);
      logInfo(`step1 getData(151): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(48.84);
      subject.notifyDataChange(-93);
      subject.notifyDataMove(70, 30);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0029
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0029
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > totalCount > addLastItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0029 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataAdd(168);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0030
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0030
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > addItem > modifyAllData > delete1stItem > getDat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0030 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataChange(70);
      subject.addItem(70);
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.delete1stItem();
      const step5: string = subject.getData(15);
      logInfo(`step5 getData(15): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0031
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0031
     * @tc.desc      KeyboardDataSource call flow add1stItem > notifyDataDelete > totalCount > add1stItem keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0031 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.add1stItem();
      subject.notifyDataDelete(77.11);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0032
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0032
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > notifyDataChange > totalCount > getData keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0032 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataChange(185);
      subject.notifyDataChange(-72);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.getData(145);
      logInfo(`step4 getData(145): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0033
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0033
     * @tc.desc      KeyboardDataSource call flow getData > delete1stItem > addLastItem > notifyDataDelete > totalCou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0033 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(44.99);
      logInfo(`step1 getData(44.99): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete1stItem();
      subject.addLastItem();
      subject.notifyDataDelete(-37);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0034
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0034
     * @tc.desc      KeyboardDataSource call flow modifyAllData > getData > totalCount > modifyAllData > delete1stIte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0034 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.modifyAllData(['', 'a']);
      const step2: string = subject.getData(0);
      logInfo(`step2 getData(0): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.modifyAllData(['', 'a', 'abc', 'Hello World', ' ']);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0035
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0035
     * @tc.desc      KeyboardDataSource call flow addLastItem > notifyDataReload > addItem > totalCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0035 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.addLastItem();
      subject.notifyDataReload();
      subject.addItem(30);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0036
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0036
     * @tc.desc      KeyboardDataSource call flow getData > getData > getData > notifyDataAdd > notifyDataReload keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0036 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(145);
      logInfo(`step1 getData(145): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string = subject.getData(151);
      logInfo(`step2 getData(151): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string = subject.getData(50);
      logInfo(`step3 getData(50): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataAdd(7.76);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0037
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0037
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataChange > getData > reload > addItem keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0037 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataChange(170);
      const step3: string = subject.getData(160);
      logInfo(`step3 getData(160): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.reload();
      subject.addItem(77.13);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0038
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0038
     * @tc.desc      KeyboardDataSource call flow totalCount > delete1stItem > notifyDataChange > notifyDataMove > ge...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0038 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.delete1stItem();
      subject.notifyDataChange(21);
      subject.notifyDataMove(90, 182);
      const step5: string = subject.getData(4);
      logInfo(`step5 getData(4): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0039
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0039
     * @tc.desc      KeyboardDataSource call flow modifyAllData > modifyAllData > addLastItem > totalCount keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0039 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.modifyAllData(['a', '', 'abc']);
      subject.addLastItem();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(4);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0040
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0040
     * @tc.desc      KeyboardDataSource call flow addLastItem > notifyDataDelete > getData > totalCount > notifyDataM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0040 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.addLastItem();
      subject.notifyDataDelete(150);
      const step3: string = subject.getData(60.23);
      logInfo(`step3 getData(60.23): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.notifyDataMove(10, 0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0041
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0041
     * @tc.desc      KeyboardDataSource call flow modifyAllData > notifyDataDelete > getData > getData > add1stItem k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0041 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.modifyAllData([]);
      subject.notifyDataDelete(100);
      const step3: string = subject.getData(104);
      logInfo(`step3 getData(104): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string = subject.getData(42.56);
      logInfo(`step4 getData(42.56): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0042
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0042
     * @tc.desc      KeyboardDataSource call flow getData > totalCount > add1stItem > addLastItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0042 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: string = subject.getData(54);
      logInfo(`step1 getData(54): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.add1stItem();
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0043
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0043
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > totalCount > notifyDataMove > getData > delete1s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0043 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataChange(166);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.notifyDataMove(-90, 70);
      const step4: string = subject.getData(64);
      logInfo(`step4 getData(64): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0044
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0044
     * @tc.desc      KeyboardDataSource call flow totalCount > notifyDataReload > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0044 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.notifyDataReload();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0045
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0045
     * @tc.desc      KeyboardDataSource call flow notifyDataReload > totalCount > add1stItem > addLastItem > totalCou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0045 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataReload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.add1stItem();
      subject.addLastItem();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0046
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0046
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > deleteLastItem > totalCount > add1stItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0046 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataDelete(70);
      subject.deleteLastItem();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.add1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0047
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0047
     * @tc.desc      KeyboardDataSource call flow getData > addItem > totalCount > reload > addLastItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0047 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(-3);
      logInfo(`step1 getData(-3): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addItem(75);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.reload();
      subject.addLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0048
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0048
     * @tc.desc      KeyboardDataSource call flow reload > notifyDataChange > totalCount > modifyAllData > delete1stI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0048 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.reload();
      subject.notifyDataChange(110);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.modifyAllData(['123', ' ', 'Hello World', 'abc', 'a', '']);
      subject.delete1stItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0049
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0049
     * @tc.desc      KeyboardDataSource call flow notifyDataMove > delete1stItem > delete2ndItem > modifyAllData > to...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0049 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataMove(30, 25);
      subject.delete1stItem();
      subject.delete2ndItem();
      subject.modifyAllData(['a', '', 'abc']);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0050
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0050
     * @tc.desc      KeyboardDataSource call flow notifyDataAdd > delete1stItem > totalCount > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0050 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataAdd(34);
      subject.delete1stItem();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.getData(3);
      logInfo(`step4 getData(3): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0051
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0051
     * @tc.desc      KeyboardDataSource call flow totalCount > getData > delete2ndItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0051 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string = subject.getData(-68);
      logInfo(`step2 getData(-68): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete2ndItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0052
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0052
     * @tc.desc      KeyboardDataSource call flow modifyAllData > getData > add1stItem > modifyAllData > addItem keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0052 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.modifyAllData(['abc', 'abc']);
      const step2: string = subject.getData(0);
      logInfo(`step2 getData(0): step2=${step2}`);
      expect(step2).assertEqual('abc');
      subject.add1stItem();
      subject.modifyAllData(['Hello World', 'a', ' ', 'a', '123']);
      subject.addItem(170);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0053
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0053
     * @tc.desc      KeyboardDataSource call flow addLastItem > deleteLastItem > notifyDataDelete > addItem > totalCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0053 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.addLastItem();
      subject.deleteLastItem();
      subject.notifyDataDelete(50);
      subject.addItem(-87);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0054
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0054
     * @tc.desc      KeyboardDataSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0054 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.getData(42.56);
      logInfo(`step2 getData(42.56): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0055
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0055
     * @tc.desc      KeyboardDataSource call flow totalCount > totalCount > delete1stItem > totalCount > deleteLastIt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0055 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.delete1stItem();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.deleteLastItem();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0056
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0056
     * @tc.desc      KeyboardDataSource call flow delete1stItem > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0056 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.delete1stItem();
      const step2: string = subject.getData(30);
      logInfo(`step2 getData(30): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.getData(-20);
      logInfo(`step4 getData(-20): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0057
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0057
     * @tc.desc      KeyboardDataSource call flow delete2ndItem > notifyDataAdd > notifyDataAdd > reload > totalCount...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0057 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.delete2ndItem();
      subject.notifyDataAdd(27);
      subject.notifyDataAdd(110);
      subject.reload();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0058
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0058
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0058 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      subject.notifyDataDelete(-52);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.getData(-19);
      logInfo(`step3 getData(-19): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0059
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0059
     * @tc.desc      KeyboardDataSource call flow getData > totalCount > notifyDataReload keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0059 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: string = subject.getData(100);
      logInfo(`step1 getData(100): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0060
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0060
     * @tc.desc      KeyboardDataSource call flow getData > delete2ndItem > addLastItem > addItem > totalCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0060 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(100);
      logInfo(`step1 getData(100): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete2ndItem();
      subject.addLastItem();
      subject.addItem(-12);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0061
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0061
     * @tc.desc      KeyboardDataSource call flow add1stItem > totalCount > deleteLastItem > totalCount > notifyDataR...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0061 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.add1stItem();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(3);
      subject.deleteLastItem();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.notifyDataReload();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0062
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0062
     * @tc.desc      KeyboardDataSource call flow getData > notifyDataDelete > delete2ndItem > getData keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0062 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: string = subject.getData(56.93);
      logInfo(`step1 getData(56.93): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.notifyDataDelete(80);
      subject.delete2ndItem();
      const step4: string = subject.getData(70);
      logInfo(`step4 getData(70): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0063
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0063
     * @tc.desc      KeyboardDataSource call flow totalCount > getData > addLastItem > notifyDataAdd > notifyDataAdd ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0063 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string = subject.getData(-31);
      logInfo(`step2 getData(-31): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addLastItem();
      subject.notifyDataAdd(168);
      subject.notifyDataAdd(15);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0064
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0064
     * @tc.desc      KeyboardDataSource call flow totalCount > totalCount > notifyDataMove > getData keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0064 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.notifyDataMove(-1, 2);
      const step4: string = subject.getData(-5);
      logInfo(`step4 getData(-5): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0065
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0065
     * @tc.desc      KeyboardDataSource call flow notifyDataDelete > notifyDataMove > addItem > totalCount > getData ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0065 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.notifyDataDelete(-89);
      subject.notifyDataMove(-1, 2);
      subject.addItem(177);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: string = subject.getData(48);
      logInfo(`step5 getData(48): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0066
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0066
     * @tc.desc      KeyboardDataSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0066 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0067
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0067
     * @tc.desc      KeyboardDataSource call flow deleteLastItem > delete2ndItem > getData > notifyDataDelete > total...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0067 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.deleteLastItem();
      subject.delete2ndItem();
      const step3: string = subject.getData(-68);
      logInfo(`step3 getData(-68): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.notifyDataDelete(147);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0068
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0068
     * @tc.desc      KeyboardDataSource call flow reload > totalCount > notifyDataChange > notifyDataChange > totalCo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0068 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.reload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.notifyDataChange(-84);
      subject.notifyDataChange(36.41);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0069
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0069
     * @tc.desc      KeyboardDataSource call flow notifyDataChange > getData > notifyDataChange > totalCount > addIte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0069 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['']);
      subject.notifyDataChange(63.8);
      const step2: string = subject.getData(-73);
      logInfo(`step2 getData(-73): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.notifyDataChange(65);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.addItem(70);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0070
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0070
     * @tc.desc      KeyboardDataSource call flow reload > totalCount > totalCount > notifyDataMove keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0070 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource(['', 'a']);
      subject.reload();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.notifyDataMove(110, 5);
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_DATA_SOURCE_FLOW_0071
     * @tc.name      KeyboardAvoid_KeyboardDataSourceFlow_0071
     * @tc.desc      KeyboardDataSource call flow totalCount > modifyAllData > notifyDataDelete > getData > getData k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_KeyboardDataSourceFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0071 begin`);
      const subject: KeyboardDataSource = new KeyboardDataSource([]);
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.modifyAllData(['abc', 'abc']);
      subject.notifyDataDelete(69);
      const step4: string = subject.getData(69);
      logInfo(`step4 getData(69): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string = subject.getData(54);
      logInfo(`step5 getData(54): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}KeyboardDataSourceFlow_0071 end`);
    });
  });
}
