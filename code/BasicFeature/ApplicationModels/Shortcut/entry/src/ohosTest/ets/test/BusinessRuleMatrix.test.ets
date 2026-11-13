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
  ParamKind, ROUTE_TABLE, RoutePage, RouteParam, RouteRequest, auditRoutes, pageOf,
  resolveRoute, routeIds, routeLines, routeOf, routesOfPage
} from '../../../main/ets/business/EntryRoute';
import {
  TODO_TRANSITIONS, TodoEvent, TodoItem, TodoState, auditTodoRules, dueBucket, isClosedState,
  nextTodoState, openTodos, priorityWeight, scoreOf, sortTodos, summarizeTodos, todoEventLabel,
  todoEventsOf, todoRuleLines, todoStateLabel
} from '../../../main/ets/business/TodoRules';
import {
  BODY_WEIGHT, SearchDoc, TAG_WEIGHT, TITLE_WEIGHT, auditDocs, countOccurrences, highlight,
  scoreDoc, search, snippetOf, tokenSummary, tokenize, uniqueTokens
} from '../../../main/ets/business/SearchIndex';

const DAY: number = 86400000;

function noteDoc(): SearchDoc {
  const doc: SearchDoc = new SearchDoc('demo-note', '便签示例', '这是一条便签示例，用于演示本地检索。');
  doc.tags = ['便签', 'note'];
  doc.updatedAt = 1700000000000;
  return doc;
}

function todoDoc(): SearchDoc {
  const doc: SearchDoc = new SearchDoc('demo-todo', '待办示例', '今日待办包含三条任务。');
  doc.tags = ['待办', 'todo'];
  doc.updatedAt = 1700000000000;
  return doc;
}

function allDocs(): SearchDoc[] {
  return [noteDoc(), todoDoc()];
}

function sampleTodos(now: number): TodoItem[] {
  const urgent: TodoItem = new TodoItem('a', '整理今日待办', 3);
  urgent.state = TodoState.DOING;
  urgent.dueAt = now - 1000;
  urgent.estimateMinutes = 15;
  const normal: TodoItem = new TodoItem('b', '补充便签内容', 2);
  normal.dueAt = now + 1000;
  normal.estimateMinutes = 45;
  const later: TodoItem = new TodoItem('c', '整理收藏标签', 1);
  later.state = TodoState.DEFERRED;
  later.dueAt = now + 3 * DAY;
  later.estimateMinutes = 180;
  return [urgent, normal, later];
}

export default function businessRuleMatrixTest(): void {
  describe('EntryRouteMatrix', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIX_0100
     * @tc.name      testEntryRouteMatrix0001
     * @tc.desc      Verify route table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('EntryRouteMatrix', '0001'), 0, (): void => {
      expect(ROUTE_TABLE.length, caseName('EntryRouteMatrix', '0001')).assertEqual(8);
      expect(routeIds().length, caseName('EntryRouteMatrix', '0001')).assertEqual(8);
      expect(routeLines().length, caseName('EntryRouteMatrix', '0001')).assertEqual(8);
      const audit = auditRoutes();
      expect(audit.findings.length, caseName('EntryRouteMatrix', '0001')).assertEqual(0);
      expect(audit.ok, caseName('EntryRouteMatrix', '0001')).assertTrue();
      expect(audit.summary(), caseName('EntryRouteMatrix', '0001')).assertEqual('路由表自洽');
      ROUTE_TABLE.forEach((entry): void => {
        expect(entry.routeId.length > 0, caseName('EntryRouteMatrix', '0001')).assertTrue();
        expect(entry.page !== RoutePage.UNKNOWN, caseName('EntryRouteMatrix', '0001')).assertTrue();
        expect(entry.description.length > 0, caseName('EntryRouteMatrix', '0001')).assertTrue();
        expect(entry.text().indexOf(entry.routeId) === 0, caseName('EntryRouteMatrix', '0001')).assertTrue();
        entry.params.forEach((param: RouteParam): void => {
          expect(param.name.length > 0, caseName('EntryRouteMatrix', '0001')).assertTrue();
          expect(param.text().indexOf(param.name) === 0, caseName('EntryRouteMatrix', '0001')).assertTrue();
        });
      });
      expect(routeOf('missing'), caseName('EntryRouteMatrix', '0001')).assertEqual(undefined);
      expect(pageOf('missing'), caseName('EntryRouteMatrix', '0001')).assertEqual(RoutePage.HOME);
      expect(pageOf('sc.todo.today'), caseName('EntryRouteMatrix', '0001')).assertEqual(RoutePage.TODO);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIX_0200
     * @tc.name      testEntryRouteMatrix0002
     * @tc.desc      Verify resolve route handles guards
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrix', '0002'), 0, (): void => {
      const request: RouteRequest = new RouteRequest('sc.note.new', 0);
      request.put('focus', 'true');
      request.loggedIn = true;
      const resolved = resolveRoute(request);
      expect(resolved.ok, caseName('EntryRouteMatrix', '0002')).assertTrue();
      expect(resolved.page, caseName('EntryRouteMatrix', '0002')).assertEqual(RoutePage.NOTE);
      expect(resolved.get('focus'), caseName('EntryRouteMatrix', '0002')).assertEqual('true');
      expect(resolved.keys.length, caseName('EntryRouteMatrix', '0002')).assertEqual(2);
      expect(resolved.text().indexOf('-> note') === 0, caseName('EntryRouteMatrix', '0002')).assertTrue();
      expect(request.get('missing'), caseName('EntryRouteMatrix', '0002')).assertEqual('');
      const loggedOut: RouteRequest = new RouteRequest('sc.detail', 0);
      const blocked = resolveRoute(loggedOut);
      expect(blocked.ok, caseName('EntryRouteMatrix', '0002')).assertFalse();
      expect(blocked.issues[0], caseName('EntryRouteMatrix', '0002')).assertEqual('需要登录后才能进入');
      const loggedIn: RouteRequest = new RouteRequest('sc.detail', 0);
      loggedIn.loggedIn = true;
      const missing = resolveRoute(loggedIn);
      expect(missing.ok, caseName('EntryRouteMatrix', '0002')).assertFalse();
      expect(missing.missing.length, caseName('EntryRouteMatrix', '0002')).assertEqual(1);
      expect(missing.missing[0], caseName('EntryRouteMatrix', '0002')).assertEqual('noteId');
      const unknown: RouteRequest = new RouteRequest('sc.unknown', 0);
      const unknownResult = resolveRoute(unknown);
      expect(unknownResult.ok, caseName('EntryRouteMatrix', '0002')).assertFalse();
      expect(unknownResult.page, caseName('EntryRouteMatrix', '0002')).assertEqual(RoutePage.HOME);
      expect(unknownResult.text().indexOf('未解析') === 0, caseName('EntryRouteMatrix', '0002')).assertTrue();
      const invalidValue: RouteRequest = new RouteRequest('sc.note.new', 0);
      invalidValue.put('focus', 'yes');
      const invalidResult = resolveRoute(invalidValue);
      expect(invalidResult.get('focus'), caseName('EntryRouteMatrix', '0002')).assertEqual('true');
      expect(invalidResult.issues.length > 0, caseName('EntryRouteMatrix', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIX_0300
     * @tc.name      testEntryRouteMatrix0003
     * @tc.desc      Verify page reverse lookup
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrix', '0003'), 0, (): void => {
      expect(routesOfPage(RoutePage.NOTE).length, caseName('EntryRouteMatrix', '0003')).assertEqual(2);
      expect(routesOfPage(RoutePage.DETAIL).length, caseName('EntryRouteMatrix', '0003')).assertEqual(2);
      expect(routesOfPage(RoutePage.RULE_CENTER).length, caseName('EntryRouteMatrix', '0003')).assertEqual(1);
      expect(routesOfPage(RoutePage.CALL_LOG)[0], caseName('EntryRouteMatrix', '0003')).assertEqual('sc.calls');
      const param: RouteParam = new RouteParam('count', ParamKind.NUMBER, false, '0');
      expect(param.accepts('12'), caseName('EntryRouteMatrix', '0003')).assertTrue();
      expect(param.accepts('abc'), caseName('EntryRouteMatrix', '0003')).assertFalse();
      expect(param.coerce('abc'), caseName('EntryRouteMatrix', '0003')).assertEqual('0');
      const required: RouteParam = new RouteParam('id', ParamKind.ID, true, '');
      expect(required.accepts(''), caseName('EntryRouteMatrix', '0003')).assertFalse();
      expect(required.coerce(''), caseName('EntryRouteMatrix', '0003')).assertEqual('');
      expect(new RouteRequest('sc.note.new', 0).put('a', 'b').get('a'), caseName('EntryRouteMatrix', '0003')).assertEqual('b');
      expect(new RouteRequest('sc.note.new', 0).put('a', 'b').put('a', 'c').get('a'), caseName('EntryRouteMatrix', '0003'))
        .assertEqual('c');
    });
  });

  describe('TodoRulesMatrix', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIX_0100
     * @tc.name      testTodoRulesMatrix0001
     * @tc.desc      Verify transition table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('TodoRulesMatrix', '0001'), 0, (): void => {
      expect(TODO_TRANSITIONS.length, caseName('TodoRulesMatrix', '0001')).assertEqual(14);
      expect(todoRuleLines().length, caseName('TodoRulesMatrix', '0001')).assertEqual(14);
      const audit = auditTodoRules();
      expect(audit.findings.length, caseName('TodoRulesMatrix', '0001')).assertEqual(0);
      expect(audit.ok, caseName('TodoRulesMatrix', '0001')).assertTrue();
      expect(audit.summary(), caseName('TodoRulesMatrix', '0001')).assertEqual('待办迁移表自洽');
      TODO_TRANSITIONS.forEach((rule): void => {
        expect(rule.ruleId.indexOf('TT-') === 0, caseName('TodoRulesMatrix', '0001')).assertTrue();
        expect(rule.from !== rule.to, caseName('TodoRulesMatrix', '0001')).assertTrue();
        expect(rule.note.length > 0, caseName('TodoRulesMatrix', '0001')).assertTrue();
        expect(rule.text().indexOf(rule.ruleId) === 0, caseName('TodoRulesMatrix', '0001')).assertTrue();
        expect(nextTodoState(rule.from, rule.event).to, caseName('TodoRulesMatrix', '0001')).assertEqual(rule.to);
      });
      expect(todoStateLabel(TodoState.DOING), caseName('TodoRulesMatrix', '0001')).assertEqual('进行中');
      expect(todoEventLabel(TodoEvent.EXPIRE), caseName('TodoRulesMatrix', '0001')).assertEqual('过期');
      expect(isClosedState(TodoState.DONE), caseName('TodoRulesMatrix', '0001')).assertTrue();
      expect(isClosedState(TodoState.DOING), caseName('TodoRulesMatrix', '0001')).assertFalse();
      expect(todoEventsOf(TodoState.OPEN).length, caseName('TodoRulesMatrix', '0001')).assertEqual(5);
      expect(todoEventsOf(TodoState.DONE).length, caseName('TodoRulesMatrix', '0001')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIX_0200
     * @tc.name      testTodoRulesMatrix0002
     * @tc.desc      Verify rejects illegal transitions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrix', '0002'), 0, (): void => {
      const started = nextTodoState(TodoState.OPEN, TodoEvent.START);
      expect(started.applied, caseName('TodoRulesMatrix', '0002')).assertTrue();
      expect(started.to, caseName('TodoRulesMatrix', '0002')).assertEqual(TodoState.DOING);
      const illegal = nextTodoState(TodoState.DONE, TodoEvent.START);
      expect(illegal.applied, caseName('TodoRulesMatrix', '0002')).assertFalse();
      expect(illegal.to, caseName('TodoRulesMatrix', '0002')).assertEqual(TodoState.DONE);
      expect(illegal.reason.indexOf('不接受') > 0, caseName('TodoRulesMatrix', '0002')).assertTrue();
      expect(illegal.text().indexOf('被拒绝') === 0, caseName('TodoRulesMatrix', '0002')).assertTrue();
      expect(nextTodoState(TodoState.DONE, TodoEvent.REOPEN).to, caseName('TodoRulesMatrix', '0002')).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DROPPED, TodoEvent.REOPEN).to, caseName('TodoRulesMatrix', '0002')).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DEFERRED, TodoEvent.EXPIRE).to, caseName('TodoRulesMatrix', '0002')).assertEqual(TodoState.DROPPED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIX_0300
     * @tc.name      testTodoRulesMatrix0003
     * @tc.desc      Verify scoring and sorting
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrix', '0003'), 0, (): void => {
      const now: number = 1700000000000;
      const items: TodoItem[] = sampleTodos(now);
      expect(priorityWeight(3), caseName('TodoRulesMatrix', '0003')).assertEqual(100);
      expect(priorityWeight(0), caseName('TodoRulesMatrix', '0003')).assertEqual(10);
      expect(dueBucket(items[0], now), caseName('TodoRulesMatrix', '0003')).assertEqual('已逾期');
      expect(dueBucket(items[1], now), caseName('TodoRulesMatrix', '0003')).assertEqual('今天');
      expect(dueBucket(items[2], now), caseName('TodoRulesMatrix', '0003')).assertEqual('本周');
      expect(scoreOf(items[0], now), caseName('TodoRulesMatrix', '0003')).assertEqual(195);
      expect(scoreOf(items[1], now), caseName('TodoRulesMatrix', '0003')).assertEqual(110);
      expect(scoreOf(items[2], now), caseName('TodoRulesMatrix', '0003')).assertEqual(15);
      const sorted: TodoItem[] = sortTodos(items, now);
      expect(sorted[0].id, caseName('TodoRulesMatrix', '0003')).assertEqual('a');
      expect(sorted[1].id, caseName('TodoRulesMatrix', '0003')).assertEqual('b');
      expect(sorted[2].id, caseName('TodoRulesMatrix', '0003')).assertEqual('c');
      const done: TodoItem = new TodoItem('z', '已完成', 3);
      done.state = TodoState.DONE;
      expect(scoreOf(done, now), caseName('TodoRulesMatrix', '0003')).assertEqual(0);
      expect(sorted[0].text().indexOf('进行中') > 0, caseName('TodoRulesMatrix', '0003')).assertTrue();
      expect(openTodos(sorted).length, caseName('TodoRulesMatrix', '0003')).assertEqual(3);
      expect(new TodoItem('n', '无截止', 1).dueAt, caseName('TodoRulesMatrix', '0003')).assertEqual(0);
      expect(dueBucket(new TodoItem('n', '无截止', 1), now), caseName('TodoRulesMatrix', '0003')).assertEqual('无截止');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIX_0400
     * @tc.name      testTodoRulesMatrix0004
     * @tc.desc      Verify summary covers buckets and states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrix', '0004'), 0, (): void => {
      const now: number = 1700000000000;
      const lines: string[] = summarizeTodos(sampleTodos(now), now);
      expect(lines.length, caseName('TodoRulesMatrix', '0004')).assertEqual(12);
      expect(lines[0].indexOf('未结束 3 条') > 0, caseName('TodoRulesMatrix', '0004')).assertTrue();
      expect(lines[1], caseName('TodoRulesMatrix', '0004')).assertEqual('已逾期：1 条');
      expect(lines[2], caseName('TodoRulesMatrix', '0004')).assertEqual('今天：1 条');
      expect(lines[3], caseName('TodoRulesMatrix', '0004')).assertEqual('明天：0 条');
      expect(lines[4], caseName('TodoRulesMatrix', '0004')).assertEqual('本周：1 条');
      expect(lines[5], caseName('TodoRulesMatrix', '0004')).assertEqual('以后：0 条');
      expect(lines[6], caseName('TodoRulesMatrix', '0004')).assertEqual('无截止：0 条');
      expect(lines[7], caseName('TodoRulesMatrix', '0004')).assertEqual('待处理：1 条');
      expect(lines[8], caseName('TodoRulesMatrix', '0004')).assertEqual('进行中：1 条');
      expect(lines[9], caseName('TodoRulesMatrix', '0004')).assertEqual('已推迟：1 条');
      expect(summarizeTodos([], now).length, caseName('TodoRulesMatrix', '0004')).assertEqual(12);
    });
  });

  describe('SearchIndexMatrix', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXMATRIX_0100
     * @tc.name      testSearchIndexMatrix0001
     * @tc.desc      Verify tokenize handles latin and cjk
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchIndexMatrix', '0001'), 0, (): void => {
      expect(tokenize('便签 note').length, caseName('SearchIndexMatrix', '0001')).assertEqual(3);
      expect(tokenize('便签 note')[0], caseName('SearchIndexMatrix', '0001')).assertEqual('便');
      expect(tokenize('便签 note')[2], caseName('SearchIndexMatrix', '0001')).assertEqual('note');
      expect(tokenize('').length, caseName('SearchIndexMatrix', '0001')).assertEqual(0);
      expect(tokenize('，。！').length, caseName('SearchIndexMatrix', '0001')).assertEqual(0);
      expect(tokenize('Hello World').length, caseName('SearchIndexMatrix', '0001')).assertEqual(2);
      expect(tokenize('Hello World')[0], caseName('SearchIndexMatrix', '0001')).assertEqual('hello');
      expect(uniqueTokens('便签便签').length, caseName('SearchIndexMatrix', '0001')).assertEqual(2);
      expect(countOccurrences('xxz', 'x'), caseName('SearchIndexMatrix', '0001')).assertEqual(2);
      expect(countOccurrences('xxz', ''), caseName('SearchIndexMatrix', '0001')).assertEqual(0);
      expect(countOccurrences('xxz', 'y'), caseName('SearchIndexMatrix', '0001')).assertEqual(0);
      expect(tokenSummary(''), caseName('SearchIndexMatrix', '0001')).assertEqual('没有可检索的词');
      expect(tokenSummary('便签 note').indexOf('3 个词') === 0, caseName('SearchIndexMatrix', '0001')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXMATRIX_0200
     * @tc.name      testSearchIndexMatrix0002
     * @tc.desc      Verify score and snippet
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchIndexMatrix', '0002'), 0, (): void => {
      const doc: SearchDoc = noteDoc();
      const tokens: string[] = uniqueTokens('便签 note');
      expect(TITLE_WEIGHT, caseName('SearchIndexMatrix', '0002')).assertEqual(5);
      expect(BODY_WEIGHT, caseName('SearchIndexMatrix', '0002')).assertEqual(1);
      expect(TAG_WEIGHT, caseName('SearchIndexMatrix', '0002')).assertEqual(3);
      expect(scoreDoc(doc, tokens, 0), caseName('SearchIndexMatrix', '0002')).assertEqual(21);
      expect(scoreDoc(doc, [], 0), caseName('SearchIndexMatrix', '0002')).assertEqual(0);
      expect(scoreDoc(doc, uniqueTokens('不存在'), 0), caseName('SearchIndexMatrix', '0002')).assertEqual(0);
      expect(scoreDoc(doc, tokens, 1700000000000 + 1000), caseName('SearchIndexMatrix', '0002')).assertEqual(25);
      expect(snippetOf('便签', ['便']), caseName('SearchIndexMatrix', '0002')).assertEqual('便签');
      expect(snippetOf('', ['便']), caseName('SearchIndexMatrix', '0002')).assertEqual('');
      const long: string = '开头内容'.concat('填充'.repeat(40)).concat('便签在末尾');
      const snippet: string = snippetOf(long, ['便'], 20);
      expect(snippet.length <= 22, caseName('SearchIndexMatrix', '0002')).assertTrue();
      expect(snippet.indexOf('便') > 0, caseName('SearchIndexMatrix', '0002')).assertTrue();
      expect(doc.text().indexOf('便签示例') === 0, caseName('SearchIndexMatrix', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXMATRIX_0300
     * @tc.name      testSearchIndexMatrix0003
     * @tc.desc      Verify search ranks and limits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchIndexMatrix', '0003'), 0, (): void => {
      const docs: SearchDoc[] = allDocs();
      const hits = search(docs, '便签 note', 0, 5);
      expect(hits.length, caseName('SearchIndexMatrix', '0003')).assertEqual(1);
      expect(hits[0].id, caseName('SearchIndexMatrix', '0003')).assertEqual('demo-note');
      expect(hits[0].score, caseName('SearchIndexMatrix', '0003')).assertEqual(21);
      expect(hits[0].text().indexOf('便签示例') === 0, caseName('SearchIndexMatrix', '0003')).assertTrue();
      expect(search(docs, '', 0, 5).length, caseName('SearchIndexMatrix', '0003')).assertEqual(0);
      expect(search(docs, '   ', 0, 5).length, caseName('SearchIndexMatrix', '0003')).assertEqual(0);
      expect(search(docs, '不存在', 0, 5).length, caseName('SearchIndexMatrix', '0003')).assertEqual(0);
      expect(search(docs, 'todo', 0, 5).length, caseName('SearchIndexMatrix', '0003')).assertEqual(1);
      expect(search(docs, '便签 note', 0, 0).length, caseName('SearchIndexMatrix', '0003')).assertEqual(1);
      const both = search(docs, '便签 todo', 0, 5);
      expect(both.length, caseName('SearchIndexMatrix', '0003')).assertEqual(2);
      expect(both[0].score >= both[1].score, caseName('SearchIndexMatrix', '0003')).assertTrue();
      const reversed = search(docs.slice().reverse(), '便签 todo', 0, 5);
      expect(reversed.length, caseName('SearchIndexMatrix', '0003')).assertEqual(2);
      expect(reversed[0].score >= reversed[1].score, caseName('SearchIndexMatrix', '0003')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHINDEXMATRIX_0400
     * @tc.name      testSearchIndexMatrix0004
     * @tc.desc      Verify highlight and audit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchIndexMatrix', '0004'), 0, (): void => {
      const marked: string = highlight('便签 note 检索', uniqueTokens('便签 note'));
      expect(marked.indexOf('[便]') === 0, caseName('SearchIndexMatrix', '0004')).assertTrue();
      expect(marked.indexOf('[note]') > 0, caseName('SearchIndexMatrix', '0004')).assertTrue();
      expect(highlight('', ['便']), caseName('SearchIndexMatrix', '0004')).assertEqual('');
      expect(highlight('文本', []), caseName('SearchIndexMatrix', '0004')).assertEqual('文本');
      const docs: SearchDoc[] = allDocs();
      const audit = auditDocs(docs);
      expect(audit.ok, caseName('SearchIndexMatrix', '0004')).assertTrue();
      expect(audit.summary(), caseName('SearchIndexMatrix', '0004')).assertEqual('检索数据自洽');
      const broken: SearchDoc[] = allDocs();
      broken.push(new SearchDoc('demo-note', '', ''));
      const brokenAudit = auditDocs(broken);
      expect(brokenAudit.ok, caseName('SearchIndexMatrix', '0004')).assertFalse();
      expect(brokenAudit.findings.length, caseName('SearchIndexMatrix', '0004')).assertEqual(2);
      const longTitle: SearchDoc[] = allDocs();
      longTitle.push(new SearchDoc('long', 'a'.repeat(80), 'x'));
      expect(auditDocs(longTitle).findings.length, caseName('SearchIndexMatrix', '0004')).assertEqual(1);
    });
  });
}
