import { describe, expect, it } from '@ohos/hypium';
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

    it('testEntryRouteCases0001', 0, (): void => {
      const entry = requireEntry('sc.note.new');
      expect(entry?.page).assertEqual(RoutePage.NOTE);
      expect(pageOf('sc.note.new')).assertEqual(RoutePage.NOTE);
      expect(entry?.params.length).assertEqual(2);
      expect(entry?.requiresLogin).assertFalse();
      expect(routesOfPage(RoutePage.NOTE).indexOf('sc.note.new') >= 0).assertTrue();
      expect(entry?.description.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0200
     * @tc.name      testEntryRouteCases0002
     * @tc.desc      Verify todo today route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteCases0002', 0, (): void => {
      const entry = requireEntry('sc.todo.today');
      expect(entry?.page).assertEqual(RoutePage.TODO);
      expect(entry?.params.length).assertEqual(2);
      expect(entry?.paramOf('date')?.fallback).assertEqual('today');
      expect(entry?.paramOf('filter')?.fallback).assertEqual('all');
      expect(entry?.requiresLogin).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0300
     * @tc.name      testEntryRouteCases0003
     * @tc.desc      Verify collection route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteCases0003', 0, (): void => {
      const entry = routeOf('sc.collection.saved');
      expect(entry?.page).assertEqual(RoutePage.COLLECTION);
      expect(entry?.paramOf('sort')?.fallback).assertEqual('recent');
      expect(entry?.maxAgeMs).assertEqual(0);
      expect(routesOfPage(RoutePage.COLLECTION)[0]).assertEqual('sc.collection.saved');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0400
     * @tc.name      testEntryRouteCases0004
     * @tc.desc      Verify detail route requires login
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteCases0004', 0, (): void => {
      const entry = routeOf('sc.detail');
      expect(entry?.page).assertEqual(RoutePage.DETAIL);
      expect(entry?.requiresLogin).assertTrue();
      expect(entry?.paramOf('noteId')?.required).assertTrue();
      const blocked = resolveRoute(new RouteRequest('sc.detail', 0));
      expect(blocked.ok).assertFalse();
      expect(routesOfPage(RoutePage.DETAIL).length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0500
     * @tc.name      testEntryRouteCases0005
     * @tc.desc      Verify activity route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteCases0005', 0, (): void => {
      const entry = routeOf('sc.activity');
      expect(entry?.page).assertEqual(RoutePage.ACTIVITY);
      expect(entry?.paramOf('range')?.fallback).assertEqual('week');
      expect(routesOfPage(RoutePage.ACTIVITY).length).assertEqual(1);
      expect(pageOf('sc.activity')).assertEqual(RoutePage.ACTIVITY);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0600
     * @tc.name      testEntryRouteCases0006
     * @tc.desc      Verify rule center route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteCases0006', 0, (): void => {
      const entry = requireEntry('sc.rule.center');
      expect(entry?.page).assertEqual(RoutePage.RULE_CENTER);
      expect(entry?.params.length).assertEqual(0);
      expect(entry?.requiresLogin).assertFalse();
      expect(routesOfPage(RoutePage.RULE_CENTER).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0700
     * @tc.name      testEntryRouteCases0007
     * @tc.desc      Verify resume route expires
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteCases0007', 0, (): void => {
      const entry = routeOf('sc.note.resume');
      expect(entry?.page).assertEqual(RoutePage.NOTE);
      expect(entry?.maxAgeMs).assertEqual(600000);
      expect(entry?.paramOf('draftId')?.required).assertTrue();
      const fresh: RouteRequest = new RouteRequest('sc.note.resume', Date.now());
      fresh.put('draftId', 'draft-1');
      const resolved = resolveRoute(fresh);
      expect(resolved.ok).assertTrue();
      expect(resolved.expired).assertFalse();
      expect(resolved.get('draftId')).assertEqual('draft-1');
      const stale: RouteRequest = new RouteRequest('sc.note.resume', 1000);
      stale.put('draftId', 'draft-1');
      expect(resolveRoute(stale).expired).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0800
     * @tc.name      testEntryRouteCases0008
     * @tc.desc      Verify todo detail route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteCases0008', 0, (): void => {
      const entry = routeOf('sc.todo.detail');
      expect(entry?.page).assertEqual(RoutePage.DETAIL);
      expect(entry?.maxAgeMs).assertEqual(1800000);
      expect(entry?.paramOf('from')?.fallback).assertEqual('shortcut');
      expect(entry?.requiresLogin).assertTrue();
      const request: RouteRequest = new RouteRequest('sc.todo.detail', Date.now());
      request.loggedIn = true;
      request.put('todoId', 'todo-9');
      request.put('from', 'todoPage');
      const resolved = resolveRoute(request);
      expect(resolved.ok).assertTrue();
      expect(resolved.get('from')).assertEqual('todoPage');
      expect(resolved.keys.length).assertEqual(2);
      expect(resolved.page).assertEqual(RoutePage.DETAIL);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTECASES_0900
     * @tc.name      testEntryRouteCases0009
     * @tc.desc      Verify table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testEntryRouteCases0009', 0, (): void => {
      expect(ROUTE_TABLE.length).assertEqual(8);
      expect(routeIds().length).assertEqual(8);
      expect(auditRoutes().ok).assertTrue();
      expect(auditRoutes().summary()).assertEqual('路由表自洽');
      expect(pageOf('sc.missing')).assertEqual(RoutePage.HOME);
      ROUTE_TABLE.forEach((entry): void => {
        expect(routesOfPage(entry.page).indexOf(entry.routeId) >= 0).assertTrue();
        expect(entry.text().indexOf(entry.routeId) === 0).assertTrue();
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

    it('testTodoTransitionCases0001', 0, (): void => {
      const events: TodoEvent[] = todoEventsOf(TodoState.OPEN);
      expect(events.length).assertEqual(5);
      expect(events.indexOf(TodoEvent.START) >= 0).assertTrue();
      expect(events.indexOf(TodoEvent.FINISH) >= 0).assertTrue();
      expect(events.indexOf(TodoEvent.DROP) >= 0).assertTrue();
      expect(events.indexOf(TodoEvent.DEFER) >= 0).assertTrue();
      expect(events.indexOf(TodoEvent.EXPIRE) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0200
     * @tc.name      testTodoTransitionCases0002
     * @tc.desc      Verify doing state transitions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoTransitionCases0002', 0, (): void => {
      expect(todoEventsOf(TodoState.DOING).length).assertEqual(4);
      expect(nextTodoState(TodoState.DOING, TodoEvent.FINISH).to).assertEqual(TodoState.DONE);
      expect(nextTodoState(TodoState.DOING, TodoEvent.DROP).to).assertEqual(TodoState.DROPPED);
      expect(nextTodoState(TodoState.DOING, TodoEvent.DEFER).to).assertEqual(TodoState.DEFERRED);
      expect(nextTodoState(TodoState.DOING, TodoEvent.EXPIRE).to).assertEqual(TodoState.DROPPED);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0300
     * @tc.name      testTodoTransitionCases0003
     * @tc.desc      Verify deferred state transitions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoTransitionCases0003', 0, (): void => {
      expect(todoEventsOf(TodoState.DEFERRED).length).assertEqual(3);
      expect(nextTodoState(TodoState.DEFERRED, TodoEvent.REOPEN).to).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DEFERRED, TodoEvent.START).to).assertEqual(TodoState.DOING);
      expect(nextTodoState(TodoState.DEFERRED, TodoEvent.EXPIRE).to).assertEqual(TodoState.DROPPED);
      expect(todoStateLabel(TodoState.DEFERRED)).assertEqual('已推迟');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0400
     * @tc.name      testTodoTransitionCases0004
     * @tc.desc      Verify closed states only reopen
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoTransitionCases0004', 0, (): void => {
      expect(todoEventsOf(TodoState.DONE).length).assertEqual(1);
      expect(todoEventsOf(TodoState.DROPPED).length).assertEqual(1);
      expect(nextTodoState(TodoState.DONE, TodoEvent.REOPEN).to).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DROPPED, TodoEvent.REOPEN).to).assertEqual(TodoState.OPEN);
      expect(nextTodoState(TodoState.DONE, TodoEvent.START).applied).assertFalse();
      expect(nextTodoState(TodoState.DROPPED, TodoEvent.FINISH).applied).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0500
     * @tc.name      testTodoTransitionCases0005
     * @tc.desc      Verify every rule is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoTransitionCases0005', 0, (): void => {
      expect(TODO_TRANSITIONS.length).assertEqual(14);
      expect(auditTodoRules().ok).assertTrue();
      TODO_TRANSITIONS.forEach((rule): void => {
        const result = nextTodoState(rule.from, rule.event);
        expect(result.applied).assertTrue();
        expect(result.to).assertEqual(rule.to);
        expect(result.rule !== undefined).assertTrue();
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

    it('testTodoTransitionCases0006', 0, (): void => {
      expect(priorityWeight(3)).assertEqual(100);
      expect(priorityWeight(2)).assertEqual(70);
      expect(priorityWeight(1)).assertEqual(40);
      expect(priorityWeight(0)).assertEqual(10);
      const high: TodoItem = new TodoItem('h', '高优先', 3);
      const low: TodoItem = new TodoItem('l', '低优先', 0);
      expect(scoreOf(high, NOW) > scoreOf(low, NOW)).assertTrue();
      expect(sortTodos([low, high], NOW)[0].id).assertEqual('h');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODOTRANSITIONCASES_0700
     * @tc.name      testTodoTransitionCases0007
     * @tc.desc      Verify due buckets cover ranges
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoTransitionCases0007', 0, (): void => {
      const build = (offset: number): TodoItem => {
        const item: TodoItem = new TodoItem('x', '任务', 1);
        item.dueAt = offset === 0 ? 0 : NOW + offset;
        return item;
      };
      expect(dueBucket(build(-1000), NOW)).assertEqual('已逾期');
      expect(dueBucket(build(1000), NOW)).assertEqual('今天');
      expect(dueBucket(build(DAY + 1), NOW)).assertEqual('明天');
      expect(dueBucket(build(3 * DAY), NOW)).assertEqual('本周');
      expect(dueBucket(build(30 * DAY), NOW)).assertEqual('以后');
      expect(dueBucket(build(0), NOW)).assertEqual('无截止');
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

    it('testSearchEngineCases0001', 0, (): void => {
      expect(tokenize('便签 note').length).assertEqual(3);
      expect(tokenize('ABC def')[0]).assertEqual('abc');
      expect(tokenize('，。、').length).assertEqual(0);
      expect(uniqueTokens('便签便签').length).assertEqual(2);
      expect(countOccurrences('todo TODO todo', 'todo')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0200
     * @tc.name      testSearchEngineCases0002
     * @tc.desc      Verify title outranks body
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchEngineCases0002', 0, (): void => {
      const titleDoc: SearchDoc = doc('t1', '便签', '无关内容', []);
      const bodyDoc: SearchDoc = doc('t2', '无关标题', '便签', []);
      const tokens: string[] = uniqueTokens('便签');
      expect(scoreDoc(titleDoc, tokens, NOW) > scoreDoc(bodyDoc, tokens, NOW)).assertTrue();
      expect(scoreDoc(titleDoc, [], NOW)).assertEqual(0);
      expect(auditDocs([titleDoc, bodyDoc]).ok).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0300
     * @tc.name      testSearchEngineCases0003
     * @tc.desc      Verify ranked search order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchEngineCases0003', 0, (): void => {
      const docs: SearchDoc[] = corpus();
      const hits = search(docs, '便签', NOW, 10);
      expect(hits.length).assertEqual(2);
      expect(hits[0].id).assertEqual('n1');
      expect(hits[0].score > hits[1].score).assertTrue();
      expect(search(docs, '不存在', NOW, 10).length).assertEqual(0);
      expect(search(docs, '', NOW, 10).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0400
     * @tc.name      testSearchEngineCases0004
     * @tc.desc      Verify limit is respected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchEngineCases0004', 0, (): void => {
      const docs: SearchDoc[] = corpus();
      expect(search(docs, '便签', NOW, 1).length).assertEqual(1);
      expect(search(docs, '便签', NOW, 2).length).assertEqual(2);
      expect(search(docs, '便签', NOW, 0).length).assertEqual(2);
      expect(auditDocs(docs).ok).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0500
     * @tc.name      testSearchEngineCases0005
     * @tc.desc      Verify snippet and highlight
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchEngineCases0005', 0, (): void => {
      expect(snippetOf('便签', ['便'])).assertEqual('便签');
      expect(snippetOf('', ['便'])).assertEqual('');
      const marked: string = highlight('便签 note', uniqueTokens('便签'));
      expect(marked.indexOf('[便]') === 0).assertTrue();
      expect(highlight('', ['便'])).assertEqual('');
      expect(highlight('文本', [])).assertEqual('文本');
    });

    /**
     * @tc.number    SUB_SHORTCUT_SEARCHENGINECASES_0600
     * @tc.name      testSearchEngineCases0006
     * @tc.desc      Verify broken docs are reported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testSearchEngineCases0006', 0, (): void => {
      const broken: SearchDoc[] = corpus();
      broken.push(new SearchDoc('', '', ''));
      const audit = auditDocs(broken);
      expect(audit.ok).assertFalse();
      expect(audit.findings.length).assertEqual(2);
      expect(audit.summary().indexOf('；') > 0).assertTrue();
    });
  });
}
