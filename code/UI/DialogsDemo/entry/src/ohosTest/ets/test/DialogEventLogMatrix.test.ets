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
 
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { DialogEventLog } from '../../../main/ets/model/DialogModels';

/**
 * DialogEventLog 矩阵套件
 * 补充基线未覆盖的分支：scene 编号边界（0 / 负数 / 大数）、空与超长文本、
 * 重复行、容量淘汰后的前缀查询、空日志与空前缀、清空复用、实例隔离等
 */

function repeatChar(ch: string, n: number): string {
  let out: string = '';
  for (let i = 0; i < n; i++) {
    out += ch;
  }
  return out;
}

export default function dialogEventLogMatrixTest() {
  describe('dialogEventLogMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0100
     * @tc.name formatSceneZero001
     * @tc.desc Verify scene id 0 is interpolated without special-casing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_sceneZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DialogEventLog.formatOpen(0, '兜底')).assertEqual('open#0 兜底');
      expect(DialogEventLog.formatClose(0, '兜底')).assertEqual('close#0 兜底');
      expect(DialogEventLog.formatClick(0)).assertEqual('click#0');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0200
     * @tc.name formatNegativeScene002
     * @tc.desc Verify negative scene ids are formatted verbatim rather than rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_negativeScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DialogEventLog.formatOpen(-1, '非法')).assertEqual('open#-1 非法');
      expect(DialogEventLog.formatSelect(-3, 0)).assertEqual('select#-3 index=0');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0300
     * @tc.name formatLargeSceneId003
     * @tc.desc Verify large scene ids keep decimal formatting without separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_largeSceneId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DialogEventLog.formatError(1000000, '溢出')).assertEqual('error#1000000 溢出');
      expect(DialogEventLog.formatCheck(2147483647, true)).assertEqual('check#2147483647 checked=true');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0400
     * @tc.name formatEmptyName004
     * @tc.desc Verify an empty dialog name leaves a single trailing space in the open line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_emptyName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const line: string = DialogEventLog.formatOpen(1, '');
      expect(line).assertEqual('open#1 ');
      expect(line.charAt(line.length - 1)).assertEqual(' ');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0500
     * @tc.name formatUnicodeName005
     * @tc.desc Verify Chinese and emoji names survive formatting untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_unicodeName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DialogEventLog.formatOpen(2, '密码框🔐')).assertEqual('open#2 密码框🔐');
      expect(DialogEventLog.formatClose(2, '插屏（底部横幅）')).assertEqual('close#2 插屏（底部横幅）');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0600
     * @tc.name formatSelectZeroIndex006
     * @tc.desc Verify index 0 (first option) is reported as index=0 rather than omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_selectZeroIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DialogEventLog.formatSelect(3, 0)).assertEqual('select#3 index=0');
      expect(DialogEventLog.formatSelect(3, -1)).assertEqual('select#3 index=-1');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0700
     * @tc.name formatClickHasNoPayload007
     * @tc.desc Verify click lines carry only the scene id and no trailing separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('format_clickHasNoPayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const line: string = DialogEventLog.formatClick(6);
      expect(line).assertEqual('click#6');
      expect(line.includes(' ')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0800
     * @tc.name recordEmptyLine008
     * @tc.desc Verify an empty event line is still counted and retrievable by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_emptyLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('');
      expect(log.count()).assertEqual(1);
      expect(log.toLines().length).assertEqual(1);
      expect(log.toLines()[0]).assertEqual('');
      expect(log.hasPrefix('')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_0900
     * @tc.name recordDuplicateLinesKept009
     * @tc.desc Verify identical consecutive lines are stored separately, not deduplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_duplicateLinesKept', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 确认框');
      log.record('open#1 确认框');
      log.record('open#1 确认框');
      expect(log.count()).assertEqual(3);
      expect(log.toLines()[0]).assertEqual(log.toLines()[2]);
      expect(log.last()).assertEqual('open#1 确认框');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1000
     * @tc.name recordEvictionOrder010
     * @tc.desc Verify eviction keeps insertion order once capacity is exceeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_evictionOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let i = 1; i <= 70; i++) {
        log.record(`e${i}`);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines()[0]).assertEqual('e11');
      expect(log.toLines()[59]).assertEqual('e70');
      expect(log.last()).assertEqual('e70');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1100
     * @tc.name hasPrefixAfterEviction011
     * @tc.desc Verify a prefix query stops matching once its only line has been evicted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hasPrefix_afterEviction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#1 最早一条');
      for (let i = 1; i <= 60; i++) {
        log.record(`f${i}`);
      }
      expect(log.count()).assertEqual(60);
      expect(log.toLines()[0]).assertEqual('f1');
      expect(log.hasPrefix('open#1')).assertFalse();
      expect(log.hasPrefix('f60')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1200
     * @tc.name lastAfterEviction012
     * @tc.desc Verify last() reflects the newest line after eviction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('last_afterEviction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let i = 1; i <= 61; i++) {
        log.record(`e${i}`);
      }
      expect(log.last()).assertEqual('e61');
      expect(log.toLines().length).assertEqual(60);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1300
     * @tc.name hasPrefixEmpty013
     * @tc.desc Verify an empty prefix matches any line but not an empty log
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hasPrefix_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      expect(log.hasPrefix('')).assertFalse();
      log.record('任意行');
      expect(log.hasPrefix('')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1400
     * @tc.name hasPrefixWholeLine014
     * @tc.desc Verify a prefix equal to the whole line matches, while an over-long prefix does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hasPrefix_wholeLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('check#1 checked=true');
      expect(log.hasPrefix('check#1 checked=true')).assertTrue();
      expect(log.hasPrefix('check#1 checked=true extra')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1500
     * @tc.name hasPrefixCaseSensitive015
     * @tc.desc Verify prefix matching is case sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hasPrefix_caseSensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('open#4 提示框');
      expect(log.hasPrefix('open#4')).assertTrue();
      expect(log.hasPrefix('OPEN#4')).assertFalse();
      expect(log.hasPrefix('Open#4')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1600
     * @tc.name clearAllowsReuse016
     * @tc.desc Verify the log is usable again after clear and restarts counting from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clear_allowsReuse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('a');
      log.record('b');
      log.clear();
      log.record('c');
      expect(log.count()).assertEqual(1);
      expect(log.toLines()[0]).assertEqual('c');
      expect(log.last()).assertEqual('c');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1700
     * @tc.name clearTwiceIdempotent017
     * @tc.desc Verify clearing twice leaves the log empty without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clear_twiceIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('x');
      log.clear();
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual('');
      expect(log.toLines().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1800
     * @tc.name toLinesEmptyInitially018
     * @tc.desc Verify a fresh log exposes an empty snapshot and empty last line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toLines_emptyInitially', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      expect(log.count()).assertEqual(0);
      expect(log.toLines().length).assertEqual(0);
      expect(log.last()).assertEqual('');
      expect(log.hasPrefix('open#1')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_1900
     * @tc.name toLinesOrderPreserved019
     * @tc.desc Verify the snapshot keeps the exact insertion order across formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toLines_orderPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record(DialogEventLog.formatOpen(1, '确认框'));
      log.record(DialogEventLog.formatCheck(1, true));
      log.record(DialogEventLog.formatSelect(3, 2));
      log.record(DialogEventLog.formatClose(1, '确认框'));
      const lines: string[] = log.toLines();
      expect(lines[0]).assertEqual('open#1 确认框');
      expect(lines[1]).assertEqual('check#1 checked=true');
      expect(lines[2]).assertEqual('select#3 index=2');
      expect(lines[3]).assertEqual('close#1 确认框');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_2000
     * @tc.name instancesIsolated020
     * @tc.desc Verify two event logs do not share recorded lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('instances_isolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const first: DialogEventLog = new DialogEventLog();
      const second: DialogEventLog = new DialogEventLog();
      first.record('open#1 确认框');
      expect(second.count()).assertEqual(0);
      expect(second.last()).assertEqual('');
      second.record('open#2 警告框');
      expect(first.count()).assertEqual(1);
      expect(first.last()).assertEqual('open#1 确认框');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_2100
     * @tc.name recordNewlineKeptAsSingleLine021
     * @tc.desc Verify an embedded newline stays inside one event instead of splitting it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_newlineKeptAsSingleLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('a\nb');
      expect(log.count()).assertEqual(1);
      expect(log.toLines()[0]).assertEqual('a\nb');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_2200
     * @tc.name recordLongLinePreserved022
     * @tc.desc Verify a 1000-character event is stored intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_longLinePreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      const long: string = repeatChar('x', 1000);
      log.record(long);
      expect(log.count()).assertEqual(1);
      expect(log.toLines()[0].length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_2300
     * @tc.name recordInterleavedScenes023
     * @tc.desc Verify interleaved scene events keep per-scene prefixes queryable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_interleavedScenes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record(DialogEventLog.formatOpen(1, '确认框'));
      log.record(DialogEventLog.formatOpen(2, '警告框'));
      log.record(DialogEventLog.formatSelect(1, 1));
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.hasPrefix('open#2')).assertTrue();
      expect(log.hasPrefix('select#1 index=1')).assertTrue();
      expect(log.hasPrefix('close#')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGEVENTLOGMATRIX_2400
     * @tc.name snapshotUnaffectedByClear024
     * @tc.desc Verify a snapshot taken before clear keeps its lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('snapshot_unaffectedByClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record('a');
      log.record('b');
      const snapshot: string[] = log.toLines();
      log.clear();
      expect(snapshot.length).assertEqual(2);
      expect(snapshot[1]).assertEqual('b');
      expect(log.count()).assertEqual(0);
    });
  });
}
