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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want } from '@kit.AbilityKit';
import { uri } from '@kit.ArkTS';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OAID]';

export default function oaidWantUriMatrixMoreTest(): void {
  describe('OaidWantUriMatrixMoreTest', () => {
    /**
     * @tc.number    SUB_OAID_WANT_URI_0201
     * @tc.name      oaidWantUriMatrix0201
     * @tc.desc      Want(http + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0201 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0201 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0202
     * @tc.name      oaidWantUriMatrix0202
     * @tc.desc      Want(https + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0202 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid/detail';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0202 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0203
     * @tc.name      oaidWantUriMatrix0203
     * @tc.desc      Want(oaid + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0203 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0203 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0204
     * @tc.name      oaidWantUriMatrix0204
     * @tc.desc      Want(file + sendToData + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0204 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0204 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0205
     * @tc.name      oaidWantUriMatrix0205
     * @tc.desc      Want(https + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0205 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0205 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0206
     * @tc.name      oaidWantUriMatrix0206
     * @tc.desc      Want(oaid + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0206 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples/page?index=1';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0206 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0207
     * @tc.name      oaidWantUriMatrix0207
     * @tc.desc      Want(http + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0207 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0207 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0208
     * @tc.name      oaidWantUriMatrix0208
     * @tc.desc      Want(https + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0208 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid/detail';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0208 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0209
     * @tc.name      oaidWantUriMatrix0209
     * @tc.desc      Want(oaid + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0209 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0209 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0210
     * @tc.name      oaidWantUriMatrix0210
     * @tc.desc      Want(file + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0210 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0210 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0211
     * @tc.name      oaidWantUriMatrix0211
     * @tc.desc      Want(https + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0211 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0211 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0212
     * @tc.name      oaidWantUriMatrix0212
     * @tc.desc      Want(oaid + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0212 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples/page?index=1';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0212 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0213
     * @tc.name      oaidWantUriMatrix0213
     * @tc.desc      Want(http + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0213 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0213 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0214
     * @tc.name      oaidWantUriMatrix0214
     * @tc.desc      Want(https + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0214 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/oaid/detail';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0214 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0215
     * @tc.name      oaidWantUriMatrix0215
     * @tc.desc      Want(oaid + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0215 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0215 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0216
     * @tc.name      oaidWantUriMatrix0216
     * @tc.desc      Want(file + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0216 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0216 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0217
     * @tc.name      oaidWantUriMatrix0217
     * @tc.desc      Want(https + 无 action + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0217 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0217 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0218
     * @tc.name      oaidWantUriMatrix0218
     * @tc.desc      Want(oaid + 无 action + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0218 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page?index=1';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0218 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0219
     * @tc.name      oaidWantUriMatrix0219
     * @tc.desc      Want(http + 无 action + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0219 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0219 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0220
     * @tc.name      oaidWantUriMatrix0220
     * @tc.desc      Want(https + 无 action + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0220 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid/detail';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0220 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0221
     * @tc.name      oaidWantUriMatrix0221
     * @tc.desc      Want(oaid + 无 action + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0221 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0221 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0222
     * @tc.name      oaidWantUriMatrix0222
     * @tc.desc      Want(file + 无 action + text/plain) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0222 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0222 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0223
     * @tc.name      oaidWantUriMatrix0223
     * @tc.desc      Want(https + 无 action + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0223 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0223 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0224
     * @tc.name      oaidWantUriMatrix0224
     * @tc.desc      Want(oaid + 无 action + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0224 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0224 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0225
     * @tc.name      oaidWantUriMatrix0225
     * @tc.desc      Want(http + 无 action + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0225 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0225 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0226
     * @tc.name      oaidWantUriMatrix0226
     * @tc.desc      Want(https + 无 action + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0226 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid/detail';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0226 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0227
     * @tc.name      oaidWantUriMatrix0227
     * @tc.desc      Want(oaid + 无 action + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0227 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0227 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0228
     * @tc.name      oaidWantUriMatrix0228
     * @tc.desc      Want(file + 无 action + application/json) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0228 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0228 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0229
     * @tc.name      oaidWantUriMatrix0229
     * @tc.desc      Want(https + 无 action + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0229 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0229 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0230
     * @tc.name      oaidWantUriMatrix0230
     * @tc.desc      Want(oaid + 无 action + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0230 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page?index=1';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0230 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0231
     * @tc.name      oaidWantUriMatrix0231
     * @tc.desc      Want(http + 无 action + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0231 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0231 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0232
     * @tc.name      oaidWantUriMatrix0232
     * @tc.desc      Want(https + 无 action + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0232 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid/detail';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0232 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0233
     * @tc.name      oaidWantUriMatrix0233
     * @tc.desc      Want(oaid + 无 action + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0233 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0233 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0234
     * @tc.name      oaidWantUriMatrix0234
     * @tc.desc      Want(file + 无 action + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0234 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
      const wantType: string = 'text/html';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0234 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0235
     * @tc.name      oaidWantUriMatrix0235
     * @tc.desc      Want(https + 无 action + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0235 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('from=test');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0235 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0236
     * @tc.name      oaidWantUriMatrix0236
     * @tc.desc      Want(oaid + 无 action + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0236 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page?index=1';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/page');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('index=1');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0236 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0237
     * @tc.name      oaidWantUriMatrix0237
     * @tc.desc      Want(http + 无 action + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0237 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'http://127.0.0.1:8080/oaid/detail?id=7';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('127.0.0.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('id=7');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0237 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0238
     * @tc.name      oaidWantUriMatrix0238
     * @tc.desc      Want(https + 无 action + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0238 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid/detail';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('https');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/oaid/detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0238 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0239
     * @tc.name      oaidWantUriMatrix0239
     * @tc.desc      Want(oaid + 无 action + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0239 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('samples');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0239 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_URI_0240
     * @tc.name      oaidWantUriMatrix0240
     * @tc.desc      Want(file + 无 action + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantUriMatrix0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0240 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'file://com.samples.oaid/data/storage/oaid.txt';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const uriRead: string = want.uri ?? '';
      const parsed: uri.URI = new uri.URI(uriRead);
      const parsedScheme: string = parsed.scheme ?? '';
      const parsedHost: string = parsed.host ?? '';
      const parsedPath: string = parsed.path ?? '';
      const parsedQuery: string = parsed.query ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 parsedScheme=${parsedScheme}`);
      expect(parsedScheme).assertEqual('file');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('com.samples.oaid');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/oaid.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 parsedQuery=${parsedQuery}`);
      expect(parsedQuery).assertEqual('');
      const actionRead: string = want.action ?? '';
      const typeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 typeRead=${typeRead}`);
      expect(typeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantUriMatrix0240 end');
    })
  })
}
