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
import { DialogEventLog } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogEventFormatGridMatrixPart3Test(): void {
  describe('DialogEventFormatGridMatrixPart3', () => {

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8100
     * @tc.name      testOpenGrid0081
     * @tc.desc      Verify formatOpen(12, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0081 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(12, '确认')).assertEqual('open#12 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0081 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8200
     * @tc.name      testOpenGrid0082
     * @tc.desc      Verify formatOpen(12, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0082 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(12, 'a b')).assertEqual('open#12 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0082 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8300
     * @tc.name      testOpenGrid0083
     * @tc.desc      Verify formatOpen(12, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0083 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(12, '#tag')).assertEqual('open#12 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0083 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8400
     * @tc.name      testOpenGrid0084
     * @tc.desc      Verify formatOpen(12, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0084 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(12, 'ok!')).assertEqual('open#12 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0084 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8500
     * @tc.name      testOpenGrid0085
     * @tc.desc      Verify formatOpen(13, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0085 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(13, '')).assertEqual('open#13 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0085 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8600
     * @tc.name      testOpenGrid0086
     * @tc.desc      Verify formatOpen(13, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0086 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(13, 'confirm')).assertEqual('open#13 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0086 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8700
     * @tc.name      testOpenGrid0087
     * @tc.desc      Verify formatOpen(13, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0087 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(13, '确认')).assertEqual('open#13 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0087 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8800
     * @tc.name      testOpenGrid0088
     * @tc.desc      Verify formatOpen(13, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0088 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(13, 'a b')).assertEqual('open#13 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0088 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_8900
     * @tc.name      testOpenGrid0089
     * @tc.desc      Verify formatOpen(13, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0089 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(13, '#tag')).assertEqual('open#13 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0089 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9000
     * @tc.name      testOpenGrid0090
     * @tc.desc      Verify formatOpen(13, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0090 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(13, 'ok!')).assertEqual('open#13 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0090 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9100
     * @tc.name      testOpenGrid0091
     * @tc.desc      Verify formatOpen(14, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0091 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(14, '')).assertEqual('open#14 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0091 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9200
     * @tc.name      testOpenGrid0092
     * @tc.desc      Verify formatOpen(14, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0092 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(14, 'confirm')).assertEqual('open#14 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0092 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9300
     * @tc.name      testOpenGrid0093
     * @tc.desc      Verify formatOpen(14, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0093 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(14, '确认')).assertEqual('open#14 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0093 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9400
     * @tc.name      testOpenGrid0094
     * @tc.desc      Verify formatOpen(14, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0094 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(14, 'a b')).assertEqual('open#14 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0094 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9500
     * @tc.name      testOpenGrid0095
     * @tc.desc      Verify formatOpen(14, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0095 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(14, '#tag')).assertEqual('open#14 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0095 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9600
     * @tc.name      testOpenGrid0096
     * @tc.desc      Verify formatOpen(14, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0096 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(14, 'ok!')).assertEqual('open#14 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0096 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9700
     * @tc.name      testOpenGrid0097
     * @tc.desc      Verify formatOpen(15, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0097 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(15, '')).assertEqual('open#15 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0097 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9800
     * @tc.name      testOpenGrid0098
     * @tc.desc      Verify formatOpen(15, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0098 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(15, 'confirm')).assertEqual('open#15 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0098 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_9900
     * @tc.name      testOpenGrid0099
     * @tc.desc      Verify formatOpen(15, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0099 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(15, '确认')).assertEqual('open#15 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0099 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10000
     * @tc.name      testOpenGrid0100
     * @tc.desc      Verify formatOpen(15, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0100 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(15, 'a b')).assertEqual('open#15 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0100 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10100
     * @tc.name      testOpenGrid0101
     * @tc.desc      Verify formatOpen(15, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0101 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(15, '#tag')).assertEqual('open#15 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0101 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10200
     * @tc.name      testOpenGrid0102
     * @tc.desc      Verify formatOpen(15, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0102 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(15, 'ok!')).assertEqual('open#15 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0102 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10300
     * @tc.name      testOpenGrid0103
     * @tc.desc      Verify formatOpen(16, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0103 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(16, '')).assertEqual('open#16 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0103 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10400
     * @tc.name      testOpenGrid0104
     * @tc.desc      Verify formatOpen(16, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0104 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(16, 'confirm')).assertEqual('open#16 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0104 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10500
     * @tc.name      testOpenGrid0105
     * @tc.desc      Verify formatOpen(16, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0105 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(16, '确认')).assertEqual('open#16 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0105 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10600
     * @tc.name      testOpenGrid0106
     * @tc.desc      Verify formatOpen(16, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0106 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(16, 'a b')).assertEqual('open#16 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0106 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10700
     * @tc.name      testOpenGrid0107
     * @tc.desc      Verify formatOpen(16, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0107 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(16, '#tag')).assertEqual('open#16 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0107 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10800
     * @tc.name      testOpenGrid0108
     * @tc.desc      Verify formatOpen(16, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0108 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(16, 'ok!')).assertEqual('open#16 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0108 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_10900
     * @tc.name      testOpenGrid0109
     * @tc.desc      Verify formatOpen(20, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0109 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(20, '')).assertEqual('open#20 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0109 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11000
     * @tc.name      testOpenGrid0110
     * @tc.desc      Verify formatOpen(20, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0110 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(20, 'confirm')).assertEqual('open#20 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0110 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11100
     * @tc.name      testOpenGrid0111
     * @tc.desc      Verify formatOpen(20, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0111 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(20, '确认')).assertEqual('open#20 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0111 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11200
     * @tc.name      testOpenGrid0112
     * @tc.desc      Verify formatOpen(20, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0112 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(20, 'a b')).assertEqual('open#20 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0112 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11300
     * @tc.name      testOpenGrid0113
     * @tc.desc      Verify formatOpen(20, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0113 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(20, '#tag')).assertEqual('open#20 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0113 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11400
     * @tc.name      testOpenGrid0114
     * @tc.desc      Verify formatOpen(20, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0114 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(20, 'ok!')).assertEqual('open#20 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0114 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11500
     * @tc.name      testOpenGrid0115
     * @tc.desc      Verify formatOpen(99, '').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0115 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(99, '')).assertEqual('open#99 ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0115 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11600
     * @tc.name      testOpenGrid0116
     * @tc.desc      Verify formatOpen(99, 'confirm').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0116 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(99, 'confirm')).assertEqual('open#99 confirm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0116 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11700
     * @tc.name      testOpenGrid0117
     * @tc.desc      Verify formatOpen(99, '确认').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0117 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(99, '确认')).assertEqual('open#99 确认');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0117 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11800
     * @tc.name      testOpenGrid0118
     * @tc.desc      Verify formatOpen(99, 'a b').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0118 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(99, 'a b')).assertEqual('open#99 a b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0118 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_11900
     * @tc.name      testOpenGrid0119
     * @tc.desc      Verify formatOpen(99, '#tag').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0119 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(99, '#tag')).assertEqual('open#99 #tag');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0119 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DEFP3_12000
     * @tc.name      testOpenGrid0120
     * @tc.desc      Verify formatOpen(99, 'ok!').
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOpenGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0120 begin');
      await delayTick();
      expect(DialogEventLog.formatOpen(99, 'ok!')).assertEqual('open#99 ok!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenGrid0120 end');
    })

  })
}
