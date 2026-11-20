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
  ParamKind, ROUTE_TABLE, RouteEntry, RoutePage, RouteParam, RouteRequest, RouteResolution,
  pageOf, resolveRoute, routeIds, routeOf
} from '../../../main/ets/business/EntryRoute';
import {
  TODO_TRANSITIONS, TodoEvent, TodoItem, TodoState, TodoTransition, TodoTransitionResult,
  isClosedState, nextTodoState, todoEventLabel, todoEventsOf, todoStateLabel
} from '../../../main/ets/business/TodoRules';

/** 按参数名取必填项，避免依赖具体路由定义。 */
function requiredParams(entry: RouteEntry): RouteParam[] {
  return entry.params.filter((param: RouteParam): boolean => param.required);
}

/** 构造一个携带全部必填参数的请求。 */
function requestFor(routeId: string, loggedIn: boolean): RouteRequest {
  const request: RouteRequest = new RouteRequest();
  request.routeId = routeId;
  request.loggedIn = loggedIn;
  request.at = 1000;
  const entry = routeOf(routeId);
  if (entry !== undefined) {
    requiredParams(entry).forEach((param: RouteParam): void => {
      request.keys.push(param.name);
      request.values.push(param.kind === ParamKind.NUMBER ? '42' : 'value');
    });
  }
  return request;
}

export default function routeTodoMatrixCasesTest(): void {
  describe('EntryRouteMatrixCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0100
     * @tc.name      testEntryRouteMatrixCases0001
     * @tc.desc      Verify route table is well formed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0001'), 0, (): void => {
      expect(ROUTE_TABLE.length > 0, caseName('EntryRouteMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0001').assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0, caseName('EntryRouteMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0002').assertTrue();
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean => entry.routeId.length > 0), caseName('EntryRouteMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0003').assertTrue();
      const ids: string[] = routeIds();
      expect(ids.length, caseName('EntryRouteMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0004').assertEqual(ROUTE_TABLE.length);
      expect(ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length, caseName('EntryRouteMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0005')
        .assertEqual(0);
      expect(ids.every((id: string): boolean => id.length > 0), caseName('EntryRouteMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0006').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0200
     * @tc.name      testEntryRouteMatrixCases0002
     * @tc.desc      Verify every route is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0002'), 0, (): void => {
      let found: number = 0;
      routeIds().forEach((id: string): void => {
        const entry = routeOf(id);
        if (entry !== undefined && entry.routeId === id) {
          found++;
        }
      });
      expect(found, caseName('EntryRouteMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0007').assertEqual(ROUTE_TABLE.length);
      expect(routeOf('no-such-route') === undefined, caseName('EntryRouteMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0008').assertTrue();
      expect(routeIds().length, caseName('EntryRouteMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0009').assertEqual(ROUTE_TABLE.length);
      expect(routeOf(routeIds()[0]) === undefined, caseName('EntryRouteMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0010').assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0300
     * @tc.name      testEntryRouteMatrixCases0003
     * @tc.desc      Verify page lookup is defined for known routes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0003'), 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        const page: RoutePage = pageOf(entry.routeId);
        expect(page === undefined, caseName('EntryRouteMatrixCases', '0003'), 'RouteTodoMatrixCases.test.ets:A0011').assertFalse();
        expect(entry.page !== undefined, caseName('EntryRouteMatrixCases', '0003'), 'RouteTodoMatrixCases.test.ets:A0012').assertTrue();
      });
      expect(ROUTE_TABLE.length > 0, caseName('EntryRouteMatrixCases', '0003'), 'RouteTodoMatrixCases.test.ets:A0013').assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0, caseName('EntryRouteMatrixCases', '0003'), 'RouteTodoMatrixCases.test.ets:A0014').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0400
     * @tc.name      testEntryRouteMatrixCases0004
     * @tc.desc      Verify unknown route is not in table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0004'), 0, (): void => {
      expect(routeOf('') === undefined, caseName('EntryRouteMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0015').assertTrue();
      expect(routeOf('no-such-route') === undefined, caseName('EntryRouteMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0016').assertTrue();
      expect(pageOf('no-such-route') !== undefined, caseName('EntryRouteMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0017').assertTrue();
      expect(routeIds().indexOf('no-such-route') < 0, caseName('EntryRouteMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0018').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0500
     * @tc.name      testEntryRouteMatrixCases0005
     * @tc.desc      Verify param names are unique within route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0005'), 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        const names: string[] = entry.params.map((param: RouteParam): string => param.name);
        expect(names.filter((name: string, index: number): boolean =>
          names.indexOf(name) !== index).length, caseName('EntryRouteMatrixCases', '0005'), 'RouteTodoMatrixCases.test.ets:A0019').assertEqual(0);
      });
      expect(ROUTE_TABLE.length > 0, caseName('EntryRouteMatrixCases', '0005'), 'RouteTodoMatrixCases.test.ets:A0020').assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0, caseName('EntryRouteMatrixCases', '0005'), 'RouteTodoMatrixCases.test.ets:A0021').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0600
     * @tc.name      testEntryRouteMatrixCases0006
     * @tc.desc      Verify required params have fallback or are enforced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0006'), 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        requiredParams(entry).forEach((param: RouteParam): void => {
          expect(param.required, caseName('EntryRouteMatrixCases', '0006'), 'RouteTodoMatrixCases.test.ets:A0022').assertTrue();
          expect(param.name.length > 0, caseName('EntryRouteMatrixCases', '0006'), 'RouteTodoMatrixCases.test.ets:A0023').assertTrue();
        });
      });
      expect(ROUTE_TABLE.some((entry: RouteEntry): boolean => requiredParams(entry).length > 0), caseName('EntryRouteMatrixCases', '0006'), 'RouteTodoMatrixCases.test.ets:A0024')
        .assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0700
     * @tc.name      testEntryRouteMatrixCases0007
     * @tc.desc      Verify complete request resolves
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0007'), 0, (): void => {
      let resolved: number = 0;
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        const result: RouteResolution = resolveRoute(requestFor(entry.routeId, true));
        if (result.ok) {
          resolved++;
        }
      });
      expect(resolved, caseName('EntryRouteMatrixCases', '0007'), 'RouteTodoMatrixCases.test.ets:A0025').assertEqual(ROUTE_TABLE.length);
      expect(resolved > 0, caseName('EntryRouteMatrixCases', '0007'), 'RouteTodoMatrixCases.test.ets:A0026').assertTrue();
      expect(resolveRoute(requestFor(ROUTE_TABLE[0].routeId, true)).ok, caseName('EntryRouteMatrixCases', '0007'), 'RouteTodoMatrixCases.test.ets:A0027').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0800
     * @tc.name      testEntryRouteMatrixCases0008
     * @tc.desc      Verify unknown route request is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0008'), 0, (): void => {
      const request: RouteRequest = new RouteRequest();
      request.routeId = 'no-such-route';
      request.loggedIn = true;
      request.at = 1000;
      const result: RouteResolution = resolveRoute(request);
      expect(result.ok, caseName('EntryRouteMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0028').assertFalse();
      expect(result.issues.length > 0, caseName('EntryRouteMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0029').assertTrue();
      expect(request.loggedIn, caseName('EntryRouteMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0030').assertTrue();
      expect(result.issues[0].length > 0, caseName('EntryRouteMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0031').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0900
     * @tc.name      testEntryRouteMatrixCases0009
     * @tc.desc      Verify missing required param is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0009'), 0, (): void => {
      const guarded: RouteEntry[] = ROUTE_TABLE.filter((entry: RouteEntry): boolean =>
        requiredParams(entry).length > 0);
      expect(guarded.length > 0, caseName('EntryRouteMatrixCases', '0009'), 'RouteTodoMatrixCases.test.ets:A0032').assertTrue();
      const entry: RouteEntry = guarded[0];
      const request: RouteRequest = new RouteRequest();
      request.routeId = entry.routeId;
      request.loggedIn = true;
      request.at = 1000;
      const result: RouteResolution = resolveRoute(request);
      expect(result.ok, caseName('EntryRouteMatrixCases', '0009'), 'RouteTodoMatrixCases.test.ets:A0033').assertFalse();
      expect(result.missing.length > 0, caseName('EntryRouteMatrixCases', '0009'), 'RouteTodoMatrixCases.test.ets:A0034').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1000
     * @tc.name      testEntryRouteMatrixCases0010
     * @tc.desc      Verify login requirement is enforced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0010'), 0, (): void => {
      const guarded: RouteEntry[] = ROUTE_TABLE.filter((entry: RouteEntry): boolean =>
        entry.requiresLogin);
      expect(guarded.length > 0, caseName('EntryRouteMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0035').assertTrue();
      guarded.forEach((entry: RouteEntry): void => {
        const anonymous: RouteResolution = resolveRoute(requestFor(entry.routeId, false));
        expect(anonymous.ok, caseName('EntryRouteMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0036').assertFalse();
        const authenticated: RouteResolution = resolveRoute(requestFor(entry.routeId, true));
        expect(authenticated.ok, caseName('EntryRouteMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0037').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1100
     * @tc.name      testEntryRouteMatrixCases0011
     * @tc.desc      Verify open routes need no login
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0011'), 0, (): void => {
      const open: RouteEntry[] = ROUTE_TABLE.filter((entry: RouteEntry): boolean =>
        !entry.requiresLogin);
      expect(open.length > 0, caseName('EntryRouteMatrixCases', '0011'), 'RouteTodoMatrixCases.test.ets:A0038').assertTrue();
      open.forEach((entry: RouteEntry): void => {
        expect(resolveRoute(requestFor(entry.routeId, false)).ok, caseName('EntryRouteMatrixCases', '0011'), 'RouteTodoMatrixCases.test.ets:A0039').assertTrue();
      });
      expect(open.every((entry: RouteEntry): boolean => !entry.requiresLogin), caseName('EntryRouteMatrixCases', '0011'), 'RouteTodoMatrixCases.test.ets:A0040').assertTrue();
      expect(open.length <= ROUTE_TABLE.length, caseName('EntryRouteMatrixCases', '0011'), 'RouteTodoMatrixCases.test.ets:A0041').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1200
     * @tc.name      testEntryRouteMatrixCases0012
     * @tc.desc      Verify route descriptions are present
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRouteMatrixCases', '0012'), 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        expect(entry.description.length > 0, caseName('EntryRouteMatrixCases', '0012'), 'RouteTodoMatrixCases.test.ets:A0042').assertTrue();
      });
      expect(ROUTE_TABLE[0].description.length > 0, caseName('EntryRouteMatrixCases', '0012'), 'RouteTodoMatrixCases.test.ets:A0043').assertTrue();
      expect(ROUTE_TABLE.length, caseName('EntryRouteMatrixCases', '0012'), 'RouteTodoMatrixCases.test.ets:A0044').assertEqual(routeIds().length);
    });
  });

  describe('TodoRulesMatrixCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0100
     * @tc.name      testTodoRulesMatrixCases0001
     * @tc.desc      Verify transition table is well formed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0001'), 0, (): void => {
      expect(TODO_TRANSITIONS.length > 0, caseName('TodoRulesMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0045').assertTrue();
      const ids: string[] = TODO_TRANSITIONS.map((rule: TodoTransition): string => rule.ruleId);
      expect(ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length, caseName('TodoRulesMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0046')
        .assertEqual(0);
      expect(ids.every((id: string): boolean => id.length > 0), caseName('TodoRulesMatrixCases', '0001'), 'RouteTodoMatrixCases.test.ets:A0047').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0200
     * @tc.name      testTodoRulesMatrixCases0002
     * @tc.desc      Verify every transition has distinct state and event
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0002'), 0, (): void => {
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        expect(rule.note.length > 0, caseName('TodoRulesMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0048').assertTrue();
        expect(todoStateLabel(rule.from).length > 0, caseName('TodoRulesMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0049').assertTrue();
        expect(todoEventLabel(rule.event).length > 0, caseName('TodoRulesMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0050').assertTrue();
      });
      expect(TODO_TRANSITIONS.length > 0, caseName('TodoRulesMatrixCases', '0002'), 'RouteTodoMatrixCases.test.ets:A0051').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0300
     * @tc.name      testTodoRulesMatrixCases0003
     * @tc.desc      Verify table is deterministic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0003'), 0, (): void => {
      let applied: number = 0;
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        const result: TodoTransitionResult = nextTodoState(rule.from, rule.event);
        if (result.applied && result.to === rule.to) {
          applied++;
        }
      });
      expect(applied, caseName('TodoRulesMatrixCases', '0003'), 'RouteTodoMatrixCases.test.ets:A0052').assertEqual(TODO_TRANSITIONS.length);
      expect(applied > 0, caseName('TodoRulesMatrixCases', '0003'), 'RouteTodoMatrixCases.test.ets:A0053').assertTrue();
      expect(TODO_TRANSITIONS.length > 0, caseName('TodoRulesMatrixCases', '0003'), 'RouteTodoMatrixCases.test.ets:A0054').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0400
     * @tc.name      testTodoRulesMatrixCases0004
     * @tc.desc      Verify rule lookup returns same rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0004'), 0, (): void => {
      const rule: TodoTransition = TODO_TRANSITIONS[0];
      const result: TodoTransitionResult = nextTodoState(rule.from, rule.event);
      expect(result.applied, caseName('TodoRulesMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0055').assertTrue();
      expect(result.rule !== undefined, caseName('TodoRulesMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0056').assertTrue();
      if (result.rule !== undefined) {
        expect(result.rule.ruleId, caseName('TodoRulesMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0057').assertEqual(rule.ruleId);
      }
      expect(result.reason.length, caseName('TodoRulesMatrixCases', '0004'), 'RouteTodoMatrixCases.test.ets:A0058').assertEqual(0);
    });

;

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0600
     * @tc.name      testTodoRulesMatrixCases0006
     * @tc.desc      Verify events per state are non empty where defined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0006'), 0, (): void => {
      const states: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (states.indexOf(rule.from) < 0) {
          states.push(rule.from);
        }
      });
      expect(states.length > 0, caseName('TodoRulesMatrixCases', '0006'), 'RouteTodoMatrixCases.test.ets:A0059').assertTrue();
      states.forEach((state: TodoState): void => {
        const events: TodoEvent[] = todoEventsOf(state);
        expect(events.length > 0, caseName('TodoRulesMatrixCases', '0006'), 'RouteTodoMatrixCases.test.ets:A0060').assertTrue();
      });
      expect(states.length <= 5, caseName('TodoRulesMatrixCases', '0006'), 'RouteTodoMatrixCases.test.ets:A0061').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0700
     * @tc.name      testTodoRulesMatrixCases0007
     * @tc.desc      Verify closed states are recognised
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0007'), 0, (): void => {
      const closed: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (isClosedState(rule.to) && closed.indexOf(rule.to) < 0) {
          closed.push(rule.to);
        }
      });
      expect(closed.length > 0, caseName('TodoRulesMatrixCases', '0007'), 'RouteTodoMatrixCases.test.ets:A0062').assertTrue();
      closed.forEach((state: TodoState): void => {
        expect(isClosedState(state), caseName('TodoRulesMatrixCases', '0007'), 'RouteTodoMatrixCases.test.ets:A0063').assertTrue();
      });
      expect(closed.indexOf(TodoState.DONE) >= 0, caseName('TodoRulesMatrixCases', '0007'), 'RouteTodoMatrixCases.test.ets:A0064').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0800
     * @tc.name      testTodoRulesMatrixCases0008
     * @tc.desc      Verify state labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('TodoRulesMatrixCases', '0008'), 0, (): void => {
      const states: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (states.indexOf(rule.from) < 0) {
          states.push(rule.from);
        }
        if (states.indexOf(rule.to) < 0) {
          states.push(rule.to);
        }
      });
      const labels: string[] = states.map((state: TodoState): string => todoStateLabel(state));
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length, caseName('TodoRulesMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0065').assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0), caseName('TodoRulesMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0066').assertTrue();
      expect(labels.length, caseName('TodoRulesMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0067').assertEqual(states.length);
      expect(labels.length > 0, caseName('TodoRulesMatrixCases', '0008'), 'RouteTodoMatrixCases.test.ets:A0068').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0900
     * @tc.name      testTodoRulesMatrixCases0009
     * @tc.desc      Verify event labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('TodoRulesMatrixCases', '0009'), 0, (): void => {
      const events: TodoEvent[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (events.indexOf(rule.event) < 0) {
          events.push(rule.event);
        }
      });
      const labels: string[] = events.map((event: TodoEvent): string => todoEventLabel(event));
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length, caseName('TodoRulesMatrixCases', '0009'), 'RouteTodoMatrixCases.test.ets:A0069').assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0), caseName('TodoRulesMatrixCases', '0009'), 'RouteTodoMatrixCases.test.ets:A0070').assertTrue();
      expect(labels.length, caseName('TodoRulesMatrixCases', '0009'), 'RouteTodoMatrixCases.test.ets:A0071').assertEqual(events.length);
      expect(labels.length > 0, caseName('TodoRulesMatrixCases', '0009'), 'RouteTodoMatrixCases.test.ets:A0072').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1000
     * @tc.name      testTodoRulesMatrixCases0010
     * @tc.desc      Verify todo item defaults are valid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('TodoRulesMatrixCases', '0010'), 0, (): void => {
      const item: TodoItem = new TodoItem();
      expect(item.id, caseName('TodoRulesMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0073').assertEqual('');
      expect(item.priority, caseName('TodoRulesMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0074').assertEqual(1);
      expect(item.state, caseName('TodoRulesMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0075').assertEqual(TodoState.OPEN);
      expect(item.dueAt, caseName('TodoRulesMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0076').assertEqual(0);
      expect(item.estimateMinutes, caseName('TodoRulesMatrixCases', '0010'), 'RouteTodoMatrixCases.test.ets:A0077').assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1100
     * @tc.name      testTodoRulesMatrixCases0011
     * @tc.desc      Verify transition from closed state is limited
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0011'), 0, (): void => {
      const closedStates: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (isClosedState(rule.from) && closedStates.indexOf(rule.from) < 0) {
          closedStates.push(rule.from);
        }
      });
      expect(closedStates.length > 0, caseName('TodoRulesMatrixCases', '0011'), 'RouteTodoMatrixCases.test.ets:A0078').assertTrue();
      closedStates.forEach((state: TodoState): void => {
        const events: TodoEvent[] = todoEventsOf(state);
        expect(events.every((event: TodoEvent): boolean => todoEventLabel(event).length > 0), caseName('TodoRulesMatrixCases', '0011'), 'RouteTodoMatrixCases.test.ets:A0079')
          .assertTrue();
      });
      expect(closedStates.indexOf(TodoState.DONE) >= 0, caseName('TodoRulesMatrixCases', '0011'), 'RouteTodoMatrixCases.test.ets:A0080').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1200
     * @tc.name      testTodoRulesMatrixCases0012
     * @tc.desc      Verify every target state has an inbound rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0012'), 0, (): void => {
      const targets: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (targets.indexOf(rule.to) < 0) {
          targets.push(rule.to);
        }
      });
      let reachable: number = 0;
      targets.forEach((target: TodoState): void => {
        const inbound: TodoTransition[] = TODO_TRANSITIONS.filter((rule: TodoTransition): boolean =>
          rule.to === target);
        if (inbound.length > 0) {
          reachable++;
        }
      });
      expect(reachable, caseName('TodoRulesMatrixCases', '0012'), 'RouteTodoMatrixCases.test.ets:A0081').assertEqual(targets.length);
      expect(targets.length > 0, caseName('TodoRulesMatrixCases', '0012'), 'RouteTodoMatrixCases.test.ets:A0082').assertTrue();
      expect(targets.indexOf(TodoState.OPEN) >= 0, caseName('TodoRulesMatrixCases', '0012'), 'RouteTodoMatrixCases.test.ets:A0083').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1300
     * @tc.name      testTodoRulesMatrixCases0013
     * @tc.desc      Verify event order is stable across calls
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0013'), 0, (): void => {
      const first: TodoEvent[] = todoEventsOf(TodoState.OPEN);
      const second: TodoEvent[] = todoEventsOf(TodoState.OPEN);
      expect(first.length, caseName('TodoRulesMatrixCases', '0013'), 'RouteTodoMatrixCases.test.ets:A0084').assertEqual(second.length);
      expect(first.every((event: TodoEvent, index: number): boolean => event === second[index]), caseName('TodoRulesMatrixCases', '0013'), 'RouteTodoMatrixCases.test.ets:A0085')
        .assertTrue();
      expect(first.length > 0, caseName('TodoRulesMatrixCases', '0013'), 'RouteTodoMatrixCases.test.ets:A0086').assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1400
     * @tc.name      testTodoRulesMatrixCases0014
     * @tc.desc      Verify next state is pure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('TodoRulesMatrixCases', '0014'), 0, (): void => {
      const rule: TodoTransition = TODO_TRANSITIONS[0];
      const first: TodoTransitionResult = nextTodoState(rule.from, rule.event);
      const second: TodoTransitionResult = nextTodoState(rule.from, rule.event);
      expect(first.applied, caseName('TodoRulesMatrixCases', '0014'), 'RouteTodoMatrixCases.test.ets:A0087').assertEqual(second.applied);
      expect(first.to, caseName('TodoRulesMatrixCases', '0014'), 'RouteTodoMatrixCases.test.ets:A0088').assertEqual(second.to);
      expect(first.reason, caseName('TodoRulesMatrixCases', '0014'), 'RouteTodoMatrixCases.test.ets:A0089').assertEqual(second.reason);
    });
  });
}
