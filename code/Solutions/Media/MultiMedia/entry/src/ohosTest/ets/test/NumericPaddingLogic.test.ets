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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { LogicTestLog } from '../utils/LogicTestLog';
import DateTimeUtil from '../../../main/ets/model/DateTimeUtil';
import { getDurationString, tempNum } from '../../../main/ets/model/TimeUtils';

export default function NumericPaddingLogic(): void {
  describe('NumericPaddingLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1344
     * @tc.name MultiMedia_Padding_1344
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1344', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1344';
      LogicTestLog.begin(name, 'value=-Infinity');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = Number.NEGATIVE_INFINITY;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('0-Infinity'), String(datePadding));
      expect(datePadding).assertEqual('0-Infinity');
      LogicTestLog.value(name, 'duration padding result', String('0-Infinity'), String(durationPadding));
      expect(durationPadding).assertEqual('0-Infinity');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('0-Infinity'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('0-Infinity');
      LogicTestLog.value(name, 'repeat duration formatting', String('0-Infinity'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('0-Infinity');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1345
     * @tc.name MultiMedia_Padding_1345
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1345', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1345';
      LogicTestLog.begin(name, 'value=-100');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = -100;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('0-100'), String(datePadding));
      expect(datePadding).assertEqual('0-100');
      LogicTestLog.value(name, 'duration padding result', String('0-100'), String(durationPadding));
      expect(durationPadding).assertEqual('0-100');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('0-100'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('0-100');
      LogicTestLog.value(name, 'repeat duration formatting', String('0-100'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('0-100');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1346
     * @tc.name MultiMedia_Padding_1346
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1346', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1346';
      LogicTestLog.begin(name, 'value=-10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = -10;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('0-10'), String(datePadding));
      expect(datePadding).assertEqual('0-10');
      LogicTestLog.value(name, 'duration padding result', String('0-10'), String(durationPadding));
      expect(durationPadding).assertEqual('0-10');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('0-10'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('0-10');
      LogicTestLog.value(name, 'repeat duration formatting', String('0-10'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('0-10');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1347
     * @tc.name MultiMedia_Padding_1347
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1347', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1347';
      LogicTestLog.begin(name, 'value=-1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = -1;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('0-1'), String(datePadding));
      expect(datePadding).assertEqual('0-1');
      LogicTestLog.value(name, 'duration padding result', String('0-1'), String(durationPadding));
      expect(durationPadding).assertEqual('0-1');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('0-1'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('0-1');
      LogicTestLog.value(name, 'repeat duration formatting', String('0-1'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('0-1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1348
     * @tc.name MultiMedia_Padding_1348
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1348', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1348';
      LogicTestLog.begin(name, 'value=-0.5');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = -0.5;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('0-0.5'), String(datePadding));
      expect(datePadding).assertEqual('0-0.5');
      LogicTestLog.value(name, 'duration padding result', String('0-0.5'), String(durationPadding));
      expect(durationPadding).assertEqual('0-0.5');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('0-0.5'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('0-0.5');
      LogicTestLog.value(name, 'repeat duration formatting', String('0-0.5'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('0-0.5');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1349
     * @tc.name MultiMedia_Padding_1349
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1349', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1349';
      LogicTestLog.begin(name, 'value=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = -0;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('00'), String(datePadding));
      expect(datePadding).assertEqual('00');
      LogicTestLog.value(name, 'duration padding result', String('00'), String(durationPadding));
      expect(durationPadding).assertEqual('00');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('00'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('00');
      LogicTestLog.value(name, 'repeat duration formatting', String('00'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1350
     * @tc.name MultiMedia_Padding_1350
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1350', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1350';
      LogicTestLog.begin(name, 'value=5e-324');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 5e-324;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('05e-324'), String(datePadding));
      expect(datePadding).assertEqual('05e-324');
      LogicTestLog.value(name, 'duration padding result', String('05e-324'), String(durationPadding));
      expect(durationPadding).assertEqual('05e-324');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('05e-324'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('05e-324');
      LogicTestLog.value(name, 'repeat duration formatting', String('05e-324'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('05e-324');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1351
     * @tc.name MultiMedia_Padding_1351
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1351', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1351';
      LogicTestLog.begin(name, 'value=0.1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 0.1;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('00.1'), String(datePadding));
      expect(datePadding).assertEqual('00.1');
      LogicTestLog.value(name, 'duration padding result', String('00.1'), String(durationPadding));
      expect(durationPadding).assertEqual('00.1');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('00.1'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('00.1');
      LogicTestLog.value(name, 'repeat duration formatting', String('00.1'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('00.1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1352
     * @tc.name MultiMedia_Padding_1352
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1352', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1352';
      LogicTestLog.begin(name, 'value=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 1;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('01'), String(datePadding));
      expect(datePadding).assertEqual('01');
      LogicTestLog.value(name, 'duration padding result', String('01'), String(durationPadding));
      expect(durationPadding).assertEqual('01');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('01'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('01');
      LogicTestLog.value(name, 'repeat duration formatting', String('01'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1353
     * @tc.name MultiMedia_Padding_1353
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1353', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1353';
      LogicTestLog.begin(name, 'value=2');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 2;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('02'), String(datePadding));
      expect(datePadding).assertEqual('02');
      LogicTestLog.value(name, 'duration padding result', String('02'), String(durationPadding));
      expect(durationPadding).assertEqual('02');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('02'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('02');
      LogicTestLog.value(name, 'repeat duration formatting', String('02'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('02');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1354
     * @tc.name MultiMedia_Padding_1354
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1354', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1354';
      LogicTestLog.begin(name, 'value=5');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 5;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('05'), String(datePadding));
      expect(datePadding).assertEqual('05');
      LogicTestLog.value(name, 'duration padding result', String('05'), String(durationPadding));
      expect(durationPadding).assertEqual('05');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('05'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('05');
      LogicTestLog.value(name, 'repeat duration formatting', String('05'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('05');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1355
     * @tc.name MultiMedia_Padding_1355
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1355', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1355';
      LogicTestLog.begin(name, 'value=8');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 8;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('08'), String(datePadding));
      expect(datePadding).assertEqual('08');
      LogicTestLog.value(name, 'duration padding result', String('08'), String(durationPadding));
      expect(durationPadding).assertEqual('08');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('08'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('08');
      LogicTestLog.value(name, 'repeat duration formatting', String('08'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('08');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1356
     * @tc.name MultiMedia_Padding_1356
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1356', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1356';
      LogicTestLog.begin(name, 'value=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 9;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('09'), String(datePadding));
      expect(datePadding).assertEqual('09');
      LogicTestLog.value(name, 'duration padding result', String('09'), String(durationPadding));
      expect(durationPadding).assertEqual('09');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('09'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('09');
      LogicTestLog.value(name, 'repeat duration formatting', String('09'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('09');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1357
     * @tc.name MultiMedia_Padding_1357
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1357', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1357';
      LogicTestLog.begin(name, 'value=9.25');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 9.25;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('9.25'), String(datePadding));
      expect(datePadding).assertEqual('9.25');
      LogicTestLog.value(name, 'duration padding result', String('09.25'), String(durationPadding));
      expect(durationPadding).assertEqual('09.25');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('9.25'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('9.25');
      LogicTestLog.value(name, 'repeat duration formatting', String('09.25'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('09.25');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1358
     * @tc.name MultiMedia_Padding_1358
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1358', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1358';
      LogicTestLog.begin(name, 'value=9.5');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 9.5;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('9.5'), String(datePadding));
      expect(datePadding).assertEqual('9.5');
      LogicTestLog.value(name, 'duration padding result', String('09.5'), String(durationPadding));
      expect(durationPadding).assertEqual('09.5');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('9.5'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('9.5');
      LogicTestLog.value(name, 'repeat duration formatting', String('09.5'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('09.5');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1359
     * @tc.name MultiMedia_Padding_1359
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1359', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1359';
      LogicTestLog.begin(name, 'value=9.999');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 9.999;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('9.999'), String(datePadding));
      expect(datePadding).assertEqual('9.999');
      LogicTestLog.value(name, 'duration padding result', String('09.999'), String(durationPadding));
      expect(durationPadding).assertEqual('09.999');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('9.999'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('9.999');
      LogicTestLog.value(name, 'repeat duration formatting', String('09.999'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('09.999');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1360
     * @tc.name MultiMedia_Padding_1360
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1360', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1360';
      LogicTestLog.begin(name, 'value=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 10;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('10'), String(datePadding));
      expect(datePadding).assertEqual('10');
      LogicTestLog.value(name, 'duration padding result', String('10'), String(durationPadding));
      expect(durationPadding).assertEqual('10');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('10'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('10');
      LogicTestLog.value(name, 'repeat duration formatting', String('10'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('10');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1361
     * @tc.name MultiMedia_Padding_1361
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1361', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1361';
      LogicTestLog.begin(name, 'value=10.1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 10.1;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('10.1'), String(datePadding));
      expect(datePadding).assertEqual('10.1');
      LogicTestLog.value(name, 'duration padding result', String('10.1'), String(durationPadding));
      expect(durationPadding).assertEqual('10.1');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('10.1'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('10.1');
      LogicTestLog.value(name, 'repeat duration formatting', String('10.1'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('10.1');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1362
     * @tc.name MultiMedia_Padding_1362
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1362', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1362';
      LogicTestLog.begin(name, 'value=11');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 11;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('11'), String(datePadding));
      expect(datePadding).assertEqual('11');
      LogicTestLog.value(name, 'duration padding result', String('11'), String(durationPadding));
      expect(durationPadding).assertEqual('11');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('11'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('11');
      LogicTestLog.value(name, 'repeat duration formatting', String('11'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('11');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1363
     * @tc.name MultiMedia_Padding_1363
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1363', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1363';
      LogicTestLog.begin(name, 'value=12');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 12;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('12'), String(datePadding));
      expect(datePadding).assertEqual('12');
      LogicTestLog.value(name, 'duration padding result', String('12'), String(durationPadding));
      expect(durationPadding).assertEqual('12');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('12'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('12');
      LogicTestLog.value(name, 'repeat duration formatting', String('12'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('12');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1364
     * @tc.name MultiMedia_Padding_1364
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1364', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1364';
      LogicTestLog.begin(name, 'value=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 59;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('59'), String(datePadding));
      expect(datePadding).assertEqual('59');
      LogicTestLog.value(name, 'duration padding result', String('59'), String(durationPadding));
      expect(durationPadding).assertEqual('59');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('59'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('59');
      LogicTestLog.value(name, 'repeat duration formatting', String('59'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1365
     * @tc.name MultiMedia_Padding_1365
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1365', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1365';
      LogicTestLog.begin(name, 'value=60');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 60;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('60'), String(datePadding));
      expect(datePadding).assertEqual('60');
      LogicTestLog.value(name, 'duration padding result', String('60'), String(durationPadding));
      expect(durationPadding).assertEqual('60');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('60'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('60');
      LogicTestLog.value(name, 'repeat duration formatting', String('60'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('60');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1366
     * @tc.name MultiMedia_Padding_1366
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1366', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1366';
      LogicTestLog.begin(name, 'value=99');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 99;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('99'), String(datePadding));
      expect(datePadding).assertEqual('99');
      LogicTestLog.value(name, 'duration padding result', String('99'), String(durationPadding));
      expect(durationPadding).assertEqual('99');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('99'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('99');
      LogicTestLog.value(name, 'repeat duration formatting', String('99'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('99');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1367
     * @tc.name MultiMedia_Padding_1367
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1367', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1367';
      LogicTestLog.begin(name, 'value=100');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 100;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('100'), String(datePadding));
      expect(datePadding).assertEqual('100');
      LogicTestLog.value(name, 'duration padding result', String('100'), String(durationPadding));
      expect(durationPadding).assertEqual('100');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('100'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('100');
      LogicTestLog.value(name, 'repeat duration formatting', String('100'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('100');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1368
     * @tc.name MultiMedia_Padding_1368
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1368', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1368';
      LogicTestLog.begin(name, 'value=1000');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 1000;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('1000'), String(datePadding));
      expect(datePadding).assertEqual('1000');
      LogicTestLog.value(name, 'duration padding result', String('1000'), String(durationPadding));
      expect(durationPadding).assertEqual('1000');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('1000'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('1000');
      LogicTestLog.value(name, 'repeat duration formatting', String('1000'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('1000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1369
     * @tc.name MultiMedia_Padding_1369
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1369', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1369';
      LogicTestLog.begin(name, 'value=10000');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 10000;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('10000'), String(datePadding));
      expect(datePadding).assertEqual('10000');
      LogicTestLog.value(name, 'duration padding result', String('10000'), String(durationPadding));
      expect(durationPadding).assertEqual('10000');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('10000'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('10000');
      LogicTestLog.value(name, 'repeat duration formatting', String('10000'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('10000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1370
     * @tc.name MultiMedia_Padding_1370
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1370', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1370';
      LogicTestLog.begin(name, 'value=9007199254740991');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 9007199254740991;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('9007199254740991'), String(datePadding));
      expect(datePadding).assertEqual('9007199254740991');
      LogicTestLog.value(name, 'duration padding result', String('9007199254740991'), String(durationPadding));
      expect(durationPadding).assertEqual('9007199254740991');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('9007199254740991'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('9007199254740991');
      LogicTestLog.value(name, 'repeat duration formatting', String('9007199254740991'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('9007199254740991');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1371
     * @tc.name MultiMedia_Padding_1371
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1371', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1371';
      LogicTestLog.begin(name, 'value=1.7976931348623157e+308');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = 1.7976931348623157e+308;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('1.7976931348623157e+308'), String(datePadding));
      expect(datePadding).assertEqual('1.7976931348623157e+308');
      LogicTestLog.value(name, 'duration padding result', String('1.7976931348623157e+308'), String(durationPadding));
      expect(durationPadding).assertEqual('1.7976931348623157e+308');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting',
        String('1.7976931348623157e+308'),
        String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('1.7976931348623157e+308');
      LogicTestLog.value(name, 'repeat duration formatting', String('1.7976931348623157e+308'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('1.7976931348623157e+308');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1372
     * @tc.name MultiMedia_Padding_1372
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1372', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1372';
      LogicTestLog.begin(name, 'value=Infinity');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = Number.POSITIVE_INFINITY;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('Infinity'), String(datePadding));
      expect(datePadding).assertEqual('Infinity');
      LogicTestLog.value(name, 'duration padding result', String('Infinity'), String(durationPadding));
      expect(durationPadding).assertEqual('Infinity');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('Infinity'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('Infinity');
      LogicTestLog.value(name, 'repeat duration formatting', String('Infinity'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('Infinity');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1373
     * @tc.name MultiMedia_Padding_1373
     * @tc.desc Characterize legacy numeric padding without input normalization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Padding_1373', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Padding_1373';
      LogicTestLog.begin(name, 'value=NaN');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const value: number = Number.NaN;
      const datePadding: string = dateTime.fill(value);
      const durationPadding: string = tempNum(value);
      LogicTestLog.value(name, 'date padding result', String('0NaN'), String(datePadding));
      expect(datePadding).assertEqual('0NaN');
      LogicTestLog.value(name, 'duration padding result', String('NaN'), String(durationPadding));
      expect(durationPadding).assertEqual('NaN');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof datePadding));
      expect(typeof datePadding).assertEqual('string');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof durationPadding));
      expect(typeof durationPadding).assertEqual('string');
      LogicTestLog.value(name, 'repeat date formatting', String('0NaN'), String(dateTime.fill(value)));
      expect(dateTime.fill(value)).assertEqual('0NaN');
      LogicTestLog.value(name, 'repeat duration formatting', String('NaN'), String(tempNum(value)));
      expect(tempNum(value)).assertEqual('NaN');
      LogicTestLog.end(name);
    });
  });
}
