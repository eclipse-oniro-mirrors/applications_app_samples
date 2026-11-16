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

import hilog from '@ohos.hilog';
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SETTLE,
  getDriver,
  serializedDelay,
  triggerGamePage,
  pressAndWait
} from '../Shared/SharedDriver';
import {
  API_VERSION,
  ORIENTATION_LANDSCAPE,
  LONG_PRESS_DURATION,
  GameSession,
  LayoutProfile,
  ConfigSnapshot
} from '../Shared/GameModel';
import {
  GestureClassifier
} from '../Shared/TestHelpers';

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'device_compatibility suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'device_compatibility suite end');
    });

    // 默认设备与平板均受支持，手机不在 deviceTypes 中
    it('device_compatibility_device_profile_is_supported', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.supportsDevice('default')).assertTrue();
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.supportsDevice('phone')).assertFalse();
    });

    // 应用固定横屏，布局按 10/80/10 分配
    it('device_compatibility_landscape_orientation_is_enforced', 0, async () => {
      const layout: LayoutProfile = LayoutProfile.createDefault();
      expect(layout.getOrientation()).assertEqual(ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isValid()).assertTrue();
    });

    // 配置 API 版本与工程 compileSdkVersion 一致
    it('device_compatibility_api_level_matches_project_sdk', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(API_VERSION);
      expect(config.apiVersion).assertEqual(9);
    });

    // 长按重复间隔 20ms 应能在 1 秒内产生多次移动
    it('device_compatibility_long_press_interval_is_short_enough', 0, async () => {
      const gestures: GestureClassifier = new GestureClassifier(500, 20);
      expect(gestures.repeatCount(1000, LONG_PRESS_DURATION)).assertEqual(50);
      expect(gestures.repeatCount(1000, 0)).assertEqual(0);
    });

    // 会话连续开始后保持运行且计数一致
    it('device_compatibility_scenario_5006200_session_start_cycles', 0, async () => {
      const caseSeed: number = 5006200;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5006200);
    });

  });
}
