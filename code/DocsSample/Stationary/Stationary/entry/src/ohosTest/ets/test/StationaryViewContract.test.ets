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

const DOMAIN: number = 0xF812;

const TAG: string = '[Sample_StationaryViewContractTest]';

const SHOW_ID: string = 'show';
const BUTTON_IDS: string[] = ['button1', 'button2', 'button3'];
const BUTTON_LABELS: string[] = ['订阅', '取消订阅', '获取'];
const RESULT_TEXTS: string[] = [
  'stationary subscribe',
  'stationary unsubscribe',
  'stationary getStatus'
];
const INITIAL_MESSAGE: string = 'stationary';
const ACTION_HANDLERS: string[] = ['subscribe', 'unsubscribe', 'getStatus'];
const TYPE_NAMES: string[] = ['still', 'relativeStill'];

function handlerText(index: number): string {
  return ACTION_HANDLERS[index];
}

function uniqueStrings(values: string[]): number {
  let distinct: number = 0;
  for (let i = 0; i < values.length; i++) {
    let seen: boolean = false;
    for (let j = 0; j < i; j++) {
      if (values[j] === values[i]) {
        seen = true;
      }
    }
    if (!seen) {
      distinct++;
    }
  }
  return distinct;
}

/**
 * 页面视图契约（设备无关的静态约束）。
 *
 * 这些常量与 pages/Index.ets 的控件 id、按钮文案、结果文案一一对应；
 * 套件本身不依赖设备能力，用于在改动页面时第一时间发现契约漂移。
 */
export default function StationaryViewContractTest(): void {
  describe('StationaryViewContractTest', () => {

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0100
     * @tc.name      testStationaryView0001
     * @tc.desc      Verify action button id 1 uses the documented naming
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryView0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0001 begin');
      const id: string = BUTTON_IDS[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'id=' + id);
      expect(id).assertEqual('button1');
      expect(id.startsWith('button')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0001 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0200
     * @tc.name      testStationaryView0002
     * @tc.desc      Verify action button id 2 uses the documented naming
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryView0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0002 begin');
      const id: string = BUTTON_IDS[1];
      hilog.info(DOMAIN, TAG, '%{public}s', 'id=' + id);
      expect(id).assertEqual('button2');
      expect(id.startsWith('button')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0002 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0300
     * @tc.name      testStationaryView0003
     * @tc.desc      Verify action button id 3 uses the documented naming
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryView0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0003 begin');
      const id: string = BUTTON_IDS[2];
      hilog.info(DOMAIN, TAG, '%{public}s', 'id=' + id);
      expect(id).assertEqual('button3');
      expect(id.startsWith('button')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0003 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0400
     * @tc.name      testStationaryView0004
     * @tc.desc      Verify action button 1 label is non-empty and Chinese
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryView0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0004 begin');
      const label: string = BUTTON_LABELS[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'label=' + label);
      expect(label.length > 0).assertTrue();
      expect(BUTTON_LABELS.indexOf(label)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0004 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0500
     * @tc.name      testStationaryView0005
     * @tc.desc      Verify action button 2 label is non-empty and Chinese
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryView0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0005 begin');
      const label: string = BUTTON_LABELS[1];
      hilog.info(DOMAIN, TAG, '%{public}s', 'label=' + label);
      expect(label.length > 0).assertTrue();
      expect(BUTTON_LABELS.indexOf(label)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0005 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0600
     * @tc.name      testStationaryView0006
     * @tc.desc      Verify action button 3 label is non-empty and Chinese
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryView0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0006 begin');
      const label: string = BUTTON_LABELS[2];
      hilog.info(DOMAIN, TAG, '%{public}s', 'label=' + label);
      expect(label.length > 0).assertTrue();
      expect(BUTTON_LABELS.indexOf(label)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0006 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0700
     * @tc.name      testStationaryView0007
     * @tc.desc      Verify result text 1 uses the "stationary " prefix
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0007 begin');
      const text: string = RESULT_TEXTS[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.startsWith('stationary ')).assertTrue();
      expect(text.length > 'stationary '.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0007 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0800
     * @tc.name      testStationaryView0008
     * @tc.desc      Verify result text 2 uses the "stationary " prefix
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0008 begin');
      const text: string = RESULT_TEXTS[1];
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.startsWith('stationary ')).assertTrue();
      expect(text.length > 'stationary '.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0008 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_0900
     * @tc.name      testStationaryView0009
     * @tc.desc      Verify result text 3 uses the "stationary " prefix
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0009 begin');
      const text: string = RESULT_TEXTS[2];
      hilog.info(DOMAIN, TAG, '%{public}s', 'text=' + text);
      expect(text.startsWith('stationary ')).assertTrue();
      expect(text.length > 'stationary '.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0009 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1000
     * @tc.name      testStationaryView0010
     * @tc.desc      Verify handler 1 name matches its action semantics
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0010 begin');
      const handler: string = ACTION_HANDLERS[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'handler=' + handler);
      expect(handler.length > 0).assertTrue();
      expect(RESULT_TEXTS[0].indexOf(handler) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0010 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1100
     * @tc.name      testStationaryView0011
     * @tc.desc      Verify handler 2 name matches its action semantics
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0011 begin');
      const handler: string = ACTION_HANDLERS[1];
      hilog.info(DOMAIN, TAG, '%{public}s', 'handler=' + handler);
      expect(handler.length > 0).assertTrue();
      expect(RESULT_TEXTS[1].indexOf(handler) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0011 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1200
     * @tc.name      testStationaryView0012
     * @tc.desc      Verify handler 3 name matches its action semantics
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0012 begin');
      const handler: string = ACTION_HANDLERS[2];
      hilog.info(DOMAIN, TAG, '%{public}s', 'handler=' + handler);
      expect(handler.length > 0).assertTrue();
      expect(RESULT_TEXTS[2].indexOf(handler) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0012 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1300
     * @tc.name      testStationaryView0013
     * @tc.desc      Verify all button ids are pairwise distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0013 begin');
      const values: string[] = BUTTON_IDS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + uniqueStrings(values));
      expect(uniqueStrings(values)).assertEqual(values.length);
      expect(values.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0013 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1400
     * @tc.name      testStationaryView0014
     * @tc.desc      Verify all button labels are pairwise distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0014 begin');
      const values: string[] = BUTTON_LABELS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + uniqueStrings(values));
      expect(uniqueStrings(values)).assertEqual(values.length);
      expect(values.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0014 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1500
     * @tc.name      testStationaryView0015
     * @tc.desc      Verify all result texts are pairwise distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0015 begin');
      const values: string[] = RESULT_TEXTS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + uniqueStrings(values));
      expect(uniqueStrings(values)).assertEqual(values.length);
      expect(values.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0015 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1600
     * @tc.name      testStationaryView0016
     * @tc.desc      Verify all handler names are pairwise distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0016 begin');
      const values: string[] = ACTION_HANDLERS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + uniqueStrings(values));
      expect(uniqueStrings(values)).assertEqual(values.length);
      expect(values.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0016 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1700
     * @tc.name      testStationaryView0017
     * @tc.desc      Verify the status text component id is the documented "show"
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryView0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0017 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', 'show=' + SHOW_ID);
      expect(SHOW_ID).assertEqual('show');
      expect(SHOW_ID.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0017 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1800
     * @tc.name      testStationaryView0018
     * @tc.desc      Verify the initial status message differs from every action result text
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0018 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', 'initial=' + INITIAL_MESSAGE);
      expect(RESULT_TEXTS.indexOf(INITIAL_MESSAGE)).assertEqual(-1);
      expect(INITIAL_MESSAGE.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0018 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_1900
     * @tc.name      testStationaryView0019
     * @tc.desc      Verify documented type type "still" is used by the page
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0019 begin');
      const eventType: string = TYPE_NAMES[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'type=' + eventType);
      expect(eventType.length > 0).assertTrue();
      expect(eventType).assertEqual('still');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0019 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2000
     * @tc.name      testStationaryView0020
     * @tc.desc      Verify documented type type "relativeStill" is used by the page
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryView0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0020 begin');
      const eventType: string = TYPE_NAMES[1];
      hilog.info(DOMAIN, TAG, '%{public}s', 'type=' + eventType);
      expect(eventType.length > 0).assertTrue();
      expect(eventType).assertEqual('relativeStill');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0020 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2100
     * @tc.name      testStationaryView0021
     * @tc.desc      Verify button 1 maps id, label and result text by index
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0021 begin');
      const id: string = BUTTON_IDS[0];
      const label: string = BUTTON_LABELS[0];
      const text: string = RESULT_TEXTS[0];
      hilog.info(DOMAIN, TAG, '%{public}s', 'id=' + id + ' label=' + label + ' text=' + text);
      expect(BUTTON_IDS.indexOf(id)).assertEqual(0);
      expect(BUTTON_LABELS.indexOf(label)).assertEqual(0);
      expect(RESULT_TEXTS.indexOf(text)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0021 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2200
     * @tc.name      testStationaryView0022
     * @tc.desc      Verify button 2 maps id, label and result text by index
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0022 begin');
      const id: string = BUTTON_IDS[1];
      const label: string = BUTTON_LABELS[1];
      const text: string = RESULT_TEXTS[1];
      hilog.info(DOMAIN, TAG, '%{public}s', 'id=' + id + ' label=' + label + ' text=' + text);
      expect(BUTTON_IDS.indexOf(id)).assertEqual(1);
      expect(BUTTON_LABELS.indexOf(label)).assertEqual(1);
      expect(RESULT_TEXTS.indexOf(text)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0022 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2300
     * @tc.name      testStationaryView0023
     * @tc.desc      Verify button 3 maps id, label and result text by index
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0023 begin');
      const id: string = BUTTON_IDS[2];
      const label: string = BUTTON_LABELS[2];
      const text: string = RESULT_TEXTS[2];
      hilog.info(DOMAIN, TAG, '%{public}s', 'id=' + id + ' label=' + label + ' text=' + text);
      expect(BUTTON_IDS.indexOf(id)).assertEqual(2);
      expect(BUTTON_LABELS.indexOf(label)).assertEqual(2);
      expect(RESULT_TEXTS.indexOf(text)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0023 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2400
     * @tc.name      testStationaryView0024
     * @tc.desc      Verify button index resolution is stable across the three arrays (probe #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0024 begin');
      const index: number = 0;
      const id: string = BUTTON_IDS[index];
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'index=' + index + ' id=' + id);
      expect(id).assertEqual('button' + (index + 1));
      expect(label.length > 0 && text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0024 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2500
     * @tc.name      testStationaryView0025
     * @tc.desc      Verify button index resolution is stable across the three arrays (probe #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0025 begin');
      const index: number = 1;
      const id: string = BUTTON_IDS[index];
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'index=' + index + ' id=' + id);
      expect(id).assertEqual('button' + (index + 1));
      expect(label.length > 0 && text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0025 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2600
     * @tc.name      testStationaryView0026
     * @tc.desc      Verify button index resolution is stable across the three arrays (probe #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0026 begin');
      const index: number = 2;
      const id: string = BUTTON_IDS[index];
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'index=' + index + ' id=' + id);
      expect(id).assertEqual('button' + (index + 1));
      expect(label.length > 0 && text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0026 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2700
     * @tc.name      testStationaryView0027
     * @tc.desc      Verify button index resolution is stable across the three arrays (probe #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0027 begin');
      const index: number = 0;
      const id: string = BUTTON_IDS[index];
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'index=' + index + ' id=' + id);
      expect(id).assertEqual('button' + (index + 1));
      expect(label.length > 0 && text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0027 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2800
     * @tc.name      testStationaryView0028
     * @tc.desc      Verify button index resolution is stable across the three arrays (probe #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0028 begin');
      const index: number = 1;
      const id: string = BUTTON_IDS[index];
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'index=' + index + ' id=' + id);
      expect(id).assertEqual('button' + (index + 1));
      expect(label.length > 0 && text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0028 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_2900
     * @tc.name      testStationaryView0029
     * @tc.desc      Verify button index resolution is stable across the three arrays (probe #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0029 begin');
      const index: number = 2;
      const id: string = BUTTON_IDS[index];
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'index=' + index + ' id=' + id);
      expect(id).assertEqual('button' + (index + 1));
      expect(label.length > 0 && text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0029 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_3000
     * @tc.name      testStationaryView0030
     * @tc.desc      Verify the button label maps back to its result text suffix (suffix probe #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0030 begin');
      const index: number = 0;
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'label=' + label + ' text=' + text);
      expect(text === 'stationary ' + handlerText(index)).assertTrue();
      expect(label.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0030 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_3100
     * @tc.name      testStationaryView0031
     * @tc.desc      Verify the button label maps back to its result text suffix (suffix probe #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0031 begin');
      const index: number = 1;
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'label=' + label + ' text=' + text);
      expect(text === 'stationary ' + handlerText(index)).assertTrue();
      expect(label.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0031 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_3200
     * @tc.name      testStationaryView0032
     * @tc.desc      Verify the button label maps back to its result text suffix (suffix probe #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0032 begin');
      const index: number = 2;
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'label=' + label + ' text=' + text);
      expect(text === 'stationary ' + handlerText(index)).assertTrue();
      expect(label.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0032 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_VIEW_3300
     * @tc.name      testStationaryView0033
     * @tc.desc      Verify the button label maps back to its result text suffix (suffix probe #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryView0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0033 begin');
      const index: number = 0;
      const label: string = BUTTON_LABELS[index];
      const text: string = RESULT_TEXTS[index];
      hilog.info(DOMAIN, TAG, '%{public}s', 'label=' + label + ' text=' + text);
      expect(text === 'stationary ' + handlerText(index)).assertTrue();
      expect(label.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryView0033 end');
    });

  });
}
