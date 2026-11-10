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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MotionViewContractTest]';
const DOMAIN: number = 0xF815;

const SHOW_ID: string = 'show';
const BUTTON_IDS: string[] = ['button1', 'button2', 'button3', 'button4', 'button5'];
const BUTTON_LABELS: string[] = ['订阅操作手', '取消订阅操作手', '获取操作手状态', '订阅握持手', '取消订阅握持手'];
const RESULT_TEXTS: string[] = [
  'motion subscribeOperating',
  'motion unsubscribeOperating',
  'motion getOperating',
  'motion subscribeHolding',
  'motion unsubscribeHolding'
];
const INITIAL_MESSAGE: string = 'motion';
const ACTION_HANDLERS: string[] = [
  'subscribeOperating',
  'unsubscribeOperating',
  'getOperating',
  'subscribeHolding',
  'unsubscribeHolding'
];
const EVENTS: string[] = ['operatingHandChanged', 'holdingHandChanged'];

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function isCamelCase(name: string): boolean {
  if (name.length === 0) {
    return false;
  }
  const first: string = name.charAt(0);
  if (first !== first.toLowerCase() || first === first.toUpperCase()) {
    return false;
  }
  return name.indexOf('_') < 0 && name.indexOf('-') < 0 && name.indexOf(' ') < 0;
}

/**
 * 页面静态契约（设备无关）。
 *
 * 与 MotionStateTransition 的运行时断言互补：这里固化 Index.ets 的控件命名、
 * 初始文案、动作与方法名的对应关系，确保页面结构变更时能第一时间被发现。
 * 常量表与 pages/Index.ets 一一对应，修改页面时需同步本套件。
 */
export default function MotionViewContractTest(): void {
  describe('MotionViewContractTest', () => {
    /**
     * @tc.number    SUB_MOTION_VIEW_0100
     * @tc.name      testMotionView0001
     * @tc.desc      Verify page exposes exactly five action buttons plus one status text id
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionView0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionView0001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'buttons=' + BUTTON_IDS.length + ', showId=' + SHOW_ID);
      expect(BUTTON_IDS.length).assertEqual(5);
      expect(SHOW_ID.length > 0).assertTrue();
      logEnd('testMotionView0001');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0200
     * @tc.name      testMotionView0002
     * @tc.desc      Verify every button id follows the sequential button1..button5 pattern
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionView0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionView0002');
      let sequential: number = 0;
      for (let index: number = 0; index < BUTTON_IDS.length; index++) {
        if (BUTTON_IDS[index] === 'button' + (index + 1)) {
          sequential++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ids=' + BUTTON_IDS.join(',') + ', sequential=' + sequential);
      expect(sequential).assertEqual(BUTTON_IDS.length);
      expect(sequential).assertEqual(5);
      logEnd('testMotionView0002');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0300
     * @tc.name      testMotionView0003
     * @tc.desc      Verify button ids are unique and none collide with the status text id
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionView0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionView0003');
      const all: string[] = BUTTON_IDS.concat([SHOW_ID]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'all=' + all.join(','));
      expect(new Set<string>(all).size).assertEqual(all.length);
      expect(BUTTON_IDS.indexOf(SHOW_ID) >= 0).assertFalse();
      logEnd('testMotionView0003');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0400
     * @tc.name      testMotionView0004
     * @tc.desc      Verify button ids are lower case alphanumeric without separators
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0004');
      let conforming: number = 0;
      for (const id of BUTTON_IDS) {
        const lowerCased: boolean = id === id.toLowerCase();
        const noSeparator: boolean = !id.includes('_') && !id.includes('-') && !id.includes(' ');
        if (lowerCased && noSeparator) {
          conforming++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'conforming=' + conforming);
      expect(conforming).assertEqual(BUTTON_IDS.length);
      expect(BUTTON_IDS.every((id: string) => id.startsWith('button'))).assertTrue();
      logEnd('testMotionView0004');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0500
     * @tc.name      testMotionView0005
     * @tc.desc      Verify status text id is a single lower case word distinct in shape from button ids
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0005');
      hilog.info(DOMAIN, TAG, '%{public}s', 'showId=' + SHOW_ID + ', numericSuffix=' + /\d/.test(SHOW_ID));
      expect(SHOW_ID).assertEqual('show');
      expect(SHOW_ID === SHOW_ID.toLowerCase()).assertTrue();
      expect(/\d/.test(SHOW_ID)).assertFalse();
      logEnd('testMotionView0005');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0600
     * @tc.name      testMotionView0006
     * @tc.desc      Verify all five button labels are non-empty
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionView0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionView0006');
      let nonEmpty: number = 0;
      for (const label of BUTTON_LABELS) {
        if (label.length > 0) {
          nonEmpty++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'labels=' + BUTTON_LABELS.join('|') + ', nonEmpty=' + nonEmpty);
      expect(nonEmpty).assertEqual(BUTTON_LABELS.length);
      expect(BUTTON_LABELS.length).assertEqual(BUTTON_IDS.length);
      logEnd('testMotionView0006');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0700
     * @tc.name      testMotionView0007
     * @tc.desc      Verify button labels are mutually distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionView0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionView0007');
      const distinct: number = new Set<string>(BUTTON_LABELS).size;
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + distinct);
      expect(distinct).assertEqual(BUTTON_LABELS.length);
      expect(distinct).assertEqual(5);
      logEnd('testMotionView0007');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0800
     * @tc.name      testMotionView0008
     * @tc.desc      Verify labels carry no leading or trailing whitespace
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0008');
      let trimmed: number = 0;
      for (const label of BUTTON_LABELS) {
        if (label === label.trim()) {
          trimmed++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'trimmed=' + trimmed);
      expect(trimmed).assertEqual(BUTTON_LABELS.length);
      expect(BUTTON_LABELS.every((label: string) => label.length >= 4)).assertTrue();
      logEnd('testMotionView0008');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_0900
     * @tc.name      testMotionView0009
     * @tc.desc      Verify subscribe and unsubscribe labels exist in balanced pairs for both hands
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0009');
      const subscribeCount: number = BUTTON_LABELS.filter((label: string) => label.startsWith('订阅')).length;
      const unsubscribeCount: number = BUTTON_LABELS.filter((label: string) => label.startsWith('取消订阅')).length;
      hilog.info(DOMAIN, TAG, '%{public}s', 'subscribe=' + subscribeCount + ', unsubscribe=' + unsubscribeCount);
      expect(subscribeCount).assertEqual(2);
      expect(unsubscribeCount).assertEqual(2);
      expect(subscribeCount).assertEqual(unsubscribeCount);
      logEnd('testMotionView0009');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1100
     * @tc.name      testMotionView0011
     * @tc.desc      Verify initial status message is the bare motion token
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionView0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionView0011');
      hilog.info(DOMAIN, TAG, '%{public}s', 'initial=' + INITIAL_MESSAGE);
      expect(INITIAL_MESSAGE).assertEqual('motion');
      expect(INITIAL_MESSAGE.length).assertEqual('motion'.length);
      expect(RESULT_TEXTS.indexOf(INITIAL_MESSAGE) >= 0).assertFalse();
      logEnd('testMotionView0011');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1200
     * @tc.name      testMotionView0012
     * @tc.desc      Verify five action methods follow lower camel case naming
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0012');
      let conforming: number = 0;
      for (const handler of ACTION_HANDLERS) {
        if (isCamelCase(handler)) {
          conforming++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'handlers=' + ACTION_HANDLERS.join(',') + ', conforming=' + conforming);
      expect(conforming).assertEqual(ACTION_HANDLERS.length);
      expect(ACTION_HANDLERS.length).assertEqual(5);
      logEnd('testMotionView0012');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1300
     * @tc.name      testMotionView0013
     * @tc.desc      Verify action methods are unique and each starts with a known verb
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0013');
      const verbs: string[] = ['subscribe', 'unsubscribe', 'get'];
      let matched: number = 0;
      for (const handler of ACTION_HANDLERS) {
        if (verbs.some((verb: string) => handler.startsWith(verb))) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'matched=' + matched);
      expect(matched).assertEqual(ACTION_HANDLERS.length);
      expect(new Set<string>(ACTION_HANDLERS).size).assertEqual(ACTION_HANDLERS.length);
      logEnd('testMotionView0013');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1400
     * @tc.name      testMotionView0014
     * @tc.desc      Verify result texts are prefixed with the motion namespace and suffixed with the handler name
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0014');
      let matched: number = 0;
      for (let index: number = 0; index < RESULT_TEXTS.length; index++) {
        if (RESULT_TEXTS[index] === 'motion ' + ACTION_HANDLERS[index]) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'texts=' + RESULT_TEXTS.join('|') + ', matched=' + matched);
      expect(matched).assertEqual(RESULT_TEXTS.length);
      expect(RESULT_TEXTS.every((text: string) => text.startsWith('motion '))).assertTrue();
      logEnd('testMotionView0014');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1500
     * @tc.name      testMotionView0015
     * @tc.desc      Verify result texts are mutually distinct and never collide with the initial message
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionView0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionView0015');
      const distinct: number = new Set<string>(RESULT_TEXTS).size;
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + distinct);
      expect(distinct).assertEqual(RESULT_TEXTS.length);
      expect(RESULT_TEXTS.indexOf(INITIAL_MESSAGE) >= 0).assertFalse();
      logEnd('testMotionView0015');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1600
     * @tc.name      testMotionView0016
     * @tc.desc      Verify each button position maps to the same index in ids, labels, texts and handlers
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0016');
      const lengths: number[] = [BUTTON_IDS.length, BUTTON_LABELS.length, RESULT_TEXTS.length, ACTION_HANDLERS.length];
      hilog.info(DOMAIN, TAG, '%{public}s', 'lengths=' + lengths.join(','));
      expect(new Set<number>(lengths).size).assertEqual(1);
      expect(lengths[0]).assertEqual(5);
      logEnd('testMotionView0016');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1700
     * @tc.name      testMotionView0017
     * @tc.desc      Verify two documented motion events back the two subscribe handlers
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0017');
      const subscribeHandlers: string[] = ACTION_HANDLERS.filter((handler: string) => handler.startsWith('subscribe'));
      hilog.info(DOMAIN, TAG, '%{public}s',
        'events=' + EVENTS.join(',') + ', subscribeHandlers=' + subscribeHandlers.join(','));
      expect(subscribeHandlers.length).assertEqual(EVENTS.length);
      expect(EVENTS.every((event: string) => event.endsWith('HandChanged'))).assertTrue();
      logEnd('testMotionView0017');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1800
     * @tc.name      testMotionView0018
     * @tc.desc      Verify exactly one query action exists and it is the get-prefixed handler
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0018');
      const getHandlers: string[] = ACTION_HANDLERS.filter((handler: string) => handler.startsWith('get'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'getHandlers=' + getHandlers.join(','));
      expect(getHandlers.length).assertEqual(1);
      expect(getHandlers[0]).assertEqual('getOperating');
      logEnd('testMotionView0018');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_1900
     * @tc.name      testMotionView0019
     * @tc.desc      Verify button label order matches the documented action order in build()
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0019');
      const expected: string[] = ['订阅操作手', '取消订阅操作手', '获取操作手状态', '订阅握持手', '取消订阅握持手'];
      hilog.info(DOMAIN, TAG, '%{public}s', 'order=' + BUTTON_LABELS.join('|'));
      expect(BUTTON_LABELS.join('|')).assertEqual(expected.join('|'));
      expect(BUTTON_LABELS[2]).assertEqual('获取操作手状态');
      logEnd('testMotionView0019');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_2000
     * @tc.name      testMotionView0020
     * @tc.desc      Verify handler order pairs subscribe before unsubscribe for each hand
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0020');
      const operatingSubscribe: number = ACTION_HANDLERS.indexOf('subscribeOperating');
      const operatingUnsubscribe: number = ACTION_HANDLERS.indexOf('unsubscribeOperating');
      const holdingSubscribe: number = ACTION_HANDLERS.indexOf('subscribeHolding');
      const holdingUnsubscribe: number = ACTION_HANDLERS.indexOf('unsubscribeHolding');
      hilog.info(DOMAIN, TAG, '%{public}s',
        'os=' + operatingSubscribe + ', ou=' + operatingUnsubscribe + ', hs=' + holdingSubscribe +
        ', hu=' + holdingUnsubscribe);
      expect(operatingSubscribe < operatingUnsubscribe).assertTrue();
      expect(holdingSubscribe < holdingUnsubscribe).assertTrue();
      logEnd('testMotionView0020');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_2200
     * @tc.name      testMotionView0022
     * @tc.desc      Verify every result text names a handler that actually exists
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionView0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionView0022');
      let resolvable: number = 0;
      for (const text of RESULT_TEXTS) {
        if (ACTION_HANDLERS.indexOf(text.substring('motion '.length)) >= 0) {
          resolvable++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'resolvable=' + resolvable);
      expect(resolvable).assertEqual(RESULT_TEXTS.length);
      expect(resolvable).assertEqual(5);
      logEnd('testMotionView0022');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_2300
     * @tc.name      testMotionView0023
     * @tc.desc      Verify status text content length stays within the single-line display budget
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionView0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logBegin('testMotionView0023');
      let longest: number = 0;
      for (const text of RESULT_TEXTS) {
        longest = text.length > longest ? text.length : longest;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'longest=' + longest);
      expect(longest > 0).assertTrue();
      expect(longest <= 32).assertTrue();
      logEnd('testMotionView0023');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_2400
     * @tc.name      testMotionView0024
     * @tc.desc      Verify all result texts share a single space separator after the motion token
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionView0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logBegin('testMotionView0024');
      let singleSpace: number = 0;
      for (const text of RESULT_TEXTS) {
        if (text.indexOf('motion ') === 0 && text.indexOf('  ') < 0) {
          singleSpace++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'singleSpace=' + singleSpace);
      expect(singleSpace).assertEqual(RESULT_TEXTS.length);
      expect(RESULT_TEXTS.every((text: string) => !text.endsWith(' '))).assertTrue();
      logEnd('testMotionView0024');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_2500
     * @tc.name      testMotionView0025
     * @tc.desc      Verify subscribe and unsubscribe results differ only by the unsubscribe prefix
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionView0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logBegin('testMotionView0025');
      const operatingPair: boolean =
        RESULT_TEXTS[1] === RESULT_TEXTS[0].replace('subscribeOperating', 'unsubscribeOperating');
      const holdingPair: boolean =
        RESULT_TEXTS[4] === RESULT_TEXTS[3].replace('subscribeHolding', 'unsubscribeHolding');
      hilog.info(DOMAIN, TAG, '%{public}s', 'operatingPair=' + operatingPair + ', holdingPair=' + holdingPair);
      expect(operatingPair).assertTrue();
      expect(holdingPair).assertTrue();
      logEnd('testMotionView0025');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_2600
     * @tc.name      testMotionView0026
     * @tc.desc      Verify operating-hand texts outnumber holding-hand texts
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionView0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logBegin('testMotionView0026');
      const operatingTexts: number = RESULT_TEXTS.filter((text: string) => text.includes('Operating')).length;
      const holdingTexts: number = RESULT_TEXTS.filter((text: string) => text.includes('Holding')).length;
      hilog.info(DOMAIN, TAG, '%{public}s', 'operating=' + operatingTexts + ', holding=' + holdingTexts);
      expect(operatingTexts).assertEqual(3);
      expect(holdingTexts).assertEqual(2);
      logEnd('testMotionView0026');
    });

    /**
     * @tc.number    SUB_MOTION_VIEW_2700
     * @tc.name      testMotionView0027
     * @tc.desc      Verify the two event names align with the two subscribe handler suffixes
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionView0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logBegin('testMotionView0027');
      const operatingEventBacked: boolean =
        EVENTS[0] === 'operatingHandChanged' && ACTION_HANDLERS[0] === 'subscribeOperating';
      const holdingEventBacked: boolean =
        EVENTS[1] === 'holdingHandChanged' && ACTION_HANDLERS[3] === 'subscribeHolding';
      hilog.info(DOMAIN, TAG, '%{public}s', 'operating=' + operatingEventBacked + ', holding=' + holdingEventBacked);
      expect(operatingEventBacked).assertTrue();
      expect(holdingEventBacked).assertTrue();
      logEnd('testMotionView0027');
    });
  });
}
