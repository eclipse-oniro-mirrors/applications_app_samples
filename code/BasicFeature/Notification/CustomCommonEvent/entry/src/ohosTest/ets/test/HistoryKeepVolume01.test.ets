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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import historyFeature from '../../../main/ets/feature/HistoryFeature';
import { arr } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function historyKeepVolume01Test(): void {
  describe('HistoryKeepVolume01Test', () => {

    /**
     * @tc.name   testHistoryKeepVolume010001
     * @tc.number SUB_CCE_HISTKEEP_01_0001
     * @tc.desc   detail="[]" 时保留判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010001 begin');
      const detail: Array<string> = arr('');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('false'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010001 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010002
     * @tc.number SUB_CCE_HISTKEEP_01_0002
     * @tc.desc   detail="[\"\",\"\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010002 begin');
      const detail: Array<string> = arr('|');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010002 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010003
     * @tc.number SUB_CCE_HISTKEEP_01_0003
     * @tc.desc   detail="[\"a\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010003 begin');
      const detail: Array<string> = arr('a');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010003 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010004
     * @tc.number SUB_CCE_HISTKEEP_01_0004
     * @tc.desc   detail="[\"a\",\"b\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010004 begin');
      const detail: Array<string> = arr('a|b');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010004 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010005
     * @tc.number SUB_CCE_HISTKEEP_01_0005
     * @tc.desc   detail="[\"a\",\"b\",\"c\",\"d\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010005 begin');
      const detail: Array<string> = arr('a|b|c|d');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010005 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010006
     * @tc.number SUB_CCE_HISTKEEP_01_0006
     * @tc.desc   detail="[\" \"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010006 begin');
      const detail: Array<string> = arr(' ');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010006 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010007
     * @tc.number SUB_CCE_HISTKEEP_01_0007
     * @tc.desc   detail="[\"[]\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010007 begin');
      const detail: Array<string> = arr('[]');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010007 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010008
     * @tc.number SUB_CCE_HISTKEEP_01_0008
     * @tc.desc   detail="[\"\",\"a\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010008 begin');
      const detail: Array<string> = arr('|a');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010008 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010009
     * @tc.number SUB_CCE_HISTKEEP_01_0009
     * @tc.desc   detail="[\"a\",\"\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010009 begin');
      const detail: Array<string> = arr('a|');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010009 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010010
     * @tc.number SUB_CCE_HISTKEEP_01_0010
     * @tc.desc   detail="[\"null\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010010 begin');
      const detail: Array<string> = arr('null');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010010 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010011
     * @tc.number SUB_CCE_HISTKEEP_01_0011
     * @tc.desc   detail="[\"undefined\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010011 begin');
      const detail: Array<string> = arr('undefined');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010011 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010012
     * @tc.number SUB_CCE_HISTKEEP_01_0012
     * @tc.desc   detail="[\"x\\\"y\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010012 begin');
      const detail: Array<string> = arr('x"y');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010012 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010013
     * @tc.number SUB_CCE_HISTKEEP_01_0013
     * @tc.desc   detail="[\"x,y\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010013 begin');
      const detail: Array<string> = arr('x,y');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010013 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010014
     * @tc.number SUB_CCE_HISTKEEP_01_0014
     * @tc.desc   detail="[\"中文\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010014 begin');
      const detail: Array<string> = arr('中文');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010014 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010015
     * @tc.number SUB_CCE_HISTKEEP_01_0015
     * @tc.desc   detail="[\"a\",\"b\",\"c\",\"d\",\"e\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010015 begin');
      const detail: Array<string> = arr('a|b|c|d|e');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010015 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010016
     * @tc.number SUB_CCE_HISTKEEP_01_0016
     * @tc.desc   detail="[\"0\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010016 begin');
      const detail: Array<string> = arr('0');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010016 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010017
     * @tc.number SUB_CCE_HISTKEEP_01_0017
     * @tc.desc   detail="[\"true\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010017 begin');
      const detail: Array<string> = arr('true');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010017 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010018
     * @tc.number SUB_CCE_HISTKEEP_01_0018
     * @tc.desc   detail="[\"[1,2]\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010018 begin');
      const detail: Array<string> = arr('[1,2]');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010018 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010019
     * @tc.number SUB_CCE_HISTKEEP_01_0019
     * @tc.desc   detail="[\"a\",\"a\",\"a\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010019 begin');
      const detail: Array<string> = arr('a|a|a');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010019 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010020
     * @tc.number SUB_CCE_HISTKEEP_01_0020
     * @tc.desc   detail="[\"k=v\"]" 时保留判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010020 begin');
      const detail: Array<string> = arr('k=v');
      const result: boolean = historyFeature.shouldKeep(detail);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat([])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat([])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(historyFeature.shouldKeep(detail.concat(['x'])))), String('true'));
      expect(String(historyFeature.shouldKeep(detail.concat(['x'])))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010020 end');
    })

    /**
     * @tc.name   testHistoryKeepVolume010021
     * @tc.number SUB_CCE_HISTKEEP_01_0021
     * @tc.desc   空数组不保留、含两个空串的记录仍保留，保留判定只看内容不看长度
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testHistoryKeepVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010021 begin');
      const emptyRow: Array<string> = [];
      const blankRow: Array<string> = ['', ''];
      const fullRow: Array<string> = ['a', 'b', 'c', 'd'];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(historyFeature.shouldKeep(emptyRow)), 'false');
      expect(historyFeature.shouldKeep(emptyRow)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(historyFeature.shouldKeep(blankRow)), 'true');
      expect(historyFeature.shouldKeep(blankRow)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(historyFeature.shouldKeep(fullRow)), 'true');
      expect(historyFeature.shouldKeep(fullRow)).assertTrue();
      expect(blankRow.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testHistoryKeepVolume010021 end');
    })
  })
}
