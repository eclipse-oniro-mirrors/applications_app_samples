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
  ParamKind, ROUTE_TABLE, RouteEntry, RoutePage, RouteParam, RouteRequest, auditRoutes, pageOf,
  resolveRoute, routeIds, routeLines, routeOf, routesOfPage
} from '../../../main/ets/business/EntryRoute';
import {
  ENTRY_RULES, EntryPlan, EntryRequest, EntryRule, EntrySource, auditEntry, parseUri,
  resolveEntry, ruleIds, ruleLines, ruleOf, rulesOf, sourceCounts, sourceLabel, sourceLines
} from '../../../main/ets/business/LaunchIntent';

function requestOf(routeId: string, at: number): RouteRequest {
  return new RouteRequest(routeId, at);
}

function routeEntryOf(routeId: string): RouteEntry {
  const found: RouteEntry | undefined = routeOf(routeId);
  if (found === undefined) {
    throw new Error(`路由表缺少 ${routeId}`);
  }
  return found;
}

function entryOf(source: EntrySource, uri: string): EntryRequest {
  return new EntryRequest(source, uri);
}

export default function entryMatrixCasesTest(): void {
  describe('RouteParamCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0100
     * @tc.name      testRouteParamCases0001
     * @tc.desc      Verify optional param accepts empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0001'), 0, (): void => {
      const optional: RouteParam = new RouteParam('tag', ParamKind.TEXT, false, '');
      expect(optional.accepts(''), caseName('RouteParamCases', '0001')).assertTrue();
      expect(optional.required, caseName('RouteParamCases', '0001')).assertFalse();
      expect(optional.fallback, caseName('RouteParamCases', '0001')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0200
     * @tc.name      testRouteParamCases0002
     * @tc.desc      Verify required param rejects empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0002'), 0, (): void => {
      const required: RouteParam = new RouteParam('noteId', ParamKind.ID, true, '');
      expect(required.accepts(''), caseName('RouteParamCases', '0002')).assertFalse();
      expect(required.accepts('n-1'), caseName('RouteParamCases', '0002')).assertTrue();
      expect(required.text(), caseName('RouteParamCases', '0002')).assertEqual('noteId(id)必填');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0300
     * @tc.name      testRouteParamCases0003
     * @tc.desc      Verify number kind only accepts integer text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('RouteParamCases', '0003'), 0, (): void => {
      const number: RouteParam = new RouteParam('page', ParamKind.NUMBER, false, '0');
      expect(number.accepts('12'), caseName('RouteParamCases', '0003')).assertTrue();
      expect(number.accepts('-3'), caseName('RouteParamCases', '0003')).assertTrue();
      expect(number.accepts('1.5'), caseName('RouteParamCases', '0003')).assertFalse();
      expect(number.accepts('1e3'), caseName('RouteParamCases', '0003')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0400
     * @tc.name      testRouteParamCases0004
     * @tc.desc      Verify boolean kind only accepts two literals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0004'), 0, (): void => {
      const flag: RouteParam = new RouteParam('focus', ParamKind.BOOLEAN, false, 'true');
      expect(flag.accepts('true'), caseName('RouteParamCases', '0004')).assertTrue();
      expect(flag.accepts('false'), caseName('RouteParamCases', '0004')).assertTrue();
      expect(flag.accepts('yes'), caseName('RouteParamCases', '0004')).assertFalse();
      expect(flag.accepts('TRUE'), caseName('RouteParamCases', '0004')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0500
     * @tc.name      testRouteParamCases0005
     * @tc.desc      Verify id kind rejects separators outside allow list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0005'), 0, (): void => {
      const id: RouteParam = new RouteParam('noteId', ParamKind.ID, false, '');
      expect(id.accepts('note_1'), caseName('RouteParamCases', '0005')).assertTrue();
      expect(id.accepts('a.b:c-d'), caseName('RouteParamCases', '0005')).assertTrue();
      expect(id.accepts('bad id'), caseName('RouteParamCases', '0005')).assertFalse();
      expect(id.accepts('便签'), caseName('RouteParamCases', '0005')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0600
     * @tc.name      testRouteParamCases0006
     * @tc.desc      Verify text kind accepts any non empty value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0006'), 0, (): void => {
      const text: RouteParam = new RouteParam('date', ParamKind.TEXT, false, 'today');
      expect(text.accepts('tomorrow'), caseName('RouteParamCases', '0006')).assertTrue();
      expect(text.accepts('   '), caseName('RouteParamCases', '0006')).assertTrue();
      expect(text.accepts('a=b'), caseName('RouteParamCases', '0006')).assertTrue();
      expect(text.kind, caseName('RouteParamCases', '0006')).assertEqual(ParamKind.TEXT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0700
     * @tc.name      testRouteParamCases0007
     * @tc.desc      Verify coerce keeps legal value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0007'), 0, (): void => {
      const kind: RouteParam = new RouteParam('sort', ParamKind.TEXT, false, 'recent');
      expect(kind.coerce('oldest'), caseName('RouteParamCases', '0007')).assertEqual('oldest');
      expect(kind.coerce('oldest') === kind.fallback, caseName('RouteParamCases', '0007')).assertFalse();
      expect(kind.name, caseName('RouteParamCases', '0007')).assertEqual('sort');
      expect(kind.kind, caseName('RouteParamCases', '0007')).assertEqual(ParamKind.TEXT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0800
     * @tc.name      testRouteParamCases0008
     * @tc.desc      Verify coerce falls back on illegal value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0008'), 0, (): void => {
      const flag: RouteParam = new RouteParam('focus', ParamKind.BOOLEAN, false, 'true');
      expect(flag.coerce('yes'), caseName('RouteParamCases', '0008')).assertEqual('true');
      expect(flag.coerce('0'), caseName('RouteParamCases', '0008')).assertEqual('true');
      expect(flag.coerce('false'), caseName('RouteParamCases', '0008')).assertEqual('false');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0900
     * @tc.name      testRouteParamCases0009
     * @tc.desc      Verify empty value is not replaced by fallback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteParamCases', '0009'), 0, (): void => {
      const kind: RouteParam = new RouteParam('sort', ParamKind.TEXT, false, 'recent');
      expect(kind.coerce(''), caseName('RouteParamCases', '0009')).assertEqual('');
      expect(kind.coerce('') === 'recent', caseName('RouteParamCases', '0009')).assertFalse();
      expect(kind.fallback, caseName('RouteParamCases', '0009')).assertEqual('recent');
      expect(kind.required, caseName('RouteParamCases', '0009')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_1000
     * @tc.name      testRouteParamCases0010
     * @tc.desc      Verify param text marks optional
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('RouteParamCases', '0010'), 0, (): void => {
      const optional: RouteParam = new RouteParam('draftId', ParamKind.ID, false, '');
      const required: RouteParam = new RouteParam('draftId', ParamKind.ID, true, '');
      expect(optional.text(), caseName('RouteParamCases', '0010')).assertEqual('draftId(id)选填');
      expect(required.text(), caseName('RouteParamCases', '0010')).assertEqual('draftId(id)必填');
      expect(optional.text() === required.text(), caseName('RouteParamCases', '0010')).assertFalse();
    });
  });

  describe('RouteEntryCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0100
     * @tc.name      testRouteEntryCases0001
     * @tc.desc      Verify param of finds declared parameter
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteEntryCases', '0001'), 0, (): void => {
      const entry: RouteEntry | undefined = routeOf('sc.todo.today');
      expect(entry !== undefined, caseName('RouteEntryCases', '0001')).assertTrue();
      const param: RouteParam | undefined = entry?.paramOf('filter');
      expect(param !== undefined, caseName('RouteEntryCases', '0001')).assertTrue();
      expect(param?.fallback, caseName('RouteEntryCases', '0001')).assertEqual('all');
      expect(param?.kind, caseName('RouteEntryCases', '0001')).assertEqual(ParamKind.TEXT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0200
     * @tc.name      testRouteEntryCases0002
     * @tc.desc      Verify param of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteEntryCases', '0002'), 0, (): void => {
      const entry: RouteEntry | undefined = routeOf('sc.rule.center');
      expect(entry !== undefined, caseName('RouteEntryCases', '0002')).assertTrue();
      expect(entry?.paramOf('anything') === undefined, caseName('RouteEntryCases', '0002')).assertTrue();
      expect(entry?.params.length, caseName('RouteEntryCases', '0002')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0300
     * @tc.name      testRouteEntryCases0003
     * @tc.desc      Verify entry text lists params
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('RouteEntryCases', '0003'), 0, (): void => {
      const entry: RouteEntry = routeEntryOf('sc.note.new');
      expect(entry.text(), caseName('RouteEntryCases', '0003')).assertEqual('sc.note.new -> note｜draftId,focus｜免登录');
      expect(entry.text().indexOf('无参数'), caseName('RouteEntryCases', '0003')).assertEqual(-1);
      expect(entry.routeId, caseName('RouteEntryCases', '0003')).assertEqual('sc.note.new');
      expect(entry.params.length, caseName('RouteEntryCases', '0003')).assertEqual(2);
      expect(entry.requiresLogin, caseName('RouteEntryCases', '0003')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0400
     * @tc.name      testRouteEntryCases0004
     * @tc.desc      Verify entry text marks parameterless route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('RouteEntryCases', '0004'), 0, (): void => {
      const entry: RouteEntry = routeEntryOf('sc.rule.center');
      expect(entry.text(), caseName('RouteEntryCases', '0004')).assertEqual('sc.rule.center -> ruleCenter｜无参数｜免登录');
      expect(entry.text().indexOf('无参数') >= 0, caseName('RouteEntryCases', '0004')).assertTrue();
      expect(entry.params.length, caseName('RouteEntryCases', '0004')).assertEqual(0);
      expect(entry.text().split('｜').length, caseName('RouteEntryCases', '0004')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0500
     * @tc.name      testRouteEntryCases0005
     * @tc.desc      Verify entry text marks login requirement
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('RouteEntryCases', '0005'), 0, (): void => {
      const entry: RouteEntry = routeEntryOf('sc.detail');
      expect(entry.text(), caseName('RouteEntryCases', '0005')).assertEqual('sc.detail -> detail｜noteId｜需登录');
      expect(entry.requiresLogin, caseName('RouteEntryCases', '0005')).assertTrue();
      expect(entry.text().indexOf('需登录') >= 0, caseName('RouteEntryCases', '0005')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0600
     * @tc.name      testRouteEntryCases0006
     * @tc.desc      Verify route table is unique and complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteEntryCases', '0006'), 0, (): void => {
      const ids: string[] = routeIds();
      expect(ids.length, caseName('RouteEntryCases', '0006')).assertEqual(8);
      const unique: string[] = ids.filter((id: string, index: number): boolean =>
        ids.indexOf(id) === index);
      expect(unique.length, caseName('RouteEntryCases', '0006')).assertEqual(8);
      expect(ROUTE_TABLE.length, caseName('RouteEntryCases', '0006')).assertEqual(ids.length);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0700
     * @tc.name      testRouteEntryCases0007
     * @tc.desc      Verify route ids cover declared shortcuts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteEntryCases', '0007'), 0, (): void => {
      const ids: string[] = routeIds();
      expect(ids.indexOf('sc.note.new') >= 0, caseName('RouteEntryCases', '0007')).assertTrue();
      expect(ids.indexOf('sc.todo.detail') >= 0, caseName('RouteEntryCases', '0007')).assertTrue();
      expect(ids.indexOf('sc.note.resume') >= 0, caseName('RouteEntryCases', '0007')).assertTrue();
      expect(ids.indexOf('sc.missing') >= 0, caseName('RouteEntryCases', '0007')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0800
     * @tc.name      testRouteEntryCases0008
     * @tc.desc      Verify page of unknown falls back home
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteEntryCases', '0008'), 0, (): void => {
      expect(pageOf('sc.detail'), caseName('RouteEntryCases', '0008')).assertEqual(RoutePage.DETAIL);
      expect(pageOf('sc.todo.detail'), caseName('RouteEntryCases', '0008')).assertEqual(RoutePage.DETAIL);
      expect(pageOf('sc.unknown'), caseName('RouteEntryCases', '0008')).assertEqual(RoutePage.HOME);
      expect(pageOf(''), caseName('RouteEntryCases', '0008')).assertEqual(RoutePage.HOME);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0900
     * @tc.name      testRouteEntryCases0009
     * @tc.desc      Verify routes of page groups targets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteEntryCases', '0009'), 0, (): void => {
      const note: string[] = routesOfPage(RoutePage.NOTE);
      expect(note.length, caseName('RouteEntryCases', '0009')).assertEqual(2);
      expect(note.indexOf('sc.note.new') >= 0, caseName('RouteEntryCases', '0009')).assertTrue();
      expect(note.indexOf('sc.note.resume') >= 0, caseName('RouteEntryCases', '0009')).assertTrue();
      expect(routesOfPage(RoutePage.HOME).length, caseName('RouteEntryCases', '0009')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_1000
     * @tc.name      testRouteEntryCases0010
     * @tc.desc      Verify detail routes are two
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteEntryCases', '0010'), 0, (): void => {
      const detail: string[] = routesOfPage(RoutePage.DETAIL);
      expect(detail.length, caseName('RouteEntryCases', '0010')).assertEqual(2);
      expect(detail.indexOf('sc.detail') >= 0, caseName('RouteEntryCases', '0010')).assertTrue();
      expect(detail.indexOf('sc.todo.detail') >= 0, caseName('RouteEntryCases', '0010')).assertTrue();
      expect(routesOfPage(RoutePage.RULE_CENTER).length, caseName('RouteEntryCases', '0010')).assertEqual(1);
    });
  });

  describe('ResolveRouteCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0100
     * @tc.name      testResolveRouteCases0001
     * @tc.desc      Verify unknown route is reported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0001'), 0, (): void => {
      const result = resolveRoute(requestOf('sc.nope', 0));
      expect(result.ok, caseName('ResolveRouteCases', '0001')).assertFalse();
      expect(result.page, caseName('ResolveRouteCases', '0001')).assertEqual(RoutePage.HOME);
      expect(result.issues[0].indexOf('未知路由') >= 0, caseName('ResolveRouteCases', '0001')).assertTrue();
      expect(result.entry === undefined, caseName('ResolveRouteCases', '0001')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0200
     * @tc.name      testResolveRouteCases0002
     * @tc.desc      Verify optional params resolve empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0002'), 0, (): void => {
      const result = resolveRoute(requestOf('sc.note.new', 0));
      expect(result.ok, caseName('ResolveRouteCases', '0002')).assertTrue();
      expect(result.page, caseName('ResolveRouteCases', '0002')).assertEqual(RoutePage.NOTE);
      expect(result.keys.length, caseName('ResolveRouteCases', '0002')).assertEqual(2);
      expect(result.get('draftId'), caseName('ResolveRouteCases', '0002')).assertEqual('');
      expect(result.get('focus'), caseName('ResolveRouteCases', '0002')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0300
     * @tc.name      testResolveRouteCases0003
     * @tc.desc      Verify parameterless route resolves clean
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0003'), 0, (): void => {
      const result = resolveRoute(requestOf('sc.rule.center', 0));
      expect(result.ok, caseName('ResolveRouteCases', '0003')).assertTrue();
      expect(result.page, caseName('ResolveRouteCases', '0003')).assertEqual(RoutePage.RULE_CENTER);
      expect(result.keys.length, caseName('ResolveRouteCases', '0003')).assertEqual(0);
      expect(result.issues.length, caseName('ResolveRouteCases', '0003')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0400
     * @tc.name      testResolveRouteCases0004
     * @tc.desc      Verify missing required param blocks entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0004'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.detail', 0);
      request.loggedIn = true;
      const result = resolveRoute(request);
      expect(result.ok, caseName('ResolveRouteCases', '0004')).assertFalse();
      expect(result.missing.length, caseName('ResolveRouteCases', '0004')).assertEqual(1);
      expect(result.missing[0], caseName('ResolveRouteCases', '0004')).assertEqual('noteId');
      expect(result.issues[0].indexOf('缺少必填参数') >= 0, caseName('ResolveRouteCases', '0004')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0500
     * @tc.name      testResolveRouteCases0005
     * @tc.desc      Verify login gate stops before params
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0005'), 0, (): void => {
      const result = resolveRoute(requestOf('sc.detail', 0));
      expect(result.ok, caseName('ResolveRouteCases', '0005')).assertFalse();
      expect(result.issues[0], caseName('ResolveRouteCases', '0005')).assertEqual('需要登录后才能进入');
      expect(result.keys.length, caseName('ResolveRouteCases', '0005')).assertEqual(0);
      expect(result.missing.length, caseName('ResolveRouteCases', '0005')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0600
     * @tc.name      testResolveRouteCases0006
     * @tc.desc      Verify logged in detail resolves
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0006'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.detail', 0);
      request.loggedIn = true;
      request.put('noteId', 'note-1');
      const result = resolveRoute(request);
      expect(result.ok, caseName('ResolveRouteCases', '0006')).assertTrue();
      expect(result.get('noteId'), caseName('ResolveRouteCases', '0006')).assertEqual('note-1');
      expect(result.page, caseName('ResolveRouteCases', '0006')).assertEqual(RoutePage.DETAIL);
      expect(result.expired, caseName('ResolveRouteCases', '0006')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0700
     * @tc.name      testResolveRouteCases0007
     * @tc.desc      Verify illegal value is reported and coerced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0007'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.detail', 0);
      request.loggedIn = true;
      request.put('noteId', 'bad id');
      const result = resolveRoute(request);
      expect(result.ok, caseName('ResolveRouteCases', '0007')).assertFalse();
      expect(result.issues.some((issue: string): boolean =>
        issue.indexOf('参数取值非法：noteId') >= 0), caseName('ResolveRouteCases', '0007')).assertTrue();
      expect(result.get('noteId'), caseName('ResolveRouteCases', '0007')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0800
     * @tc.name      testResolveRouteCases0008
     * @tc.desc      Verify illegal boolean falls back to default
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0008'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.new', 0);
      request.put('focus', 'yes');
      const result = resolveRoute(request);
      expect(result.get('focus'), caseName('ResolveRouteCases', '0008')).assertEqual('true');
      expect(result.ok, caseName('ResolveRouteCases', '0008')).assertFalse();
      expect(result.issues.some((issue: string): boolean =>
        issue.indexOf('参数取值非法：focus') >= 0), caseName('ResolveRouteCases', '0008')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0900
     * @tc.name      testResolveRouteCases0009
     * @tc.desc      Verify unknown param is ignored without blocking
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0009'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.rule.center', 0);
      request.put('extra', '1');
      const result = resolveRoute(request);
      expect(result.ok, caseName('ResolveRouteCases', '0009')).assertTrue();
      expect(result.issues.length, caseName('ResolveRouteCases', '0009')).assertEqual(1);
      expect(result.issues[0], caseName('ResolveRouteCases', '0009')).assertEqual('忽略未知参数：extra');
      expect(result.keys.length, caseName('ResolveRouteCases', '0009')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1000
     * @tc.name      testResolveRouteCases0010
     * @tc.desc      Verify multiple unknown params are all listed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0010'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.calls', 0);
      request.put('a', '1');
      request.put('b', '2');
      const result = resolveRoute(request);
      expect(result.issues.length, caseName('ResolveRouteCases', '0010')).assertEqual(2);
      expect(result.ok, caseName('ResolveRouteCases', '0010')).assertTrue();
      expect(result.get('range'), caseName('ResolveRouteCases', '0010')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1100
     * @tc.name      testResolveRouteCases0011
     * @tc.desc      Verify resolution text explains success
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ResolveRouteCases', '0011'), 0, (): void => {
      const result = resolveRoute(requestOf('sc.note.new', 0));
      expect(result.text(), caseName('ResolveRouteCases', '0011')).assertEqual('-> note｜2 个参数｜有效');
      expect(result.text().indexOf('未解析'), caseName('ResolveRouteCases', '0011')).assertEqual(-1);
      expect(result.ok, caseName('ResolveRouteCases', '0011')).assertTrue();
      expect(result.issues.length, caseName('ResolveRouteCases', '0011')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1200
     * @tc.name      testResolveRouteCases0012
     * @tc.desc      Verify resolution text explains failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ResolveRouteCases', '0012'), 0, (): void => {
      const result = resolveRoute(requestOf('sc.unknown', 0));
      expect(result.text().indexOf('未解析：未知路由') >= 0, caseName('ResolveRouteCases', '0012')).assertTrue();
      expect(result.text().indexOf('sc.unknown') >= 0, caseName('ResolveRouteCases', '0012')).assertTrue();
      expect(result.text().indexOf('个参数'), caseName('ResolveRouteCases', '0012')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1300
     * @tc.name      testResolveRouteCases0013
     * @tc.desc      Verify stale entry is marked expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0013'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.resume', Date.now() - 700000);
      request.put('draftId', 'd-1');
      const result = resolveRoute(request);
      expect(result.expired, caseName('ResolveRouteCases', '0013')).assertTrue();
      expect(result.ok, caseName('ResolveRouteCases', '0013')).assertTrue();
      expect(result.text().indexOf('已过期') >= 0, caseName('ResolveRouteCases', '0013')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1400
     * @tc.name      testResolveRouteCases0014
     * @tc.desc      Verify fresh entry is not expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0014'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.resume', Date.now() - 1000);
      request.put('draftId', 'd-1');
      const result = resolveRoute(request);
      expect(result.expired, caseName('ResolveRouteCases', '0014')).assertFalse();
      expect(result.text().indexOf('有效') >= 0, caseName('ResolveRouteCases', '0014')).assertTrue();
      expect(result.ok, caseName('ResolveRouteCases', '0014')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1500
     * @tc.name      testResolveRouteCases0015
     * @tc.desc      Verify zero timestamp skips expiry check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0015'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.resume', 0);
      request.put('draftId', 'd-1');
      const result = resolveRoute(request);
      expect(result.expired, caseName('ResolveRouteCases', '0015')).assertFalse();
      expect(result.ok, caseName('ResolveRouteCases', '0015')).assertTrue();
      expect(request.get('draftId'), caseName('ResolveRouteCases', '0015')).assertEqual('d-1');
      expect(request.keys.length, caseName('ResolveRouteCases', '0015')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1600
     * @tc.name      testResolveRouteCases0016
     * @tc.desc      Verify request put overwrites in place
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveRouteCases', '0016'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.new', 0);
      request.put('focus', 'false');
      request.put('focus', 'true');
      expect(request.keys.length, caseName('ResolveRouteCases', '0016')).assertEqual(1);
      expect(request.get('focus'), caseName('ResolveRouteCases', '0016')).assertEqual('true');
      expect(request.get('missing'), caseName('ResolveRouteCases', '0016')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1700
     * @tc.name      testResolveRouteCases0017
     * @tc.desc      Verify request text joins pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ResolveRouteCases', '0017'), 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.new', 0);
      request.put('draftId', 'd-1');
      request.put('focus', 'true');
      expect(request.text(), caseName('ResolveRouteCases', '0017')).assertEqual('sc.note.new?draftId=d-1&focus=true');
      expect(requestOf('sc.rule.center', 0).text(), caseName('ResolveRouteCases', '0017')).assertEqual('sc.rule.center?');
      expect(request.keys.length, caseName('ResolveRouteCases', '0017')).assertEqual(2);
      expect(requestOf('sc.rule.center', 0).keys.length, caseName('ResolveRouteCases', '0017')).assertEqual(0);
    });
  });

  describe('RouteAuditCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ROUTEAUDITCASES_0100
     * @tc.name      testRouteAuditCases0001
     * @tc.desc      Verify route table is self consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('RouteAuditCases', '0001'), 0, (): void => {
      const audit = auditRoutes();
      expect(audit.ok, caseName('RouteAuditCases', '0001')).assertTrue();
      expect(audit.findings.length, caseName('RouteAuditCases', '0001')).assertEqual(0);
      expect(audit.summary(), caseName('RouteAuditCases', '0001')).assertEqual('路由表自洽');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEAUDITCASES_0200
     * @tc.name      testRouteAuditCases0002
     * @tc.desc      Verify route lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('RouteAuditCases', '0002'), 0, (): void => {
      const lines: string[] = routeLines();
      expect(lines.length, caseName('RouteAuditCases', '0002')).assertEqual(ROUTE_TABLE.length);
      expect(lines.every((line: string): boolean => line.indexOf('｜') > 0), caseName('RouteAuditCases', '0002')).assertTrue();
      expect(lines[0].indexOf('sc.note.new') >= 0, caseName('RouteAuditCases', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEAUDITCASES_0300
     * @tc.name      testRouteAuditCases0003
     * @tc.desc      Verify every route has description
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteAuditCases', '0003'), 0, (): void => {
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean =>
        entry.description.length > 0), caseName('RouteAuditCases', '0003')).assertTrue();
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean =>
        entry.page !== RoutePage.UNKNOWN), caseName('RouteAuditCases', '0003')).assertTrue();
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean =>
        entry.maxAgeMs >= 0), caseName('RouteAuditCases', '0003')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEAUDITCASES_0400
     * @tc.name      testRouteAuditCases0004
     * @tc.desc      Verify required params carry no usable fallback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('RouteAuditCases', '0004'), 0, (): void => {
      const offenders: string[] = [];
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        entry.params.forEach((param: RouteParam): void => {
          if (param.required && param.fallback.length > 0 && param.accepts(param.fallback)) {
            offenders.push(`${entry.routeId}.${param.name}`);
          }
        });
      });
      expect(offenders.length, caseName('RouteAuditCases', '0004')).assertEqual(0);
      expect(ROUTE_TABLE.some((entry: RouteEntry): boolean =>
        entry.params.some((param: RouteParam): boolean => param.required)), caseName('RouteAuditCases', '0004')).assertTrue();
      expect(ROUTE_TABLE.length > 0, caseName('RouteAuditCases', '0004')).assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0, caseName('RouteAuditCases', '0004')).assertTrue();
    });
  });

  describe('EntryRuleCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0100
     * @tc.name      testEntryRuleCases0001
     * @tc.desc      Verify source labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('EntryRuleCases', '0001'), 0, (): void => {
      const labels: string[] = [
        sourceLabel(EntrySource.SHORTCUT), sourceLabel(EntrySource.DEEPLINK),
        sourceLabel(EntrySource.NOTIFICATION), sourceLabel(EntrySource.WIDGET),
        sourceLabel(EntrySource.RESUME), sourceLabel(EntrySource.UNKNOWN)
      ];
      expect(labels[0], caseName('EntryRuleCases', '0001')).assertEqual('桌面快捷方式');
      expect(labels[1], caseName('EntryRuleCases', '0001')).assertEqual('深链');
      expect(labels[2], caseName('EntryRuleCases', '0001')).assertEqual('通知');
      expect(labels[3], caseName('EntryRuleCases', '0001')).assertEqual('小组件');
      expect(labels[4], caseName('EntryRuleCases', '0001')).assertEqual('进程恢复');
      expect(labels[5], caseName('EntryRuleCases', '0001')).assertEqual('未知来源');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0200
     * @tc.name      testEntryRuleCases0002
     * @tc.desc      Verify empty prefix matches every uri
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRuleCases', '0002'), 0, (): void => {
      const fallback: EntryRule | undefined = ruleOf('IN-18');
      expect(fallback?.prefix, caseName('EntryRuleCases', '0002')).assertEqual('');
      expect(fallback?.matchesUri(''), caseName('EntryRuleCases', '0002')).assertTrue();
      expect(fallback?.matchesUri('shortcut://whatever'), caseName('EntryRuleCases', '0002')).assertTrue();
      expect(fallback?.matchesUri('app://note'), caseName('EntryRuleCases', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0300
     * @tc.name      testEntryRuleCases0003
     * @tc.desc      Verify prefix match is anchored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRuleCases', '0003'), 0, (): void => {
      const rule: EntryRule | undefined = ruleOf('IN-01');
      expect(rule?.matchesUri('shortcut://note/new'), caseName('EntryRuleCases', '0003')).assertTrue();
      expect(rule?.matchesUri('shortcut://note/new?focus=true'), caseName('EntryRuleCases', '0003')).assertTrue();
      expect(rule?.matchesUri('xshortcut://note/new'), caseName('EntryRuleCases', '0003')).assertFalse();
      expect(rule?.matchesUri('shortcut://note/old'), caseName('EntryRuleCases', '0003')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0400
     * @tc.name      testEntryRuleCases0004
     * @tc.desc      Verify rule text shows priority
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('EntryRuleCases', '0004'), 0, (): void => {
      expect(ruleOf('IN-01')?.text(), caseName('EntryRuleCases', '0004')).assertEqual(
        'IN-01 桌面快捷方式｜shortcut://note/new -> sc.note.new｜优先级 90');
      expect(ruleOf('IN-18')?.text(), caseName('EntryRuleCases', '0004')).assertEqual(
        'IN-18 桌面快捷方式｜* -> sc.rule.center｜优先级 10');
      expect(ruleOf('IN-01') === undefined, caseName('EntryRuleCases', '0004')).assertFalse();
      expect(ruleOf('IN-18')?.priority, caseName('EntryRuleCases', '0004')).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0500
     * @tc.name      testEntryRuleCases0005
     * @tc.desc      Verify rule ids are sequential
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('EntryRuleCases', '0005'), 0, (): void => {
      const ids: string[] = ruleIds();
      expect(ids.length, caseName('EntryRuleCases', '0005')).assertEqual(20);
      expect(ids[0], caseName('EntryRuleCases', '0005')).assertEqual('IN-01');
      expect(ids[19], caseName('EntryRuleCases', '0005')).assertEqual('IN-20');
      expect(ids.every((id: string, index: number): boolean =>
        id === `IN-${(index + 1).toString().padStart(2, '0')}`), caseName('EntryRuleCases', '0005')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0600
     * @tc.name      testEntryRuleCases0006
     * @tc.desc      Verify rule of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRuleCases', '0006'), 0, (): void => {
      expect(ruleOf('IN-20')?.routeId, caseName('EntryRuleCases', '0006')).assertEqual('sc.rule.center');
      expect(ruleOf('IN-99') === undefined, caseName('EntryRuleCases', '0006')).assertTrue();
      expect(ruleOf('') === undefined, caseName('EntryRuleCases', '0006')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0700
     * @tc.name      testEntryRuleCases0007
     * @tc.desc      Verify shortcut source has five rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRuleCases', '0007'), 0, (): void => {
      const shortcut: EntryRule[] = rulesOf(EntrySource.SHORTCUT);
      expect(shortcut.length, caseName('EntryRuleCases', '0007')).assertEqual(5);
      expect(shortcut.every((rule: EntryRule): boolean =>
        rule.source === EntrySource.SHORTCUT), caseName('EntryRuleCases', '0007')).assertTrue();
      expect(shortcut.some((rule: EntryRule): boolean => rule.ruleId === 'IN-18'), caseName('EntryRuleCases', '0007')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0800
     * @tc.name      testEntryRuleCases0008
     * @tc.desc      Verify deeplink source has six rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRuleCases', '0008'), 0, (): void => {
      const deeplink: EntryRule[] = rulesOf(EntrySource.DEEPLINK);
      expect(deeplink.length, caseName('EntryRuleCases', '0008')).assertEqual(6);
      expect(deeplink.filter((rule: EntryRule): boolean =>
        rule.priority === 80).length, caseName('EntryRuleCases', '0008')).assertEqual(5);
      expect(deeplink.some((rule: EntryRule): boolean => rule.ruleId === 'IN-19'), caseName('EntryRuleCases', '0008')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_0900
     * @tc.name      testEntryRuleCases0009
     * @tc.desc      Verify other sources have expected counts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRuleCases', '0009'), 0, (): void => {
      expect(rulesOf(EntrySource.NOTIFICATION).length, caseName('EntryRuleCases', '0009')).assertEqual(3);
      expect(rulesOf(EntrySource.WIDGET).length, caseName('EntryRuleCases', '0009')).assertEqual(3);
      expect(rulesOf(EntrySource.RESUME).length, caseName('EntryRuleCases', '0009')).assertEqual(2);
      expect(rulesOf(EntrySource.UNKNOWN).length, caseName('EntryRuleCases', '0009')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_1000
     * @tc.name      testEntryRuleCases0010
     * @tc.desc      Verify rule lines match rule table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('EntryRuleCases', '0010'), 0, (): void => {
      const lines: string[] = ruleLines();
      expect(lines.length, caseName('EntryRuleCases', '0010')).assertEqual(ENTRY_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('优先级') > 0), caseName('EntryRuleCases', '0010')).assertTrue();
      expect(lines[0].indexOf('IN-01') === 0, caseName('EntryRuleCases', '0010')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYRULECASES_1100
     * @tc.name      testEntryRuleCases0011
     * @tc.desc      Verify source counts are ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryRuleCases', '0011'), 0, (): void => {
      const counts: number[] = sourceCounts();
      expect(counts.length, caseName('EntryRuleCases', '0011')).assertEqual(6);
      expect(counts[0], caseName('EntryRuleCases', '0011')).assertEqual(5);
      expect(counts[1], caseName('EntryRuleCases', '0011')).assertEqual(6);
      expect(counts[5], caseName('EntryRuleCases', '0011')).assertEqual(1);
      expect(counts.reduce((sum: number, item: number): number => sum + item, 0), caseName('EntryRuleCases', '0011'))
        .assertEqual(ENTRY_RULES.length);
    });
  });

  describe('ParseUriCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0100
     * @tc.name      testParseUriCases0001
     * @tc.desc      Verify uri without query keeps whole text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ParseUriCases', '0001'), 0, (): void => {
      const request: EntryRequest = parseUri('shortcut://note/new');
      expect(request.uri, caseName('ParseUriCases', '0001')).assertEqual('shortcut://note/new');
      expect(request.keys.length, caseName('ParseUriCases', '0001')).assertEqual(0);
      expect(request.source, caseName('ParseUriCases', '0001')).assertEqual(EntrySource.UNKNOWN);
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0200
     * @tc.name      testParseUriCases0002
     * @tc.desc      Verify uri splits into pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ParseUriCases', '0002'), 0, (): void => {
      const request: EntryRequest = parseUri('app://todo?date=today&filter=all');
      expect(request.uri, caseName('ParseUriCases', '0002')).assertEqual('app://todo');
      expect(request.keys.length, caseName('ParseUriCases', '0002')).assertEqual(2);
      expect(request.get('date'), caseName('ParseUriCases', '0002')).assertEqual('today');
      expect(request.get('filter'), caseName('ParseUriCases', '0002')).assertEqual('all');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0300
     * @tc.name      testParseUriCases0003
     * @tc.desc      Verify empty pairs are skipped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ParseUriCases', '0003'), 0, (): void => {
      const request: EntryRequest = parseUri('app://todo?a=1&&b=2&');
      expect(request.keys.length, caseName('ParseUriCases', '0003')).assertEqual(2);
      expect(request.get('a'), caseName('ParseUriCases', '0003')).assertEqual('1');
      expect(request.get('b'), caseName('ParseUriCases', '0003')).assertEqual('2');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0400
     * @tc.name      testParseUriCases0004
     * @tc.desc      Verify pairs without key are skipped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ParseUriCases', '0004'), 0, (): void => {
      const request: EntryRequest = parseUri('app://todo?novalue&=bare&ok=1');
      expect(request.keys.length, caseName('ParseUriCases', '0004')).assertEqual(1);
      expect(request.keys[0], caseName('ParseUriCases', '0004')).assertEqual('ok');
      expect(request.get('novalue'), caseName('ParseUriCases', '0004')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0500
     * @tc.name      testParseUriCases0005
     * @tc.desc      Verify values are decoded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ParseUriCases', '0005'), 0, (): void => {
      const request: EntryRequest = parseUri('app://note?tag=%E4%BE%BF%E7%AD%BE');
      expect(request.get('tag'), caseName('ParseUriCases', '0005')).assertEqual('便签');
      expect(request.get('tag').length, caseName('ParseUriCases', '0005')).assertEqual(2);
      expect(request.keys.length, caseName('ParseUriCases', '0005')).assertEqual(1);
      expect(request.keys[0], caseName('ParseUriCases', '0005')).assertEqual('tag');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0600
     * @tc.name      testParseUriCases0006
     * @tc.desc      Verify value may contain equals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ParseUriCases', '0006'), 0, (): void => {
      const request: EntryRequest = parseUri('app://note?expr=a=b=c');
      expect(request.get('expr'), caseName('ParseUriCases', '0006')).assertEqual('a=b=c');
      expect(request.keys.length, caseName('ParseUriCases', '0006')).assertEqual(1);
      expect(request.get('expr').split('=').length, caseName('ParseUriCases', '0006')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0700
     * @tc.name      testParseUriCases0007
     * @tc.desc      Verify launch request text joins pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ParseUriCases', '0007'), 0, (): void => {
      const request: EntryRequest = entryOf(EntrySource.SHORTCUT, 'shortcut://note/new');
      request.put('focus', 'true');
      expect(request.text(), caseName('ParseUriCases', '0007')).assertEqual('shortcut:shortcut://note/new?focus=true');
      expect(request.get('missing'), caseName('ParseUriCases', '0007')).assertEqual('');
      expect(entryOf(EntrySource.RESUME, 'resume://note').text(), caseName('ParseUriCases', '0007')).assertEqual(
        'resume:resume://note?');
    });
  });

  describe('ResolveEntryCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0100
     * @tc.name      testResolveEntryCases0001
     * @tc.desc      Verify shortcut uri hits exact rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0001'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.SHORTCUT, 'shortcut://note/new'));
      expect(plan.routeId, caseName('ResolveEntryCases', '0001')).assertEqual('sc.note.new');
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0001')).assertEqual('IN-01');
      expect(plan.fallback, caseName('ResolveEntryCases', '0001')).assertFalse();
      expect(plan.ok(), caseName('ResolveEntryCases', '0001')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0200
     * @tc.name      testResolveEntryCases0002
     * @tc.desc      Verify unknown shortcut falls back to rule center
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0002'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.SHORTCUT, 'shortcut://other'));
      expect(plan.routeId, caseName('ResolveEntryCases', '0002')).assertEqual('sc.rule.center');
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0002')).assertEqual('IN-18');
      expect(plan.fallback, caseName('ResolveEntryCases', '0002')).assertTrue();
      expect(plan.ok(), caseName('ResolveEntryCases', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0300
     * @tc.name      testResolveEntryCases0003
     * @tc.desc      Verify deeplink hits todo rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0003'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.DEEPLINK, 'app://todo'));
      expect(plan.routeId, caseName('ResolveEntryCases', '0003')).assertEqual('sc.todo.today');
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0003')).assertEqual('IN-06');
      expect(plan.fallback, caseName('ResolveEntryCases', '0003')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0400
     * @tc.name      testResolveEntryCases0004
     * @tc.desc      Verify unknown deeplink falls back to call log
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0004'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.DEEPLINK, 'app://nothing'));
      expect(plan.routeId, caseName('ResolveEntryCases', '0004')).assertEqual('sc.calls');
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0004')).assertEqual('IN-19');
      expect(plan.fallback, caseName('ResolveEntryCases', '0004')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0500
     * @tc.name      testResolveEntryCases0005
     * @tc.desc      Verify unknown source uses last resort
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0005'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.UNKNOWN, 'anything://at/all'));
      expect(plan.routeId, caseName('ResolveEntryCases', '0005')).assertEqual('sc.rule.center');
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0005')).assertEqual('IN-20');
      expect(plan.fallback, caseName('ResolveEntryCases', '0005')).assertTrue();
      expect(plan.ok(), caseName('ResolveEntryCases', '0005')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0600
     * @tc.name      testResolveEntryCases0006
     * @tc.desc      Verify widget uri hits note rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0006'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.WIDGET, 'widget://note'));
      expect(plan.routeId, caseName('ResolveEntryCases', '0006')).assertEqual('sc.note.new');
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0006')).assertEqual('IN-13');
      expect(plan.fallback, caseName('ResolveEntryCases', '0006')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0700
     * @tc.name      testResolveEntryCases0007
     * @tc.desc      Verify resume without draft is blocked
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0007'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.RESUME, 'resume://note'));
      expect(plan.routeId, caseName('ResolveEntryCases', '0007')).assertEqual('sc.note.resume');
      expect(plan.missing.length, caseName('ResolveEntryCases', '0007')).assertEqual(1);
      expect(plan.missing[0], caseName('ResolveEntryCases', '0007')).assertEqual('draftId');
      expect(plan.ok(), caseName('ResolveEntryCases', '0007')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0800
     * @tc.name      testResolveEntryCases0008
     * @tc.desc      Verify resume with draft passes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0008'), 0, (): void => {
      const request: EntryRequest = entryOf(EntrySource.RESUME, 'resume://note');
      request.put('draftId', 'd-9');
      const plan = resolveEntry(request);
      expect(plan.ok(), caseName('ResolveEntryCases', '0008')).assertTrue();
      expect(plan.issues.length, caseName('ResolveEntryCases', '0008')).assertEqual(0);
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0008')).assertEqual('IN-16');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_0900
     * @tc.name      testResolveEntryCases0009
     * @tc.desc      Verify notification without todo is blocked
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0009'), 0, (): void => {
      const request: EntryRequest = entryOf(EntrySource.NOTIFICATION, 'notify://todo');
      request.loggedIn = true;
      const plan = resolveEntry(request);
      expect(plan.missing[0], caseName('ResolveEntryCases', '0009')).assertEqual('todoId');
      expect(plan.issues.some((issue: string): boolean =>
        issue.indexOf('缺少参数：todoId') >= 0), caseName('ResolveEntryCases', '0009')).assertTrue();
      expect(plan.fallback, caseName('ResolveEntryCases', '0009')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1000
     * @tc.name      testResolveEntryCases0010
     * @tc.desc      Verify notification requires login
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0010'), 0, (): void => {
      const request: EntryRequest = entryOf(EntrySource.NOTIFICATION, 'notify://todo');
      request.put('todoId', 't-1');
      const plan = resolveEntry(request);
      expect(plan.issues.indexOf('需要登录后才能进入') >= 0, caseName('ResolveEntryCases', '0010')).assertTrue();
      expect(plan.missing.length, caseName('ResolveEntryCases', '0010')).assertEqual(0);
      expect(plan.ok(), caseName('ResolveEntryCases', '0010')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1100
     * @tc.name      testResolveEntryCases0011
     * @tc.desc      Verify notification with login and todo passes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0011'), 0, (): void => {
      const request: EntryRequest = entryOf(EntrySource.NOTIFICATION, 'notify://todo');
      request.loggedIn = true;
      request.put('todoId', 't-1');
      const plan = resolveEntry(request);
      expect(plan.ok(), caseName('ResolveEntryCases', '0011')).assertTrue();
      expect(plan.routeId, caseName('ResolveEntryCases', '0011')).assertEqual('sc.todo.detail');
      expect(plan.issues.length, caseName('ResolveEntryCases', '0011')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1200
     * @tc.name      testResolveEntryCases0012
     * @tc.desc      Verify extra keys are reported for parameterless rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0012'), 0, (): void => {
      const request: EntryRequest = entryOf(EntrySource.WIDGET, 'widget://note');
      request.put('unexpected', '1');
      const plan = resolveEntry(request);
      expect(plan.issues.length, caseName('ResolveEntryCases', '0012')).assertEqual(1);
      expect(plan.issues[0], caseName('ResolveEntryCases', '0012')).assertEqual('忽略多余参数：unexpected');
      expect(plan.ok(), caseName('ResolveEntryCases', '0012')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1300
     * @tc.name      testResolveEntryCases0013
     * @tc.desc      Verify extra keys are tolerated when rule has required keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0013'), 0, (): void => {
      const request: EntryRequest = entryOf(EntrySource.SHORTCUT, 'shortcut://detail');
      request.loggedIn = true;
      request.put('noteId', 'n-1');
      request.put('extra', '2');
      const plan = resolveEntry(request);
      expect(plan.issues.length, caseName('ResolveEntryCases', '0013')).assertEqual(0);
      expect(plan.ok(), caseName('ResolveEntryCases', '0013')).assertTrue();
      expect(plan.matchedRuleId, caseName('ResolveEntryCases', '0013')).assertEqual('IN-04');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1400
     * @tc.name      testResolveEntryCases0014
     * @tc.desc      Verify fallback flag uses priority threshold
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0014'), 0, (): void => {
      expect(ruleOf('IN-01')?.priority, caseName('ResolveEntryCases', '0014')).assertEqual(90);
      expect(ruleOf('IN-19')?.priority, caseName('ResolveEntryCases', '0014')).assertEqual(10);
      expect(ruleOf('IN-20')?.priority, caseName('ResolveEntryCases', '0014')).assertEqual(0);
      expect(resolveEntry(entryOf(EntrySource.DEEPLINK, 'app://rule')).fallback, caseName('ResolveEntryCases', '0014'))
        .assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1500
     * @tc.name      testResolveEntryCases0015
     * @tc.desc      Verify plan text explains ready state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ResolveEntryCases', '0015'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.SHORTCUT, 'shortcut://note/new'));
      expect(plan.text(), caseName('ResolveEntryCases', '0015')).assertEqual('sc.note.new｜可进入｜规则 IN-01｜精确');
      expect(plan.text().indexOf('需处理'), caseName('ResolveEntryCases', '0015')).assertEqual(-1);
      expect(plan.ok(), caseName('ResolveEntryCases', '0015')).assertTrue();
      expect(plan.fallback, caseName('ResolveEntryCases', '0015')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1600
     * @tc.name      testResolveEntryCases0016
     * @tc.desc      Verify plan text explains pending state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ResolveEntryCases', '0016'), 0, (): void => {
      const plan = resolveEntry(entryOf(EntrySource.RESUME, 'resume://note'));
      expect(plan.text(), caseName('ResolveEntryCases', '0016')).assertEqual('sc.note.resume｜需处理｜规则 IN-16｜精确');
      expect(plan.text().indexOf('可进入'), caseName('ResolveEntryCases', '0016')).assertEqual(-1);
      expect(plan.ok(), caseName('ResolveEntryCases', '0016')).assertFalse();
      expect(plan.missing.length > 0, caseName('ResolveEntryCases', '0016')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1700
     * @tc.name      testResolveEntryCases0017
     * @tc.desc      Verify plan text explains unresolved state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('ResolveEntryCases', '0017'), 0, (): void => {
      const plan = new EntryPlan();
      plan.issues.push('手工构造');
      expect(plan.text(), caseName('ResolveEntryCases', '0017')).assertEqual('未解析：手工构造');
      expect(plan.ok(), caseName('ResolveEntryCases', '0017')).assertFalse();
      plan.routeId = 'sc.detail';
      expect(plan.text().indexOf('需处理') >= 0, caseName('ResolveEntryCases', '0017')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1800
     * @tc.name      testResolveEntryCases0018
     * @tc.desc      Verify plan ok requires all three facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0018'), 0, (): void => {
      const plan = new EntryPlan();
      expect(plan.ok(), caseName('ResolveEntryCases', '0018')).assertFalse();
      plan.routeId = 'sc.detail';
      expect(plan.ok(), caseName('ResolveEntryCases', '0018')).assertTrue();
      plan.missing.push('noteId');
      expect(plan.ok(), caseName('ResolveEntryCases', '0018')).assertFalse();
      plan.missing = [];
      plan.issues.push('需要登录后才能进入');
      expect(plan.ok(), caseName('ResolveEntryCases', '0018')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEENTRYCASES_1900
     * @tc.name      testResolveEntryCases0019
     * @tc.desc      Verify matched rule is stable for repeated parse
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ResolveEntryCases', '0019'), 0, (): void => {
      const first = resolveEntry(entryOf(EntrySource.DEEPLINK, 'app://calls'));
      const second = resolveEntry(entryOf(EntrySource.DEEPLINK, 'app://calls'));
      expect(first.matchedRuleId, caseName('ResolveEntryCases', '0019')).assertEqual(second.matchedRuleId);
      expect(first.routeId, caseName('ResolveEntryCases', '0019')).assertEqual(second.routeId);
      expect(first.matchedRuleId, caseName('ResolveEntryCases', '0019')).assertEqual('IN-08');
    });
  });

  describe('EntryAuditCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ENTRYAUDITCASES_0100
     * @tc.name      testEntryAuditCases0001
     * @tc.desc      Verify launch table is self consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('EntryAuditCases', '0001'), 0, (): void => {
      const audit = auditEntry();
      expect(audit.ok, caseName('EntryAuditCases', '0001')).assertTrue();
      expect(audit.findings.length, caseName('EntryAuditCases', '0001')).assertEqual(0);
      expect(audit.summary(), caseName('EntryAuditCases', '0001')).assertEqual('入口规则表自洽');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYAUDITCASES_0200
     * @tc.name      testEntryAuditCases0002
     * @tc.desc      Verify every rule has route and description
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryAuditCases', '0002'), 0, (): void => {
      expect(ENTRY_RULES.every((rule: EntryRule): boolean =>
        rule.routeId.length > 0), caseName('EntryAuditCases', '0002')).assertTrue();
      expect(ENTRY_RULES.every((rule: EntryRule): boolean =>
        rule.description.length > 0), caseName('EntryAuditCases', '0002')).assertTrue();
      expect(ENTRY_RULES.every((rule: EntryRule): boolean =>
        rule.priority >= 0), caseName('EntryAuditCases', '0002')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYAUDITCASES_0300
     * @tc.name      testEntryAuditCases0003
     * @tc.desc      Verify fallback rules carry no required keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryAuditCases', '0003'), 0, (): void => {
      const offenders: EntryRule[] = ENTRY_RULES.filter((rule: EntryRule): boolean =>
        rule.requiredKeys.length > 0 && rule.priority <= 10);
      expect(offenders.length, caseName('EntryAuditCases', '0003')).assertEqual(0);
      expect(ENTRY_RULES.filter((rule: EntryRule): boolean =>
        rule.requiredKeys.length > 0).length, caseName('EntryAuditCases', '0003')).assertEqual(5);
      expect(ENTRY_RULES.length, caseName('EntryAuditCases', '0003')).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYAUDITCASES_0400
     * @tc.name      testEntryAuditCases0004
     * @tc.desc      Verify every source has at least one rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryAuditCases', '0004'), 0, (): void => {
      const counts: number[] = sourceCounts();
      expect(counts.every((count: number): boolean => count > 0), caseName('EntryAuditCases', '0004')).assertTrue();
      expect(counts.length, caseName('EntryAuditCases', '0004')).assertEqual(6);
      expect(counts.every((count: number): boolean => Math.floor(count) === count), caseName('EntryAuditCases', '0004')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYAUDITCASES_0500
     * @tc.name      testEntryAuditCases0005
     * @tc.desc      Verify source lines match counts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it(caseName('EntryAuditCases', '0005'), 0, (): void => {
      const lines: string[] = sourceLines();
      expect(lines.length, caseName('EntryAuditCases', '0005')).assertEqual(6);
      expect(lines.every((line: string): boolean => line.indexOf('条规则') > 0), caseName('EntryAuditCases', '0005')).assertTrue();
      expect(lines[0], caseName('EntryAuditCases', '0005')).assertEqual('桌面快捷方式：5 条规则');
      expect(lines[5], caseName('EntryAuditCases', '0005')).assertEqual('未知来源：1 条规则');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ENTRYAUDITCASES_0600
     * @tc.name      testEntryAuditCases0006
     * @tc.desc      Verify rule targets exist in route table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('EntryAuditCases', '0006'), 0, (): void => {
      const routeIdsInTable: string[] = routeIds();
      const dangling: string[] = ENTRY_RULES
        .filter((rule: EntryRule): boolean => routeIdsInTable.indexOf(rule.routeId) < 0)
        .map((rule: EntryRule): string => rule.ruleId);
      expect(dangling.length, caseName('EntryAuditCases', '0006')).assertEqual(0);
      expect(ENTRY_RULES.length, caseName('EntryAuditCases', '0006')).assertEqual(ruleIds().length);
      expect(routeIdsInTable.length > 0, caseName('EntryAuditCases', '0006')).assertTrue();
      expect(routeIdsInTable.indexOf(ENTRY_RULES[0].routeId) >= 0, caseName('EntryAuditCases', '0006')).assertTrue();
    });
  });
}
