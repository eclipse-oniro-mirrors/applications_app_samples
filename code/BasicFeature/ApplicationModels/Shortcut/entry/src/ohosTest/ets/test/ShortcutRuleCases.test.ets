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
  ROUTE_TABLE, RouteEntry, RoutePage, RouteRequest, auditRoutes, pageOf, resolveRoute, routeIds,
  routeOf, routesOfPage
} from '../../../main/ets/business/EntryRoute';
import {
  TODO_TRANSITIONS, TodoEvent, TodoItem, TodoState, auditTodoRules, dueBucket, nextTodoState,
  priorityWeight, scoreOf, sortTodos, todoEventsOf, todoStateLabel
} from '../../../main/ets/business/TodoRules';
import {
  SearchDoc, auditDocs, countOccurrences, highlight, scoreDoc, search, snippetOf, tokenize,
  uniqueTokens
} from '../../../main/ets/business/SearchIndex';

const NOW: number = 1700000000000;
const DAY: number = 86400000;

function requireEntry(routeId: string): RouteEntry {
  const entry: RouteEntry | undefined = routeOf(routeId);
  if (entry === undefined) {
    throw new Error(`missing route ${routeId}`);
  }
  return entry;
}

function doc(id: string, title: string, body: string, tags: string[]): SearchDoc {
  const value: SearchDoc = new SearchDoc(id, title, body);
  value.tags = tags;
  value.updatedAt = NOW;
  return value;
}

function corpus(): SearchDoc[] {
  return [
    doc('n1', '便签一', '便签内容包含待办关键词', ['便签', 'note']),
    doc('n2', '待办清单', '清单里有三条 todo', ['待办', 'todo']),
    doc('n3', '收藏夹', '收藏的便签资料', ['收藏', 'collection'])
  ];
}

export default function shortcutRuleCasesTest(): void {
  describe('EntryRouteCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0100
     * @tc.name      testEntryRouteCases0001
     * @tc.desc      Verify note new route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0001'), 0, (): void => {
      const entry = requireEntry('sc.note.new');
      expect(entry?.page, caseName('EntryRouteCases', '0001')).assertEqual(RoutePage.NOTE);
      expect(pageOf('sc.note.new'), caseName('EntryRouteCases', '0001')).assertEqual(RoutePage.NOTE);
      expect(entry?.params.length, caseName('EntryRouteCases', '0001')).assertEqual(2);
      expect(entry?.requiresLogin, caseName('EntryRouteCases', '0001')).assertFalse();
      expect(routesOfPage(RoutePage.NOTE).indexOf('sc.note.new') >= 0, caseName('EntryRouteCases', '0001')).assertTrue();
      expect(entry?.description.length > 0, caseName('EntryRouteCases', '0001')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0200
     * @tc.name      testEntryRouteCases0002
     * @tc.desc      Verify todo today route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0002'), 0, (): void => {
      const entry = requireEntry('sc.todo.today');
      expect(entry?.page, caseName('EntryRouteCases', '0002')).assertEqual(RoutePage.TODO);
      expect(entry?.params.length, caseName('EntryRouteCases', '0002')).assertEqual(2);
      expect(entry?.paramOf('date')?.fallback, caseName('EntryRouteCases', '0002')).assertEqual('today');
      expect(entry?.paramOf('filter')?.fallback, caseName('EntryRouteCases', '0002')).assertEqual('all');
      expect(entry?.requiresLogin, caseName('EntryRouteCases', '0002')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0300
     * @tc.name      testEntryRouteCases0003
     * @tc.desc      Verify collection route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0003'), 0, (): void => {
      const entry = routeOf('sc.collection.saved');
      expect(entry?.page, caseName('EntryRouteCases', '0003')).assertEqual(RoutePage.COLLECTION);
      expect(entry?.paramOf('sort')?.fallback, caseName('EntryRouteCases', '0003')).assertEqual('recent');
      expect(entry?.maxAgeMs, caseName('EntryRouteCases', '0003')).assertEqual(0);
      expect(routesOfPage(RoutePage.COLLECTION)[0], caseName('EntryRouteCases', '0003')).assertEqual('sc.collection.saved');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0400
     * @tc.name      testEntryRouteCases0004
     * @tc.desc      Verify detail route requires login
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0004'), 0, (): void => {
      const entry = routeOf('sc.detail');
      expect(entry?.page, caseName('EntryRouteCases', '0004')).assertEqual(RoutePage.DETAIL);
      expect(entry?.requiresLogin, caseName('EntryRouteCases', '0004')).assertTrue();
      expect(entry?.paramOf('noteId')?.required, caseName('EntryRouteCases', '0004')).assertTrue();
      const blocked = resolveRoute(new RouteRequest('sc.detail', 0));
      expect(blocked.ok, caseName('EntryRouteCases', '0004')).assertFalse();
      expect(routesOfPage(RoutePage.DETAIL).length, caseName('EntryRouteCases', '0004')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0500
     * @tc.name      testEntryRouteCases0005
     * @tc.desc      Verify call log route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0005'), 0, (): void => {
      const entry = routeOf('sc.calls');
      expect(entry?.page, caseName('EntryRouteCases', '0005')).assertEqual(RoutePage.CALL_LOG);
      expect(entry?.paramOf('range')?.fallback, caseName('EntryRouteCases', '0005')).assertEqual('week');
      expect(routesOfPage(RoutePage.CALL_LOG).length, caseName('EntryRouteCases', '0005')).assertEqual(1);
      expect(pageOf('sc.calls'), caseName('EntryRouteCases', '0005')).assertEqual(RoutePage.CALL_LOG);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0600
     * @tc.name      testEntryRouteCases0006
     * @tc.desc      Verify rule center route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0006'), 0, (): void => {
      const entry = requireEntry('sc.rule.center');
      expect(entry?.page, caseName('EntryRouteCases', '0006')).assertEqual(RoutePage.RULE_CENTER);
      expect(entry?.params.length, caseName('EntryRouteCases', '0006')).assertEqual(0);
      expect(entry?.requiresLogin, caseName('EntryRouteCases', '0006')).assertFalse();
      expect(routesOfPage(RoutePage.RULE_CENTER).length, caseName('EntryRouteCases', '0006')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0700
     * @tc.name      testEntryRouteCases0007
     * @tc.desc      Verify resume route expires
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0007'), 0, (): void => {
      const entry = routeOf('sc.note.resume');
      expect(entry?.page, caseName('EntryRouteCases', '0007')).assertEqual(RoutePage.NOTE);
      expect(entry?.maxAgeMs, caseName('EntryRouteCases', '0007')).assertEqual(600000);
      expect(entry?.paramOf('draftId')?.required, caseName('EntryRouteCases', '0007')).assertTrue();
      const fresh: RouteRequest = new RouteRequest('sc.note.resume', Date.now());
      fresh.put('draftId', 'draft-1');
      const resolved = resolveRoute(fresh);
      expect(resolved.ok, caseName('EntryRouteCases', '0007')).assertTrue();
      expect(resolved.expired, caseName('EntryRouteCases', '0007')).assertFalse();
      expect(resolved.get('draftId'), caseName('EntryRouteCases', '0007')).assertEqual('draft-1');
      const stale: RouteRequest = new RouteRequest('sc.note.resume', 1000);
      stale.put('draftId', 'draft-1');
      expect(resolveRoute(stale).expired, caseName('EntryRouteCases', '0007')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0800
     * @tc.name      testEntryRouteCases0008
     * @tc.desc      Verify todo detail route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteCases', '0008'), 0, (): void => {
      const entry = routeOf('sc.todo.detail');
      expect(entry?.page, caseName('EntryRouteCases', '0008')).assertEqual(RoutePage.DETAIL);
      expect(entry?.maxAgeMs, caseName('EntryRouteCases', '0008')).assertEqual(1800000);
      expect(entry?.paramOf('from')?.fallback, caseName('EntryRouteCases', '0008')).assertEqual('shortcut');
      expect(entry?.requiresLogin, caseName('EntryRouteCases', '0008')).assertTrue();
      const request: RouteRequest = new RouteRequest('sc.todo.detail', Date.now());
      request.loggedIn = true;
      request.put('todoId', 'todo-9');
      request.put('from', 'todoPage');
      const resolved = resolveRoute(request);
      expect(resolved.ok, caseName('EntryRouteCases', '0008')).assertTrue();
      expect(resolved.get('from'), caseName('EntryRouteCases', '0008')).assertEqual('todoPage');
      expect(resolved.keys.length, caseName('EntryRouteCases', '0008')).assertEqual(2);
      expect(resolved.page, caseName('EntryRouteCases', '0008')).assertEqual(RoutePage.DETAIL);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0900
     * @tc.name      testEntryRouteCases0009
     * @tc.desc      Verify table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('EntryRouteCases', '0009'), 0, (): void => {
      expect(ROUTE_TABLE.length, caseName('EntryRouteCases', '0009')).assertEqual(8);
      expect(routeIds().length, caseName('EntryRouteCases', '0009')).assertEqual(8);
      expect(auditRoutes().ok, caseName('EntryRouteCases', '0009')).assertTrue();
      expect(auditRoutes().summary(), caseName('EntryRouteCases', '0009')).assertEqual('路由表自洽');
      expect(pageOf('sc.missing'), caseName('EntryRouteCases', '0009')).assertEqual(RoutePage.HOME);
      ROUTE_TABLE.forEach((entry): void => {
        expect(routesOfPage(entry.page).indexOf(entry.routeId) >= 0, caseName('EntryRouteCases', '0009')).assertTrue();
        expect(entry.text().indexOf(entry.routeId) === 0, caseName('EntryRouteCases', '0009')).assertTrue();
      });
    });
  });

  describe('TodoTransitionCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0100
     * @tc.name      testTodoTransitionCases0001
     * @tc.desc      Verify open state has five exits
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoTransitionCases', '0001'), 0, (): void => {
      const events: TodoEvent[] = todoEventsOf(TodoState.OPEN);
      expect(events.length, caseName('TodoTransitionCases', '0001')).assertEqual(5);
      expect(events.indexOf(TodoEvent.START) >= 0, caseName('TodoTransitionCases', '0001')).assertTrue();
      expect(events.indexOf(TodoEvent.FINISH) >= 0, caseName('TodoTransitionCases', '0001')).assertTrue();
      expect(events.indexOf(TodoEvent.DROP) >= 0, caseName('TodoTransitionCases', '0001')).assertTrue();
      expect(events.indexOf(TodoEvent.DEFER) >= 0, caseName('TodoTransitionCases', '0001')).assertTrue();
      expect(events.indexOf(TodoEvent.EXPIRE) >= 0, caseName('TodoTransitionCases', '0001')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0200
     * @tc.name      testTodoTransitionCases0002
     * @tc.desc      Verify doing state transitions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoTransitionCases', '0002'), 0, (): void => {
      expect(todoEventsOf(TodoState.DOING).length, caseName('TodoTransitionCases', '0002')).assertEqual(4);
      expect(nextTodoState(TodoState.DOING, TodoEvent.FINISH).to, caseName('TodoTransitionCases', '0002')).assertEqual(TodoState.DONE);
      expect(nextTodoState(TodoState.DOING, TodoEvent.DROP).to, caseName('TodoTransitionCases', '0002')).assertEqual(TodoState.DROPPED);
      expect(nextTodoState(TodoState.DOING, TodoEvent.DEFER).to, caseName('TodoTransitionCases', '0002')).assertEqual(TodoState.DEFERRED);
      expect(nextTodoState(TodoState.DOING, TodoEvent.EXPIRE).to, caseName('TodoTransitionCases', '0002')).assertEqual(TodoState.DROPPED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0300
     * @tc.name      testTodoTransitionCases0003
     * @tc.desc      Verify deferred state transitions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoTransitionCases', '0003'), 0, (): void => {
      expect(todoEventsOf(TodoState.DEFERRED).length, caseName('TodoTransitionCases', '0003')).assertEqual(3);
      expect(nextTodoState(TodoState.DEFERRED, TodoEvent.REOPEN).to, caseName('TodoTransitionCases', '0003')).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DEFERRED, TodoEvent.START).to, caseName('TodoTransitionCases', '0003')).assertEqual(TodoState.DOING);
      expect(nextTodoState(TodoState.DEFERRED, TodoEvent.EXPIRE).to, caseName('TodoTransitionCases', '0003')).assertEqual(TodoState.DROPPED);
      expect(todoStateLabel(TodoState.DEFERRED), caseName('TodoTransitionCases', '0003')).assertEqual('已推迟');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0400
     * @tc.name      testTodoTransitionCases0004
     * @tc.desc      Verify closed states only reopen
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoTransitionCases', '0004'), 0, (): void => {
      expect(todoEventsOf(TodoState.DONE).length, caseName('TodoTransitionCases', '0004')).assertEqual(1);
      expect(todoEventsOf(TodoState.DROPPED).length, caseName('TodoTransitionCases', '0004')).assertEqual(1);
      expect(nextTodoState(TodoState.DONE, TodoEvent.REOPEN).to, caseName('TodoTransitionCases', '0004')).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DROPPED, TodoEvent.REOPEN).to, caseName('TodoTransitionCases', '0004')).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DONE, TodoEvent.START).applied, caseName('TodoTransitionCases', '0004')).assertFalse();
      expect(nextTodoState(TodoState.DROPPED, TodoEvent.FINISH).applied, caseName('TodoTransitionCases', '0004')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0500
     * @tc.name      testTodoTransitionCases0005
     * @tc.desc      Verify every rule is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoTransitionCases', '0005'), 0, (): void => {
      expect(TODO_TRANSITIONS.length, caseName('TodoTransitionCases', '0005')).assertEqual(14);
      expect(auditTodoRules().ok, caseName('TodoTransitionCases', '0005')).assertTrue();
      TODO_TRANSITIONS.forEach((rule): void => {
        const result = nextTodoState(rule.from, rule.event);
        expect(result.applied, caseName('TodoTransitionCases', '0005')).assertTrue();
        expect(result.to, caseName('TodoTransitionCases', '0005')).assertEqual(rule.to);
        expect(result.rule !== undefined, caseName('TodoTransitionCases', '0005')).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0600
     * @tc.name      testTodoTransitionCases0006
     * @tc.desc      Verify score weights are ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoTransitionCases', '0006'), 0, (): void => {
      expect(priorityWeight(3), caseName('TodoTransitionCases', '0006')).assertEqual(100);
      expect(priorityWeight(2), caseName('TodoTransitionCases', '0006')).assertEqual(70);
      expect(priorityWeight(1), caseName('TodoTransitionCases', '0006')).assertEqual(40);
      expect(priorityWeight(0), caseName('TodoTransitionCases', '0006')).assertEqual(10);
      const high: TodoItem = new TodoItem('h', '高优先', 3);
      const low: TodoItem = new TodoItem('l', '低优先', 0);
      expect(scoreOf(high, NOW) > scoreOf(low, NOW), caseName('TodoTransitionCases', '0006')).assertTrue();
      expect(sortTodos([low, high], NOW)[0].id, caseName('TodoTransitionCases', '0006')).assertEqual('h');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0700
     * @tc.name      testTodoTransitionCases0007
     * @tc.desc      Verify due buckets cover ranges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoTransitionCases', '0007'), 0, (): void => {
      const build = (offset: number): TodoItem => {
        const item: TodoItem = new TodoItem('x', '任务', 1);
        item.dueAt = offset === 0 ? 0 : NOW + offset;
        return item;
      };
      expect(dueBucket(build(-1000), NOW), caseName('TodoTransitionCases', '0007')).assertEqual('已逾期');
      expect(dueBucket(build(1000), NOW), caseName('TodoTransitionCases', '0007')).assertEqual('今天');
      expect(dueBucket(build(DAY + 1), NOW), caseName('TodoTransitionCases', '0007')).assertEqual('明天');
      expect(dueBucket(build(3 * DAY), NOW), caseName('TodoTransitionCases', '0007')).assertEqual('本周');
      expect(dueBucket(build(30 * DAY), NOW), caseName('TodoTransitionCases', '0007')).assertEqual('以后');
      expect(dueBucket(build(0), NOW), caseName('TodoTransitionCases', '0007')).assertEqual('无截止');
    });
  });

  describe('SearchEngineCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0100
     * @tc.name      testSearchEngineCases0001
     * @tc.desc      Verify tokenizer splits latin and cjk
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchEngineCases', '0001'), 0, (): void => {
      expect(tokenize('便签 note').length, caseName('SearchEngineCases', '0001')).assertEqual(3);
      expect(tokenize('ABC def')[0], caseName('SearchEngineCases', '0001')).assertEqual('abc');
      expect(tokenize('，。、').length, caseName('SearchEngineCases', '0001')).assertEqual(0);
      expect(uniqueTokens('便签便签').length, caseName('SearchEngineCases', '0001')).assertEqual(2);
      expect(countOccurrences('todo TODO todo', 'todo'), caseName('SearchEngineCases', '0001')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0200
     * @tc.name      testSearchEngineCases0002
     * @tc.desc      Verify title outranks body
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchEngineCases', '0002'), 0, (): void => {
      const titleDoc: SearchDoc = doc('t1', '便签', '无关内容', []);
      const bodyDoc: SearchDoc = doc('t2', '无关标题', '便签', []);
      const tokens: string[] = uniqueTokens('便签');
      expect(scoreDoc(titleDoc, tokens, NOW) > scoreDoc(bodyDoc, tokens, NOW), caseName('SearchEngineCases', '0002')).assertTrue();
      expect(scoreDoc(titleDoc, [], NOW), caseName('SearchEngineCases', '0002')).assertEqual(0);
      expect(auditDocs([titleDoc, bodyDoc]).ok, caseName('SearchEngineCases', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0300
     * @tc.name      testSearchEngineCases0003
     * @tc.desc      Verify ranked search order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchEngineCases', '0003'), 0, (): void => {
      const docs: SearchDoc[] = corpus();
      const hits = search(docs, '便签', NOW, 10);
      expect(hits.length, caseName('SearchEngineCases', '0003')).assertEqual(2);
      expect(hits[0].id, caseName('SearchEngineCases', '0003')).assertEqual('n1');
      expect(hits[0].score > hits[1].score, caseName('SearchEngineCases', '0003')).assertTrue();
      expect(search(docs, '不存在', NOW, 10).length, caseName('SearchEngineCases', '0003')).assertEqual(0);
      expect(search(docs, '', NOW, 10).length, caseName('SearchEngineCases', '0003')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0400
     * @tc.name      testSearchEngineCases0004
     * @tc.desc      Verify limit is respected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchEngineCases', '0004'), 0, (): void => {
      const docs: SearchDoc[] = corpus();
      expect(search(docs, '便签', NOW, 1).length, caseName('SearchEngineCases', '0004')).assertEqual(1);
      expect(search(docs, '便签', NOW, 2).length, caseName('SearchEngineCases', '0004')).assertEqual(2);
      expect(search(docs, '便签', NOW, 0).length, caseName('SearchEngineCases', '0004')).assertEqual(2);
      expect(auditDocs(docs).ok, caseName('SearchEngineCases', '0004')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0500
     * @tc.name      testSearchEngineCases0005
     * @tc.desc      Verify snippet and highlight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchEngineCases', '0005'), 0, (): void => {
      expect(snippetOf('便签', ['便']), caseName('SearchEngineCases', '0005')).assertEqual('便签');
      expect(snippetOf('', ['便']), caseName('SearchEngineCases', '0005')).assertEqual('');
      const marked: string = highlight('便签 note', uniqueTokens('便签'));
      expect(marked.indexOf('[便]') === 0, caseName('SearchEngineCases', '0005')).assertTrue();
      expect(highlight('', ['便']), caseName('SearchEngineCases', '0005')).assertEqual('');
      expect(highlight('文本', []), caseName('SearchEngineCases', '0005')).assertEqual('文本');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0600
     * @tc.name      testSearchEngineCases0006
     * @tc.desc      Verify broken docs are reported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('SearchEngineCases', '0006'), 0, (): void => {
      const broken: SearchDoc[] = corpus();
      broken.push(new SearchDoc('', '', ''));
      const audit = auditDocs(broken);
      expect(audit.ok, caseName('SearchEngineCases', '0006')).assertFalse();
      expect(audit.findings.length, caseName('SearchEngineCases', '0006')).assertEqual(2);
      expect(audit.summary().indexOf('；') > 0, caseName('SearchEngineCases', '0006')).assertTrue();
    });
  });
}
