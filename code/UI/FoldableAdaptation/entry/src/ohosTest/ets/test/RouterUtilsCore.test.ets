/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { RouterUtils } from '../../../main/ets/utils/RouterUtils';

const DOMAIN: number = 0xF814;
const TAG: string = 'RouterUtilsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

function setNarrowWindowSize(): void {
  const narrow: window.Size = { width: 720, height: 1280 };
  AppStorage.setOrCreate('windowSize', narrow);
}

export default function routerUtilsCoreTest(): void {
  describe('RouterUtilsCoreTest', () => {
    afterEach(async () => {
      // 等待宽屏分支的 20ms 延时 timer 到期后清理，防止跨用例栈污染
      await sleep(120);
      RouterUtils.pageStack.clear();
      AppStorage.delete('windowSize');
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0101
     * @tc.name      testRouterCore0101
     * @tc.desc      Checks the shared pageStack reports size 0 after clear.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0101 begin');
      RouterUtils.pageStack.clear();
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof size=${typeof size}, expected='number'`);
      expect(typeof size).assertEqual('number');
      log('testRouterCore0101 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0102
     * @tc.name      testRouterCore0102
     * @tc.desc      Checks pageStack exposes getAllPathName as a callable function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0102 begin');
      const stack: NavPathStack = RouterUtils.pageStack;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof stack.getAllPathName=${typeof stack.getAllPathName}`);
      expect(typeof stack.getAllPathName).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof stack.size=${typeof stack.size}, expected='function'`);
      expect(typeof stack.size).assertEqual('function');
      log('testRouterCore0102 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0103
     * @tc.name      testRouterCore0103
     * @tc.desc      Checks setFullScreenRouter registers the route without touching the stack.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0103 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter(['fullscreen']);
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      log('testRouterCore0103 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0104
     * @tc.name      testRouterCore0104
     * @tc.desc      Checks setFullScreenRouter accepts an empty route list safely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0104 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter([]);
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      log('testRouterCore0104 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0105
     * @tc.name      testRouterCore0105
     * @tc.desc      Checks narrow-window pushUri adds exactly one route to the stack.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0105 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      log('testRouterCore0105 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0106
     * @tc.name      testRouterCore0106
     * @tc.desc      Checks narrow-window pushUri stores the pushed route name in the stack.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0106 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='normal'`);
      expect(names[0]).assertEqual('normal');
      log('testRouterCore0106 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0107
     * @tc.name      testRouterCore0107
     * @tc.desc      Checks narrow-window pushUri stores the fullscreen route name in the stack.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0107 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('fullscreen');
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='fullscreen'`);
      expect(names[0]).assertEqual('fullscreen');
      log('testRouterCore0107 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0108
     * @tc.name      testRouterCore0108
     * @tc.desc      Checks pushUri records enterRouteName as the pushed uri.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0108 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      const routeName: string = AppStorage.get<string>('enterRouteName') ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeName=${routeName}, expected='normal'`);
      expect(routeName).assertEqual('normal');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof routeName=${typeof routeName}, expected='string'`);
      expect(typeof routeName).assertEqual('string');
      log('testRouterCore0108 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0109
     * @tc.name      testRouterCore0109
     * @tc.desc      Checks pushUri updates enterRouteName for the fullscreen route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0109 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('fullscreen');
      const routeName: string = AppStorage.get<string>('enterRouteName') ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeName=${routeName}, expected='fullscreen'`);
      expect(routeName).assertEqual('fullscreen');
      log('testRouterCore0109 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0110
     * @tc.name      testRouterCore0110
     * @tc.desc      Checks two successive narrow-window pushes grow the stack to size 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0110 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      RouterUtils.pushUri('detail');
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=2`);
      expect(size).assertEqual(2);
      log('testRouterCore0110 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0111
     * @tc.name      testRouterCore0111
     * @tc.desc      Checks two pushes keep LIFO order in getAllPathName.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0111 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      RouterUtils.pushUri('detail');
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='normal'`);
      expect(names[0]).assertEqual('normal');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[1]=${names[1]}, expected='detail'`);
      expect(names[1]).assertEqual('detail');
      log('testRouterCore0111 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0112
     * @tc.name      testRouterCore0112
     * @tc.desc      Checks pushUri accepts a string route param.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0112 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal', 'imageResource');
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      log('testRouterCore0112 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0113
     * @tc.name      testRouterCore0113
     * @tc.desc      Checks pushUri accepts a number route param.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0113 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal', 7);
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      log('testRouterCore0113 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0114
     * @tc.name      testRouterCore0114
     * @tc.desc      Checks pushUri accepts a record route param.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0114 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      const param: Record<string, string> = { 'src': 'startIcon' };
      RouterUtils.pushUri('normal', param);
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      log('testRouterCore0114 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0115
     * @tc.name      testRouterCore0115
     * @tc.desc      Checks getAllPathName always returns an array value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0115 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(names)=${Array.isArray(names)}`);
      expect(Array.isArray(names)).assertTrue();
      log('testRouterCore0115 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0116
     * @tc.name      testRouterCore0116
     * @tc.desc      Checks popAppRouter drains a two-entry non-fullscreen stack.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0116 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter(['fullscreen']);
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      RouterUtils.pushUri('detail');
      RouterUtils.popAppRouter();
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      log('testRouterCore0116 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0117
     * @tc.name      testRouterCore0117
     * @tc.desc      Checks popAppRouter pops a single fullscreen route entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0117 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter(['fullscreen']);
      setNarrowWindowSize();
      RouterUtils.pushUri('fullscreen');
      RouterUtils.popAppRouter();
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      log('testRouterCore0117 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERCORE_0118
     * @tc.name      testRouterCore0118
     * @tc.desc      Checks popAppRouter on an empty stack stays safe at size 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterCore0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterCore0118 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter([]);
      RouterUtils.popAppRouter();
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      log('testRouterCore0118 end');
    })
  })
}
