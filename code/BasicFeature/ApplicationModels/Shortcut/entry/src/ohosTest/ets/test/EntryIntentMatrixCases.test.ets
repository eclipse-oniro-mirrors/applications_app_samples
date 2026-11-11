import { describe, expect, it } from '@ohos/hypium';
import {
  ParamKind, ROUTE_TABLE, RouteEntry, RoutePage, RouteParam, RouteRequest, auditRoutes, pageOf,
  resolveRoute, routeIds, routeLines, routeOf, routesOfPage
} from '../../../main/ets/business/EntryRoute';
import {
  INTENT_RULES, IntentPlan, IntentRequest, IntentRule, IntentSource, auditIntent, parseUri,
  resolveIntent, ruleIds, ruleLines, ruleOf, rulesOf, sourceCounts, sourceLabel, sourceLines
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

function intentOf(source: IntentSource, uri: string): IntentRequest {
  return new IntentRequest(source, uri);
}

export default function entryIntentMatrixCasesTest(): void {
  describe('RouteParamCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0100
     * @tc.name      testRouteParamCases0001
     * @tc.desc      Verify optional param accepts empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0001', 0, (): void => {
      const optional: RouteParam = new RouteParam('tag', ParamKind.TEXT, false, '');
      expect(optional.accepts('')).assertTrue();
      expect(optional.required).assertFalse();
      expect(optional.fallback).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0200
     * @tc.name      testRouteParamCases0002
     * @tc.desc      Verify required param rejects empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0002', 0, (): void => {
      const required: RouteParam = new RouteParam('noteId', ParamKind.ID, true, '');
      expect(required.accepts('')).assertFalse();
      expect(required.accepts('n-1')).assertTrue();
      expect(required.text()).assertEqual('noteId(id)必填');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0300
     * @tc.name      testRouteParamCases0003
     * @tc.desc      Verify number kind only accepts integer text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRouteParamCases0003', 0, (): void => {
      const number: RouteParam = new RouteParam('page', ParamKind.NUMBER, false, '0');
      expect(number.accepts('12')).assertTrue();
      expect(number.accepts('-3')).assertTrue();
      expect(number.accepts('1.5')).assertFalse();
      expect(number.accepts('1e3')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0400
     * @tc.name      testRouteParamCases0004
     * @tc.desc      Verify boolean kind only accepts two literals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0004', 0, (): void => {
      const flag: RouteParam = new RouteParam('focus', ParamKind.BOOLEAN, false, 'true');
      expect(flag.accepts('true')).assertTrue();
      expect(flag.accepts('false')).assertTrue();
      expect(flag.accepts('yes')).assertFalse();
      expect(flag.accepts('TRUE')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0500
     * @tc.name      testRouteParamCases0005
     * @tc.desc      Verify id kind rejects separators outside allow list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0005', 0, (): void => {
      const id: RouteParam = new RouteParam('noteId', ParamKind.ID, false, '');
      expect(id.accepts('note_1')).assertTrue();
      expect(id.accepts('a.b:c-d')).assertTrue();
      expect(id.accepts('bad id')).assertFalse();
      expect(id.accepts('便签')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0600
     * @tc.name      testRouteParamCases0006
     * @tc.desc      Verify text kind accepts any non empty value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0006', 0, (): void => {
      const text: RouteParam = new RouteParam('date', ParamKind.TEXT, false, 'today');
      expect(text.accepts('tomorrow')).assertTrue();
      expect(text.accepts('   ')).assertTrue();
      expect(text.accepts('a=b')).assertTrue();
      expect(text.kind).assertEqual(ParamKind.TEXT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0700
     * @tc.name      testRouteParamCases0007
     * @tc.desc      Verify coerce keeps legal value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0007', 0, (): void => {
      const kind: RouteParam = new RouteParam('sort', ParamKind.TEXT, false, 'recent');
      expect(kind.coerce('oldest')).assertEqual('oldest');
      expect(kind.coerce('oldest') === kind.fallback).assertFalse();
      expect(kind.name).assertEqual('sort');
      expect(kind.kind).assertEqual(ParamKind.TEXT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0800
     * @tc.name      testRouteParamCases0008
     * @tc.desc      Verify coerce falls back on illegal value
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0008', 0, (): void => {
      const flag: RouteParam = new RouteParam('focus', ParamKind.BOOLEAN, false, 'true');
      expect(flag.coerce('yes')).assertEqual('true');
      expect(flag.coerce('0')).assertEqual('true');
      expect(flag.coerce('false')).assertEqual('false');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_0900
     * @tc.name      testRouteParamCases0009
     * @tc.desc      Verify empty value is not replaced by fallback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteParamCases0009', 0, (): void => {
      const kind: RouteParam = new RouteParam('sort', ParamKind.TEXT, false, 'recent');
      expect(kind.coerce('')).assertEqual('');
      expect(kind.coerce('') === 'recent').assertFalse();
      expect(kind.fallback).assertEqual('recent');
      expect(kind.required).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEPARAMCASES_1000
     * @tc.name      testRouteParamCases0010
     * @tc.desc      Verify param text marks optional
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRouteParamCases0010', 0, (): void => {
      const optional: RouteParam = new RouteParam('draftId', ParamKind.ID, false, '');
      const required: RouteParam = new RouteParam('draftId', ParamKind.ID, true, '');
      expect(optional.text()).assertEqual('draftId(id)选填');
      expect(required.text()).assertEqual('draftId(id)必填');
      expect(optional.text() === required.text()).assertFalse();
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

    it('testRouteEntryCases0001', 0, (): void => {
      const entry: RouteEntry | undefined = routeOf('sc.todo.today');
      expect(entry !== undefined).assertTrue();
      const param: RouteParam | undefined = entry?.paramOf('filter');
      expect(param !== undefined).assertTrue();
      expect(param?.fallback).assertEqual('all');
      expect(param?.kind).assertEqual(ParamKind.TEXT);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0200
     * @tc.name      testRouteEntryCases0002
     * @tc.desc      Verify param of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteEntryCases0002', 0, (): void => {
      const entry: RouteEntry | undefined = routeOf('sc.rule.center');
      expect(entry !== undefined).assertTrue();
      expect(entry?.paramOf('anything') === undefined).assertTrue();
      expect(entry?.params.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0300
     * @tc.name      testRouteEntryCases0003
     * @tc.desc      Verify entry text lists params
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRouteEntryCases0003', 0, (): void => {
      const entry: RouteEntry = routeEntryOf('sc.note.new');
      expect(entry.text()).assertEqual('sc.note.new -> note｜draftId,focus｜免登录');
      expect(entry.text().indexOf('无参数')).assertEqual(-1);
      expect(entry.routeId).assertEqual('sc.note.new');
      expect(entry.params.length).assertEqual(2);
      expect(entry.requiresLogin).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0400
     * @tc.name      testRouteEntryCases0004
     * @tc.desc      Verify entry text marks parameterless route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRouteEntryCases0004', 0, (): void => {
      const entry: RouteEntry = routeEntryOf('sc.rule.center');
      expect(entry.text()).assertEqual('sc.rule.center -> ruleCenter｜无参数｜免登录');
      expect(entry.text().indexOf('无参数') >= 0).assertTrue();
      expect(entry.params.length).assertEqual(0);
      expect(entry.text().split('｜').length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0500
     * @tc.name      testRouteEntryCases0005
     * @tc.desc      Verify entry text marks login requirement
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRouteEntryCases0005', 0, (): void => {
      const entry: RouteEntry = routeEntryOf('sc.detail');
      expect(entry.text()).assertEqual('sc.detail -> detail｜noteId｜需登录');
      expect(entry.requiresLogin).assertTrue();
      expect(entry.text().indexOf('需登录') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0600
     * @tc.name      testRouteEntryCases0006
     * @tc.desc      Verify route table is unique and complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteEntryCases0006', 0, (): void => {
      const ids: string[] = routeIds();
      expect(ids.length).assertEqual(8);
      const unique: string[] = ids.filter((id: string, index: number): boolean =>
        ids.indexOf(id) === index);
      expect(unique.length).assertEqual(8);
      expect(ROUTE_TABLE.length).assertEqual(ids.length);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0700
     * @tc.name      testRouteEntryCases0007
     * @tc.desc      Verify route ids cover declared shortcuts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteEntryCases0007', 0, (): void => {
      const ids: string[] = routeIds();
      expect(ids.indexOf('sc.note.new') >= 0).assertTrue();
      expect(ids.indexOf('sc.todo.detail') >= 0).assertTrue();
      expect(ids.indexOf('sc.note.resume') >= 0).assertTrue();
      expect(ids.indexOf('sc.missing') >= 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0800
     * @tc.name      testRouteEntryCases0008
     * @tc.desc      Verify page of unknown falls back home
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteEntryCases0008', 0, (): void => {
      expect(pageOf('sc.detail')).assertEqual(RoutePage.DETAIL);
      expect(pageOf('sc.todo.detail')).assertEqual(RoutePage.DETAIL);
      expect(pageOf('sc.unknown')).assertEqual(RoutePage.HOME);
      expect(pageOf('')).assertEqual(RoutePage.HOME);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_0900
     * @tc.name      testRouteEntryCases0009
     * @tc.desc      Verify routes of page groups targets
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteEntryCases0009', 0, (): void => {
      const note: string[] = routesOfPage(RoutePage.NOTE);
      expect(note.length).assertEqual(2);
      expect(note.indexOf('sc.note.new') >= 0).assertTrue();
      expect(note.indexOf('sc.note.resume') >= 0).assertTrue();
      expect(routesOfPage(RoutePage.HOME).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEENTRYCASES_1000
     * @tc.name      testRouteEntryCases0010
     * @tc.desc      Verify detail routes are two
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteEntryCases0010', 0, (): void => {
      const detail: string[] = routesOfPage(RoutePage.DETAIL);
      expect(detail.length).assertEqual(2);
      expect(detail.indexOf('sc.detail') >= 0).assertTrue();
      expect(detail.indexOf('sc.todo.detail') >= 0).assertTrue();
      expect(routesOfPage(RoutePage.RULE_CENTER).length).assertEqual(1);
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

    it('testResolveRouteCases0001', 0, (): void => {
      const result = resolveRoute(requestOf('sc.nope', 0));
      expect(result.ok).assertFalse();
      expect(result.page).assertEqual(RoutePage.HOME);
      expect(result.issues[0].indexOf('未知路由') >= 0).assertTrue();
      expect(result.entry === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0200
     * @tc.name      testResolveRouteCases0002
     * @tc.desc      Verify optional params resolve empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0002', 0, (): void => {
      const result = resolveRoute(requestOf('sc.note.new', 0));
      expect(result.ok).assertTrue();
      expect(result.page).assertEqual(RoutePage.NOTE);
      expect(result.keys.length).assertEqual(2);
      expect(result.get('draftId')).assertEqual('');
      expect(result.get('focus')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0300
     * @tc.name      testResolveRouteCases0003
     * @tc.desc      Verify parameterless route resolves clean
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0003', 0, (): void => {
      const result = resolveRoute(requestOf('sc.rule.center', 0));
      expect(result.ok).assertTrue();
      expect(result.page).assertEqual(RoutePage.RULE_CENTER);
      expect(result.keys.length).assertEqual(0);
      expect(result.issues.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0400
     * @tc.name      testResolveRouteCases0004
     * @tc.desc      Verify missing required param blocks entry
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0004', 0, (): void => {
      const request: RouteRequest = requestOf('sc.detail', 0);
      request.loggedIn = true;
      const result = resolveRoute(request);
      expect(result.ok).assertFalse();
      expect(result.missing.length).assertEqual(1);
      expect(result.missing[0]).assertEqual('noteId');
      expect(result.issues[0].indexOf('缺少必填参数') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0500
     * @tc.name      testResolveRouteCases0005
     * @tc.desc      Verify login gate stops before params
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0005', 0, (): void => {
      const result = resolveRoute(requestOf('sc.detail', 0));
      expect(result.ok).assertFalse();
      expect(result.issues[0]).assertEqual('需要登录后才能进入');
      expect(result.keys.length).assertEqual(0);
      expect(result.missing.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0600
     * @tc.name      testResolveRouteCases0006
     * @tc.desc      Verify logged in detail resolves
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0006', 0, (): void => {
      const request: RouteRequest = requestOf('sc.detail', 0);
      request.loggedIn = true;
      request.put('noteId', 'note-1');
      const result = resolveRoute(request);
      expect(result.ok).assertTrue();
      expect(result.get('noteId')).assertEqual('note-1');
      expect(result.page).assertEqual(RoutePage.DETAIL);
      expect(result.expired).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0700
     * @tc.name      testResolveRouteCases0007
     * @tc.desc      Verify illegal value is reported and coerced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0007', 0, (): void => {
      const request: RouteRequest = requestOf('sc.detail', 0);
      request.loggedIn = true;
      request.put('noteId', 'bad id');
      const result = resolveRoute(request);
      expect(result.ok).assertFalse();
      expect(result.issues.some((issue: string): boolean =>
        issue.indexOf('参数取值非法：noteId') >= 0)).assertTrue();
      expect(result.get('noteId')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0800
     * @tc.name      testResolveRouteCases0008
     * @tc.desc      Verify illegal boolean falls back to default
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0008', 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.new', 0);
      request.put('focus', 'yes');
      const result = resolveRoute(request);
      expect(result.get('focus')).assertEqual('true');
      expect(result.ok).assertFalse();
      expect(result.issues.some((issue: string): boolean =>
        issue.indexOf('参数取值非法：focus') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_0900
     * @tc.name      testResolveRouteCases0009
     * @tc.desc      Verify unknown param is ignored without blocking
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0009', 0, (): void => {
      const request: RouteRequest = requestOf('sc.rule.center', 0);
      request.put('extra', '1');
      const result = resolveRoute(request);
      expect(result.ok).assertTrue();
      expect(result.issues.length).assertEqual(1);
      expect(result.issues[0]).assertEqual('忽略未知参数：extra');
      expect(result.keys.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1000
     * @tc.name      testResolveRouteCases0010
     * @tc.desc      Verify multiple unknown params are all listed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0010', 0, (): void => {
      const request: RouteRequest = requestOf('sc.activity', 0);
      request.put('a', '1');
      request.put('b', '2');
      const result = resolveRoute(request);
      expect(result.issues.length).assertEqual(2);
      expect(result.ok).assertTrue();
      expect(result.get('range')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1100
     * @tc.name      testResolveRouteCases0011
     * @tc.desc      Verify resolution text explains success
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testResolveRouteCases0011', 0, (): void => {
      const result = resolveRoute(requestOf('sc.note.new', 0));
      expect(result.text()).assertEqual('-> note｜2 个参数｜有效');
      expect(result.text().indexOf('未解析')).assertEqual(-1);
      expect(result.ok).assertTrue();
      expect(result.issues.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1200
     * @tc.name      testResolveRouteCases0012
     * @tc.desc      Verify resolution text explains failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testResolveRouteCases0012', 0, (): void => {
      const result = resolveRoute(requestOf('sc.unknown', 0));
      expect(result.text().indexOf('未解析：未知路由') >= 0).assertTrue();
      expect(result.text().indexOf('sc.unknown') >= 0).assertTrue();
      expect(result.text().indexOf('个参数')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1300
     * @tc.name      testResolveRouteCases0013
     * @tc.desc      Verify stale entry is marked expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0013', 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.resume', Date.now() - 700000);
      request.put('draftId', 'd-1');
      const result = resolveRoute(request);
      expect(result.expired).assertTrue();
      expect(result.ok).assertTrue();
      expect(result.text().indexOf('已过期') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1400
     * @tc.name      testResolveRouteCases0014
     * @tc.desc      Verify fresh entry is not expired
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0014', 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.resume', Date.now() - 1000);
      request.put('draftId', 'd-1');
      const result = resolveRoute(request);
      expect(result.expired).assertFalse();
      expect(result.text().indexOf('有效') >= 0).assertTrue();
      expect(result.ok).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1500
     * @tc.name      testResolveRouteCases0015
     * @tc.desc      Verify zero timestamp skips expiry check
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0015', 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.resume', 0);
      request.put('draftId', 'd-1');
      const result = resolveRoute(request);
      expect(result.expired).assertFalse();
      expect(result.ok).assertTrue();
      expect(request.get('draftId')).assertEqual('d-1');
      expect(request.keys.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1600
     * @tc.name      testResolveRouteCases0016
     * @tc.desc      Verify request put overwrites in place
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveRouteCases0016', 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.new', 0);
      request.put('focus', 'false');
      request.put('focus', 'true');
      expect(request.keys.length).assertEqual(1);
      expect(request.get('focus')).assertEqual('true');
      expect(request.get('missing')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEROUTECASES_1700
     * @tc.name      testResolveRouteCases0017
     * @tc.desc      Verify request text joins pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testResolveRouteCases0017', 0, (): void => {
      const request: RouteRequest = requestOf('sc.note.new', 0);
      request.put('draftId', 'd-1');
      request.put('focus', 'true');
      expect(request.text()).assertEqual('sc.note.new?draftId=d-1&focus=true');
      expect(requestOf('sc.rule.center', 0).text()).assertEqual('sc.rule.center?');
      expect(request.keys.length).assertEqual(2);
      expect(requestOf('sc.rule.center', 0).keys.length).assertEqual(0);
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

    it('testRouteAuditCases0001', 0, (): void => {
      const audit = auditRoutes();
      expect(audit.ok).assertTrue();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.summary()).assertEqual('路由表自洽');
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEAUDITCASES_0200
     * @tc.name      testRouteAuditCases0002
     * @tc.desc      Verify route lines match table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testRouteAuditCases0002', 0, (): void => {
      const lines: string[] = routeLines();
      expect(lines.length).assertEqual(ROUTE_TABLE.length);
      expect(lines.every((line: string): boolean => line.indexOf('｜') > 0)).assertTrue();
      expect(lines[0].indexOf('sc.note.new') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEAUDITCASES_0300
     * @tc.name      testRouteAuditCases0003
     * @tc.desc      Verify every route has description
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteAuditCases0003', 0, (): void => {
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean =>
        entry.description.length > 0)).assertTrue();
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean =>
        entry.page !== RoutePage.UNKNOWN)).assertTrue();
      expect(ROUTE_TABLE.every((entry: RouteEntry): boolean =>
        entry.maxAgeMs >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_ROUTEAUDITCASES_0400
     * @tc.name      testRouteAuditCases0004
     * @tc.desc      Verify required params carry no usable fallback
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRouteAuditCases0004', 0, (): void => {
      const offenders: string[] = [];
      ROUTE_TABLE.forEach((entry: RouteEntry): void => {
        entry.params.forEach((param: RouteParam): void => {
          if (param.required && param.fallback.length > 0 && param.accepts(param.fallback)) {
            offenders.push(`${entry.routeId}.${param.name}`);
          }
        });
      });
      expect(offenders.length).assertEqual(0);
      expect(ROUTE_TABLE.some((entry: RouteEntry): boolean =>
        entry.params.some((param: RouteParam): boolean => param.required))).assertTrue();
      expect(ROUTE_TABLE.length > 0).assertTrue();
      expect(ROUTE_TABLE[0].routeId.length > 0).assertTrue();
    });
  });

  describe('IntentRuleCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0100
     * @tc.name      testIntentRuleCases0001
     * @tc.desc      Verify source labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testIntentRuleCases0001', 0, (): void => {
      const labels: string[] = [
        sourceLabel(IntentSource.SHORTCUT), sourceLabel(IntentSource.DEEPLINK),
        sourceLabel(IntentSource.NOTIFICATION), sourceLabel(IntentSource.WIDGET),
        sourceLabel(IntentSource.RESUME), sourceLabel(IntentSource.UNKNOWN)
      ];
      expect(labels[0]).assertEqual('桌面快捷方式');
      expect(labels[1]).assertEqual('深链');
      expect(labels[2]).assertEqual('通知');
      expect(labels[3]).assertEqual('小组件');
      expect(labels[4]).assertEqual('进程恢复');
      expect(labels[5]).assertEqual('未知来源');
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0200
     * @tc.name      testIntentRuleCases0002
     * @tc.desc      Verify empty prefix matches every uri
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentRuleCases0002', 0, (): void => {
      const fallback: IntentRule | undefined = ruleOf('IN-18');
      expect(fallback?.prefix).assertEqual('');
      expect(fallback?.matchesUri('')).assertTrue();
      expect(fallback?.matchesUri('shortcut://whatever')).assertTrue();
      expect(fallback?.matchesUri('app://note')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0300
     * @tc.name      testIntentRuleCases0003
     * @tc.desc      Verify prefix match is anchored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentRuleCases0003', 0, (): void => {
      const rule: IntentRule | undefined = ruleOf('IN-01');
      expect(rule?.matchesUri('shortcut://note/new')).assertTrue();
      expect(rule?.matchesUri('shortcut://note/new?focus=true')).assertTrue();
      expect(rule?.matchesUri('xshortcut://note/new')).assertFalse();
      expect(rule?.matchesUri('shortcut://note/old')).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0400
     * @tc.name      testIntentRuleCases0004
     * @tc.desc      Verify rule text shows priority
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testIntentRuleCases0004', 0, (): void => {
      expect(ruleOf('IN-01')?.text()).assertEqual(
        'IN-01 桌面快捷方式｜shortcut://note/new -> sc.note.new｜优先级 90');
      expect(ruleOf('IN-18')?.text()).assertEqual(
        'IN-18 桌面快捷方式｜* -> sc.rule.center｜优先级 10');
      expect(ruleOf('IN-01') === undefined).assertFalse();
      expect(ruleOf('IN-18')?.priority).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0500
     * @tc.name      testIntentRuleCases0005
     * @tc.desc      Verify rule ids are sequential
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testIntentRuleCases0005', 0, (): void => {
      const ids: string[] = ruleIds();
      expect(ids.length).assertEqual(20);
      expect(ids[0]).assertEqual('IN-01');
      expect(ids[19]).assertEqual('IN-20');
      expect(ids.every((id: string, index: number): boolean =>
        id === `IN-${(index + 1).toString().padStart(2, '0')}`)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0600
     * @tc.name      testIntentRuleCases0006
     * @tc.desc      Verify rule of miss returns undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentRuleCases0006', 0, (): void => {
      expect(ruleOf('IN-20')?.routeId).assertEqual('sc.rule.center');
      expect(ruleOf('IN-99') === undefined).assertTrue();
      expect(ruleOf('') === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0700
     * @tc.name      testIntentRuleCases0007
     * @tc.desc      Verify shortcut source has five rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentRuleCases0007', 0, (): void => {
      const shortcut: IntentRule[] = rulesOf(IntentSource.SHORTCUT);
      expect(shortcut.length).assertEqual(5);
      expect(shortcut.every((rule: IntentRule): boolean =>
        rule.source === IntentSource.SHORTCUT)).assertTrue();
      expect(shortcut.some((rule: IntentRule): boolean => rule.ruleId === 'IN-18')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0800
     * @tc.name      testIntentRuleCases0008
     * @tc.desc      Verify deeplink source has six rules
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentRuleCases0008', 0, (): void => {
      const deeplink: IntentRule[] = rulesOf(IntentSource.DEEPLINK);
      expect(deeplink.length).assertEqual(6);
      expect(deeplink.filter((rule: IntentRule): boolean =>
        rule.priority === 80).length).assertEqual(5);
      expect(deeplink.some((rule: IntentRule): boolean => rule.ruleId === 'IN-19')).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_0900
     * @tc.name      testIntentRuleCases0009
     * @tc.desc      Verify other sources have expected counts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentRuleCases0009', 0, (): void => {
      expect(rulesOf(IntentSource.NOTIFICATION).length).assertEqual(3);
      expect(rulesOf(IntentSource.WIDGET).length).assertEqual(3);
      expect(rulesOf(IntentSource.RESUME).length).assertEqual(2);
      expect(rulesOf(IntentSource.UNKNOWN).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_1000
     * @tc.name      testIntentRuleCases0010
     * @tc.desc      Verify rule lines match rule table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testIntentRuleCases0010', 0, (): void => {
      const lines: string[] = ruleLines();
      expect(lines.length).assertEqual(INTENT_RULES.length);
      expect(lines.every((line: string): boolean => line.indexOf('优先级') > 0)).assertTrue();
      expect(lines[0].indexOf('IN-01') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTRULECASES_1100
     * @tc.name      testIntentRuleCases0011
     * @tc.desc      Verify source counts are ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentRuleCases0011', 0, (): void => {
      const counts: number[] = sourceCounts();
      expect(counts.length).assertEqual(6);
      expect(counts[0]).assertEqual(5);
      expect(counts[1]).assertEqual(6);
      expect(counts[5]).assertEqual(1);
      expect(counts.reduce((sum: number, item: number): number => sum + item, 0))
        .assertEqual(INTENT_RULES.length);
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

    it('testParseUriCases0001', 0, (): void => {
      const request: IntentRequest = parseUri('shortcut://note/new');
      expect(request.uri).assertEqual('shortcut://note/new');
      expect(request.keys.length).assertEqual(0);
      expect(request.source).assertEqual(IntentSource.UNKNOWN);
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0200
     * @tc.name      testParseUriCases0002
     * @tc.desc      Verify uri splits into pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testParseUriCases0002', 0, (): void => {
      const request: IntentRequest = parseUri('app://todo?date=today&filter=all');
      expect(request.uri).assertEqual('app://todo');
      expect(request.keys.length).assertEqual(2);
      expect(request.get('date')).assertEqual('today');
      expect(request.get('filter')).assertEqual('all');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0300
     * @tc.name      testParseUriCases0003
     * @tc.desc      Verify empty pairs are skipped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testParseUriCases0003', 0, (): void => {
      const request: IntentRequest = parseUri('app://todo?a=1&&b=2&');
      expect(request.keys.length).assertEqual(2);
      expect(request.get('a')).assertEqual('1');
      expect(request.get('b')).assertEqual('2');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0400
     * @tc.name      testParseUriCases0004
     * @tc.desc      Verify pairs without key are skipped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testParseUriCases0004', 0, (): void => {
      const request: IntentRequest = parseUri('app://todo?novalue&=bare&ok=1');
      expect(request.keys.length).assertEqual(1);
      expect(request.keys[0]).assertEqual('ok');
      expect(request.get('novalue')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0500
     * @tc.name      testParseUriCases0005
     * @tc.desc      Verify values are decoded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testParseUriCases0005', 0, (): void => {
      const request: IntentRequest = parseUri('app://note?tag=%E4%BE%BF%E7%AD%BE');
      expect(request.get('tag')).assertEqual('便签');
      expect(request.get('tag').length).assertEqual(2);
      expect(request.keys.length).assertEqual(1);
      expect(request.keys[0]).assertEqual('tag');
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0600
     * @tc.name      testParseUriCases0006
     * @tc.desc      Verify value may contain equals
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testParseUriCases0006', 0, (): void => {
      const request: IntentRequest = parseUri('app://note?expr=a=b=c');
      expect(request.get('expr')).assertEqual('a=b=c');
      expect(request.keys.length).assertEqual(1);
      expect(request.get('expr').split('=').length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SHORTCUT_PARSEURICASES_0700
     * @tc.name      testParseUriCases0007
     * @tc.desc      Verify launch request text joins pairs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testParseUriCases0007', 0, (): void => {
      const request: IntentRequest = intentOf(IntentSource.SHORTCUT, 'shortcut://note/new');
      request.put('focus', 'true');
      expect(request.text()).assertEqual('shortcut:shortcut://note/new?focus=true');
      expect(request.get('missing')).assertEqual('');
      expect(intentOf(IntentSource.RESUME, 'resume://note').text()).assertEqual(
        'resume:resume://note?');
    });
  });

  describe('ResolveIntentCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0100
     * @tc.name      testResolveIntentCases0001
     * @tc.desc      Verify shortcut uri hits exact rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0001', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.SHORTCUT, 'shortcut://note/new'));
      expect(plan.routeId).assertEqual('sc.note.new');
      expect(plan.matchedRuleId).assertEqual('IN-01');
      expect(plan.fallback).assertFalse();
      expect(plan.ok()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0200
     * @tc.name      testResolveIntentCases0002
     * @tc.desc      Verify unknown shortcut falls back to rule center
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0002', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.SHORTCUT, 'shortcut://other'));
      expect(plan.routeId).assertEqual('sc.rule.center');
      expect(plan.matchedRuleId).assertEqual('IN-18');
      expect(plan.fallback).assertTrue();
      expect(plan.ok()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0300
     * @tc.name      testResolveIntentCases0003
     * @tc.desc      Verify deeplink hits todo rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0003', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.DEEPLINK, 'app://todo'));
      expect(plan.routeId).assertEqual('sc.todo.today');
      expect(plan.matchedRuleId).assertEqual('IN-06');
      expect(plan.fallback).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0400
     * @tc.name      testResolveIntentCases0004
     * @tc.desc      Verify unknown deeplink falls back to activity
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0004', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.DEEPLINK, 'app://nothing'));
      expect(plan.routeId).assertEqual('sc.activity');
      expect(plan.matchedRuleId).assertEqual('IN-19');
      expect(plan.fallback).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0500
     * @tc.name      testResolveIntentCases0005
     * @tc.desc      Verify unknown source uses last resort
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0005', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.UNKNOWN, 'anything://at/all'));
      expect(plan.routeId).assertEqual('sc.rule.center');
      expect(plan.matchedRuleId).assertEqual('IN-20');
      expect(plan.fallback).assertTrue();
      expect(plan.ok()).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0600
     * @tc.name      testResolveIntentCases0006
     * @tc.desc      Verify widget uri hits note rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0006', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.WIDGET, 'widget://note'));
      expect(plan.routeId).assertEqual('sc.note.new');
      expect(plan.matchedRuleId).assertEqual('IN-13');
      expect(plan.fallback).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0700
     * @tc.name      testResolveIntentCases0007
     * @tc.desc      Verify resume without draft is blocked
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0007', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.RESUME, 'resume://note'));
      expect(plan.routeId).assertEqual('sc.note.resume');
      expect(plan.missing.length).assertEqual(1);
      expect(plan.missing[0]).assertEqual('draftId');
      expect(plan.ok()).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0800
     * @tc.name      testResolveIntentCases0008
     * @tc.desc      Verify resume with draft passes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0008', 0, (): void => {
      const request: IntentRequest = intentOf(IntentSource.RESUME, 'resume://note');
      request.put('draftId', 'd-9');
      const plan = resolveIntent(request);
      expect(plan.ok()).assertTrue();
      expect(plan.issues.length).assertEqual(0);
      expect(plan.matchedRuleId).assertEqual('IN-16');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_0900
     * @tc.name      testResolveIntentCases0009
     * @tc.desc      Verify notification without todo is blocked
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0009', 0, (): void => {
      const request: IntentRequest = intentOf(IntentSource.NOTIFICATION, 'notify://todo');
      request.loggedIn = true;
      const plan = resolveIntent(request);
      expect(plan.missing[0]).assertEqual('todoId');
      expect(plan.issues.some((issue: string): boolean =>
        issue.indexOf('缺少参数：todoId') >= 0)).assertTrue();
      expect(plan.fallback).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1000
     * @tc.name      testResolveIntentCases0010
     * @tc.desc      Verify notification requires login
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0010', 0, (): void => {
      const request: IntentRequest = intentOf(IntentSource.NOTIFICATION, 'notify://todo');
      request.put('todoId', 't-1');
      const plan = resolveIntent(request);
      expect(plan.issues.indexOf('需要登录后才能进入') >= 0).assertTrue();
      expect(plan.missing.length).assertEqual(0);
      expect(plan.ok()).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1100
     * @tc.name      testResolveIntentCases0011
     * @tc.desc      Verify notification with login and todo passes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0011', 0, (): void => {
      const request: IntentRequest = intentOf(IntentSource.NOTIFICATION, 'notify://todo');
      request.loggedIn = true;
      request.put('todoId', 't-1');
      const plan = resolveIntent(request);
      expect(plan.ok()).assertTrue();
      expect(plan.routeId).assertEqual('sc.todo.detail');
      expect(plan.issues.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1200
     * @tc.name      testResolveIntentCases0012
     * @tc.desc      Verify extra keys are reported for parameterless rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0012', 0, (): void => {
      const request: IntentRequest = intentOf(IntentSource.WIDGET, 'widget://note');
      request.put('unexpected', '1');
      const plan = resolveIntent(request);
      expect(plan.issues.length).assertEqual(1);
      expect(plan.issues[0]).assertEqual('忽略多余参数：unexpected');
      expect(plan.ok()).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1300
     * @tc.name      testResolveIntentCases0013
     * @tc.desc      Verify extra keys are tolerated when rule has required keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0013', 0, (): void => {
      const request: IntentRequest = intentOf(IntentSource.SHORTCUT, 'shortcut://detail');
      request.loggedIn = true;
      request.put('noteId', 'n-1');
      request.put('extra', '2');
      const plan = resolveIntent(request);
      expect(plan.issues.length).assertEqual(0);
      expect(plan.ok()).assertTrue();
      expect(plan.matchedRuleId).assertEqual('IN-04');
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1400
     * @tc.name      testResolveIntentCases0014
     * @tc.desc      Verify fallback flag uses priority threshold
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0014', 0, (): void => {
      expect(ruleOf('IN-01')?.priority).assertEqual(90);
      expect(ruleOf('IN-19')?.priority).assertEqual(10);
      expect(ruleOf('IN-20')?.priority).assertEqual(0);
      expect(resolveIntent(intentOf(IntentSource.DEEPLINK, 'app://rule')).fallback)
        .assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1500
     * @tc.name      testResolveIntentCases0015
     * @tc.desc      Verify plan text explains ready state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testResolveIntentCases0015', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.SHORTCUT, 'shortcut://note/new'));
      expect(plan.text()).assertEqual('sc.note.new｜可进入｜规则 IN-01｜精确');
      expect(plan.text().indexOf('需处理')).assertEqual(-1);
      expect(plan.ok()).assertTrue();
      expect(plan.fallback).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1600
     * @tc.name      testResolveIntentCases0016
     * @tc.desc      Verify plan text explains pending state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testResolveIntentCases0016', 0, (): void => {
      const plan = resolveIntent(intentOf(IntentSource.RESUME, 'resume://note'));
      expect(plan.text()).assertEqual('sc.note.resume｜需处理｜规则 IN-16｜精确');
      expect(plan.text().indexOf('可进入')).assertEqual(-1);
      expect(plan.ok()).assertFalse();
      expect(plan.missing.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1700
     * @tc.name      testResolveIntentCases0017
     * @tc.desc      Verify plan text explains unresolved state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testResolveIntentCases0017', 0, (): void => {
      const plan = new IntentPlan();
      plan.issues.push('手工构造');
      expect(plan.text()).assertEqual('未解析：手工构造');
      expect(plan.ok()).assertFalse();
      plan.routeId = 'sc.detail';
      expect(plan.text().indexOf('需处理') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1800
     * @tc.name      testResolveIntentCases0018
     * @tc.desc      Verify plan ok requires all three facts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0018', 0, (): void => {
      const plan = new IntentPlan();
      expect(plan.ok()).assertFalse();
      plan.routeId = 'sc.detail';
      expect(plan.ok()).assertTrue();
      plan.missing.push('noteId');
      expect(plan.ok()).assertFalse();
      plan.missing = [];
      plan.issues.push('需要登录后才能进入');
      expect(plan.ok()).assertFalse();
    });

    /**
     * @tc.number    SUB_SHORTCUT_RESOLVEINTENTCASES_1900
     * @tc.name      testResolveIntentCases0019
     * @tc.desc      Verify matched rule is stable for repeated parse
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testResolveIntentCases0019', 0, (): void => {
      const first = resolveIntent(intentOf(IntentSource.DEEPLINK, 'app://activity'));
      const second = resolveIntent(intentOf(IntentSource.DEEPLINK, 'app://activity'));
      expect(first.matchedRuleId).assertEqual(second.matchedRuleId);
      expect(first.routeId).assertEqual(second.routeId);
      expect(first.matchedRuleId).assertEqual('IN-08');
    });
  });

  describe('IntentAuditCases', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_INTENTAUDITCASES_0100
     * @tc.name      testIntentAuditCases0001
     * @tc.desc      Verify launch table is self consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testIntentAuditCases0001', 0, (): void => {
      const audit = auditIntent();
      expect(audit.ok).assertTrue();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.summary()).assertEqual('入口规则表自洽');
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTAUDITCASES_0200
     * @tc.name      testIntentAuditCases0002
     * @tc.desc      Verify every rule has route and description
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentAuditCases0002', 0, (): void => {
      expect(INTENT_RULES.every((rule: IntentRule): boolean =>
        rule.routeId.length > 0)).assertTrue();
      expect(INTENT_RULES.every((rule: IntentRule): boolean =>
        rule.description.length > 0)).assertTrue();
      expect(INTENT_RULES.every((rule: IntentRule): boolean =>
        rule.priority >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTAUDITCASES_0300
     * @tc.name      testIntentAuditCases0003
     * @tc.desc      Verify fallback rules carry no required keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentAuditCases0003', 0, (): void => {
      const offenders: IntentRule[] = INTENT_RULES.filter((rule: IntentRule): boolean =>
        rule.requiredKeys.length > 0 && rule.priority <= 10);
      expect(offenders.length).assertEqual(0);
      expect(INTENT_RULES.filter((rule: IntentRule): boolean =>
        rule.requiredKeys.length > 0).length).assertEqual(5);
      expect(INTENT_RULES.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTAUDITCASES_0400
     * @tc.name      testIntentAuditCases0004
     * @tc.desc      Verify every source has at least one rule
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentAuditCases0004', 0, (): void => {
      const counts: number[] = sourceCounts();
      expect(counts.every((count: number): boolean => count > 0)).assertTrue();
      expect(counts.length).assertEqual(6);
      expect(counts.every((count: number): boolean => Math.floor(count) === count)).assertTrue();
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTAUDITCASES_0500
     * @tc.name      testIntentAuditCases0005
     * @tc.desc      Verify source lines match counts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testIntentAuditCases0005', 0, (): void => {
      const lines: string[] = sourceLines();
      expect(lines.length).assertEqual(6);
      expect(lines.every((line: string): boolean => line.indexOf('条规则') > 0)).assertTrue();
      expect(lines[0]).assertEqual('桌面快捷方式：5 条规则');
      expect(lines[5]).assertEqual('未知来源：1 条规则');
    });

    /**
     * @tc.number    SUB_SHORTCUT_INTENTAUDITCASES_0600
     * @tc.name      testIntentAuditCases0006
     * @tc.desc      Verify rule targets exist in route table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIntentAuditCases0006', 0, (): void => {
      const routeIdsInTable: string[] = routeIds();
      const dangling: string[] = INTENT_RULES
        .filter((rule: IntentRule): boolean => routeIdsInTable.indexOf(rule.routeId) < 0)
        .map((rule: IntentRule): string => rule.ruleId);
      expect(dangling.length).assertEqual(0);
      expect(INTENT_RULES.length).assertEqual(ruleIds().length);
      expect(routeIdsInTable.length > 0).assertTrue();
      expect(routeIdsInTable.indexOf(INTENT_RULES[0].routeId) >= 0).assertTrue();
    });
  });
}
