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

    it(caseName('TagRuleCases', '0001'), 0, (): void => {
      expect(TAG_RULES.length, caseName('TagRuleCases', '0001')).assertEqual(10);
      const codes: string[] = TAG_RULES.map((rule: TagRule): string => rule.code);
      expect(codes[0], caseName('TagRuleCases', '0001')).assertEqual('TG-01');
      expect(codes[9], caseName('TagRuleCases', '0001')).assertEqual('TG-10');
      expect(codes.every((code: string, index: number): boolean =>
        code === `TG-${(index + 1).toString().padStart(2, '0')}`), caseName('TagRuleCases', '0001')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0200
     * @tc.name      testTagRuleCases0002
     * @tc.desc      Verify rule describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagRuleCases', '0002'), 0, (): void => {
      const rule: TagRule = TAG_RULES[2];
      expect(rule.describe(), caseName('TagRuleCases', '0002')).assertEqual('TG-03｜标签长度超过 24 个字符 → 截断到 24｜与存储上限一致');
      expect(rule.describe().split('｜').length, caseName('TagRuleCases', '0002')).assertEqual(3);
      expect(rule.code, caseName('TagRuleCases', '0002')).assertEqual('TG-03');
      expect(rule.describe().indexOf('TG-03') === 0, caseName('TagRuleCases', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0300
     * @tc.name      testTagRuleCases0003
     * @tc.desc      Verify tag lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('TagRuleCases', '0003'), 0, (): void => {
      const lines: string[] = tagLines();
      expect(lines.length, caseName('TagRuleCases', '0003')).assertEqual(TAG_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('→') > 0), caseName('TagRuleCases', '0003')).assertTrue();
      expect(lines[0].indexOf('TG-01') === 0, caseName('TagRuleCases', '0003')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0400
     * @tc.name      testTagRuleCases0004
     * @tc.desc      Verify tag limits are fixed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagRuleCases', '0004'), 0, (): void => {
      expect(TAG_LIMIT, caseName('TagRuleCases', '0004')).assertEqual(12);
      expect(TAG_MAX_LENGTH, caseName('TagRuleCases', '0004')).assertEqual(24);
      expect(TAG_MAX_LENGTH > TAG_LIMIT, caseName('TagRuleCases', '0004')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0500
     * @tc.name      testTagRuleCases0005
     * @tc.desc      Verify synonym table has four pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagRuleCases', '0005'), 0, (): void => {
      expect(SYNONYMS.length, caseName('TagRuleCases', '0005')).assertEqual(4);
      expect(SYNONYMS[0].canonical, caseName('TagRuleCases', '0005')).assertEqual('工作');
      expect(SYNONYMS[0].aliases.indexOf('work') >= 0, caseName('TagRuleCases', '0005')).assertTrue();
      expect(SYNONYMS[3].canonical, caseName('TagRuleCases', '0005')).assertEqual('资料');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGRULECASES_0600
     * @tc.name      testTagRuleCases0006
     * @tc.desc      Verify synonym describe shows aliases
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagRuleCases', '0006'), 0, (): void => {
      const pair: SynonymPair = new SynonymPair('待办', ['todo', '任务']);
      expect(pair.describe(), caseName('TagRuleCases', '0006')).assertEqual('待办 ← todo / 任务');
      expect(synonymLines().length, caseName('TagRuleCases', '0006')).assertEqual(SYNONYMS.length);
      expect(synonymLines()[2], caseName('TagRuleCases', '0006')).assertEqual('待办 ← todo / 任务');
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

    it(caseName('NormalizeCases', '0001'), 0, (): void => {
      expect(normalizeTag('  便签  '), caseName('NormalizeCases', '0001')).assertEqual('便签');
      expect(normalizeTag('便签'), caseName('NormalizeCases', '0001')).assertEqual('便签');
      expect(normalizeTag(''), caseName('NormalizeCases', '0001')).assertEqual('');
      expect(normalizeTag('便签').length, caseName('NormalizeCases', '0001')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0200
     * @tc.name      testNormalizeCases0002
     * @tc.desc      Verify strips hash prefix
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0002'), 0, (): void => {
      expect(normalizeTag('#便签'), caseName('NormalizeCases', '0002')).assertEqual('便签');
      expect(normalizeTag('# 便签'), caseName('NormalizeCases', '0002')).assertEqual('便签');
      expect(normalizeTag('##便签'), caseName('NormalizeCases', '0002')).assertEqual('#便签');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0300
     * @tc.name      testNormalizeCases0003
     * @tc.desc      Verify folds chinese comma
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0003'), 0, (): void => {
      expect(normalizeTag('a，b'), caseName('NormalizeCases', '0003')).assertEqual('a,b');
      expect(normalizeTag('a、b'), caseName('NormalizeCases', '0003')).assertEqual('a,b');
      expect(normalizeTag('a;b'), caseName('NormalizeCases', '0003')).assertEqual('a,b');
      expect(normalizeTag('a；b'), caseName('NormalizeCases', '0003')).assertEqual('a；b');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0400
     * @tc.name      testNormalizeCases0004
     * @tc.desc      Verify collapses repeated separators
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0004'), 0, (): void => {
      expect(normalizeTag('a,,,b'), caseName('NormalizeCases', '0004')).assertEqual('a,b');
      expect(normalizeTag('a，、，b'), caseName('NormalizeCases', '0004')).assertEqual('a,b');
      expect(normalizeTag('a,b'), caseName('NormalizeCases', '0004')).assertEqual('a,b');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0500
     * @tc.name      testNormalizeCases0005
     * @tc.desc      Verify blank tags become empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0005'), 0, (): void => {
      expect(normalizeTag(''), caseName('NormalizeCases', '0005')).assertEqual('');
      expect(normalizeTag('   '), caseName('NormalizeCases', '0005')).assertEqual('');
      expect(normalizeTag('#'), caseName('NormalizeCases', '0005')).assertEqual('');
      expect(normalizeTag('#   '), caseName('NormalizeCases', '0005')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0600
     * @tc.name      testNormalizeCases0006
     * @tc.desc      Verify long tags are truncated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0006'), 0, (): void => {
      const long: string = 'a'.repeat(TAG_MAX_LENGTH + 10);
      expect(normalizeTag(long).length, caseName('NormalizeCases', '0006')).assertEqual(TAG_MAX_LENGTH);
      expect(normalizeTag('a'.repeat(TAG_MAX_LENGTH)).length, caseName('NormalizeCases', '0006')).assertEqual(TAG_MAX_LENGTH);
      expect(TAG_MAX_LENGTH, caseName('NormalizeCases', '0006')).assertEqual(24);
      expect(normalizeTag(long), caseName('NormalizeCases', '0006')).assertEqual('a'.repeat(TAG_MAX_LENGTH));
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0700
     * @tc.name      testNormalizeCases0007
     * @tc.desc      Verify case is folded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0007'), 0, (): void => {
      expect(normalizeTag('NotePad'), caseName('NormalizeCases', '0007')).assertEqual('notepad');
      expect(normalizeTag('NOTE'), caseName('NormalizeCases', '0007')).assertEqual('note');
      expect(normalizeTag('Note') === normalizeTag('note'), caseName('NormalizeCases', '0007')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0800
     * @tc.name      testNormalizeCases0008
     * @tc.desc      Verify synonyms merge to canonical
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0008'), 0, (): void => {
      expect(normalizeTag('work'), caseName('NormalizeCases', '0008')).assertEqual('工作');
      expect(normalizeTag('办公'), caseName('NormalizeCases', '0008')).assertEqual('工作');
      expect(normalizeTag('todo'), caseName('NormalizeCases', '0008')).assertEqual('待办');
      expect(normalizeTag('任务'), caseName('NormalizeCases', '0008')).assertEqual('待办');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_0900
     * @tc.name      testNormalizeCases0009
     * @tc.desc      Verify synonym match is case insensitive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0009'), 0, (): void => {
      expect(normalizeTag('WORK'), caseName('NormalizeCases', '0009')).assertEqual('工作');
      expect(normalizeTag(' Study '), caseName('NormalizeCases', '0009')).assertEqual('学习');
      expect(normalizeTag('DoC'), caseName('NormalizeCases', '0009')).assertEqual('资料');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1000
     * @tc.name      testNormalizeCases0010
     * @tc.desc      Verify unknown words are kept
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0010'), 0, (): void => {
      expect(normalizeTag('便签'), caseName('NormalizeCases', '0010')).assertEqual('便签');
      expect(normalizeTag('meeting'), caseName('NormalizeCases', '0010')).assertEqual('meeting');
      expect(normalizeTag('工作'), caseName('NormalizeCases', '0010')).assertEqual('工作');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1100
     * @tc.name      testNormalizeCases0011
     * @tc.desc      Verify numeric tags stay as is
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0011'), 0, (): void => {
      expect(normalizeTag('2024'), caseName('NormalizeCases', '0011')).assertEqual('2024');
      expect(normalizeTag('007'), caseName('NormalizeCases', '0011')).assertEqual('007');
      expect(normalizeTag('#42'), caseName('NormalizeCases', '0011')).assertEqual('42');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1200
     * @tc.name      testNormalizeCases0012
     * @tc.desc      Verify normalize tags drops duplicates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0012'), 0, (): void => {
      const tags: string[] = normalizeTags(['便签', ' 便签 ', '#便签', 'NOTE']);
      expect(tags.length, caseName('NormalizeCases', '0012')).assertEqual(2);
      expect(tags[0], caseName('NormalizeCases', '0012')).assertEqual('便签');
      expect(tags[1], caseName('NormalizeCases', '0012')).assertEqual('note');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1300
     * @tc.name      testNormalizeCases0013
     * @tc.desc      Verify normalize tags drops blanks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0013'), 0, (): void => {
      const tags: string[] = normalizeTags(['', '   ', '#', 'a']);
      expect(tags.length, caseName('NormalizeCases', '0013')).assertEqual(1);
      expect(tags[0], caseName('NormalizeCases', '0013')).assertEqual('a');
      expect(normalizeTags(['#']).length, caseName('NormalizeCases', '0013')).assertEqual(0);
      expect(normalizeTags(['   ']).length, caseName('NormalizeCases', '0013')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1400
     * @tc.name      testNormalizeCases0014
     * @tc.desc      Verify normalize tags caps at limit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0014'), 0, (): void => {
      const raw: string[] = [];
      for (let index = 0; index < TAG_LIMIT + 4; index++) {
        raw.push(`tag${index}`);
      }
      const tags: string[] = normalizeTags(raw);
      expect(tags.length, caseName('NormalizeCases', '0014')).assertEqual(TAG_LIMIT);
      expect(tags[TAG_LIMIT - 1], caseName('NormalizeCases', '0014')).assertEqual(`tag${TAG_LIMIT - 1}`);
      expect(tags.indexOf(`tag${TAG_LIMIT}`) < 0, caseName('NormalizeCases', '0014')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1500
     * @tc.name      testNormalizeCases0015
     * @tc.desc      Verify normalize tags merges synonyms before dedup
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0015'), 0, (): void => {
      const tags: string[] = normalizeTags(['work', '办公', '工作']);
      expect(tags.length, caseName('NormalizeCases', '0015')).assertEqual(1);
      expect(tags[0], caseName('NormalizeCases', '0015')).assertEqual('工作');
      expect(normalizeTags(['工作']).length, caseName('NormalizeCases', '0015')).assertEqual(1);
      expect(normalizeTags(['work'])[0], caseName('NormalizeCases', '0015')).assertEqual('工作');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1600
     * @tc.name      testNormalizeCases0016
     * @tc.desc      Verify normalize tags keeps input order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0016'), 0, (): void => {
      const tags: string[] = normalizeTags(['b', 'a', 'c']);
      expect(tags.join(','), caseName('NormalizeCases', '0016')).assertEqual('b,a,c');
      expect(tags.length, caseName('NormalizeCases', '0016')).assertEqual(3);
      expect(tags[0], caseName('NormalizeCases', '0016')).assertEqual('b');
      expect(tags[2], caseName('NormalizeCases', '0016')).assertEqual('c');
    });

    /**
     * @tc.number    SUB_SHORTCUT_NORMALIZECASES_1700
     * @tc.name      testNormalizeCases0017
     * @tc.desc      Verify normalize empty list is empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('NormalizeCases', '0017'), 0, (): void => {
      expect(normalizeTags([]).length, caseName('NormalizeCases', '0017')).assertEqual(0);
      expect(normalizeTags(['', '  ']).length, caseName('NormalizeCases', '0017')).assertEqual(0);
      expect(normalizeTags(['  a  ']).length, caseName('NormalizeCases', '0017')).assertEqual(1);
      expect(normalizeTags(['  a  '])[0], caseName('NormalizeCases', '0017')).assertEqual('a');
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

    it(caseName('TokenizeCases', '0001'), 0, (): void => {
      expect(tokenize('alpha beta').join(','), caseName('TokenizeCases', '0001')).assertEqual('alpha,beta');
      expect(tokenize('a  b').length, caseName('TokenizeCases', '0001')).assertEqual(2);
      expect(tokenize('').length, caseName('TokenizeCases', '0001')).assertEqual(0);
      expect(tokenize('alpha').length, caseName('TokenizeCases', '0001')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0200
     * @tc.name      testTokenizeCases0002
     * @tc.desc      Verify splits on punctuation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TokenizeCases', '0002'), 0, (): void => {
      expect(tokenize('a,b;c:d').join(','), caseName('TokenizeCases', '0002')).assertEqual('a,b,c,d');
      expect(tokenize('a。b、c').join(','), caseName('TokenizeCases', '0002')).assertEqual('a,b,c');
      expect(tokenize('a,b;c:d').length, caseName('TokenizeCases', '0002')).assertEqual(4);
      expect(tokenize('a。b、c').length, caseName('TokenizeCases', '0002')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0300
     * @tc.name      testTokenizeCases0003
     * @tc.desc      Verify tokenize lowercases
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TokenizeCases', '0003'), 0, (): void => {
      expect(tokenize('Alpha BETA').join(','), caseName('TokenizeCases', '0003')).assertEqual('alpha,beta');
      expect(tokenize('NOTE').length, caseName('TokenizeCases', '0003')).assertEqual(1);
      expect(tokenize('NOTE')[0], caseName('TokenizeCases', '0003')).assertEqual('note');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0400
     * @tc.name      testTokenizeCases0004
     * @tc.desc      Verify tokenize skips empty parts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TokenizeCases', '0004'), 0, (): void => {
      expect(tokenize('   ').length, caseName('TokenizeCases', '0004')).assertEqual(0);
      expect(tokenize('').length, caseName('TokenizeCases', '0004')).assertEqual(0);
      expect(tokenize(',,,').length, caseName('TokenizeCases', '0004')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TOKENIZECASES_0500
     * @tc.name      testTokenizeCases0005
     * @tc.desc      Verify tokenize handles brackets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TokenizeCases', '0005'), 0, (): void => {
      expect(tokenize('【标题】(注释)').join(','), caseName('TokenizeCases', '0005')).assertEqual('标题,注释');
      expect(tokenize('[a]（b）').join(','), caseName('TokenizeCases', '0005')).assertEqual('a,b');
      expect(tokenize('【标题】(注释)').length, caseName('TokenizeCases', '0005')).assertEqual(2);
      expect(tokenize('【标题】(注释)')[0].indexOf('【'), caseName('TokenizeCases', '0005')).assertEqual(-1);
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

    it(caseName('SearchCases', '0001'), 0, (): void => {
      const docs: IndexedDoc[] = [docOf('d1', '标题', '正文', ['标签'])];
      expect(search(docs, '').length, caseName('SearchCases', '0001')).assertEqual(0);
      expect(search(docs, '   ').length, caseName('SearchCases', '0001')).assertEqual(0);
      expect(searchLines(search(docs, '')).length, caseName('SearchCases', '0001')).assertEqual(1);
      expect(searchLines(search(docs, ''))[0], caseName('SearchCases', '0001')).assertEqual('无匹配结果');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0200
     * @tc.name      testSearchCases0002
     * @tc.desc      Verify id match scores highest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0002'), 0, (): void => {
      const hits: Hit[] = search([docOf('note-1', '标题', '正文', [])], 'note-1');
      expect(hits.length, caseName('SearchCases', '0002')).assertEqual(1);
      expect(hits[0].score, caseName('SearchCases', '0002')).assertEqual(TITLE_WEIGHT + TAG_WEIGHT + BODY_WEIGHT);
      expect(hits[0].score, caseName('SearchCases', '0002')).assertEqual(9);
      expect(hits[0].source, caseName('SearchCases', '0002')).assertEqual(ScoreSource.ID);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0300
     * @tc.name      testSearchCases0003
     * @tc.desc      Verify title match scores five
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0003'), 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '周报整理', '正文', [])], '周报');
      expect(hits[0].score, caseName('SearchCases', '0003')).assertEqual(TITLE_WEIGHT);
      expect(hits[0].source, caseName('SearchCases', '0003')).assertEqual(ScoreSource.TITLE);
      expect(hits[0].matched, caseName('SearchCases', '0003')).assertEqual('周报');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0400
     * @tc.name      testSearchCases0004
     * @tc.desc      Verify tag match scores three
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0004'), 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '标题', '正文', ['工作'])], '工作');
      expect(hits[0].score, caseName('SearchCases', '0004')).assertEqual(TAG_WEIGHT);
      expect(hits[0].source, caseName('SearchCases', '0004')).assertEqual(ScoreSource.TAG);
      expect(hits.length, caseName('SearchCases', '0004')).assertEqual(1);
      expect(hits[0].id, caseName('SearchCases', '0004')).assertEqual('d1');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0500
     * @tc.name      testSearchCases0005
     * @tc.desc      Verify body match scores one
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0005'), 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '标题', '正文里有待办', [])], '待办');
      expect(hits[0].score, caseName('SearchCases', '0005')).assertEqual(BODY_WEIGHT);
      expect(hits[0].source, caseName('SearchCases', '0005')).assertEqual(ScoreSource.BODY);
      expect(hits.length, caseName('SearchCases', '0005')).assertEqual(1);
      expect(hits[0].matched.length > 0, caseName('SearchCases', '0005')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0600
     * @tc.name      testSearchCases0006
     * @tc.desc      Verify highest source wins per doc
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0006'), 0, (): void => {
      const doc: IndexedDoc = docOf('d1', '工作', '工作', ['工作']);
      const hits: Hit[] = search([doc], '工作');
      expect(hits.length, caseName('SearchCases', '0006')).assertEqual(1);
      expect(hits[0].source, caseName('SearchCases', '0006')).assertEqual(ScoreSource.TITLE);
      expect(hits[0].score, caseName('SearchCases', '0006')).assertEqual(TITLE_WEIGHT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0700
     * @tc.name      testSearchCases0007
     * @tc.desc      Verify results sort by score descending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0007'), 0, (): void => {
      const docs: IndexedDoc[] = [docOf('body-doc', '标题', '关键词在正文', []),
        docOf('tag-doc', '标题', '正文', ['关键词']),
        docOf('title-doc', '关键词在标题', '正文', [])];
      const hits: Hit[] = search(docs, '关键词');
      expect(hits.length, caseName('SearchCases', '0007')).assertEqual(3);
      expect(hits[0].id, caseName('SearchCases', '0007')).assertEqual('title-doc');
      expect(hits[1].id, caseName('SearchCases', '0007')).assertEqual('tag-doc');
      expect(hits[2].id, caseName('SearchCases', '0007')).assertEqual('body-doc');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0800
     * @tc.name      testSearchCases0008
     * @tc.desc      Verify ties sort by id ascending
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0008'), 0, (): void => {
      const docs: IndexedDoc[] = [docOf('c', '标题关键词', '', []),
        docOf('a', '标题关键词', '', []), docOf('b', '标题关键词', '', [])];
      const hits: Hit[] = search(docs, '关键词');
      expect(hits.map((hit: Hit): string => hit.id).join(','), caseName('SearchCases', '0008')).assertEqual('a,b,c');
      expect(hits.length, caseName('SearchCases', '0008')).assertEqual(3);
      expect(hits[0].id < hits[1].id, caseName('SearchCases', '0008')).assertTrue();
      expect(hits[1].id < hits[2].id, caseName('SearchCases', '0008')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_0900
     * @tc.name      testSearchCases0009
     * @tc.desc      Verify no match returns empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0009'), 0, (): void => {
      const docs: IndexedDoc[] = [docOf('d1', '标题', '正文', ['标签'])];
      expect(search(docs, '不存在').length, caseName('SearchCases', '0009')).assertEqual(0);
      expect(searchLines(search(docs, '不存在'))[0], caseName('SearchCases', '0009')).assertEqual('无匹配结果');
      expect(searchLines(search(docs, '不存在')).length, caseName('SearchCases', '0009')).assertEqual(1);
      expect(searchLines(search(docs, '不存在'))[0].length, caseName('SearchCases', '0009')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1000
     * @tc.name      testSearchCases0010
     * @tc.desc      Verify matching is substring
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0010'), 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '项目周报整理', '', [])], '周报');
      expect(hits.length, caseName('SearchCases', '0010')).assertEqual(1);
      expect(hits[0].matched, caseName('SearchCases', '0010')).assertEqual('周报');
      expect(hits[0].id, caseName('SearchCases', '0010')).assertEqual('d1');
      expect(hits[0].source, caseName('SearchCases', '0010')).assertEqual(ScoreSource.TITLE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1100
     * @tc.name      testSearchCases0011
     * @tc.desc      Verify multiple tokens keep best
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0011'), 0, (): void => {
      const doc: IndexedDoc = docOf('d1', '标题', '正文含beta', ['alpha']);
      const hits: Hit[] = search([doc], 'alpha beta');
      expect(hits.length, caseName('SearchCases', '0011')).assertEqual(1);
      expect(hits[0].score, caseName('SearchCases', '0011')).assertEqual(TAG_WEIGHT);
      expect(hits[0].matched, caseName('SearchCases', '0011')).assertEqual('alpha');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1200
     * @tc.name      testSearchCases0012
     * @tc.desc      Verify hit describe joins facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0012'), 0, (): void => {
      const hit: Hit = new Hit('d1', 5, ScoreSource.TITLE, '周报');
      expect(hit.describe(), caseName('SearchCases', '0012')).assertEqual('d1｜5 分｜标题｜周报');
      expect(hit.describe().split('｜').length, caseName('SearchCases', '0012')).assertEqual(4);
      expect(hit.id, caseName('SearchCases', '0012')).assertEqual('d1');
      expect(hit.score, caseName('SearchCases', '0012')).assertEqual(5);
      expect(hit.source, caseName('SearchCases', '0012')).assertEqual(ScoreSource.TITLE);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1300
     * @tc.name      testSearchCases0013
     * @tc.desc      Verify search lines headline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('SearchCases', '0013'), 0, (): void => {
      const hits: Hit[] = search([docOf('d1', '关键词', '', []),
        docOf('d2', '', '', ['关键词'])], '关键词');
      const lines: string[] = searchLines(hits);
      expect(lines[0], caseName('SearchCases', '0013')).assertEqual('命中 2 条');
      expect(lines.length, caseName('SearchCases', '0013')).assertEqual(3);
      expect(lines[1].indexOf('d1') === 0, caseName('SearchCases', '0013')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHCASES_1400
     * @tc.name      testSearchCases0014
     * @tc.desc      Verify empty docs yield no hits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchCases', '0014'), 0, (): void => {
      expect(search([], '任意').length, caseName('SearchCases', '0014')).assertEqual(0);
      expect(searchLines([]).length, caseName('SearchCases', '0014')).assertEqual(1);
      expect(searchLines([])[0], caseName('SearchCases', '0014')).assertEqual('无匹配结果');
      expect(searchLines([])[0].length, caseName('SearchCases', '0014')).assertEqual(5);
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

    it(caseName('TagIndexCasesB', '0001'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['工作', '学习']), docOf('d2', 'b', '', ['工作'])]);
      expect(index.size(), caseName('TagIndexCasesB', '0001')).assertEqual(2);
      expect(index.docsOf('工作').join(','), caseName('TagIndexCasesB', '0001')).assertEqual('d1,d2');
      expect(index.docsOf('学习').join(','), caseName('TagIndexCasesB', '0001')).assertEqual('d1');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0200
     * @tc.name      testTagIndexCasesB0002
     * @tc.desc      Verify docs of unknown is empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0002'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['工作'])]);
      expect(index.docsOf('不存在').length, caseName('TagIndexCasesB', '0002')).assertEqual(0);
      expect(index.size(), caseName('TagIndexCasesB', '0002')).assertEqual(1);
      expect(index.docsOf('工作').length, caseName('TagIndexCasesB', '0002')).assertEqual(1);
      expect(index.topTags().length, caseName('TagIndexCasesB', '0002')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0300
     * @tc.name      testTagIndexCasesB0003
     * @tc.desc      Verify add deduplicates doc ids
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0003'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.add('工作', 'd1');
      index.add('工作', 'd1');
      index.add('工作', 'd2');
      expect(index.size(), caseName('TagIndexCasesB', '0003')).assertEqual(1);
      expect(index.docsOf('工作').join(','), caseName('TagIndexCasesB', '0003')).assertEqual('d1,d2');
      expect(index.docsOf('工作').length, caseName('TagIndexCasesB', '0003')).assertEqual(2);
      index.add('其他', 'd3');
      expect(index.size(), caseName('TagIndexCasesB', '0003')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0400
     * @tc.name      testTagIndexCasesB0004
     * @tc.desc      Verify build replaces previous index
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0004'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['旧标签'])]);
      index.build([docOf('d2', 'b', '', ['新标签'])]);
      expect(index.size(), caseName('TagIndexCasesB', '0004')).assertEqual(1);
      expect(index.docsOf('旧标签').length, caseName('TagIndexCasesB', '0004')).assertEqual(0);
      expect(index.docsOf('新标签').join(','), caseName('TagIndexCasesB', '0004')).assertEqual('d2');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0500
     * @tc.name      testTagIndexCasesB0005
     * @tc.desc      Verify top tags sorts by doc count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0005'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['常', '少']), docOf('d2', 'b', '', ['常']),
        docOf('d3', 'c', '', ['常'])]);
      const top: string[] = index.topTags();
      expect(top[0], caseName('TagIndexCasesB', '0005')).assertEqual('常');
      expect(top.length, caseName('TagIndexCasesB', '0005')).assertEqual(2);
      expect(top[1], caseName('TagIndexCasesB', '0005')).assertEqual('少');
      expect(index.docsOf('常').length, caseName('TagIndexCasesB', '0005')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0600
     * @tc.name      testTagIndexCasesB0006
     * @tc.desc      Verify top tags break ties by name
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0006'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['b', 'a'])]);
      expect(index.topTags().join(','), caseName('TagIndexCasesB', '0006')).assertEqual('a,b');
      expect(index.topTags().length, caseName('TagIndexCasesB', '0006')).assertEqual(2);
      expect(index.topTags()[0], caseName('TagIndexCasesB', '0006')).assertEqual('a');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0700
     * @tc.name      testTagIndexCasesB0007
     * @tc.desc      Verify docs of returns copy
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0007'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['工作'])]);
      const docs: string[] = index.docsOf('工作');
      docs.push('外部追加');
      expect(index.docsOf('工作').join(','), caseName('TagIndexCasesB', '0007')).assertEqual('d1');
      expect(docs.length, caseName('TagIndexCasesB', '0007')).assertEqual(2);
      expect(index.docsOf('工作').length, caseName('TagIndexCasesB', '0007')).assertEqual(1);
      expect(index.size(), caseName('TagIndexCasesB', '0007')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0800
     * @tc.name      testTagIndexCasesB0008
     * @tc.desc      Verify empty index reports nothing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0008'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      expect(index.size(), caseName('TagIndexCasesB', '0008')).assertEqual(0);
      expect(index.topTags().length, caseName('TagIndexCasesB', '0008')).assertEqual(0);
      index.build([]);
      expect(index.size(), caseName('TagIndexCasesB', '0008')).assertEqual(0);
      expect(index.docsOf('任意').length, caseName('TagIndexCasesB', '0008')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_0900
     * @tc.name      testTagIndexCasesB0009
     * @tc.desc      Verify index with multiple docs per tag
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0009'), 0, (): void => {
      const index: TagIndex = new TagIndex();
      index.build([docOf('d1', 'a', '', ['便签', '工作']), docOf('d2', 'b', '', ['便签']),
        docOf('d3', 'c', '', ['便签'])]);
      expect(index.size(), caseName('TagIndexCasesB', '0009')).assertEqual(2);
      expect(index.docsOf('便签').length, caseName('TagIndexCasesB', '0009')).assertEqual(3);
      expect(index.topTags()[0], caseName('TagIndexCasesB', '0009')).assertEqual('便签');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TAGINDEXCASESB_1000
     * @tc.name      testTagIndexCasesB0010
     * @tc.desc      Verify search and index agree
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TagIndexCasesB', '0010'), 0, (): void => {
      const docs: IndexedDoc[] = [docOf('d1', '标题', '', ['关键词']),
        docOf('d2', '标题', '', ['其他'])];
      const index: TagIndex = new TagIndex();
      index.build(docs);
      const hits: Hit[] = search(docs, '关键词');
      expect(index.docsOf('关键词').length, caseName('TagIndexCasesB', '0010')).assertEqual(hits.length);
      expect(index.docsOf('关键词')[0], caseName('TagIndexCasesB', '0010')).assertEqual(hits[0].id);
      expect(hits.length, caseName('TagIndexCasesB', '0010')).assertEqual(1);
      expect(index.docsOf('其他').length, caseName('TagIndexCasesB', '0010')).assertEqual(1);
    });
  });
}
