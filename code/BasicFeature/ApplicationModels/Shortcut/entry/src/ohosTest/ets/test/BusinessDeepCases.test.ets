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

import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import {
  SAVE_RULES, SaveDecision, SaveInput, SaveOutcome, TRASH_RETENTION_DAYS, TrashBin, TrashEntry,
  TrashState, decideSave, saveAdvice, saveLines, trashLines
} from '../../../main/ets/business/NoteTrash';
import {
  DUE_RULES, DUE_SOON_MS, DueBuckets, DueState, Priority, RepeatKind, TodoDue, bucketize, dateKeyOf,
  defer, dueLines, dueStateOf, dueSummary, nextOccurrence, overdueDays, priorityWeight, repeatText
} from '../../../main/ets/business/DuePolicy';
import {
  IndexedDoc, TAG_LIMIT, TAG_RULES, TagIndex, Hit, ScoreSource, normalizeTag, normalizeTags, search,
  searchLines, synonymLines, tagLines, tokenize
} from '../../../main/ets/business/TagIndex';

const DAY: number = 86400000;

function saveOf(baseline: number, local: number, remote: number): SaveInput {
  const input: SaveInput = new SaveInput();
  input.baselineRevision = baseline;
  input.localRevision = local;
  input.remoteRevision = remote;
  return input;
}

export default function businessDeepCasesTest(): void {
  describe('NoteTrashCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0100
     * @tc.name      testNoteTrashCases0001
     * @tc.desc      Verify save rule table has ten entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('NoteTrashCases', '0001'), 0, (): void => {
      expect(SAVE_RULES.length, caseName('NoteTrashCases', '0001')).assertEqual(10);
      expect(saveLines().length, caseName('NoteTrashCases', '0001')).assertEqual(10);
      expect(TRASH_RETENTION_DAYS, caseName('NoteTrashCases', '0001')).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0200
     * @tc.name      testNoteTrashCases0002
     * @tc.desc      Verify clean forward save is safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0002'), 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 4, 3));
      expect(decision.code, caseName('NoteTrashCases', '0002')).assertEqual('SV-02');
      expect(decision.outcome, caseName('NoteTrashCases', '0002')).assertEqual(SaveOutcome.SAFE);
      expect(decision.writable(), caseName('NoteTrashCases', '0002')).assertTrue();
      expect(saveAdvice(decision), caseName('NoteTrashCases', '0002')).assertEqual('可以保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0300
     * @tc.name      testNoteTrashCases0003
     * @tc.desc      Verify identical triple needs no change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0003'), 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 3, 3));
      expect(decision.code, caseName('NoteTrashCases', '0003')).assertEqual('SV-01');
      expect(decision.writable(), caseName('NoteTrashCases', '0003')).assertTrue();
      expect(decision.outcome, caseName('NoteTrashCases', '0003')).assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision), caseName('NoteTrashCases', '0003')).assertEqual('可以保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0400
     * @tc.name      testNoteTrashCases0004
     * @tc.desc      Verify remote ahead asks for confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0004'), 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 3, 5));
      expect(decision.code, caseName('NoteTrashCases', '0004')).assertEqual('SV-03');
      expect(decision.outcome, caseName('NoteTrashCases', '0004')).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.writable(), caseName('NoteTrashCases', '0004')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0500
     * @tc.name      testNoteTrashCases0005
     * @tc.desc      Verify both ahead branches the save
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0005'), 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 5, 6));
      expect(decision.code, caseName('NoteTrashCases', '0005')).assertEqual('SV-05');
      expect(decision.outcome, caseName('NoteTrashCases', '0005')).assertEqual(SaveOutcome.BRANCH);
      expect(saveAdvice(decision).indexOf('另存') >= 0, caseName('NoteTrashCases', '0005')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0600
     * @tc.name      testNoteTrashCases0006
     * @tc.desc      Verify converged revisions are safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0006'), 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 6, 6));
      expect(decision.code, caseName('NoteTrashCases', '0006')).assertEqual('SV-04');
      expect(decision.outcome, caseName('NoteTrashCases', '0006')).assertEqual(SaveOutcome.SAFE);
      expect(decision.writable(), caseName('NoteTrashCases', '0006')).assertTrue();
      expect(decision.message.length > 0, caseName('NoteTrashCases', '0006')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0700
     * @tc.name      testNoteTrashCases0007
     * @tc.desc      Verify rollback and guards block writing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0007'), 0, (): void => {
      expect(decideSave(saveOf(5, 5, 4)).code, caseName('NoteTrashCases', '0007')).assertEqual('SV-06');
      const recovery: SaveInput = saveOf(3, 4, 3);
      recovery.recoveryActive = true;
      expect(decideSave(recovery).code, caseName('NoteTrashCases', '0007')).assertEqual('SV-08');
      const trashed: SaveInput = saveOf(3, 4, 3);
      trashed.trashed = true;
      expect(decideSave(trashed).code, caseName('NoteTrashCases', '0007')).assertEqual('SV-09');
      expect(decideSave(saveOf(3, 4, 3)).writable(), caseName('NoteTrashCases', '0007')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0800
     * @tc.name      testNoteTrashCases0008
     * @tc.desc      Verify missing revision and uncertain write are handled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0008'), 0, (): void => {
      expect(decideSave(saveOf(0, 0, 0)).code, caseName('NoteTrashCases', '0008')).assertEqual('SV-07');
      const uncertain: SaveInput = saveOf(3, 4, 3);
      uncertain.writeUncertain = true;
      expect(decideSave(uncertain).code, caseName('NoteTrashCases', '0008')).assertEqual('SV-10');
      expect(decideSave(uncertain).outcome, caseName('NoteTrashCases', '0008')).assertEqual(SaveOutcome.CONFIRM);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0900
     * @tc.name      testNoteTrashCases0009
     * @tc.desc      Verify trash bin keeps recent items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0009'), 0, (): void => {
      const now: number = 1000 * DAY;
      const bin: TrashBin = new TrashBin();
      expect(bin.trash('note-1', '学习记录', 3, now - DAY, '手动删除'), caseName('NoteTrashCases', '0009')).assertTrue();
      expect(bin.inTrash('note-1'), caseName('NoteTrashCases', '0009')).assertTrue();
      expect(bin.trashed().length, caseName('NoteTrashCases', '0009')).assertEqual(1);
      expect(bin.restore('note-1', now), caseName('NoteTrashCases', '0009')).assertTrue();
      expect(bin.inTrash('note-1'), caseName('NoteTrashCases', '0009')).assertFalse();
      expect(bin.restore('note-1', now), caseName('NoteTrashCases', '0009')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_1000
     * @tc.name      testNoteTrashCases0010
     * @tc.desc      Verify expired items cannot be restored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NoteTrashCases', '0010'), 0, (): void => {
      const now: number = 100 * DAY;
      const bin: TrashBin = new TrashBin();
      bin.trash('note-2', '旧草稿', 1, now - 40 * DAY, '覆盖');
      expect(bin.restore('note-2', now), caseName('NoteTrashCases', '0010')).assertFalse();
      const removed: TrashEntry[] = bin.purge(now);
      expect(removed.length, caseName('NoteTrashCases', '0010')).assertEqual(1);
      expect(removed[0].state, caseName('NoteTrashCases', '0010')).assertEqual(TrashState.PURGED);
      expect(trashLines(bin, now).length >= 1, caseName('NoteTrashCases', '0010')).assertTrue();
    });
  });

  describe('DuePolicyCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0100
     * @tc.name      testDuePolicyCases0001
     * @tc.desc      Verify rule table has ten entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('DuePolicyCases', '0001'), 0, (): void => {
      expect(DUE_RULES.length, caseName('DuePolicyCases', '0001')).assertEqual(10);
      expect(dueLines().length, caseName('DuePolicyCases', '0001')).assertEqual(10);
      expect(DUE_SOON_MS, caseName('DuePolicyCases', '0001')).assertEqual(DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0200
     * @tc.name      testDuePolicyCases0002
     * @tc.desc      Verify state covers all branches
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0002'), 0, (): void => {
      const now: number = 10 * DAY;
      expect(dueStateOf(new TodoDue(0), now), caseName('DuePolicyCases', '0002')).assertEqual(DueState.NO_DUE);
      expect(dueStateOf(new TodoDue(now - DAY), now), caseName('DuePolicyCases', '0002')).assertEqual(DueState.OVERDUE);
      expect(dueStateOf(new TodoDue(now + 3600000), now), caseName('DuePolicyCases', '0002')).assertEqual(DueState.DUE_SOON);
      expect(dueStateOf(new TodoDue(now + 3 * DAY), now), caseName('DuePolicyCases', '0002')).assertEqual(DueState.FUTURE);
      const done: TodoDue = new TodoDue(now - DAY);
      done.done = true;
      expect(dueStateOf(done, now), caseName('DuePolicyCases', '0002')).assertEqual(DueState.DONE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0300
     * @tc.name      testDuePolicyCases0003
     * @tc.desc      Verify overdue days rounds down
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0003'), 0, (): void => {
      const now: number = 10 * DAY;
      expect(overdueDays(new TodoDue(now - 3 * DAY), now), caseName('DuePolicyCases', '0003')).assertEqual(3);
      expect(overdueDays(new TodoDue(now - DAY / 2), now), caseName('DuePolicyCases', '0003')).assertEqual(0);
      expect(overdueDays(new TodoDue(now + DAY), now), caseName('DuePolicyCases', '0003')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0400
     * @tc.name      testDuePolicyCases0004
     * @tc.desc      Verify defer moves deadline only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0004'), 0, (): void => {
      const now: number = 10 * DAY;
      const due: TodoDue = new TodoDue(now - DAY, Priority.HIGH);
      expect(defer(due, 2, now), caseName('DuePolicyCases', '0004')).assertTrue();
      expect(due.dueAt, caseName('DuePolicyCases', '0004')).assertEqual(now + DAY);
      expect(due.deferredAt, caseName('DuePolicyCases', '0004')).assertEqual(now);
      expect(due.priority, caseName('DuePolicyCases', '0004')).assertEqual(Priority.HIGH);
      expect(defer(due, 0, now), caseName('DuePolicyCases', '0004')).assertFalse();
      expect(defer(new TodoDue(0), 1, now), caseName('DuePolicyCases', '0004')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0500
     * @tc.name      testDuePolicyCases0005
     * @tc.desc      Verify priority weights are ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0005'), 0, (): void => {
      expect(priorityWeight(Priority.HIGH), caseName('DuePolicyCases', '0005')).assertEqual(0);
      expect(priorityWeight(Priority.NORMAL), caseName('DuePolicyCases', '0005')).assertEqual(1);
      expect(priorityWeight(Priority.LOW), caseName('DuePolicyCases', '0005')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0600
     * @tc.name      testDuePolicyCases0006
     * @tc.desc      Verify buckets split items by state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0006'), 0, (): void => {
      const now: number = 10 * DAY;
      const items: TodoDue[] = [new TodoDue(now - DAY), new TodoDue(now + 3600000),
        new TodoDue(now + 5 * DAY), new TodoDue(0)];
      const buckets: DueBuckets = bucketize(items, now);
      expect(buckets.overdue.length, caseName('DuePolicyCases', '0006')).assertEqual(1);
      expect(buckets.soon.length, caseName('DuePolicyCases', '0006')).assertEqual(1);
      expect(buckets.future.length, caseName('DuePolicyCases', '0006')).assertEqual(1);
      expect(buckets.undated.length, caseName('DuePolicyCases', '0006')).assertEqual(1);
      expect(buckets.size(), caseName('DuePolicyCases', '0006')).assertEqual(4);
      expect(dueSummary(items, now).indexOf('逾期 1') >= 0, caseName('DuePolicyCases', '0006')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0700
     * @tc.name      testDuePolicyCases0007
     * @tc.desc      Verify daily repeat advances one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0007'), 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.DAILY;
      expect(nextOccurrence(due, 10 * DAY), caseName('DuePolicyCases', '0007')).assertEqual(11 * DAY);
      const none: TodoDue = new TodoDue(10 * DAY);
      expect(nextOccurrence(none, 10 * DAY), caseName('DuePolicyCases', '0007')).assertEqual(0);
      expect(nextOccurrence(due, 10 * DAY) > 10 * DAY, caseName('DuePolicyCases', '0007')).assertTrue();
      expect(due.repeat, caseName('DuePolicyCases', '0007')).assertEqual(RepeatKind.DAILY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0800
     * @tc.name      testDuePolicyCases0008
     * @tc.desc      Verify weekday repeat skips weekend
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0008'), 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.WEEKDAY;
      const next: number = nextOccurrence(due, 10 * DAY);
      expect(next > 10 * DAY, caseName('DuePolicyCases', '0008')).assertTrue();
      const weekday: number = new Date(next).getDay();
      expect(weekday !== 0 && weekday !== 6, caseName('DuePolicyCases', '0008')).assertTrue();
      expect(next !== 10 * DAY, caseName('DuePolicyCases', '0008')).assertTrue();
      expect(next < 10 * DAY + 4 * 86400000, caseName('DuePolicyCases', '0008')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0900
     * @tc.name      testDuePolicyCases0009
     * @tc.desc      Verify exceptions push to next valid day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('DuePolicyCases', '0009'), 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.DAILY;
      due.exceptions = [dateKeyOf(11 * DAY)];
      expect(nextOccurrence(due, 10 * DAY), caseName('DuePolicyCases', '0009')).assertEqual(12 * DAY);
      expect(due.exceptions.length, caseName('DuePolicyCases', '0009')).assertEqual(1);
      expect(nextOccurrence(due, 10 * DAY) !== 11 * DAY, caseName('DuePolicyCases', '0009')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_1000
     * @tc.name      testDuePolicyCases0010
     * @tc.desc      Verify repeat text explains next date
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('DuePolicyCases', '0010'), 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.DAILY;
      expect(repeatText(RepeatKind.DAILY, due, 10 * DAY).indexOf('下次') >= 0, caseName('DuePolicyCases', '0010')).assertTrue();
      expect(repeatText(RepeatKind.NONE, due, 10 * DAY), caseName('DuePolicyCases', '0010')).assertEqual('不重复');
      const lonely: TodoDue = new TodoDue(10 * DAY);
      lonely.repeat = RepeatKind.WEEKLY;
      expect(repeatText(RepeatKind.WEEKLY, lonely, 10 * DAY).indexOf('每周') >= 0, caseName('DuePolicyCases', '0010')).assertTrue();
    });
  });

  describe('TagIndexCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0100
     * @tc.name      testTagIndexCases0001
     * @tc.desc      Verify rule table has ten entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('TagIndexCases', '0001'), 0, (): void => {
      expect(TAG_RULES.length, caseName('TagIndexCases', '0001')).assertEqual(10);
      expect(tagLines().length, caseName('TagIndexCases', '0001')).assertEqual(10);
      expect(synonymLines().length, caseName('TagIndexCases', '0001')).assertEqual(4);
      expect(TAG_LIMIT, caseName('TagIndexCases', '0001')).assertEqual(12);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0200
     * @tc.name      testTagIndexCases0002
     * @tc.desc      Verify normalize trims and lowercases
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0002'), 0, (): void => {
      expect(normalizeTag('  #工作  '), caseName('TagIndexCases', '0002')).assertEqual('工作');
      expect(normalizeTag('WORK'), caseName('TagIndexCases', '0002')).assertEqual('工作');
      expect(normalizeTag(''), caseName('TagIndexCases', '0002')).assertEqual('');
      expect(normalizeTag('   '), caseName('TagIndexCases', '0002')).assertEqual('');
      expect(normalizeTag('任务'), caseName('TagIndexCases', '0002')).assertEqual('待办');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0300
     * @tc.name      testTagIndexCases0003
     * @tc.desc      Verify long tag is truncated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0003'), 0, (): void => {
      const long: string = 'abcdefghijklmnopqrstuvwxyz0123456789';
      expect(normalizeTag(long).length, caseName('TagIndexCases', '0003')).assertEqual(24);
      expect(normalizeTag(long), caseName('TagIndexCases', '0003')).assertEqual(long.substring(0, 24));
      expect(normalizeTag(long) === long, caseName('TagIndexCases', '0003')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0400
     * @tc.name      testTagIndexCases0004
     * @tc.desc      Verify normalize tags deduplicates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0004'), 0, (): void => {
      const tags: string[] = normalizeTags(['#工作', 'work', '工作', '学习']);
      expect(tags.length, caseName('TagIndexCases', '0004')).assertEqual(2);
      expect(tags[0], caseName('TagIndexCases', '0004')).assertEqual('工作');
      expect(tags[1], caseName('TagIndexCases', '0004')).assertEqual('学习');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0500
     * @tc.name      testTagIndexCases0005
     * @tc.desc      Verify normalize tags respects limit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0005'), 0, (): void => {
      const raw: string[] = [];
      for (let index = 0; index < 20; index++) {
        raw.push(`tag-${index}`);
      }
      expect(normalizeTags(raw).length, caseName('TagIndexCases', '0005')).assertEqual(TAG_LIMIT);
      expect(TAG_LIMIT, caseName('TagIndexCases', '0005')).assertEqual(12);
      expect(raw.length, caseName('TagIndexCases', '0005')).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0600
     * @tc.name      testTagIndexCases0006
     * @tc.desc      Verify tokenize splits on punctuation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0006'), 0, (): void => {
      const tokens: string[] = tokenize('工作, 待办；学习。work');
      expect(tokens.length, caseName('TagIndexCases', '0006')).assertEqual(4);
      expect(tokens[0], caseName('TagIndexCases', '0006')).assertEqual('工作');
      expect(tokens[3], caseName('TagIndexCases', '0006')).assertEqual('work');
      expect(tokenize('   ').length, caseName('TagIndexCases', '0006')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0700
     * @tc.name      testTagIndexCases0007
     * @tc.desc      Verify search ranks title above tag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0007'), 0, (): void => {
      const byTitle: IndexedDoc = new IndexedDoc('n1', '工作记录');
      byTitle.tags = ['学习'];
      const byTag: IndexedDoc = new IndexedDoc('n2', '其他记录');
      byTag.tags = ['工作'];
      const hits: Hit[] = search([byTag, byTitle], '工作');
      expect(hits.length, caseName('TagIndexCases', '0007')).assertEqual(2);
      expect(hits[0].id, caseName('TagIndexCases', '0007')).assertEqual('n1');
      expect(hits[0].source, caseName('TagIndexCases', '0007')).assertEqual(ScoreSource.TITLE);
      expect(hits[1].source, caseName('TagIndexCases', '0007')).assertEqual(ScoreSource.TAG);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0800
     * @tc.name      testTagIndexCases0008
     * @tc.desc      Verify search returns empty for blank query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0008'), 0, (): void => {
      const doc: IndexedDoc = new IndexedDoc('n1', '工作记录');
      expect(search([doc], '').length, caseName('TagIndexCases', '0008')).assertEqual(0);
      expect(searchLines([])[0], caseName('TagIndexCases', '0008')).assertEqual('无匹配结果');
      expect(search([doc], '不存在').length, caseName('TagIndexCases', '0008')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0900
     * @tc.name      testTagIndexCases0009
     * @tc.desc      Verify tag index builds reverse map
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0009'), 0, (): void => {
      const first: IndexedDoc = new IndexedDoc('n1', '第一条');
      first.tags = ['工作', '学习'];
      const second: IndexedDoc = new IndexedDoc('n2', '第二条');
      second.tags = ['工作'];
      const index: TagIndex = new TagIndex();
      index.build([first, second]);
      expect(index.size(), caseName('TagIndexCases', '0009')).assertEqual(2);
      expect(index.docsOf('工作').length, caseName('TagIndexCases', '0009')).assertEqual(2);
      expect(index.docsOf('不存在').length, caseName('TagIndexCases', '0009')).assertEqual(0);
      expect(index.topTags()[0], caseName('TagIndexCases', '0009')).assertEqual('工作');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_1000
     * @tc.name      testTagIndexCases0010
     * @tc.desc      Verify tag index keeps first occurrence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCases', '0010'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.add('工作', 'n1');
      index.add('工作', 'n1');
      index.add('工作', 'n2');
      expect(index.docsOf('工作').length, caseName('TagIndexCases', '0010')).assertEqual(2);
      expect(index.size(), caseName('TagIndexCases', '0010')).assertEqual(1);
      expect(index.docsOf('工作').join(','), caseName('TagIndexCases', '0010')).assertEqual('n1,n2');
      expect(index.docsOf('其他').length, caseName('TagIndexCases', '0010')).assertEqual(0);
    });
  });
}
