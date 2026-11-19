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
import { delayTick } from './shared/AsyncYield';
import { formatDateValue, formatTimeValue, formatTextValue } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogValueFormatGridMatrixPart3Test(): void {
  describe('DialogValueFormatGridMatrixPart3', () => {

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8100
     * @tc.name      testTimeGrid0081
     * @tc.desc      Verify formatTimeValue(24, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0081 begin');
      await delayTick();
      expect(formatTimeValue(24, 10)).assertEqual('24:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0081 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8200
     * @tc.name      testTimeGrid0082
     * @tc.desc      Verify formatTimeValue(24, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0082 begin');
      await delayTick();
      expect(formatTimeValue(24, 59)).assertEqual('24:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0082 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8300
     * @tc.name      testTimeGrid0083
     * @tc.desc      Verify formatTimeValue(99, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0083 begin');
      await delayTick();
      expect(formatTimeValue(99, 0)).assertEqual('99:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0083 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8400
     * @tc.name      testTimeGrid0084
     * @tc.desc      Verify formatTimeValue(99, 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0084 begin');
      await delayTick();
      expect(formatTimeValue(99, 1)).assertEqual('99:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0084 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8500
     * @tc.name      testTimeGrid0085
     * @tc.desc      Verify formatTimeValue(99, 9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0085 begin');
      await delayTick();
      expect(formatTimeValue(99, 9)).assertEqual('99:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0085 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8600
     * @tc.name      testTimeGrid0086
     * @tc.desc      Verify formatTimeValue(99, 10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0086 begin');
      await delayTick();
      expect(formatTimeValue(99, 10)).assertEqual('99:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0086 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8700
     * @tc.name      testTimeGrid0087
     * @tc.desc      Verify formatTimeValue(99, 59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0087 begin');
      await delayTick();
      expect(formatTimeValue(99, 59)).assertEqual('99:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeGrid0087 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8800
     * @tc.name      testTextGrid0088
     * @tc.desc      Verify formatTextValue('', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0088 begin');
      await delayTick();
      expect(formatTextValue('', -1)).assertEqual('index=-1 value=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0088 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_8900
     * @tc.name      testTextGrid0089
     * @tc.desc      Verify formatTextValue('', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0089 begin');
      await delayTick();
      expect(formatTextValue('', 0)).assertEqual('index=0 value=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0089 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9000
     * @tc.name      testTextGrid0090
     * @tc.desc      Verify formatTextValue('', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0090 begin');
      await delayTick();
      expect(formatTextValue('', 5)).assertEqual('index=5 value=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0090 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9100
     * @tc.name      testTextGrid0091
     * @tc.desc      Verify formatTextValue('', 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0091 begin');
      await delayTick();
      expect(formatTextValue('', 99)).assertEqual('index=99 value=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0091 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9200
     * @tc.name      testTextGrid0092
     * @tc.desc      Verify formatTextValue('alpha', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0092 begin');
      await delayTick();
      expect(formatTextValue('alpha', -1)).assertEqual('index=-1 value=alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0092 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9300
     * @tc.name      testTextGrid0093
     * @tc.desc      Verify formatTextValue('alpha', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0093 begin');
      await delayTick();
      expect(formatTextValue('alpha', 0)).assertEqual('index=0 value=alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0093 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9400
     * @tc.name      testTextGrid0094
     * @tc.desc      Verify formatTextValue('alpha', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0094 begin');
      await delayTick();
      expect(formatTextValue('alpha', 5)).assertEqual('index=5 value=alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0094 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9500
     * @tc.name      testTextGrid0095
     * @tc.desc      Verify formatTextValue('alpha', 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0095 begin');
      await delayTick();
      expect(formatTextValue('alpha', 99)).assertEqual('index=99 value=alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0095 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9600
     * @tc.name      testTextGrid0096
     * @tc.desc      Verify formatTextValue('中文', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0096 begin');
      await delayTick();
      expect(formatTextValue('中文', -1)).assertEqual('index=-1 value=中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0096 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9700
     * @tc.name      testTextGrid0097
     * @tc.desc      Verify formatTextValue('中文', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0097 begin');
      await delayTick();
      expect(formatTextValue('中文', 0)).assertEqual('index=0 value=中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0097 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9800
     * @tc.name      testTextGrid0098
     * @tc.desc      Verify formatTextValue('中文', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0098 begin');
      await delayTick();
      expect(formatTextValue('中文', 5)).assertEqual('index=5 value=中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0098 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_9900
     * @tc.name      testTextGrid0099
     * @tc.desc      Verify formatTextValue('中文', 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0099 begin');
      await delayTick();
      expect(formatTextValue('中文', 99)).assertEqual('index=99 value=中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0099 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10000
     * @tc.name      testTextGrid0100
     * @tc.desc      Verify formatTextValue('a b', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0100 begin');
      await delayTick();
      expect(formatTextValue('a b', -1)).assertEqual('index=-1 value=a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0100 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10100
     * @tc.name      testTextGrid0101
     * @tc.desc      Verify formatTextValue('a b', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0101 begin');
      await delayTick();
      expect(formatTextValue('a b', 0)).assertEqual('index=0 value=a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0101 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10200
     * @tc.name      testTextGrid0102
     * @tc.desc      Verify formatTextValue('a b', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0102 begin');
      await delayTick();
      expect(formatTextValue('a b', 5)).assertEqual('index=5 value=a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0102 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10300
     * @tc.name      testTextGrid0103
     * @tc.desc      Verify formatTextValue('a b', 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0103 begin');
      await delayTick();
      expect(formatTextValue('a b', 99)).assertEqual('index=99 value=a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0103 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10400
     * @tc.name      testTextGrid0104
     * @tc.desc      Verify formatTextValue('#1', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0104 begin');
      await delayTick();
      expect(formatTextValue('#1', -1)).assertEqual('index=-1 value=#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0104 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10500
     * @tc.name      testTextGrid0105
     * @tc.desc      Verify formatTextValue('#1', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0105 begin');
      await delayTick();
      expect(formatTextValue('#1', 0)).assertEqual('index=0 value=#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0105 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10600
     * @tc.name      testTextGrid0106
     * @tc.desc      Verify formatTextValue('#1', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0106 begin');
      await delayTick();
      expect(formatTextValue('#1', 5)).assertEqual('index=5 value=#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0106 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10700
     * @tc.name      testTextGrid0107
     * @tc.desc      Verify formatTextValue('#1', 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0107 begin');
      await delayTick();
      expect(formatTextValue('#1', 99)).assertEqual('index=99 value=#1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0107 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10800
     * @tc.name      testTextGrid0108
     * @tc.desc      Verify formatTextValue('line1\nline2', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0108 begin');
      await delayTick();
      expect(formatTextValue('line1\nline2', -1)).assertEqual('index=-1 value=line1\nline2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0108 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_10900
     * @tc.name      testTextGrid0109
     * @tc.desc      Verify formatTextValue('line1\nline2', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0109 begin');
      await delayTick();
      expect(formatTextValue('line1\nline2', 0)).assertEqual('index=0 value=line1\nline2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0109 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_11000
     * @tc.name      testTextGrid0110
     * @tc.desc      Verify formatTextValue('line1\nline2', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0110 begin');
      await delayTick();
      expect(formatTextValue('line1\nline2', 5)).assertEqual('index=5 value=line1\nline2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0110 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_11100
     * @tc.name      testTextGrid0111
     * @tc.desc      Verify formatTextValue('line1\nline2', 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0111 begin');
      await delayTick();
      expect(formatTextValue('line1\nline2', 99)).assertEqual('index=99 value=line1\nline2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0111 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_11200
     * @tc.name      testTextGrid0112
     * @tc.desc      Verify formatTextValue('x', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0112 begin');
      await delayTick();
      expect(formatTextValue('x', -1)).assertEqual('index=-1 value=x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0112 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_11300
     * @tc.name      testTextGrid0113
     * @tc.desc      Verify formatTextValue('x', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0113 begin');
      await delayTick();
      expect(formatTextValue('x', 0)).assertEqual('index=0 value=x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0113 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_11400
     * @tc.name      testTextGrid0114
     * @tc.desc      Verify formatTextValue('x', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0114 begin');
      await delayTick();
      expect(formatTextValue('x', 5)).assertEqual('index=5 value=x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0114 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DVFP3_11500
     * @tc.name      testTextGrid0115
     * @tc.desc      Verify formatTextValue('x', 99).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTextGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0115 begin');
      await delayTick();
      expect(formatTextValue('x', 99)).assertEqual('index=99 value=x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextGrid0115 end');
    })

  })
}
