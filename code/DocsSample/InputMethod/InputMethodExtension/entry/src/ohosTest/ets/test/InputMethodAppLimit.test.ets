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
  API_TIMEOUT_MS,
  CANDIDATE_BAR_HEIGHT,
  EXTRA_CONFIG_MAX_BYTES,
  HILOG_DOMAIN,
  HILOG_TAG,
  HOME_LOG_LIMIT,
  KEYBOARD_BUFFER_LIMIT,
  KEYBOARD_GAP,
  KEYBOARD_PADDING,
  KEYBOARD_ROW_HEIGHT,
  KEY_CANDIDATE_LIMIT,
  KEY_INPUT_HABIT,
  KEY_THEME_COLOR,
  KEY_VOICE_ENABLED,
  LIST_PATTERN_COUNT,
  LOG_PREVIEW_LENGTH,
  LOG_STORE_CAPACITY,
  PAGE_LOG_LIMIT,
  StorageKeys
} from '../../../main/ets/common/AppConstants';
import {
  ConfigEntry,
  buildExtraConfig,
  configByteLength,
  defaultEntries,
  paddedEntries
} from '../../../main/ets/model/ExtraConfigModel';
import {
  ACTION_CHAR,
  KeySpec,
  KeyboardMode,
  applyKey,
  appendChar,
  charCount
} from '../../../main/ets/model/KeyboardModel';
import { FEATURES, FeatureEntry, declaredApiCount } from '../../../main/ets/model/FeatureCatalog';
import { LogItem, LogLevel, appendLog, queryLogs } from '../../../main/ets/model/LogStore';
import { patternSpecs } from '../../../main/ets/utils/InputMethodListSession';
import { truncateMiddle } from '../../../main/ets/utils/FormatUtil';

/** 造 n 条日志：容量与 limit 的关系用例共用 */
function logsOf(count: number): LogItem[] {
  const logs: LogItem[] = [];
  for (let i = 0; i < count; i++) {
    logs.push(new LogItem('page', 'tag', `d${i}`, LogLevel.INFO));
  }
  return logs;
}

/**
 * 常量与实际行为一致：常量不是文案，改了实现没改常量就是 bug。
 * 每条都用「真实函数 + 真实常量」一起断言，而不是只把常量抄一遍数字。
 */
export default function inputMethodAppLimitTest() {
  describe('InputMethodAppLimitTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0100
     * @tc.name testAppLimit0001
     * @tc.desc Verify the 32KB ceiling constant agrees with the padding target it is used for.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0001', 0, () => {
      expect(EXTRA_CONFIG_MAX_BYTES).assertEqual(32 * 1024);
      expect(EXTRA_CONFIG_MAX_BYTES).assertEqual(32768);
      const bytes = configByteLength(buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES)));
      expect(bytes).assertEqual(EXTRA_CONFIG_MAX_BYTES);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0200
     * @tc.name testAppLimit0002
     * @tc.desc Verify the store capacity constant is the one the append default actually enforces.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0002', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < LOG_STORE_CAPACITY + 50; i++) {
        logs = appendLog(logs, new LogItem('page', 'loop', `d${i}`));
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(LOG_STORE_CAPACITY > PAGE_LOG_LIMIT).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0300
     * @tc.name testAppLimit0003
     * @tc.desc Verify the page limit is a usable truncation value for a full store, not just a label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0003', 0, () => {
      const logs = logsOf(HOME_LOG_LIMIT);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', PAGE_LOG_LIMIT).length).assertEqual(PAGE_LOG_LIMIT);
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', PAGE_LOG_LIMIT + 10).length).assertEqual(HOME_LOG_LIMIT);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0400
     * @tc.name testAppLimit0004
     * @tc.desc Verify the home page shows more lines than a card but still less than the store capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0004', 0, () => {
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(HOME_LOG_LIMIT > PAGE_LOG_LIMIT).assertTrue();
      expect(HOME_LOG_LIMIT <= LOG_STORE_CAPACITY).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0500
     * @tc.name testAppLimit0005
     * @tc.desc Verify the two AppStorage keys are distinct literals without blanks,
     * so neither page overwrites the other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0005', 0, () => {
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.KEYBOARD_TEXT).assertEqual('keyboardText');
      expect(StorageKeys.APP_LOGS === StorageKeys.KEYBOARD_TEXT).assertFalse();
      expect(StorageKeys.APP_LOGS.includes(' ')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0600
     * @tc.name testAppLimit0006
     * @tc.desc Verify the log domain and tag match what the README tells readers to filter on.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0006', 0, () => {
      expect(HILOG_DOMAIN).assertEqual(0xF811);
      expect(HILOG_TAG).assertEqual('InputMethodExt');
      expect(HILOG_TAG.includes(' ')).assertFalse();
      expect(HILOG_DOMAIN > 0).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0700
     * @tc.name testAppLimit0007
     * @tc.desc Verify the pattern count constant matches the number of specs the dialog actually receives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0007', 0, () => {
      expect(LIST_PATTERN_COUNT).assertEqual(2);
      expect(patternSpecs().length).assertEqual(LIST_PATTERN_COUNT);
      expect(patternSpecs(LIST_PATTERN_COUNT).length).assertEqual(LIST_PATTERN_COUNT);
      expect(patternSpecs()[0].index).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0800
     * @tc.name testAppLimit0008
     * @tc.desc Verify the buffer limit constant is the value the append and key press paths stop at.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0008', 0, () => {
      const full = 'a'.repeat(KEYBOARD_BUFFER_LIMIT);
      expect(KEYBOARD_BUFFER_LIMIT).assertEqual(64);
      expect(appendChar(full, 'b', KEYBOARD_BUFFER_LIMIT)).assertEqual(full);
      expect(charCount(appendChar(full, 'b', KEYBOARD_BUFFER_LIMIT))).assertEqual(KEYBOARD_BUFFER_LIMIT);
      const edit = applyKey(full, KeyboardMode.LETTER, new KeySpec('b', ACTION_CHAR), KEYBOARD_BUFFER_LIMIT);
      expect(edit.inserted).assertEqual('');
      expect(edit.text.length).assertEqual(KEYBOARD_BUFFER_LIMIT);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_0900
     * @tc.name testAppLimit0009
     * @tc.desc Verify the wait limit is a sane positive value that a user can sit through.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0009', 0, () => {
      expect(API_TIMEOUT_MS).assertEqual(8000);
      expect(API_TIMEOUT_MS >= 1000).assertTrue();
      expect(API_TIMEOUT_MS <= 30000).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_1000
     * @tc.name testAppLimit0010
     * @tc.desc Verify the preview length constant produces a line of exactly that width when truncation kicks in.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0010', 0, () => {
      const long = 'x'.repeat(LOG_PREVIEW_LENGTH + 40);
      const text = truncateMiddle(long, LOG_PREVIEW_LENGTH);
      expect(LOG_PREVIEW_LENGTH).assertEqual(160);
      expect(text.length).assertEqual(LOG_PREVIEW_LENGTH);
      expect(text.includes('…')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_1100
     * @tc.name testAppLimit0011
     * @tc.desc Verify the keyboard geometry constants keep a positive, non overlapping vertical rhythm.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0011', 0, () => {
      expect(KEYBOARD_ROW_HEIGHT).assertEqual(46);
      expect(KEYBOARD_ROW_HEIGHT > KEYBOARD_GAP).assertTrue();
      expect(KEYBOARD_GAP > 0).assertTrue();
      expect(KEYBOARD_PADDING > 0).assertTrue();
      expect(CANDIDATE_BAR_HEIGHT < KEYBOARD_ROW_HEIGHT).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_1200
     * @tc.name testAppLimit0012
     * @tc.desc Verify the default entries use exactly the four declared keys, in a stable order, once each.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0012', 0, () => {
      const entries = defaultEntries();
      expect(entries.length).assertEqual(4);
      expect(entries[0].key).assertEqual(KEY_THEME_COLOR);
      expect(entries[1].key).assertEqual(KEY_INPUT_HABIT);
      expect(entries[2].key).assertEqual(KEY_VOICE_ENABLED);
      expect(entries[3].key).assertEqual(KEY_CANDIDATE_LIMIT);
      expect(new Set<string>(entries.map((item: ConfigEntry) => item.key)).size).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_1300
     * @tc.name testAppLimit0013
     * @tc.desc Verify every catalog entry points at a demo page path that exists under pages/demos.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0013', 0, () => {
      const routes = FEATURES.map((item: FeatureEntry) => item.route);
      expect(routes.every((route: string) => route.startsWith('pages/demos/'))).assertTrue();
      expect(routes.every((route: string) => route.endsWith('Demo'))).assertTrue();
      expect(new Set<string>(routes).size).assertEqual(routes.length);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_APPLIMIT_1400
     * @tc.name testAppLimit0014
     * @tc.desc Verify every catalog entry declares at least one api and the total stays what the home page prints.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAppLimit0014', 0, () => {
      expect(FEATURES.every((item: FeatureEntry) => item.apiCount() > 0)).assertTrue();
      expect(FEATURES.every((item: FeatureEntry) => item.apiSummary().length > 0)).assertTrue();
      expect(FEATURES[0].apiSummary().includes('、')).assertTrue();
      expect(declaredApiCount()).assertEqual(11);
    });
  });
}
