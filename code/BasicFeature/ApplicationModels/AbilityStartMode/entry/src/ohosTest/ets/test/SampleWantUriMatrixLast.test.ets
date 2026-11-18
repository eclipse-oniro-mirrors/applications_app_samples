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
const TAG: string = '[Sample_StartMode]';

export default function sampleWantUriMatrixLastTest(): void {
  describe('SampleWantUriMatrixLastTest', () => {
    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0281
     * @tc.name      sampleWantUriMatrix0281
     * @tc.desc      Want(sample + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0281 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo';
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
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0281 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0282
     * @tc.name      sampleWantUriMatrix0282
     * @tc.desc      Want(file + sendToData + text/html) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0282 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
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
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0282 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0283
     * @tc.name      sampleWantUriMatrix0283
     * @tc.desc      Want(https + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0283 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample?from=test';
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
      expect(parsedPath).assertEqual('/sample');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0283 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0284
     * @tc.name      sampleWantUriMatrix0284
     * @tc.desc      Want(sample + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0284 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo/page?index=1';
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
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0284 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0285
     * @tc.name      sampleWantUriMatrix0285
     * @tc.desc      Want(http + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0285 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'http://127.0.0.1:8080/sample/detail?id=7';
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
      expect(parsedPath).assertEqual('/sample/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0285 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0286
     * @tc.name      sampleWantUriMatrix0286
     * @tc.desc      Want(https + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0286 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'https://example.com/sample/detail';
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
      expect(parsedPath).assertEqual('/sample/detail');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0286 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0287
     * @tc.name      sampleWantUriMatrix0287
     * @tc.desc      Want(sample + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0287 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'sample://demo';
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
      expect(parsedScheme).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 parsedHost=${parsedHost}`);
      expect(parsedHost).assertEqual('demo');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0287 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_URI_0288
     * @tc.name      sampleWantUriMatrix0288
     * @tc.desc      Want(file + sendToData + 无 type) 的 URI 解析正确
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantUriMatrix0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0288 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendToData';
      const wantUri: string = 'file://com.samples.data/data/storage/sample.txt';
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
      expect(parsedHost).assertEqual('com.samples.data');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 parsedPath=${parsedPath}`);
      expect(parsedPath).assertEqual('/data/storage/sample.txt');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantUriMatrix0288 end');
    })
  })
}
