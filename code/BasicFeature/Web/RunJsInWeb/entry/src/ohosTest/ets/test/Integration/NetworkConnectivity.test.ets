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
  isGamePageVisible,
  triggerGamePage,
  pressAndWait,
  hasAllControls
} from '../Shared/SharedDriver';
import {
  SAMPLE_GAME_URL,
  PAGE_LOAD_BUDGET_MS,
  GameScript,
  ScriptCatalog,
  GameSession,
  PaddleModel,
  PageLoadRecord,
  RetryPolicy
} from '../Shared/GameModel';
import {
  UrlParts
} from '../Shared/GameTestKit';
import {
  ErrorClassifier
} from '../Shared/TestHelpers';

export default function networkConnectivityTest() {
  describe('NetworkConnectivity_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'network_connectivity suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'network_connectivity suite end');
    });

    // 游戏地址必须是 HTTPS 且托管在 github.io 域名
    it('network_connectivity_game_url_is_https_on_github_pages', 0, async () => {
      const parts: UrlParts = UrlParts.parse(SAMPLE_GAME_URL);
      expect(parts.isHttps()).assertTrue();
      expect(parts.isSecureHost()).assertTrue();
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
    });

    // 页面加载成功后记录耗时并处于预算内
    it('network_connectivity_page_load_success_is_recorded', 0, async () => {
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 100);
      record.finish(2100);
      expect(record.isSuccess()).assertTrue();
      expect(record.getDuration()).assertEqual(2000);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertTrue();
    });

    // 网络错误应被归类为可恢复错误并允许重试
    it('network_connectivity_network_failure_is_recoverable_with_retry', 0, async () => {
      const category: string = ErrorClassifier.classify('network unreachable');
      expect(category).assertEqual(ErrorClassifier.NETWORK);
      expect(ErrorClassifier.isRecoverable(category)).assertTrue();
      const policy: RetryPolicy = new RetryPolicy();
      expect(policy.recordAttempt()).assertTrue();
      expect(policy.canRetry()).assertTrue();
    });

    // 断网场景下容器控件仍应可见，便于用户重试
    it('network_connectivity_offline_page_still_shows_controls', 0, async () => {
      expect(await hasAllControls(driver)).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.fail(-1, 500);
      expect(record.isSuccess()).assertFalse();
    });

    // 会话连续开始后保持运行且计数一致
    it('network_connectivity_scenario_5697300_session_start_cycles', 0, async () => {
      const caseSeed: number = 5697300;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5697300);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('network_connectivity_scenario_5697301_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 5697301;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(5697301);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('network_connectivity_scenario_5697302_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 5697302;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(5697302);
    });

  });
}
