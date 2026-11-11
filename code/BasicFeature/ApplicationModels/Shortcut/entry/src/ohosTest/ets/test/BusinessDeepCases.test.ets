import { describe, expect, it } from '@ohos/hypium';
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

    it('testNoteTrashCases0001', 0, (): void => {
      expect(SAVE_RULES.length).assertEqual(10);
      expect(saveLines().length).assertEqual(10);
      expect(TRASH_RETENTION_DAYS).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0200
     * @tc.name      testNoteTrashCases0002
     * @tc.desc      Verify clean forward save is safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0002', 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 4, 3));
      expect(decision.code).assertEqual('SV-02');
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(decision.writable()).assertTrue();
      expect(saveAdvice(decision)).assertEqual('可以保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0300
     * @tc.name      testNoteTrashCases0003
     * @tc.desc      Verify identical triple needs no change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0003', 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 3, 3));
      expect(decision.code).assertEqual('SV-01');
      expect(decision.writable()).assertTrue();
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(saveAdvice(decision)).assertEqual('可以保存');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0400
     * @tc.name      testNoteTrashCases0004
     * @tc.desc      Verify remote ahead asks for confirm
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0004', 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 3, 5));
      expect(decision.code).assertEqual('SV-03');
      expect(decision.outcome).assertEqual(SaveOutcome.CONFIRM);
      expect(decision.writable()).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0500
     * @tc.name      testNoteTrashCases0005
     * @tc.desc      Verify both ahead branches the save
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0005', 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 5, 6));
      expect(decision.code).assertEqual('SV-05');
      expect(decision.outcome).assertEqual(SaveOutcome.BRANCH);
      expect(saveAdvice(decision).indexOf('另存') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0600
     * @tc.name      testNoteTrashCases0006
     * @tc.desc      Verify converged revisions are safe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0006', 0, (): void => {
      const decision: SaveDecision = decideSave(saveOf(3, 6, 6));
      expect(decision.code).assertEqual('SV-04');
      expect(decision.outcome).assertEqual(SaveOutcome.SAFE);
      expect(decision.writable()).assertTrue();
      expect(decision.message.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0700
     * @tc.name      testNoteTrashCases0007
     * @tc.desc      Verify rollback and guards block writing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0007', 0, (): void => {
      expect(decideSave(saveOf(5, 5, 4)).code).assertEqual('SV-06');
      const recovery: SaveInput = saveOf(3, 4, 3);
      recovery.recoveryActive = true;
      expect(decideSave(recovery).code).assertEqual('SV-08');
      const trashed: SaveInput = saveOf(3, 4, 3);
      trashed.trashed = true;
      expect(decideSave(trashed).code).assertEqual('SV-09');
      expect(decideSave(saveOf(3, 4, 3)).writable()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0800
     * @tc.name      testNoteTrashCases0008
     * @tc.desc      Verify missing revision and uncertain write are handled
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0008', 0, (): void => {
      expect(decideSave(saveOf(0, 0, 0)).code).assertEqual('SV-07');
      const uncertain: SaveInput = saveOf(3, 4, 3);
      uncertain.writeUncertain = true;
      expect(decideSave(uncertain).code).assertEqual('SV-10');
      expect(decideSave(uncertain).outcome).assertEqual(SaveOutcome.CONFIRM);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_0900
     * @tc.name      testNoteTrashCases0009
     * @tc.desc      Verify trash bin keeps recent items
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0009', 0, (): void => {
      const now: number = 1000 * DAY;
      const bin: TrashBin = new TrashBin();
      expect(bin.trash('note-1', '学习记录', 3, now - DAY, '手动删除')).assertTrue();
      expect(bin.inTrash('note-1')).assertTrue();
      expect(bin.trashed().length).assertEqual(1);
      expect(bin.restore('note-1', now)).assertTrue();
      expect(bin.inTrash('note-1')).assertFalse();
      expect(bin.restore('note-1', now)).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NOTETRASHCASES_1000
     * @tc.name      testNoteTrashCases0010
     * @tc.desc      Verify expired items cannot be restored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNoteTrashCases0010', 0, (): void => {
      const now: number = 100 * DAY;
      const bin: TrashBin = new TrashBin();
      bin.trash('note-2', '旧草稿', 1, now - 40 * DAY, '覆盖');
      expect(bin.restore('note-2', now)).assertFalse();
      const removed: TrashEntry[] = bin.purge(now);
      expect(removed.length).assertEqual(1);
      expect(removed[0].state).assertEqual(TrashState.PURGED);
      expect(trashLines(bin, now).length >= 1).assertTrue();
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

    it('testDuePolicyCases0001', 0, (): void => {
      expect(DUE_RULES.length).assertEqual(10);
      expect(dueLines().length).assertEqual(10);
      expect(DUE_SOON_MS).assertEqual(DAY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0200
     * @tc.name      testDuePolicyCases0002
     * @tc.desc      Verify state covers all branches
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0002', 0, (): void => {
      const now: number = 10 * DAY;
      expect(dueStateOf(new TodoDue(0), now)).assertEqual(DueState.NO_DUE);
      expect(dueStateOf(new TodoDue(now - DAY), now)).assertEqual(DueState.OVERDUE);
      expect(dueStateOf(new TodoDue(now + 3600000), now)).assertEqual(DueState.DUE_SOON);
      expect(dueStateOf(new TodoDue(now + 3 * DAY), now)).assertEqual(DueState.FUTURE);
      const done: TodoDue = new TodoDue(now - DAY);
      done.done = true;
      expect(dueStateOf(done, now)).assertEqual(DueState.DONE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0300
     * @tc.name      testDuePolicyCases0003
     * @tc.desc      Verify overdue days rounds down
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0003', 0, (): void => {
      const now: number = 10 * DAY;
      expect(overdueDays(new TodoDue(now - 3 * DAY), now)).assertEqual(3);
      expect(overdueDays(new TodoDue(now - DAY / 2), now)).assertEqual(0);
      expect(overdueDays(new TodoDue(now + DAY), now)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0400
     * @tc.name      testDuePolicyCases0004
     * @tc.desc      Verify defer moves deadline only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0004', 0, (): void => {
      const now: number = 10 * DAY;
      const due: TodoDue = new TodoDue(now - DAY, Priority.HIGH);
      expect(defer(due, 2, now)).assertTrue();
      expect(due.dueAt).assertEqual(now + DAY);
      expect(due.deferredAt).assertEqual(now);
      expect(due.priority).assertEqual(Priority.HIGH);
      expect(defer(due, 0, now)).assertFalse();
      expect(defer(new TodoDue(0), 1, now)).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0500
     * @tc.name      testDuePolicyCases0005
     * @tc.desc      Verify priority weights are ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0005', 0, (): void => {
      expect(priorityWeight(Priority.HIGH)).assertEqual(0);
      expect(priorityWeight(Priority.NORMAL)).assertEqual(1);
      expect(priorityWeight(Priority.LOW)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0600
     * @tc.name      testDuePolicyCases0006
     * @tc.desc      Verify buckets split items by state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0006', 0, (): void => {
      const now: number = 10 * DAY;
      const items: TodoDue[] = [new TodoDue(now - DAY), new TodoDue(now + 3600000),
        new TodoDue(now + 5 * DAY), new TodoDue(0)];
      const buckets: DueBuckets = bucketize(items, now);
      expect(buckets.overdue.length).assertEqual(1);
      expect(buckets.soon.length).assertEqual(1);
      expect(buckets.future.length).assertEqual(1);
      expect(buckets.undated.length).assertEqual(1);
      expect(buckets.size()).assertEqual(4);
      expect(dueSummary(items, now).indexOf('逾期 1') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0700
     * @tc.name      testDuePolicyCases0007
     * @tc.desc      Verify daily repeat advances one day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0007', 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.DAILY;
      expect(nextOccurrence(due, 10 * DAY)).assertEqual(11 * DAY);
      const none: TodoDue = new TodoDue(10 * DAY);
      expect(nextOccurrence(none, 10 * DAY)).assertEqual(0);
      expect(nextOccurrence(due, 10 * DAY) > 10 * DAY).assertTrue();
      expect(due.repeat).assertEqual(RepeatKind.DAILY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0800
     * @tc.name      testDuePolicyCases0008
     * @tc.desc      Verify weekday repeat skips weekend
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0008', 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.WEEKDAY;
      const next: number = nextOccurrence(due, 10 * DAY);
      expect(next > 10 * DAY).assertTrue();
      const weekday: number = new Date(next).getDay();
      expect(weekday !== 0 && weekday !== 6).assertTrue();
      expect(next !== 10 * DAY).assertTrue();
      expect(next < 10 * DAY + 4 * 86400000).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_0900
     * @tc.name      testDuePolicyCases0009
     * @tc.desc      Verify exceptions push to next valid day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDuePolicyCases0009', 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.DAILY;
      due.exceptions = [dateKeyOf(11 * DAY)];
      expect(nextOccurrence(due, 10 * DAY)).assertEqual(12 * DAY);
      expect(due.exceptions.length).assertEqual(1);
      expect(nextOccurrence(due, 10 * DAY) !== 11 * DAY).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_DUEPOLICYCASES_1000
     * @tc.name      testDuePolicyCases0010
     * @tc.desc      Verify repeat text explains next date
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDuePolicyCases0010', 0, (): void => {
      const due: TodoDue = new TodoDue(10 * DAY);
      due.repeat = RepeatKind.DAILY;
      expect(repeatText(RepeatKind.DAILY, due, 10 * DAY).indexOf('下次') >= 0).assertTrue();
      expect(repeatText(RepeatKind.NONE, due, 10 * DAY)).assertEqual('不重复');
      const lonely: TodoDue = new TodoDue(10 * DAY);
      lonely.repeat = RepeatKind.WEEKLY;
      expect(repeatText(RepeatKind.WEEKLY, lonely, 10 * DAY).indexOf('每周') >= 0).assertTrue();
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

    it('testTagIndexCases0001', 0, (): void => {
      expect(TAG_RULES.length).assertEqual(10);
      expect(tagLines().length).assertEqual(10);
      expect(synonymLines().length).assertEqual(4);
      expect(TAG_LIMIT).assertEqual(12);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0200
     * @tc.name      testTagIndexCases0002
     * @tc.desc      Verify normalize trims and lowercases
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0002', 0, (): void => {
      expect(normalizeTag('  #工作  ')).assertEqual('工作');
      expect(normalizeTag('WORK')).assertEqual('工作');
      expect(normalizeTag('')).assertEqual('');
      expect(normalizeTag('   ')).assertEqual('');
      expect(normalizeTag('任务')).assertEqual('待办');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0300
     * @tc.name      testTagIndexCases0003
     * @tc.desc      Verify long tag is truncated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0003', 0, (): void => {
      const long: string = 'abcdefghijklmnopqrstuvwxyz0123456789';
      expect(normalizeTag(long).length).assertEqual(24);
      expect(normalizeTag(long)).assertEqual(long.substring(0, 24));
      expect(normalizeTag(long) === long).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0400
     * @tc.name      testTagIndexCases0004
     * @tc.desc      Verify normalize tags deduplicates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0004', 0, (): void => {
      const tags: string[] = normalizeTags(['#工作', 'work', '工作', '学习']);
      expect(tags.length).assertEqual(2);
      expect(tags[0]).assertEqual('工作');
      expect(tags[1]).assertEqual('学习');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0500
     * @tc.name      testTagIndexCases0005
     * @tc.desc      Verify normalize tags respects limit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0005', 0, (): void => {
      const raw: string[] = [];
      for (let index = 0; index < 20; index++) {
        raw.push(`tag-${index}`);
      }
      expect(normalizeTags(raw).length).assertEqual(TAG_LIMIT);
      expect(TAG_LIMIT).assertEqual(12);
      expect(raw.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0600
     * @tc.name      testTagIndexCases0006
     * @tc.desc      Verify tokenize splits on punctuation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0006', 0, (): void => {
      const tokens: string[] = tokenize('工作, 待办；学习。work');
      expect(tokens.length).assertEqual(4);
      expect(tokens[0]).assertEqual('工作');
      expect(tokens[3]).assertEqual('work');
      expect(tokenize('   ').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0700
     * @tc.name      testTagIndexCases0007
     * @tc.desc      Verify search ranks title above tag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0007', 0, (): void => {
      const byTitle: IndexedDoc = new IndexedDoc('n1', '工作记录');
      byTitle.tags = ['学习'];
      const byTag: IndexedDoc = new IndexedDoc('n2', '其他记录');
      byTag.tags = ['工作'];
      const hits: Hit[] = search([byTag, byTitle], '工作');
      expect(hits.length).assertEqual(2);
      expect(hits[0].id).assertEqual('n1');
      expect(hits[0].source).assertEqual(ScoreSource.TITLE);
      expect(hits[1].source).assertEqual(ScoreSource.TAG);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0800
     * @tc.name      testTagIndexCases0008
     * @tc.desc      Verify search returns empty for blank query
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0008', 0, (): void => {
      const doc: IndexedDoc = new IndexedDoc('n1', '工作记录');
      expect(search([doc], '').length).assertEqual(0);
      expect(searchLines([])[0]).assertEqual('无匹配结果');
      expect(search([doc], '不存在').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_0900
     * @tc.name      testTagIndexCases0009
     * @tc.desc      Verify tag index builds reverse map
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0009', 0, (): void => {
      const first: IndexedDoc = new IndexedDoc('n1', '第一条');
      first.tags = ['工作', '学习'];
      const second: IndexedDoc = new IndexedDoc('n2', '第二条');
      second.tags = ['工作'];
      const index: TagIndex = new TagIndex();
      index.build([first, second]);
      expect(index.size()).assertEqual(2);
      expect(index.docsOf('工作').length).assertEqual(2);
      expect(index.docsOf('不存在').length).assertEqual(0);
      expect(index.topTags()[0]).assertEqual('工作');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASES_1000
     * @tc.name      testTagIndexCases0010
     * @tc.desc      Verify tag index keeps first occurrence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCases0010', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.add('工作', 'n1');
      index.add('工作', 'n1');
      index.add('工作', 'n2');
      expect(index.docsOf('工作').length).assertEqual(2);
      expect(index.size()).assertEqual(1);
      expect(index.docsOf('工作').join(',')).assertEqual('n1,n2');
      expect(index.docsOf('其他').length).assertEqual(0);
    });
  });
}
