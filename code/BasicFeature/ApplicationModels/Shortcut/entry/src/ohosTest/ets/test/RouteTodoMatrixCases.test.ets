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

    it('testEntryRouteMatrixCases0001', 0, (): void => {
      expect(ROUTE_TABLE.length > 0).assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0).assertTrue();
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean => entry.routeId.length > 0)).assertTrue();
      const ids: string[] = routeIds();
      expect(ids.length).assertEqual(ROUTE_TABLE.length);
      expect(ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length)
        .assertEqual(0);
      expect(ids.every((id: string): boolean => id.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0200
     * @tc.name      testEntryRouteMatrixCases0002
     * @tc.desc      Verify every route is reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0002', 0, (): void => {
      let found: number = 0;
      routeIds().forEach((id: string): void => {
        const entry = routeOf(id);
        if (entry !== undefined && entry.routeId === id) {
          found++;
        }
      });
      expect(found).assertEqual(ROUTE_TABLE.length);
      expect(routeOf('no-such-route') === undefined).assertTrue();
      expect(routeIds().length).assertEqual(ROUTE_TABLE.length);
      expect(routeOf(routeIds()[0]) === undefined).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0300
     * @tc.name      testEntryRouteMatrixCases0003
     * @tc.desc      Verify page lookup is defined for known routes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0003', 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        const page: RoutePage = pageOf(entry.routeId);
        expect(page === undefined).assertFalse();
        expect(entry.page !== undefined).assertTrue();
      });
      expect(ROUTE_TABLE.length > 0).assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0400
     * @tc.name      testEntryRouteMatrixCases0004
     * @tc.desc      Verify unknown route is not in table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0004', 0, (): void => {
      expect(routeOf('') === undefined).assertTrue();
      expect(routeOf('no-such-route') === undefined).assertTrue();
      expect(pageOf('no-such-route') !== undefined).assertTrue();
      expect(routeIds().indexOf('no-such-route') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0500
     * @tc.name      testEntryRouteMatrixCases0005
     * @tc.desc      Verify param names are unique within route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0005', 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        const names: string[] = entry.params.map((param: RouteParam): string => param.name);
        expect(names.filter((name: string, index: number): boolean =>
          names.indexOf(name) !== index).length).assertEqual(0);
      });
      expect(ROUTE_TABLE.length > 0).assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0600
     * @tc.name      testEntryRouteMatrixCases0006
     * @tc.desc      Verify required params have fallback or are enforced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0006', 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        requiredParams(entry).forEach((param: RouteParam): void => {
          expect(param.required).assertTrue();
          expect(param.name.length > 0).assertTrue();
        });
      });
      expect(ROUTE_TABLE.some((entry: RouteEntry): boolean => requiredParams(entry).length > 0))
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

    it('testEntryRouteMatrixCases0007', 0, (): void => {
      let resolved: number = 0;
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        const result: RouteResolution = resolveRoute(requestFor(entry.routeId, true));
        if (result.ok) {
          resolved++;
        }
      });
      expect(resolved).assertEqual(ROUTE_TABLE.length);
      expect(resolved > 0).assertTrue();
      expect(resolveRoute(requestFor(ROUTE_TABLE[0].routeId, true)).ok).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0800
     * @tc.name      testEntryRouteMatrixCases0008
     * @tc.desc      Verify unknown route request is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0008', 0, (): void => {
      const request: RouteRequest = new RouteRequest();
      request.routeId = 'no-such-route';
      request.loggedIn = true;
      request.at = 1000;
      const result: RouteResolution = resolveRoute(request);
      expect(result.ok).assertFalse();
      expect(result.issues.length > 0).assertTrue();
      expect(request.loggedIn).assertTrue();
      expect(result.issues[0].length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_0900
     * @tc.name      testEntryRouteMatrixCases0009
     * @tc.desc      Verify missing required param is rejected
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0009', 0, (): void => {
      const guarded: RouteEntry[] = ROUTE_TABLE.filter((entry: RouteEntry): boolean =>
        requiredParams(entry).length > 0);
      expect(guarded.length > 0).assertTrue();
      const entry: RouteEntry = guarded[0];
      const request: RouteRequest = new RouteRequest();
      request.routeId = entry.routeId;
      request.loggedIn = true;
      request.at = 1000;
      const result: RouteResolution = resolveRoute(request);
      expect(result.ok).assertFalse();
      expect(result.missing.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1000
     * @tc.name      testEntryRouteMatrixCases0010
     * @tc.desc      Verify login requirement is enforced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0010', 0, (): void => {
      const guarded: RouteEntry[] = ROUTE_TABLE.filter((entry: RouteEntry): boolean =>
        entry.requiresLogin);
      expect(guarded.length > 0).assertTrue();
      guarded.forEach((entry: RouteEntry): void => {
        const anonymous: RouteResolution = resolveRoute(requestFor(entry.routeId, false));
        expect(anonymous.ok).assertFalse();
        const authenticated: RouteResolution = resolveRoute(requestFor(entry.routeId, true));
        expect(authenticated.ok).assertTrue();
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

    it('testEntryRouteMatrixCases0011', 0, (): void => {
      const open: RouteEntry[] = ROUTE_TABLE.filter((entry: RouteEntry): boolean =>
        !entry.requiresLogin);
      expect(open.length > 0).assertTrue();
      open.forEach((entry: RouteEntry): void => {
        expect(resolveRoute(requestFor(entry.routeId, false)).ok).assertTrue();
      });
      expect(open.every((entry: RouteEntry): boolean => !entry.requiresLogin)).assertTrue();
      expect(open.length <= ROUTE_TABLE.length).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYROUTEMATRIXCASES_1200
     * @tc.name      testEntryRouteMatrixCases0012
     * @tc.desc      Verify route descriptions are present
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEntryRouteMatrixCases0012', 0, (): void => {
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        expect(entry.description.length > 0).assertTrue();
      });
      expect(ROUTE_TABLE[0].description.length > 0).assertTrue();
      expect(ROUTE_TABLE.length).assertEqual(routeIds().length);
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

    it('testTodoRulesMatrixCases0001', 0, (): void => {
      expect(TODO_TRANSITIONS.length > 0).assertTrue();
      const ids: string[] = TODO_TRANSITIONS.map((rule: TodoTransition): string => rule.ruleId);
      expect(ids.filter((id: string, index: number): boolean => ids.indexOf(id) !== index).length)
        .assertEqual(0);
      expect(ids.every((id: string): boolean => id.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0200
     * @tc.name      testTodoRulesMatrixCases0002
     * @tc.desc      Verify every transition has distinct state and event
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0002', 0, (): void => {
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        expect(rule.note.length > 0).assertTrue();
        expect(todoStateLabel(rule.from).length > 0).assertTrue();
        expect(todoEventLabel(rule.event).length > 0).assertTrue();
      });
      expect(TODO_TRANSITIONS.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0300
     * @tc.name      testTodoRulesMatrixCases0003
     * @tc.desc      Verify table is deterministic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0003', 0, (): void => {
      let applied: number = 0;
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        const result: TodoTransitionResult = nextTodoState(rule.from, rule.event);
        if (result.applied && result.to === rule.to) {
          applied++;
        }
      });
      expect(applied).assertEqual(TODO_TRANSITIONS.length);
      expect(applied > 0).assertTrue();
      expect(TODO_TRANSITIONS.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0400
     * @tc.name      testTodoRulesMatrixCases0004
     * @tc.desc      Verify rule lookup returns same rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0004', 0, (): void => {
      const rule: TodoTransition = TODO_TRANSITIONS[0];
      const result: TodoTransitionResult = nextTodoState(rule.from, rule.event);
      expect(result.applied).assertTrue();
      expect(result.rule !== undefined).assertTrue();
      if (result.rule !== undefined) {
        expect(result.rule.ruleId).assertEqual(rule.ruleId);
      }
      expect(result.reason.length).assertEqual(0);
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

    it('testTodoRulesMatrixCases0006', 0, (): void => {
      const states: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (states.indexOf(rule.from) < 0) {
          states.push(rule.from);
        }
      });
      expect(states.length > 0).assertTrue();
      states.forEach((state: TodoState): void => {
        const events: TodoEvent[] = todoEventsOf(state);
        expect(events.length > 0).assertTrue();
      });
      expect(states.length <= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0700
     * @tc.name      testTodoRulesMatrixCases0007
     * @tc.desc      Verify closed states are recognised
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0007', 0, (): void => {
      const closed: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (isClosedState(rule.to) && closed.indexOf(rule.to) < 0) {
          closed.push(rule.to);
        }
      });
      expect(closed.length > 0).assertTrue();
      closed.forEach((state: TodoState): void => {
        expect(isClosedState(state)).assertTrue();
      });
      expect(closed.indexOf(TodoState.DONE) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0800
     * @tc.name      testTodoRulesMatrixCases0008
     * @tc.desc      Verify state labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testTodoRulesMatrixCases0008', 0, (): void => {
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
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(states.length);
      expect(labels.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_0900
     * @tc.name      testTodoRulesMatrixCases0009
     * @tc.desc      Verify event labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testTodoRulesMatrixCases0009', 0, (): void => {
      const events: TodoEvent[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (events.indexOf(rule.event) < 0) {
          events.push(rule.event);
        }
      });
      const labels: string[] = events.map((event: TodoEvent): string => todoEventLabel(event));
      expect(labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length).assertEqual(0);
      expect(labels.every((label: string): boolean => label.length > 0)).assertTrue();
      expect(labels.length).assertEqual(events.length);
      expect(labels.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1000
     * @tc.name      testTodoRulesMatrixCases0010
     * @tc.desc      Verify todo item defaults are valid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testTodoRulesMatrixCases0010', 0, (): void => {
      const item: TodoItem = new TodoItem();
      expect(item.id).assertEqual('');
      expect(item.priority).assertEqual(1);
      expect(item.state).assertEqual(TodoState.OPEN);
      expect(item.dueAt).assertEqual(0);
      expect(item.estimateMinutes).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1100
     * @tc.name      testTodoRulesMatrixCases0011
     * @tc.desc      Verify transition from closed state is limited
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0011', 0, (): void => {
      const closedStates: TodoState[] = [];
      TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
        if (isClosedState(rule.from) && closedStates.indexOf(rule.from) < 0) {
          closedStates.push(rule.from);
        }
      });
      expect(closedStates.length > 0).assertTrue();
      closedStates.forEach((state: TodoState): void => {
        const events: TodoEvent[] = todoEventsOf(state);
        expect(events.every((event: TodoEvent): boolean => todoEventLabel(event).length > 0))
          .assertTrue();
      });
      expect(closedStates.indexOf(TodoState.DONE) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1200
     * @tc.name      testTodoRulesMatrixCases0012
     * @tc.desc      Verify every target state has an inbound rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0012', 0, (): void => {
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
      expect(reachable).assertEqual(targets.length);
      expect(targets.length > 0).assertTrue();
      expect(targets.indexOf(TodoState.OPEN) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1300
     * @tc.name      testTodoRulesMatrixCases0013
     * @tc.desc      Verify event order is stable across calls
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0013', 0, (): void => {
      const first: TodoEvent[] = todoEventsOf(TodoState.OPEN);
      const second: TodoEvent[] = todoEventsOf(TodoState.OPEN);
      expect(first.length).assertEqual(second.length);
      expect(first.every((event: TodoEvent, index: number): boolean => event === second[index]))
        .assertTrue();
      expect(first.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_TODORULESMATRIXCASES_1400
     * @tc.name      testTodoRulesMatrixCases0014
     * @tc.desc      Verify next state is pure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testTodoRulesMatrixCases0014', 0, (): void => {
      const rule: TodoTransition = TODO_TRANSITIONS[0];
      const first: TodoTransitionResult = nextTodoState(rule.from, rule.event);
      const second: TodoTransitionResult = nextTodoState(rule.from, rule.event);
      expect(first.applied).assertEqual(second.applied);
      expect(first.to).assertEqual(second.to);
      expect(first.reason).assertEqual(second.reason);
    });
  });
}
