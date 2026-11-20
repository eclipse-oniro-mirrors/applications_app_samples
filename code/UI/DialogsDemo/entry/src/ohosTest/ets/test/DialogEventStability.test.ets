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
import { DialogEventLog } from '../../../main/ets/model/DialogModels';

const CAP: number = 60;

function logOf(lines: string[]): DialogEventLog {
  const log: DialogEventLog = new DialogEventLog();
  for (const line of lines) {
    log.record(line);
  }
  return log;
}

/**
 * 弹窗事件流稳定性维度
 *
 * 与既有格式化/逐方法用例互补：关注高并发量写入后的容量淘汰、顺序保持、
 * 快照隔离、跨场景穿插顺序与批量性能，全部调用真实 DialogEventLog。
 */
export default function dialogEventStabilityTest() {
  describe('dialogEventStabilityTest', () => {
    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0100
     * @tc.name highVolumeKeepsCapAndLast
     * @tc.desc Verify one thousand records are capped at sixty while the newest line stays last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('highVolumeKeepsCapAndLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let i = 0; i < 1000; i++) {
        log.record(`e${i}`);
      }
      const lines: string[] = log.toLines();
      expect(log.count()).assertEqual(CAP);
      expect(lines.length).assertEqual(CAP);
      expect(log.last()).assertEqual('e999');
      expect(lines[CAP - 1]).assertEqual('e999');
      expect(lines[0]).assertEqual(`e${1000 - CAP}`);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0200
     * @tc.name evictionKeepsMonotonicOrder
     * @tc.desc Verify evicted log keeps the newest entries in strictly increasing insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('evictionKeepsMonotonicOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let i = 0; i < 100; i++) {
        log.record(`e${i}`);
      }
      const lines: string[] = log.toLines();
      let ordered: boolean = true;
      for (let i = 1; i < lines.length; i++) {
        if (lines[i] !== `e${40 + i}`) {
          ordered = false;
          break;
        }
      }
      expect(ordered).assertTrue();
      expect(lines[0]).assertEqual('e40');
      expect(lines[CAP - 1]).assertEqual('e99');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0300
     * @tc.name formatThenRecordFlowOrder
     * @tc.desc Verify a formatted open/select/check/click/close flow is recorded in call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('formatThenRecordFlowOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record(DialogEventLog.formatOpen(1, 'Confirm dialog'));
      log.record(DialogEventLog.formatSelect(1, 2));
      log.record(DialogEventLog.formatCheck(1, true));
      log.record(DialogEventLog.formatClick(1));
      log.record(DialogEventLog.formatClose(1, 'Confirm dialog'));
      const lines: string[] = log.toLines();
      expect(lines.length).assertEqual(5);
      expect(lines[0]).assertEqual('open#1 Confirm dialog');
      expect(lines[1]).assertEqual('select#1 index=2');
      expect(lines[2]).assertEqual('check#1 checked=true');
      expect(lines[3]).assertEqual('click#1');
      expect(lines[4]).assertEqual('close#1 Confirm dialog');
      expect(log.hasPrefix('open#1')).assertTrue();
      expect(log.hasPrefix('close#1')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0400
     * @tc.name interleavedScenesPreserveOrder
     * @tc.desc Verify events from five scenes keep their global interleaved order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('interleavedScenesPreserveOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let scene = 1; scene <= 5; scene++) {
        log.record(DialogEventLog.formatOpen(scene, `scene${scene}`));
      }
      for (let scene = 1; scene <= 5; scene++) {
        log.record(DialogEventLog.formatClose(scene, `scene${scene}`));
      }
      const lines: string[] = log.toLines();
      expect(lines.length).assertEqual(10);
      for (let scene = 1; scene <= 5; scene++) {
        expect(lines[scene - 1].startsWith(`open#${scene}`)).assertTrue();
        expect(lines[scene + 4].startsWith(`close#${scene}`)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0500
     * @tc.name clearThenRecordRestartsClean
     * @tc.desc Verify clearing empties the log and a subsequent record starts from one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('clearThenRecordRestartsClean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const log: DialogEventLog = logOf(['a', 'b', 'c', 'd', 'e']);
      expect(log.count()).assertEqual(5);
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual('');
      expect(log.toLines().length).assertEqual(0);
      log.record('restart');
      expect(log.count()).assertEqual(1);
      expect(log.last()).assertEqual('restart');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0600
     * @tc.name snapshotIsolatedFromLaterWrites
     * @tc.desc Verify a snapshot taken before more records is unaffected by later insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('snapshotIsolatedFromLaterWrites', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const log: DialogEventLog = logOf(['x', 'y', 'z']);
      const snapshot: string[] = log.toLines();
      log.record('later');
      expect(snapshot.length).assertEqual(3);
      expect(snapshot[2]).assertEqual('z');
      expect(log.count()).assertEqual(4);
      expect(log.last()).assertEqual('later');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0700
     * @tc.name tenThousandRecordsWithinBudget
     * @tc.desc Verify ten thousand appends stay capped and finish within a loose time budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tenThousandRecordsWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const log: DialogEventLog = new DialogEventLog();
      const start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        log.record(`line-${i}`);
      }
      const elapsed: number = Date.now() - start;
      expect(log.count()).assertEqual(CAP);
      expect(log.last()).assertEqual('line-9999');
      expect(elapsed < 3000).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0800
     * @tc.name errorFollowedByNormalFlow
     * @tc.desc Verify an error event can be followed by a normal event and last reflects the newest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('errorFollowedByNormalFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record(DialogEventLog.formatError(3, 'picker failed'));
      log.record(DialogEventLog.formatOpen(3, 'picker'));
      expect(log.count()).assertEqual(2);
      expect(log.hasPrefix('error#3')).assertTrue();
      expect(log.last()).assertEqual(DialogEventLog.formatOpen(3, 'picker'));
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_0900
     * @tc.name prefixMatchIsNotConfusedByLongerSceneId
     * @tc.desc Verify prefix lookup distinguishes scene one from scene eleven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('prefixMatchIsNotConfusedByLongerSceneId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const log: DialogEventLog = new DialogEventLog();
      log.record(DialogEventLog.formatOpen(11, 'system'));
      expect(log.hasPrefix('open#11')).assertTrue();
      expect(log.hasPrefix('open#1 ')).assertFalse();
      log.record(DialogEventLog.formatOpen(1, 'confirm'));
      expect(log.hasPrefix('open#1 ')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_1000
     * @tc.name lastTracksEveryAppend
     * @tc.desc Verify last always equals the most recent of a sequence of appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('lastTracksEveryAppend', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const log: DialogEventLog = new DialogEventLog();
      expect(log.last()).assertEqual('');
      for (let i = 0; i < 10; i++) {
        log.record(`event-${i}`);
        expect(log.last()).assertEqual(`event-${i}`);
      }
      expect(log.count()).assertEqual(10);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_1100
     * @tc.name duplicateLinesAreKeptInOrder
     * @tc.desc Verify identical events are all retained in insertion order within the cap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('duplicateLinesAreKeptInOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const log: DialogEventLog = new DialogEventLog();
      for (let i = 0; i < 5; i++) {
        log.record('dup');
      }
      const lines: string[] = log.toLines();
      expect(lines.length).assertEqual(5);
      let allDup: boolean = true;
      for (const line of lines) {
        if (line !== 'dup') {
          allDup = false;
          break;
        }
      }
      expect(allDup).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_EVENT_STABILITY_1200
     * @tc.name largeSceneAndIndexFormatting
     * @tc.desc Verify large scene ids and indexes are formatted into stable, searchable prefixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('largeSceneAndIndexFormatting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const log: DialogEventLog = new DialogEventLog();
      const selectLine: string = DialogEventLog.formatSelect(7, 999);
      log.record(selectLine);
      expect(selectLine).assertEqual('select#7 index=999');
      expect(log.hasPrefix('select#7')).assertTrue();
      expect(log.last()).assertEqual(selectLine);
    });
  });
}
