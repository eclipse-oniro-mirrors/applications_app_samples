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
import { emitter } from '@kit.BasicServicesKit';
import { RouterUtils } from '../../../main/ets/utils/RouterUtils';

const DOMAIN: number = 0xF814;
const TAG: string = 'RouterUtilsExtendedTest';
const NAV_MODE_EVENT_ID: number = 3;

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

function setWideWindowSize(): void {
  const wide: window.Size = { width: 2560, height: 1800 };
  AppStorage.setOrCreate('windowSize', wide);
}

export default function routerUtilsExtendedTest(): void {
  describe('RouterUtilsExtendedTest', () => {
    afterEach(async () => {
      // 等待宽屏分支的 20ms 延时 timer 到期后清理，防止跨用例栈污染
      await sleep(120);
      RouterUtils.pageStack.clear();
      AppStorage.delete('windowSize');
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0201
     * @tc.name      testRouterExt0201
     * @tc.desc      Checks wide-window pushUri delivers the route after its debounce delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0201 begin');
      RouterUtils.pageStack.clear();
      setWideWindowSize();
      RouterUtils.pushUri('normal');
      await sleep(120);
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      log('testRouterExt0201 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0202
     * @tc.name      testRouterExt0202
     * @tc.desc      Checks wide-window pushUri stores the correct route name after delay.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0202 begin');
      RouterUtils.pageStack.clear();
      setWideWindowSize();
      RouterUtils.pushUri('detail');
      await sleep(120);
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='detail'`);
      expect(names[0]).assertEqual('detail');
      log('testRouterExt0202 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0203
     * @tc.name      testRouterExt0203
     * @tc.desc      Checks wide-window pushUri clears stale routes before pushing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0203 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      RouterUtils.pushUri('detail');
      setWideWindowSize();
      RouterUtils.pushUri('fullscreen');
      await sleep(120);
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='fullscreen'`);
      expect(names[0]).assertEqual('fullscreen');
      log('testRouterExt0203 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0204
     * @tc.name      testRouterExt0204
     * @tc.desc      Checks wide-window pushUri still records enterRouteName.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0204 begin');
      RouterUtils.pageStack.clear();
      setWideWindowSize();
      RouterUtils.pushUri('fullscreen');
      await sleep(120);
      const routeName: string = AppStorage.get<string>('enterRouteName') ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeName=${routeName}, expected='fullscreen'`);
      expect(routeName).assertEqual('fullscreen');
      log('testRouterExt0204 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0205
     * @tc.name      testRouterExt0205
     * @tc.desc      Checks two rapid wide-window pushes keep only the latest route.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0205 begin');
      RouterUtils.pageStack.clear();
      setWideWindowSize();
      RouterUtils.pushUri('first');
      RouterUtils.pushUri('second');
      await sleep(120);
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='second'`);
      expect(names[0]).assertEqual('second');
      log('testRouterExt0205 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0206
     * @tc.name      testRouterExt0206
     * @tc.desc      Checks narrow-window push after a wide-window push appends without clearing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0206 begin');
      RouterUtils.pageStack.clear();
      setWideWindowSize();
      RouterUtils.pushUri('wide');
      await sleep(120);
      setNarrowWindowSize();
      RouterUtils.pushUri('narrow');
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=2`);
      expect(size).assertEqual(2);
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='wide'`);
      expect(names[0]).assertEqual('wide');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[1]=${names[1]}, expected='narrow'`);
      expect(names[1]).assertEqual('narrow');
      log('testRouterExt0206 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0207
     * @tc.name      testRouterExt0207
     * @tc.desc      Checks a second full-screen route entry pops through the fullscreen branch.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0207 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter(['fullscreen', 'gallery']);
      setNarrowWindowSize();
      RouterUtils.pushUri('gallery');
      RouterUtils.popAppRouter();
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      log('testRouterExt0207 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0208
     * @tc.name      testRouterExt0208
     * @tc.desc      Checks setFullScreenRouter overwriting a previous list re-classifies old routes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0208 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter(['legacy']);
      RouterUtils.setFullScreenRouter(['fullscreen']);
      setNarrowWindowSize();
      RouterUtils.pushUri('legacy');
      RouterUtils.popAppRouter();
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=0`);
      expect(size).assertEqual(0);
      log('testRouterExt0208 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0209
     * @tc.name      testRouterExt0209
     * @tc.desc      Checks successive pushes overwrite enterRouteName with the latest uri.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0209 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('first');
      RouterUtils.pushUri('second');
      const routeName: string = AppStorage.get<string>('enterRouteName') ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeName=${routeName}, expected='second'`);
      expect(routeName).assertEqual('second');
      log('testRouterExt0209 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0210
     * @tc.name      testRouterExt0210
     * @tc.desc      Checks narrow-window pushUri lands on the stack synchronously.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0210 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('normal');
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names[0]=${names[0]}, expected='normal'`);
      expect(names[0]).assertEqual('normal');
      log('testRouterExt0210 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0211
     * @tc.name      testRouterExt0211
     * @tc.desc      Checks popping a fullscreen route emits the navMode emitter event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0211 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter(['fullscreen']);
      setNarrowWindowSize();
      let received: boolean = false;
      const innerEvent: emitter.InnerEvent = { eventId: NAV_MODE_EVENT_ID };
      emitter.on(innerEvent, () => {
        received = true;
      });
      RouterUtils.pushUri('fullscreen');
      RouterUtils.popAppRouter();
      await sleep(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue received=${received}`);
      expect(received).assertTrue();
      emitter.off(NAV_MODE_EVENT_ID);
      log('testRouterExt0211 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0212
     * @tc.name      testRouterExt0212
     * @tc.desc      Checks popping the last non-fullscreen route emits the delayed navMode event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0212 begin');
      RouterUtils.pageStack.clear();
      RouterUtils.setFullScreenRouter(['fullscreen']);
      setNarrowWindowSize();
      let received: boolean = false;
      const innerEvent: emitter.InnerEvent = { eventId: NAV_MODE_EVENT_ID };
      emitter.on(innerEvent, () => {
        received = true;
      });
      RouterUtils.pushUri('normal');
      RouterUtils.popAppRouter();
      await sleep(150);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue received=${received}`);
      expect(received).assertTrue();
      emitter.off(NAV_MODE_EVENT_ID);
      log('testRouterExt0212 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0213
     * @tc.name      testRouterExt0213
     * @tc.desc      Checks pushUri tolerates an empty route name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0213 begin');
      RouterUtils.pageStack.clear();
      setNarrowWindowSize();
      RouterUtils.pushUri('');
      const size: number = RouterUtils.pageStack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual size=${size}, expected=1`);
      expect(size).assertEqual(1);
      const routeName: string = AppStorage.get<string>('enterRouteName') ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual routeName=${routeName}, expected=''`);
      expect(routeName).assertEqual('');
      log('testRouterExt0213 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTEREXT_0214
     * @tc.name      testRouterExt0214
     * @tc.desc      Checks getAllPathName on a cleared stack returns zero entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterExt0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterExt0214 begin');
      RouterUtils.pageStack.clear();
      const names: string[] = RouterUtils.pageStack.getAllPathName();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual names.length=${names.length}, expected=0`);
      expect(names.length).assertEqual(0);
      log('testRouterExt0214 end');
    })
  })
}
