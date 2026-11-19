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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { WindowEventId, WindowColor, WindowType } from '../../../main/ets/utils/WindowManageBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'WindowConstModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function windowConstModelCoreTest(): void {
  describe('WindowConstModelCoreTest', () => {
    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0201
     * @tc.name      testWindowConstModelCore0201
     * @tc.desc      Check sub window inner event id equals 1001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0201 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${WindowEventId.SUB_WINDOW_INNER_EVENT_ID}`);
      expect(WindowEventId.SUB_WINDOW_INNER_EVENT_ID).assertEqual(1001);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowEventId.SUB_WINDOW_INNER_EVENT_ID}`);
      expect(typeof WindowEventId.SUB_WINDOW_INNER_EVENT_ID).assertEqual('number');
      log('testWindowConstModelCore0201 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0202
     * @tc.name      testWindowConstModelCore0202
     * @tc.desc      Check WindowEventId is exported as an object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0202 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof WindowEventId=${typeof WindowEventId}`);
      expect(typeof WindowEventId).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue WindowEventId !== undefined && WindowEventId !== null`);
      expect(WindowEventId !== undefined && WindowEventId !== null).assertTrue();
      log('testWindowConstModelCore0202 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0203
     * @tc.name      testWindowConstModelCore0203
     * @tc.desc      Check status bar color constant equals white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0203 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual WindowColor.statusBarColor=${WindowColor.statusBarColor}`);
      expect(WindowColor.statusBarColor).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowColor.statusBarColor}`);
      expect(typeof WindowColor.statusBarColor).assertEqual('string');
      log('testWindowConstModelCore0203 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0204
     * @tc.name      testWindowConstModelCore0204
     * @tc.desc      Check navigation bar color constant equals white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0204 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${WindowColor.navigationBarColor}, expected='#ffffff'`);
      expect(WindowColor.navigationBarColor).assertEqual('#ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowColor.navigationBarColor}`);
      expect(typeof WindowColor.navigationBarColor).assertEqual('string');
      log('testWindowConstModelCore0204 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0205
     * @tc.name      testWindowConstModelCore0205
     * @tc.desc      Check status bar content color constant equals black.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0205 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${WindowColor.statusBarContentColor}`);
      expect(WindowColor.statusBarContentColor).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowColor.statusBarContentColor}`);
      expect(typeof WindowColor.statusBarContentColor).assertEqual('string');
      log('testWindowConstModelCore0205 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0206
     * @tc.name      testWindowConstModelCore0206
     * @tc.desc      Check navigation bar content color constant equals black.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0206 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${WindowColor.navigationBarContentColor}`);
      expect(WindowColor.navigationBarContentColor).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof WindowColor.navigationBarContentColor}`);
      expect(typeof WindowColor.navigationBarContentColor).assertEqual('string');
      log('testWindowConstModelCore0206 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0207
     * @tc.name      testWindowConstModelCore0207
     * @tc.desc      Check all four color constants start with the # prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0207 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${WindowColor.statusBarColor.startsWith('#')}`);
      expect(WindowColor.statusBarColor.startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${WindowColor.navigationBarColor.startsWith('#')}`);
      expect(WindowColor.navigationBarColor.startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${WindowColor.statusBarContentColor.startsWith('#')}`);
      expect(WindowColor.statusBarContentColor.startsWith('#')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue WindowColor.navigationBarContentColor.startsWith('#')`);
      expect(WindowColor.navigationBarContentColor.startsWith('#')).assertTrue();
      log('testWindowConstModelCore0207 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0208
     * @tc.name      testWindowConstModelCore0208
     * @tc.desc      Check WindowType is exported as a class constructor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0208 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof WindowType=${typeof WindowType}, expected='function'`);
      expect(typeof WindowType).assertEqual('function');
      log('testWindowConstModelCore0208 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0209
     * @tc.name      testWindowConstModelCore0209
     * @tc.desc      Check a fresh WindowType instance exposes position fields as undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0209 begin');
      const model: WindowType = new WindowType();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined model.moveToWidth`);
      expect(model.moveToWidth).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined model.moveToHeight`);
      expect(model.moveToHeight).assertUndefined();
      log('testWindowConstModelCore0209 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0210
     * @tc.name      testWindowConstModelCore0210
     * @tc.desc      Check a fresh WindowType instance exposes size fields as undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0210 begin');
      const model: WindowType = new WindowType();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined model.resetSizeWidth`);
      expect(model.resetSizeWidth).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined model.resetSizeHeight`);
      expect(model.resetSizeHeight).assertUndefined();
      log('testWindowConstModelCore0210 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0211
     * @tc.name      testWindowConstModelCore0211
     * @tc.desc      Check a fresh WindowType instance exposes flag fields as undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0211 begin');
      const model: WindowType = new WindowType();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined model.setTouchable`);
      expect(model.setTouchable).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined model.setPrivacyMode`);
      expect(model.setPrivacyMode).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined model.setBrightness`);
      expect(model.setBrightness).assertUndefined();
      log('testWindowConstModelCore0211 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_WINDOWCONST_0212
     * @tc.name      testWindowConstModelCore0212
     * @tc.desc      Check WindowType instance keeps assigned numeric and boolean values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowConstModelCore0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowConstModelCore0212 begin');
      const model: WindowType = new WindowType();
      model.moveToWidth = 50;
      model.moveToHeight = 250;
      model.setTouchable = true;
      model.setBrightness = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.moveToWidth=${model.moveToWidth}, expected=50`);
      expect(model.moveToWidth).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.moveToHeight=${model.moveToHeight}, expected=250`);
      expect(model.moveToHeight).assertEqual(250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model.setTouchable=${model.setTouchable}`);
      expect(model.setTouchable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.setBrightness=${typeof model.setBrightness}`);
      expect(typeof model.setBrightness).assertEqual('number');
      log('testWindowConstModelCore0212 end');
    })
  })
}
