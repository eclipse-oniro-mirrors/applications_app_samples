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

import { describe, expect, it } from '@ohos/hypium';
import {
  BODY_WEIGHT, RECENCY_BONUS, SAMPLE_QUERIES, SNIPPET_WIDTH, SearchAudit, SearchDoc, SearchHit,
  TAG_WEIGHT, TITLE_WEIGHT, auditDocs, countOccurrences, highlight, scoreDoc, search, snippetOf,
  tokenSummary, tokenize, uniqueTokens
} from '../../../main/ets/business/SearchIndex';

const DAY: number = 86400000;

function docOf(id: string, title: string, body: string, tags: string[] = [], updatedAt: number = 0): SearchDoc {
  const doc: SearchDoc = new SearchDoc(id, title, body);
  doc.tags = tags;
  doc.updatedAt = updatedAt;
  return doc;
}

export default function searchIndexDeepTest(): void {
  describe('SearchIndexDeepCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0100
     * @tc.name      testSearchIndexDeep0001
     * @tc.desc      Verify Latin words split on punctuation and are lowercased
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0001', 0, (): void => {
      expect(tokenize('Hello World').length).assertEqual(2);
      expect(tokenize('Hello World')[0]).assertEqual('hello');
      expect(tokenize('a,b;c').join('/')).assertEqual('a/b/c');
      expect(tokenize('foo-bar').join('/')).assertEqual('foo/bar');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0200
     * @tc.name      testSearchIndexDeep0002
     * @tc.desc      Verify CJK characters are tokenized one by one and mixed text keeps both kinds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0002', 0, (): void => {
      expect(tokenize('便签').join('/')).assertEqual('便/签');
      const mixed: string[] = tokenize('note 便签');
      expect(mixed.length).assertEqual(3);
      expect(mixed[0]).assertEqual('note');
      expect(mixed[1]).assertEqual('便');
      expect(tokenize('').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0300
     * @tc.name      testSearchIndexDeep0003
     * @tc.desc      Verify uniqueTokens keeps first-appearance order and removes duplicates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0003', 0, (): void => {
      const unique: string[] = uniqueTokens('todo todo 今天 todo 今天');
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('todo');
      expect(unique[1]).assertEqual('今');
      expect(unique[2]).assertEqual('天');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0400
     * @tc.name      testSearchIndexDeep0004
     * @tc.desc      Verify occurrence counting is case-insensitive and counts non-overlapping hits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0004', 0, (): void => {
      expect(countOccurrences('Note note NOTE', 'note')).assertEqual(3);
      expect(countOccurrences('aaaa', 'aa')).assertEqual(2);
      expect(countOccurrences('abc', 'zzz')).assertEqual(0);
      expect(countOccurrences('abc', '')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0500
     * @tc.name      testSearchIndexDeep0005
     * @tc.desc      Verify scoring weights title above tag above body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0005', 0, (): void => {
      const titleOnly: number = scoreDoc(docOf('a', 'note', ''), ['note'], 0);
      const tagOnly: number = scoreDoc(docOf('b', '', '', ['note']), ['note'], 0);
      const bodyOnly: number = scoreDoc(docOf('c', '', 'note'), ['note'], 0);
      expect(titleOnly).assertEqual(TITLE_WEIGHT);
      expect(tagOnly).assertEqual(TAG_WEIGHT);
      expect(bodyOnly).assertEqual(BODY_WEIGHT);
      expect(titleOnly > tagOnly).assertTrue();
      expect(tagOnly > bodyOnly).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0600
     * @tc.name      testSearchIndexDeep0006
     * @tc.desc      Verify empty token list and non-matching documents score zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0006', 0, (): void => {
      expect(scoreDoc(docOf('a', 'note', 'note'), [], 0)).assertEqual(0);
      expect(scoreDoc(docOf('a', 'note', 'note'), ['absent'], 0)).assertEqual(0);
      expect(scoreDoc(docOf('a', '', ''), ['note'], 0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0700
     * @tc.name      testSearchIndexDeep0007
     * @tc.desc      Verify recency bonus applies within one day and within one week only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0007', 0, (): void => {
      const now: number = 1700000000000;
      const fresh: number = scoreDoc(docOf('a', 'note', '', [], now - 3600000), ['note'], now);
      const week: number = scoreDoc(docOf('b', 'note', '', [], now - 3 * DAY), ['note'], now);
      const old: number = scoreDoc(docOf('c', 'note', '', [], now - 30 * DAY), ['note'], now);
      expect(fresh).assertEqual(TITLE_WEIGHT + RECENCY_BONUS);
      expect(week).assertEqual(TITLE_WEIGHT + 2);
      expect(old).assertEqual(TITLE_WEIGHT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0800
     * @tc.name      testSearchIndexDeep0008
     * @tc.desc      Verify recency bonus is skipped when timestamps are unknown
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0008', 0, (): void => {
      const now: number = 1700000000000;
      expect(scoreDoc(docOf('a', 'note', '', [], 0), ['note'], now)).assertEqual(TITLE_WEIGHT);
      expect(scoreDoc(docOf('b', 'note', '', [], now), ['note'], 0)).assertEqual(TITLE_WEIGHT);
      expect(scoreDoc(docOf('c', 'note', '', [], now - 3600000), ['note'], now))
        .assertEqual(TITLE_WEIGHT + RECENCY_BONUS);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_0900
     * @tc.name      testSearchIndexDeep0009
     * @tc.desc      Verify snippet returns empty for empty body and truncates without a hit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0009', 0, (): void => {
      expect(snippetOf('', ['note'])).assertEqual('');
      const long: string = 'x'.repeat(SNIPPET_WIDTH * 2);
      const plain: string = snippetOf(long, ['absent']);
      expect(plain.length).assertEqual(SNIPPET_WIDTH + 1);
      expect(plain.endsWith('…')).assertTrue();
      expect(snippetOf('  alpha   beta  ', [])).assertEqual('alpha beta');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1000
     * @tc.name      testSearchIndexDeep0010
     * @tc.desc      Verify snippet centres on the first hit and marks both truncation sides
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0010', 0, (): void => {
      const body: string = `${'a'.repeat(60)}needle${'b'.repeat(60)}`;
      const snippet: string = snippetOf(body, ['needle'], 12);
      expect(snippet.indexOf('needle') >= 0).assertTrue();
      expect(snippet.startsWith('…')).assertTrue();
      expect(snippet.endsWith('…')).assertTrue();
      const head: string = snippetOf(`needle${'b'.repeat(60)}`, ['needle'], 12);
      expect(head.startsWith('…')).assertFalse();
      expect(head.indexOf('needle')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1100
     * @tc.name      testSearchIndexDeep0011
     * @tc.desc      Verify snippet width is never below the documented floor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0011', 0, (): void => {
      const snippet: string = snippetOf('0123456789abcdefghij', ['absent'], 2);
      expect(snippet.length).assertEqual(9);
      expect(snippet.endsWith('…')).assertTrue();
      expect(snippetOf('abc', [], 2)).assertEqual('abc');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1200
     * @tc.name      testSearchIndexDeep0012
     * @tc.desc      Verify an empty query returns no hits instead of all documents
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0012', 0, (): void => {
      const docs: SearchDoc[] = [docOf('a', 'note', 'body'), docOf('b', 'todo', 'body')];
      expect(search(docs, '', 0).length).assertEqual(0);
      expect(search(docs, '   ', 0).length).assertEqual(0);
      expect(search(docs, ',,,', 0).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1300
     * @tc.name      testSearchIndexDeep0013
     * @tc.desc      Verify search drops non-matching documents and orders by score then id
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0013', 0, (): void => {
      const docs: SearchDoc[] = [
        docOf('b1', 'note', ''),
        docOf('a1', 'note', ''),
        docOf('c1', '', 'note'),
        docOf('d1', 'todo', 'todo')
      ];
      const hits: SearchHit[] = search(docs, 'note', 0);
      expect(hits.length).assertEqual(3);
      expect(hits[0].id).assertEqual('a1');
      expect(hits[1].id).assertEqual('b1');
      expect(hits[2].id).assertEqual('c1');
      expect(hits[0].score > hits[2].score).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1400
     * @tc.name      testSearchIndexDeep0014
     * @tc.desc      Verify the result limit truncates the ordered list
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0014', 0, (): void => {
      const docs: SearchDoc[] = [
        docOf('a', 'note', ''), docOf('b', 'note', ''), docOf('c', 'note', '')
      ];
      expect(search(docs, 'note', 0, 2).length).assertEqual(2);
      expect(search(docs, 'note', 0, 0).length).assertEqual(3);
      expect(search(docs, 'note', 0, 2)[1].id).assertEqual('b');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1500
     * @tc.name      testSearchIndexDeep0015
     * @tc.desc      Verify hits carry title, score and snippet text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0015', 0, (): void => {
      const docs: SearchDoc[] = [docOf('a', 'note title', `body ${'p'.repeat(80)} note`)];
      const hit: SearchHit = search(docs, 'note', 0)[0];
      expect(hit.title).assertEqual('note title');
      expect(hit.score >= TITLE_WEIGHT).assertTrue();
      expect(hit.text().indexOf('note title') >= 0).assertTrue();
      expect(hit.text().indexOf('｜') >= 0).assertTrue();
      expect(hit.snippet.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1600
     * @tc.name      testSearchIndexDeep0016
     * @tc.desc      Verify highlight wraps every case-insensitive occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0016', 0, (): void => {
      expect(highlight('Note note', ['note'])).assertEqual('[Note] [note]');
      expect(highlight('abc', [])).assertEqual('abc');
      expect(highlight('', ['abc'])).assertEqual('');
      expect(highlight('便签检索', ['便'])).assertEqual('[便]签检索');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1700
     * @tc.name      testSearchIndexDeep0017
     * @tc.desc      Verify token summary reports the unique word list or an empty notice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0017', 0, (): void => {
      expect(tokenSummary('')).assertEqual('没有可检索的词');
      expect(tokenSummary('todo todo')).assertEqual('1 个词：todo');
      expect(tokenSummary('便签 note').indexOf('3 个词') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1800
     * @tc.name      testSearchIndexDeep0018
     * @tc.desc      Verify document audit flags empty ids, duplicates and title limits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0018', 0, (): void => {
      const clean: SearchAudit = auditDocs([docOf('a', 'note', ''), docOf('b', 'todo', '')]);
      expect(clean.ok).assertTrue();
      expect(clean.summary()).assertEqual('检索数据自洽');
      const broken: SearchAudit = auditDocs([docOf('', '', ''), docOf('x', 'note', ''), docOf('x', 'note', '')]);
      expect(broken.ok).assertFalse();
      expect(broken.findings.length).assertEqual(3);
      expect(broken.summary().indexOf('文档 id 重复') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_1900
     * @tc.name      testSearchIndexDeep0019
     * @tc.desc      Verify document audit rejects an overlong title
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0019', 0, (): void => {
      expect(auditDocs([docOf('a', 'x'.repeat(64), '')]).ok).assertTrue();
      const long: SearchAudit = auditDocs([docOf('a', 'x'.repeat(65), '')]);
      expect(long.ok).assertFalse();
      expect(long.findings[0]).assertEqual('标题过长：a');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXDEEP_2000
     * @tc.name      testSearchIndexDeep0020
     * @tc.desc      Verify document text and sample queries expose the documented summary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSearchIndexDeep0020', 0, (): void => {
      const doc: SearchDoc = docOf('a', 'title', 'body', ['t1', 't2']);
      expect(doc.text()).assertEqual('title｜t1/t2｜4 字');
      expect(SAMPLE_QUERIES.length).assertEqual(5);
      expect(SAMPLE_QUERIES.indexOf('便签') >= 0).assertTrue();
      expect(SAMPLE_QUERIES.indexOf('missing')).assertEqual(-1);
    });
  });
}

