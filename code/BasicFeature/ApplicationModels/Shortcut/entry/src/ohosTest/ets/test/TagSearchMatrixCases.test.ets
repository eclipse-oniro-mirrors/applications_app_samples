import { describe, expect, it } from '@ohos/hypium';
import {
  BODY_WEIGHT, Hit, IndexedDoc, SYNONYMS, ScoreSource, SynonymPair, TAG_LIMIT, TAG_MAX_LENGTH,
  TAG_RULES, TAG_WEIGHT, TITLE_WEIGHT, TagIndex, TagRule, normalizeTag, normalizeTags, search,
  searchLines, synonymLines, tagLines, tokenize
} from '../../../main/ets/business/TagIndex';

/** 造一篇文档。 */
function docOf(id: string, title: string, body: string, tags: string[]): IndexedDoc {
  const doc: IndexedDoc = new IndexedDoc(id, title);
  doc.body = body;
  doc.tags = tags;
  return doc;
}

export default function tagSearchMatrixCasesTest(): void {
  describe('TagRuleCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0100
     * @tc.name      testTagRuleCases0001
     * @tc.desc      Verify rule table has ten entries
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testTagRuleCases0001', 0, (): void => {
      expect(TAG_RULES.length).assertEqual(10);
      const codes: string[] = TAG_RULES.map((rule: TagRule): string => rule.code);
      expect(codes[0]).assertEqual('TG-01');
      expect(codes[9]).assertEqual('TG-10');
      expect(codes.every((code: string, index: number): boolean =>
        code === `TG-${(index + 1).toString().padStart(2, '0')}`)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0200
     * @tc.name      testTagRuleCases0002
     * @tc.desc      Verify rule describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagRuleCases0002', 0, (): void => {
      const rule: TagRule = TAG_RULES[2];
      expect(rule.describe()).assertEqual('TG-03｜标签长度超过 24 个字符 → 截断到 24｜与存储上限一致');
      expect(rule.describe().split('｜').length).assertEqual(3);
      expect(rule.code).assertEqual('TG-03');
      expect(rule.describe().indexOf('TG-03') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0300
     * @tc.name      testTagRuleCases0003
     * @tc.desc      Verify tag lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testTagRuleCases0003', 0, (): void => {
      const lines: string[] = tagLines();
      expect(lines.length).assertEqual(TAG_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('→') > 0)).assertTrue();
      expect(lines[0].indexOf('TG-01') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0400
     * @tc.name      testTagRuleCases0004
     * @tc.desc      Verify tag limits are fixed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagRuleCases0004', 0, (): void => {
      expect(TAG_LIMIT).assertEqual(12);
      expect(TAG_MAX_LENGTH).assertEqual(24);
      expect(TAG_MAX_LENGTH > TAG_LIMIT).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0500
     * @tc.name      testTagRuleCases0005
     * @tc.desc      Verify synonym table has four pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagRuleCases0005', 0, (): void => {
      expect(SYNONYMS.length).assertEqual(4);
      expect(SYNONYMS[0].canonical).assertEqual('工作');
      expect(SYNONYMS[0].aliases.indexOf('work') >= 0).assertTrue();
      expect(SYNONYMS[3].canonical).assertEqual('资料');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0600
     * @tc.name      testTagRuleCases0006
     * @tc.desc      Verify synonym describe shows aliases
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagRuleCases0006', 0, (): void => {
      const pair: SynonymPair = new SynonymPair('待办', ['todo', '任务']);
      expect(pair.describe()).assertEqual('待办 ← todo / 任务');
      expect(synonymLines().length).assertEqual(SYNONYMS.length);
      expect(synonymLines()[2]).assertEqual('待办 ← todo / 任务');
    });
  });

  describe('NormalizeCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0100
     * @tc.name      testNormalizeCases0001
     * @tc.desc      Verify trims whitespace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0001', 0, (): void => {
      expect(normalizeTag('  便签  ')).assertEqual('便签');
      expect(normalizeTag('便签')).assertEqual('便签');
      expect(normalizeTag('')).assertEqual('');
      expect(normalizeTag('便签').length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0200
     * @tc.name      testNormalizeCases0002
     * @tc.desc      Verify strips hash prefix
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0002', 0, (): void => {
      expect(normalizeTag('#便签')).assertEqual('便签');
      expect(normalizeTag('# 便签')).assertEqual('便签');
      expect(normalizeTag('##便签')).assertEqual('#便签');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0300
     * @tc.name      testNormalizeCases0003
     * @tc.desc      Verify folds chinese comma
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0003', 0, (): void => {
      expect(normalizeTag('a，b')).assertEqual('a,b');
      expect(normalizeTag('a、b')).assertEqual('a,b');
      expect(normalizeTag('a;b')).assertEqual('a,b');
      expect(normalizeTag('a；b')).assertEqual('a；b');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0400
     * @tc.name      testNormalizeCases0004
     * @tc.desc      Verify collapses repeated separators
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0004', 0, (): void => {
      expect(normalizeTag('a,,,b')).assertEqual('a,b');
      expect(normalizeTag('a，、，b')).assertEqual('a,b');
      expect(normalizeTag('a,b')).assertEqual('a,b');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0500
     * @tc.name      testNormalizeCases0005
     * @tc.desc      Verify blank tags become empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0005', 0, (): void => {
      expect(normalizeTag('')).assertEqual('');
      expect(normalizeTag('   ')).assertEqual('');
      expect(normalizeTag('#')).assertEqual('');
      expect(normalizeTag('#   ')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0600
     * @tc.name      testNormalizeCases0006
     * @tc.desc      Verify long tags are truncated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0006', 0, (): void => {
      const long: string = 'a'.repeat(TAG_MAX_LENGTH + 10);
      expect(normalizeTag(long).length).assertEqual(TAG_MAX_LENGTH);
      expect(normalizeTag('a'.repeat(TAG_MAX_LENGTH)).length).assertEqual(TAG_MAX_LENGTH);
      expect(TAG_MAX_LENGTH).assertEqual(24);
      expect(normalizeTag(long)).assertEqual('a'.repeat(TAG_MAX_LENGTH));
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0700
     * @tc.name      testNormalizeCases0007
     * @tc.desc      Verify case is folded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0007', 0, (): void => {
      expect(normalizeTag('NotePad')).assertEqual('notepad');
      expect(normalizeTag('NOTE')).assertEqual('note');
      expect(normalizeTag('Note') === normalizeTag('note')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0800
     * @tc.name      testNormalizeCases0008
     * @tc.desc      Verify synonyms merge to canonical
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0008', 0, (): void => {
      expect(normalizeTag('work')).assertEqual('工作');
      expect(normalizeTag('办公')).assertEqual('工作');
      expect(normalizeTag('todo')).assertEqual('待办');
      expect(normalizeTag('任务')).assertEqual('待办');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0900
     * @tc.name      testNormalizeCases0009
     * @tc.desc      Verify synonym match is case insensitive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0009', 0, (): void => {
      expect(normalizeTag('WORK')).assertEqual('工作');
      expect(normalizeTag(' Study ')).assertEqual('学习');
      expect(normalizeTag('DoC')).assertEqual('资料');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1000
     * @tc.name      testNormalizeCases0010
     * @tc.desc      Verify unknown words are kept
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0010', 0, (): void => {
      expect(normalizeTag('便签')).assertEqual('便签');
      expect(normalizeTag('meeting')).assertEqual('meeting');
      expect(normalizeTag('工作')).assertEqual('工作');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1100
     * @tc.name      testNormalizeCases0011
     * @tc.desc      Verify numeric tags stay as is
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0011', 0, (): void => {
      expect(normalizeTag('2024')).assertEqual('2024');
      expect(normalizeTag('007')).assertEqual('007');
      expect(normalizeTag('#42')).assertEqual('42');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1200
     * @tc.name      testNormalizeCases0012
     * @tc.desc      Verify normalize tags drops duplicates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0012', 0, (): void => {
      const tags: string[] = normalizeTags(['便签', ' 便签 ', '#便签', 'NOTE']);
      expect(tags.length).assertEqual(2);
      expect(tags[0]).assertEqual('便签');
      expect(tags[1]).assertEqual('note');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1300
     * @tc.name      testNormalizeCases0013
     * @tc.desc      Verify normalize tags drops blanks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0013', 0, (): void => {
      const tags: string[] = normalizeTags(['', '   ', '#', 'a']);
      expect(tags.length).assertEqual(1);
      expect(tags[0]).assertEqual('a');
      expect(normalizeTags(['#']).length).assertEqual(0);
      expect(normalizeTags(['   ']).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1400
     * @tc.name      testNormalizeCases0014
     * @tc.desc      Verify normalize tags caps at limit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0014', 0, (): void => {
      const raw: string[] = [];
      for (let index = 0; index < TAG_LIMIT + 4; index++) {
        raw.push(`tag${index}`);
      }
      const tags: string[] = normalizeTags(raw);
      expect(tags.length).assertEqual(TAG_LIMIT);
      expect(tags[TAG_LIMIT - 1]).assertEqual(`tag${TAG_LIMIT - 1}`);
      expect(tags.indexOf(`tag${TAG_LIMIT}`) < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1500
     * @tc.name      testNormalizeCases0015
     * @tc.desc      Verify normalize tags merges synonyms before dedup
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0015', 0, (): void => {
      const tags: string[] = normalizeTags(['work', '办公', '工作']);
      expect(tags.length).assertEqual(1);
      expect(tags[0]).assertEqual('工作');
      expect(normalizeTags(['工作']).length).assertEqual(1);
      expect(normalizeTags(['work'])[0]).assertEqual('工作');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1600
     * @tc.name      testNormalizeCases0016
     * @tc.desc      Verify normalize tags keeps input order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0016', 0, (): void => {
      const tags: string[] = normalizeTags(['b', 'a', 'c']);
      expect(tags.join(',')).assertEqual('b,a,c');
      expect(tags.length).assertEqual(3);
      expect(tags[0]).assertEqual('b');
      expect(tags[2]).assertEqual('c');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1700
     * @tc.name      testNormalizeCases0017
     * @tc.desc      Verify normalize empty list is empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testNormalizeCases0017', 0, (): void => {
      expect(normalizeTags([]).length).assertEqual(0);
      expect(normalizeTags(['', '  ']).length).assertEqual(0);
      expect(normalizeTags(['  a  ']).length).assertEqual(1);
      expect(normalizeTags(['  a  '])[0]).assertEqual('a');
    });
  });

  describe('TokenizeCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0100
     * @tc.name      testTokenizeCases0001
     * @tc.desc      Verify splits on whitespace
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTokenizeCases0001', 0, (): void => {
      expect(tokenize('alpha beta').join(',')).assertEqual('alpha,beta');
      expect(tokenize('a  b').length).assertEqual(2);
      expect(tokenize('').length).assertEqual(0);
      expect(tokenize('alpha').length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0200
     * @tc.name      testTokenizeCases0002
     * @tc.desc      Verify splits on punctuation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTokenizeCases0002', 0, (): void => {
      expect(tokenize('a,b;c:d').join(',')).assertEqual('a,b,c,d');
      expect(tokenize('a。b、c').join(',')).assertEqual('a,b,c');
      expect(tokenize('a,b;c:d').length).assertEqual(4);
      expect(tokenize('a。b、c').length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0300
     * @tc.name      testTokenizeCases0003
     * @tc.desc      Verify tokenize lowercases
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTokenizeCases0003', 0, (): void => {
      expect(tokenize('Alpha BETA').join(',')).assertEqual('alpha,beta');
      expect(tokenize('NOTE').length).assertEqual(1);
      expect(tokenize('NOTE')[0]).assertEqual('note');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0400
     * @tc.name      testTokenizeCases0004
     * @tc.desc      Verify tokenize skips empty parts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTokenizeCases0004', 0, (): void => {
      expect(tokenize('   ').length).assertEqual(0);
      expect(tokenize('').length).assertEqual(0);
      expect(tokenize(',,,').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0500
     * @tc.name      testTokenizeCases0005
     * @tc.desc      Verify tokenize handles brackets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTokenizeCases0005', 0, (): void => {
      expect(tokenize('【标题】(注释)').join(',')).assertEqual('标题,注释');
      expect(tokenize('[a]（b）').join(',')).assertEqual('a,b');
      expect(tokenize('【标题】(注释)').length).assertEqual(2);
      expect(tokenize('【标题】(注释)')[0].indexOf('【')).assertEqual(-1);
    });
  });

  describe('SearchCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0100
     * @tc.name      testSearchCases0001
     * @tc.desc      Verify empty query returns nothing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0001', 0, (): void => {
      const docs: IndexedDoc[] = [docOf('d1', '标题', '正文', ['标签'])];
      expect(search(docs, '').length).assertEqual(0);
      expect(search(docs, '   ').length).assertEqual(0);
      expect(searchLines(search(docs, '')).length).assertEqual(1);
      expect(searchLines(search(docs, ''))[0]).assertEqual('无匹配结果');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0200
     * @tc.name      testSearchCases0002
     * @tc.desc      Verify id match scores highest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0002', 0, (): void => {
      const hits: Hit[] = search([docOf('note-1', '标题', '正文', [])], 'note-1');
      expect(hits.length).assertEqual(1);
      expect(hits[0].score).assertEqual(TITLE_WEIGHT + TAG_WEIGHT + BODY_WEIGHT);
      expect(hits[0].score).assertEqual(9);
      expect(hits[0].source).assertEqual(ScoreSource.ID);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0300
     * @tc.name      testSearchCases0003
     * @tc.desc      Verify title match scores five
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0003', 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '周报整理', '正文', [])], '周报');
      expect(hits[0].score).assertEqual(TITLE_WEIGHT);
      expect(hits[0].source).assertEqual(ScoreSource.TITLE);
      expect(hits[0].matched).assertEqual('周报');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0400
     * @tc.name      testSearchCases0004
     * @tc.desc      Verify tag match scores three
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0004', 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '标题', '正文', ['工作'])], '工作');
      expect(hits[0].score).assertEqual(TAG_WEIGHT);
      expect(hits[0].source).assertEqual(ScoreSource.TAG);
      expect(hits.length).assertEqual(1);
      expect(hits[0].id).assertEqual('d1');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0500
     * @tc.name      testSearchCases0005
     * @tc.desc      Verify body match scores one
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0005', 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '标题', '正文里有待办', [])], '待办');
      expect(hits[0].score).assertEqual(BODY_WEIGHT);
      expect(hits[0].source).assertEqual(ScoreSource.BODY);
      expect(hits.length).assertEqual(1);
      expect(hits[0].matched.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0600
     * @tc.name      testSearchCases0006
     * @tc.desc      Verify highest source wins per doc
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0006', 0, (): void => {
      const doc: IndexedDoc = docOf('d1', '工作', '工作', ['工作']);
      const hits: Hit[] = search([doc], '工作');
      expect(hits.length).assertEqual(1);
      expect(hits[0].source).assertEqual(ScoreSource.TITLE);
      expect(hits[0].score).assertEqual(TITLE_WEIGHT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0700
     * @tc.name      testSearchCases0007
     * @tc.desc      Verify results sort by score descending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0007', 0, (): void => {
      const docs: IndexedDoc[] = [docOf('body-doc', '标题', '关键词在正文', []),
        docOf('tag-doc', '标题', '正文', ['关键词']),
        docOf('title-doc', '关键词在标题', '正文', [])];
      const hits: Hit[] = search(docs, '关键词');
      expect(hits.length).assertEqual(3);
      expect(hits[0].id).assertEqual('title-doc');
      expect(hits[1].id).assertEqual('tag-doc');
      expect(hits[2].id).assertEqual('body-doc');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0800
     * @tc.name      testSearchCases0008
     * @tc.desc      Verify ties sort by id ascending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0008', 0, (): void => {
      const docs: IndexedDoc[] = [docOf('c', '标题关键词', '', []),
        docOf('a', '标题关键词', '', []), docOf('b', '标题关键词', '', [])];
      const hits: Hit[] = search(docs, '关键词');
      expect(hits.map((hit: Hit): string => hit.id).join(',')).assertEqual('a,b,c');
      expect(hits.length).assertEqual(3);
      expect(hits[0].id < hits[1].id).assertTrue();
      expect(hits[1].id < hits[2].id).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0900
     * @tc.name      testSearchCases0009
     * @tc.desc      Verify no match returns empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0009', 0, (): void => {
      const docs: IndexedDoc[] = [docOf('d1', '标题', '正文', ['标签'])];
      expect(search(docs, '不存在').length).assertEqual(0);
      expect(searchLines(search(docs, '不存在'))[0]).assertEqual('无匹配结果');
      expect(searchLines(search(docs, '不存在')).length).assertEqual(1);
      expect(searchLines(search(docs, '不存在'))[0].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1000
     * @tc.name      testSearchCases0010
     * @tc.desc      Verify matching is substring
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0010', 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '项目周报整理', '', [])], '周报');
      expect(hits.length).assertEqual(1);
      expect(hits[0].matched).assertEqual('周报');
      expect(hits[0].id).assertEqual('d1');
      expect(hits[0].source).assertEqual(ScoreSource.TITLE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1100
     * @tc.name      testSearchCases0011
     * @tc.desc      Verify multiple tokens keep best
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0011', 0, (): void => {
      const doc: IndexedDoc = docOf('d1', '标题', '正文含beta', ['alpha']);
      const hits: Hit[] = search([doc], 'alpha beta');
      expect(hits.length).assertEqual(1);
      expect(hits[0].score).assertEqual(TAG_WEIGHT);
      expect(hits[0].matched).assertEqual('alpha');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1200
     * @tc.name      testSearchCases0012
     * @tc.desc      Verify hit describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0012', 0, (): void => {
      const hit: Hit = new Hit('d1', 5, ScoreSource.TITLE, '周报');
      expect(hit.describe()).assertEqual('d1｜5 分｜标题｜周报');
      expect(hit.describe().split('｜').length).assertEqual(4);
      expect(hit.id).assertEqual('d1');
      expect(hit.score).assertEqual(5);
      expect(hit.source).assertEqual(ScoreSource.TITLE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1300
     * @tc.name      testSearchCases0013
     * @tc.desc      Verify search lines headline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testSearchCases0013', 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '关键词', '', []),
        docOf('d2', '', '', ['关键词'])], '关键词');
      const lines: string[] = searchLines(hits);
      expect(lines[0]).assertEqual('命中 2 条');
      expect(lines.length).assertEqual(3);
      expect(lines[1].indexOf('d1') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1400
     * @tc.name      testSearchCases0014
     * @tc.desc      Verify empty docs yield no hits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchCases0014', 0, (): void => {
      expect(search([], '任意').length).assertEqual(0);
      expect(searchLines([]).length).assertEqual(1);
      expect(searchLines([])[0]).assertEqual('无匹配结果');
      expect(searchLines([])[0].length).assertEqual(5);
    });
  });

  describe('TagIndexMatrixCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0100
     * @tc.name      testTagIndexCasesB0001
     * @tc.desc      Verify build indexes all tags
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0001', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['工作', '学习']), docOf('d2', 'b', '', ['工作'])]);
      expect(index.size()).assertEqual(2);
      expect(index.docsOf('工作').join(',')).assertEqual('d1,d2');
      expect(index.docsOf('学习').join(',')).assertEqual('d1');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0200
     * @tc.name      testTagIndexCasesB0002
     * @tc.desc      Verify docs of unknown is empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0002', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['工作'])]);
      expect(index.docsOf('不存在').length).assertEqual(0);
      expect(index.size()).assertEqual(1);
      expect(index.docsOf('工作').length).assertEqual(1);
      expect(index.topTags().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0300
     * @tc.name      testTagIndexCasesB0003
     * @tc.desc      Verify add deduplicates doc ids
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0003', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.add('工作', 'd1');
      index.add('工作', 'd1');
      index.add('工作', 'd2');
      expect(index.size()).assertEqual(1);
      expect(index.docsOf('工作').join(',')).assertEqual('d1,d2');
      expect(index.docsOf('工作').length).assertEqual(2);
      index.add('其他', 'd3');
      expect(index.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0400
     * @tc.name      testTagIndexCasesB0004
     * @tc.desc      Verify build replaces previous index
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0004', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['旧标签'])]);
      index.build([docOf('d2', 'b', '', ['新标签'])]);
      expect(index.size()).assertEqual(1);
      expect(index.docsOf('旧标签').length).assertEqual(0);
      expect(index.docsOf('新标签').join(',')).assertEqual('d2');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0500
     * @tc.name      testTagIndexCasesB0005
     * @tc.desc      Verify top tags sorts by doc count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0005', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['常', '少']), docOf('d2', 'b', '', ['常']),
        docOf('d3', 'c', '', ['常'])]);
      const top: string[] = index.topTags();
      expect(top[0]).assertEqual('常');
      expect(top.length).assertEqual(2);
      expect(top[1]).assertEqual('少');
      expect(index.docsOf('常').length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0600
     * @tc.name      testTagIndexCasesB0006
     * @tc.desc      Verify top tags break ties by name
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0006', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['b', 'a'])]);
      expect(index.topTags().join(',')).assertEqual('a,b');
      expect(index.topTags().length).assertEqual(2);
      expect(index.topTags()[0]).assertEqual('a');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0700
     * @tc.name      testTagIndexCasesB0007
     * @tc.desc      Verify docs of returns copy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0007', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['工作'])]);
      const docs: string[] = index.docsOf('工作');
      docs.push('外部追加');
      expect(index.docsOf('工作').join(',')).assertEqual('d1');
      expect(docs.length).assertEqual(2);
      expect(index.docsOf('工作').length).assertEqual(1);
      expect(index.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0800
     * @tc.name      testTagIndexCasesB0008
     * @tc.desc      Verify empty index reports nothing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0008', 0, (): void => {
      const index: TagIndex = new TagIndex();
      expect(index.size()).assertEqual(0);
      expect(index.topTags().length).assertEqual(0);
      index.build([]);
      expect(index.size()).assertEqual(0);
      expect(index.docsOf('任意').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0900
     * @tc.name      testTagIndexCasesB0009
     * @tc.desc      Verify index with multiple docs per tag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0009', 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['便签', '工作']), docOf('d2', 'b', '', ['便签']),
        docOf('d3', 'c', '', ['便签'])]);
      expect(index.size()).assertEqual(2);
      expect(index.docsOf('便签').length).assertEqual(3);
      expect(index.topTags()[0]).assertEqual('便签');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_1000
     * @tc.name      testTagIndexCasesB0010
     * @tc.desc      Verify search and index agree
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTagIndexCasesB0010', 0, (): void => {
      const docs: IndexedDoc[] = [docOf('d1', '标题', '', ['关键词']),
        docOf('d2', '标题', '', ['其他'])];
      const index: TagIndex = new TagIndex();
      index.build(docs);
      const hits: Hit[] = search(docs, '关键词');
      expect(index.docsOf('关键词').length).assertEqual(hits.length);
      expect(index.docsOf('关键词')[0]).assertEqual(hits[0].id);
      expect(hits.length).assertEqual(1);
      expect(index.docsOf('其他').length).assertEqual(1);
    });
  });
}
