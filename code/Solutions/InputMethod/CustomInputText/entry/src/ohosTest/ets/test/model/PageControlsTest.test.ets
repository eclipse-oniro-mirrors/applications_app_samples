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
import { yieldToEventLoop } from '../common/YieldHelper';
import { PageStateModel, PageOperation, CursorField, CursorInfoState } from '../common/PageStateModel';
import { TestLogger } from '../common/TestLogger';
import {
  CASE_PREFIX, TAG_PAGE, STRING_ATTACH, STRING_DETACH, STRING_SHOW, STRING_HIDE, STRING_ON, STRING_OFF,
  STRING_NO_ATTACH_TIP, INPUT_TYPE_SELECT_ID, ENTER_KEY_SELECT_ID, SELECT_OPTION_COUNT
} from '../common/TestConstant';

/**
 * pages/Index.ets control interface.
 *
 * The sample page exposes three flag buttons, four cursor TextInputs, two
 * selection TextInputs, two dropdowns and three toast entry points. This suite
 * drives the replica of that state machine: button labels follow the flags,
 * show/on are refused with the noattach toast until attach has run, detach
 * cascades into the other two flags, Number() parsing accepts everything the
 * four-character TextInputs can hold, and the updateCursor payload is a copy of
 * the four stored numbers.
 */

const TOAST_NO_ATTACH: string = 'toast:' + STRING_NO_ATTACH_TIP;

function newPage(): PageStateModel {
  let page: PageStateModel = new PageStateModel();
  return page;
}

function logPage(caseName: string, page: PageStateModel): void {
  TestLogger.infoPair(TAG_PAGE, caseName + ' flags',
    'attached=' + page.isAttached.toString() + ',show=' + page.isShow.toString() + ',on=' + page.isOn.toString());
  TestLogger.infoPair(TAG_PAGE, caseName + ' cursor',
    'left=' + page.cursorInfo.left.toString() + ',top=' + page.cursorInfo.top.toString() +
    ',width=' + page.cursorInfo.width.toString() + ',height=' + page.cursorInfo.height.toString());
}

function logRaw(caseName: string, field: string, raw: string): void {
  TestLogger.infoPair(TAG_PAGE, caseName + ' field=' + field, 'raw=[' + raw + ']');
}

function logPayload(caseName: string, payload: CursorInfoState): void {
  TestLogger.infoPair(TAG_PAGE, caseName + ' payload',
    'top=' + payload.top.toString() + ',left=' + payload.left.toString() +
    ',width=' + payload.width.toString() + ',height=' + payload.height.toString());
}

function expectFlags(page: PageStateModel, attached: boolean, show: boolean, on: boolean): void {
  expect(page.isAttached).assertEqual(attached);
  expect(page.isShow).assertEqual(show);
  expect(page.isOn).assertEqual(on);
}

export default function pageControlsTest(): void {
  describe('CustomInputTextPageControlsTest', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0010
     * @tc.name pageInitialCursorInfo001
     * @tc.desc The cursor rectangle starts at the four zero values of the page model
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageInitialCursorInfo_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageInitialCursorInfo_001');
      let page: PageStateModel = newPage();
      logPage('pageInitialCursorInfo_001', page);
      expect(page.cursorInfo.top).assertEqual(0);
      expect(page.cursorInfo.left).assertEqual(0);
      expect(page.cursorInfo.width).assertEqual(0);
      expect(page.cursorInfo.height).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageInitialCursorInfo_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0020
     * @tc.name pageInitialSelection002
     * @tc.desc Both selection fields start at zero so a changeSelection click covers nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageInitialSelection_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageInitialSelection_002');
      let page: PageStateModel = newPage();
      TestLogger.infoPair(TAG_PAGE, 'pageInitialSelection_002 range',
        'start=' + page.selectStart.toString() + ',end=' + page.selectEnd.toString());
      expect(page.selectStart).assertEqual(0);
      expect(page.selectEnd).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageInitialSelection_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0030
     * @tc.name pageInitialDropdowns003
     * @tc.desc Both dropdowns start on index zero, which is the default slot of each table
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageInitialDropdowns_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageInitialDropdowns_003');
      let page: PageStateModel = newPage();
      TestLogger.infoPair(TAG_PAGE, 'pageInitialDropdowns_003',
        'inputType=' + page.inputTypeIndex.toString() + ',enterKey=' + page.enterKeyIndex.toString());
      expect(page.inputTypeIndex).assertEqual(0);
      expect(page.enterKeyIndex).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageInitialDropdowns_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0040
     * @tc.name pageInitialChangeFlag004
     * @tc.desc No selection command is pending before the first changeSelection tap
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageInitialChangeFlag_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageInitialChangeFlag_004');
      let page: PageStateModel = newPage();
      TestLogger.value(TAG_PAGE, 'pending', page.isChangeSelection.toString());
      expect(page.isChangeSelection).assertFalse();
      expect(page.consumeChangeSelection()).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageInitialChangeFlag_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0050
     * @tc.name pageInitialOptionCounts005
     * @tc.desc aboutToAppear builds four input type options and four enter key options
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageInitialOptionCounts_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageInitialOptionCounts_005');
      let page: PageStateModel = newPage();
      expect(page.buildInputTypeOptions()).assertEqual(SELECT_OPTION_COUNT);
      expect(page.buildEnterKeyOptions()).assertEqual(SELECT_OPTION_COUNT);
      TestLogger.end(TAG_PAGE, 'pageInitialOptionCounts_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0060
     * @tc.name pageFreshInstancesIndependent006
     * @tc.desc Two page models never share flags, so a tap on one leaves the other untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageFreshInstancesIndependent_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageFreshInstancesIndependent_006');
      let first: PageStateModel = newPage();
      let second: PageStateModel = newPage();
      first.toggleAttach();
      first.setCursorField(CursorField.LEFT, '40');
      logPage('pageFreshInstancesIndependent_006 first', first);
      logPage('pageFreshInstancesIndependent_006 second', second);
      expectFlags(first, true, false, false);
      expectFlags(second, false, false, false);
      expect(second.cursorInfo.left).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageFreshInstancesIndependent_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0070
     * @tc.name pageDetachClearsOn007
     * @tc.desc Detaching after the listener was enabled clears the on flag
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageDetachClearsOn_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageDetachClearsOn_007');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleOn();
      expect(page.isOn).assertTrue();
      page.toggleAttach();
      logPage('pageDetachClearsOn_007', page);
      expect(page.isOn).assertFalse();
      expect(page.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_PAGE, 'pageDetachClearsOn_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0080
     * @tc.name pageAttachThreeTaps008
     * @tc.desc Three attach taps end in the attached state with show and on still false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageAttachThreeTaps_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageAttachThreeTaps_008');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleAttach();
      page.toggleAttach();
      logPage('pageAttachThreeTaps_008', page);
      expectFlags(page, true, false, false);
      TestLogger.end(TAG_PAGE, 'pageAttachThreeTaps_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0090
     * @tc.name pageAttachKeepsSelection009
     * @tc.desc Attaching does not rewrite the two selection fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageAttachKeepsSelection_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageAttachKeepsSelection_009');
      let page: PageStateModel = newPage();
      page.setSelectStart('2');
      page.setSelectEnd('4');
      page.toggleAttach();
      TestLogger.infoPair(TAG_PAGE, 'range',
        'start=' + page.selectStart.toString() + ', end=' + page.selectEnd.toString());
      expect(page.selectStart).assertEqual(2);
      expect(page.selectEnd).assertEqual(4);
      TestLogger.end(TAG_PAGE, 'pageAttachKeepsSelection_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0100
     * @tc.name pageAttachKeepsChangeFlag010
     * @tc.desc Attaching does not raise or consume the pending changeSelection command
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageAttachKeepsChangeFlag_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageAttachKeepsChangeFlag_010');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      TestLogger.value(TAG_PAGE, 'pending', page.isChangeSelection.toString());
      expect(page.isChangeSelection).assertFalse();
      expect(page.consumeChangeSelection()).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageAttachKeepsChangeFlag_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0110
     * @tc.name pageShowFiveToggles011
     * @tc.desc Five show taps after attach end in the hidden state, matching an odd toggle count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageShowFiveToggles_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageShowFiveToggles_011');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleShow();
      page.toggleShow();
      page.toggleShow();
      page.toggleShow();
      logPage('pageShowFiveToggles_011', page);
      expect(page.isShow).assertTrue();
      expect(page.showLabel()).assertEqual(STRING_HIDE);
      TestLogger.end(TAG_PAGE, 'pageShowFiveToggles_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0120
     * @tc.name pageOnRefusedDetached012
     * @tc.desc Tapping on before attach reports the noattach toast instead of subscribing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageOnRefusedDetached_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageOnRefusedDetached_012');
      let page: PageStateModel = newPage();
      let operation: string = page.toggleOn();
      logPage('pageOnRefusedDetached_012', page);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(page.isOn).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageOnRefusedDetached_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0130
     * @tc.name pageOnFourToggles013
     * @tc.desc Four on taps after attach end in the unsubscribed state
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageOnFourToggles_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageOnFourToggles_013');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleOn();
      page.toggleOn();
      page.toggleOn();
      page.toggleOn();
      logPage('pageOnFourToggles_013', page);
      expect(page.isOn).assertFalse();
      expect(page.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_PAGE, 'pageOnFourToggles_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0140
     * @tc.name pageSequenceRoundTrip014
     * @tc.desc A six-step cycle returns every operation name in order and ends detached and cleared
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceRoundTrip_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceRoundTrip_014');
      let page: PageStateModel = newPage();
      let attachResult: string = page.toggleAttach();
      let showResult: string = page.toggleShow();
      let onResult: string = page.toggleOn();
      let hideResult: string = page.toggleShow();
      let offResult: string = page.toggleOn();
      let detachResult: string = page.toggleAttach();
      logPage('pageSequenceRoundTrip_014', page);
      expect(attachResult).assertEqual(PageOperation.ATTACH);
      expect(showResult).assertEqual(PageOperation.SHOW);
      expect(onResult).assertEqual(PageOperation.LISTEN);
      expect(hideResult).assertEqual(PageOperation.HIDE);
      expect(offResult).assertEqual(PageOperation.UNLISTEN);
      expect(detachResult).assertEqual(PageOperation.DETACH);
      expectFlags(page, false, false, false);
      TestLogger.end(TAG_PAGE, 'pageSequenceRoundTrip_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0150
     * @tc.name pageSequenceDetachCascade015
     * @tc.desc Detaching in the middle of a fully enabled session clears show and on together
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceDetachCascade_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceDetachCascade_015');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleOn();
      page.toggleAttach();
      logPage('pageSequenceDetachCascade_015', page);
      expectFlags(page, false, false, false);
      expect(page.attachLabel()).assertEqual(STRING_ATTACH);
      TestLogger.end(TAG_PAGE, 'pageSequenceDetachCascade_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0160
     * @tc.name pageSequenceShowToastAfterDetach016
     * @tc.desc After the detach step of a full cycle show is refused with the toast
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceShowToastAfterDetach_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceShowToastAfterDetach_016');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleOn();
      page.toggleAttach();
      let operation: string = page.toggleShow();
      logPage('pageSequenceShowToastAfterDetach_016', page);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(page.isShow).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageSequenceShowToastAfterDetach_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0170
     * @tc.name pageSequenceOnToastAfterDetach017
     * @tc.desc After the detach step of a full cycle on is refused with the toast
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceOnToastAfterDetach_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceOnToastAfterDetach_017');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleOn();
      page.toggleAttach();
      let operation: string = page.toggleOn();
      logPage('pageSequenceOnToastAfterDetach_017', page);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(page.isOn).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageSequenceOnToastAfterDetach_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0180
     * @tc.name pageSequenceTwoCycles018
     * @tc.desc Two consecutive full cycles both end with all flags cleared
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceTwoCycles_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceTwoCycles_018');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleAttach();
      logPage('pageSequenceTwoCycles_018 first', page);
      let firstCycle: boolean = page.isAttached === false && page.isShow === false && page.isOn === false;
      page.toggleAttach();
      page.toggleShow();
      page.toggleAttach();
      logPage('pageSequenceTwoCycles_018 second', page);
      expect(firstCycle).assertTrue();
      expectFlags(page, false, false, false);
      TestLogger.end(TAG_PAGE, 'pageSequenceTwoCycles_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0190
     * @tc.name pageSequenceKeepsPayload019
     * @tc.desc A full button cycle leaves the updateCursor payload at its zero defaults
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceKeepsPayload_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceKeepsPayload_019');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleOn();
      page.toggleAttach();
      let payload: CursorInfoState = page.clickUpdateCursor();
      logPayload('pageSequenceKeepsPayload_019', payload);
      expect(payload.left).assertEqual(0);
      expect(payload.width).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageSequenceKeepsPayload_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0200
     * @tc.name pageSequenceKeepsDropdowns020
     * @tc.desc A full button cycle leaves both dropdown selections untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceKeepsDropdowns_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceKeepsDropdowns_020');
      let page: PageStateModel = newPage();
      page.selectInputType(1);
      page.selectEnterKey(2);
      page.toggleAttach();
      page.toggleShow();
      page.toggleOn();
      page.toggleAttach();
      expect(page.inputTypeIndex).assertEqual(1);
      expect(page.enterKeyIndex).assertEqual(2);
      TestLogger.end(TAG_PAGE, 'pageSequenceKeepsDropdowns_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0210
     * @tc.name pageSequenceKeepsSelectionAndFlag021
     * @tc.desc Button cycles never consume the pending changeSelection command or the range values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSequenceKeepsSelectionAndFlag_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSequenceKeepsSelectionAndFlag_021');
      let page: PageStateModel = newPage();
      page.setSelectStart('2');
      page.setSelectEnd('4');
      page.clickChangeSelection();
      page.toggleAttach();
      page.toggleShow();
      page.toggleAttach();
      TestLogger.infoPair(TAG_PAGE, 'range',
        'start=' + page.selectStart.toString() + ', end=' + page.selectEnd.toString());
      expect(page.selectStart).assertEqual(2);
      expect(page.selectEnd).assertEqual(4);
      expect(page.isChangeSelection).assertTrue();
      expect(page.consumeChangeSelection()).assertTrue();
      TestLogger.end(TAG_PAGE, 'pageSequenceKeepsSelectionAndFlag_021');
      await yieldToEventLoop();
      done();
    });
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0220
     * @tc.name pageParseEmptyLeft022
     * @tc.desc An empty cursor-left field parses to zero because Number('') is zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseEmptyLeft_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseEmptyLeft_022');
      let page: PageStateModel = newPage();
      logRaw('pageParseEmptyLeft_022', CursorField.LEFT, '');
      page.setCursorField(CursorField.LEFT, '');
      logPage('pageParseEmptyLeft_022', page);
      expect(page.cursorInfo.left).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageParseEmptyLeft_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0230
     * @tc.name pageParseBlankTop023
     * @tc.desc A whitespace-only cursor-top field parses to zero rather than failing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseBlankTop_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseBlankTop_023');
      let page: PageStateModel = newPage();
      logRaw('pageParseBlankTop_023', CursorField.TOP, ' ');
      page.setCursorField(CursorField.TOP, ' ');
      expect(page.cursorInfo.top).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageParseBlankTop_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0240
     * @tc.name pageParseZeroWidth024
     * @tc.desc A literal zero in cursor-width stays zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseZeroWidth_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseZeroWidth_024');
      let page: PageStateModel = newPage();
      logRaw('pageParseZeroWidth_024', CursorField.WIDTH, '0');
      page.setCursorField(CursorField.WIDTH, '0');
      expect(page.cursorInfo.width).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageParseZeroWidth_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0250
     * @tc.name pageParseNegativeHeight025
     * @tc.desc A negative cursor-height is accepted verbatim because the field performs no range check
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseNegativeHeight_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseNegativeHeight_025');
      let page: PageStateModel = newPage();
      logRaw('pageParseNegativeHeight_025', CursorField.HEIGHT, '-5');
      page.setCursorField(CursorField.HEIGHT, '-5');
      expect(page.cursorInfo.height).assertEqual(-5);
      TestLogger.end(TAG_PAGE, 'pageParseNegativeHeight_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0260
     * @tc.name pageParseDecimalLeft026
     * @tc.desc A decimal cursor-left survives without rounding
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseDecimalLeft_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseDecimalLeft_026');
      let page: PageStateModel = newPage();
      logRaw('pageParseDecimalLeft_026', CursorField.LEFT, '12.9');
      page.setCursorField(CursorField.LEFT, '12.9');
      expect(page.cursorInfo.left).assertEqual(12.9);
      TestLogger.end(TAG_PAGE, 'pageParseDecimalLeft_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0270
     * @tc.name pageParseWordTop027
     * @tc.desc A non-numeric cursor-top becomes NaN, which the page forwards unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseWordTop_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseWordTop_027');
      let page: PageStateModel = newPage();
      logRaw('pageParseWordTop_027', CursorField.TOP, 'abc');
      page.setCursorField(CursorField.TOP, 'abc');
      let parsed: number = page.cursorInfo.top;
      TestLogger.value(TAG_PAGE, 'parsed', parsed.toString());
      expect(Number.isNaN(parsed)).assertTrue();
      TestLogger.end(TAG_PAGE, 'pageParseWordTop_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0280
     * @tc.name pageParseExponentWidth028
     * @tc.desc Scientific notation 1e3 is accepted as one thousand
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseExponentWidth_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseExponentWidth_028');
      let page: PageStateModel = newPage();
      logRaw('pageParseExponentWidth_028', CursorField.WIDTH, '1e3');
      page.setCursorField(CursorField.WIDTH, '1e3');
      expect(page.cursorInfo.width).assertEqual(1000);
      TestLogger.end(TAG_PAGE, 'pageParseExponentWidth_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0290
     * @tc.name pageParseHexHeight029
     * @tc.desc A hexadecimal literal 0x10 is accepted as sixteen
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseHexHeight_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseHexHeight_029');
      let page: PageStateModel = newPage();
      logRaw('pageParseHexHeight_029', CursorField.HEIGHT, '0x10');
      page.setCursorField(CursorField.HEIGHT, '0x10');
      expect(page.cursorInfo.height).assertEqual(16);
      TestLogger.end(TAG_PAGE, 'pageParseHexHeight_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0300
     * @tc.name pageParseInfinityLeft030
     * @tc.desc The literal Infinity parses to positive infinity and is stored as such
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageParseInfinityLeft_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseInfinityLeft_030');
      let page: PageStateModel = newPage();
      logRaw('pageParseInfinityLeft_030', CursorField.LEFT, 'Infinity');
      page.setCursorField(CursorField.LEFT, 'Infinity');
      expect(page.cursorInfo.left).assertEqual(Infinity);
      TestLogger.end(TAG_PAGE, 'pageParseInfinityLeft_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0310
     * @tc.name pageParseNegativeInfinityTop031
     * @tc.desc The literal -Infinity parses to negative infinity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageParseNegativeInfinityTop_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseNegativeInfinityTop_031');
      let page: PageStateModel = newPage();
      logRaw('pageParseNegativeInfinityTop_031', CursorField.TOP, '-Infinity');
      page.setCursorField(CursorField.TOP, '-Infinity');
      expect(page.cursorInfo.top).assertEqual(-Infinity);
      TestLogger.end(TAG_PAGE, 'pageParseNegativeInfinityTop_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0320
     * @tc.name pageParsePaddedWidth032
     * @tc.desc Leading and trailing spaces are trimmed by Number(), giving seven
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParsePaddedWidth_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParsePaddedWidth_032');
      let page: PageStateModel = newPage();
      logRaw('pageParsePaddedWidth_032', CursorField.WIDTH, '  7  ');
      page.setCursorField(CursorField.WIDTH, '  7  ');
      expect(page.cursorInfo.width).assertEqual(7);
      TestLogger.end(TAG_PAGE, 'pageParsePaddedWidth_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0330
     * @tc.name pageParseLeadingZerosHeight033
     * @tc.desc Leading zeros are not octal: 0007 parses to seven
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseLeadingZerosHeight_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseLeadingZerosHeight_033');
      let page: PageStateModel = newPage();
      logRaw('pageParseLeadingZerosHeight_033', CursorField.HEIGHT, '0007');
      page.setCursorField(CursorField.HEIGHT, '0007');
      expect(page.cursorInfo.height).assertEqual(7);
      TestLogger.end(TAG_PAGE, 'pageParseLeadingZerosHeight_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0340
     * @tc.name pageParseNegativeZeroTop034
     * @tc.desc '-0' keeps its negative-zero identity, proved through one divided by the value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseNegativeZeroTop_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseNegativeZeroTop_034');
      let page: PageStateModel = newPage();
      logRaw('pageParseNegativeZeroTop_034', CursorField.TOP, '-0');
      page.setCursorField(CursorField.TOP, '-0');
      let quotient: number = 1 / page.cursorInfo.top;
      TestLogger.value(TAG_PAGE, 'one divided by top', quotient.toString());
      expect(quotient).assertEqual(-Infinity);
      expect(page.cursorInfo.top).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageParseNegativeZeroTop_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0350
     * @tc.name pageParseDotOnlyHeight035
     * @tc.desc A lone decimal point is not a number and yields NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseDotOnlyHeight_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseDotOnlyHeight_035');
      let page: PageStateModel = newPage();
      logRaw('pageParseDotOnlyHeight_035', CursorField.HEIGHT, '.');
      page.setCursorField(CursorField.HEIGHT, '.');
      expect(Number.isNaN(page.cursorInfo.height)).assertTrue();
      TestLogger.end(TAG_PAGE, 'pageParseDotOnlyHeight_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0360
     * @tc.name pageParseUnitSuffixLeft036
     * @tc.desc A value with a px suffix is rejected by Number(), leaving the field NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseUnitSuffixLeft_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseUnitSuffixLeft_036');
      let page: PageStateModel = newPage();
      logRaw('pageParseUnitSuffixLeft_036', CursorField.LEFT, '12px');
      page.setCursorField(CursorField.LEFT, '12px');
      expect(Number.isNaN(page.cursorInfo.left)).assertTrue();
      TestLogger.end(TAG_PAGE, 'pageParseUnitSuffixLeft_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0370
     * @tc.name pageParseFieldRouting037
     * @tc.desc Writing the left field leaves the other three fields at their defaults
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseFieldRouting_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseFieldRouting_037');
      let page: PageStateModel = newPage();
      page.setCursorField(CursorField.LEFT, '40');
      logPage('pageParseFieldRouting_037', page);
      expect(page.cursorInfo.left).assertEqual(40);
      expect(page.cursorInfo.top).assertEqual(0);
      expect(page.cursorInfo.width).assertEqual(0);
      expect(page.cursorInfo.height).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageParseFieldRouting_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0380
     * @tc.name pageParseOverwriteLeft038
     * @tc.desc A second edit of the left field overwrites the first value instead of appending
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseOverwriteLeft_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseOverwriteLeft_038');
      let page: PageStateModel = newPage();
      page.setCursorField(CursorField.LEFT, '40');
      page.setCursorField(CursorField.LEFT, '80');
      logPage('pageParseOverwriteLeft_038', page);
      expect(page.cursorInfo.left).assertEqual(80);
      expect(page.cursorInfo.left === 40).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageParseOverwriteLeft_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0390
     * @tc.name pageParseAllFourFields039
     * @tc.desc Four independent edits populate all four cursor fields
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageParseAllFourFields_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageParseAllFourFields_039');
      let page: PageStateModel = newPage();
      page.setCursorField(CursorField.LEFT, '10');
      page.setCursorField(CursorField.TOP, '20');
      page.setCursorField(CursorField.WIDTH, '30');
      page.setCursorField(CursorField.HEIGHT, '40');
      logPage('pageParseAllFourFields_039', page);
      expect(page.cursorInfo.left).assertEqual(10);
      expect(page.cursorInfo.top).assertEqual(20);
      expect(page.cursorInfo.width).assertEqual(30);
      expect(page.cursorInfo.height).assertEqual(40);
      TestLogger.end(TAG_PAGE, 'pageParseAllFourFields_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0400
     * @tc.name pageSelectEmptyStart040
     * @tc.desc An empty selection-start field parses to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectEmptyStart_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSelectEmptyStart_040');
      let page: PageStateModel = newPage();
      page.setSelectStart('');
      TestLogger.value(TAG_PAGE, 'start', page.selectStart.toString());
      expect(page.selectStart).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageSelectEmptyStart_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0410
     * @tc.name pageSelectEmptyEnd041
     * @tc.desc An empty selection-end field parses to zero as well
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectEmptyEnd_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSelectEmptyEnd_041');
      let page: PageStateModel = newPage();
      page.setSelectEnd('');
      expect(page.selectEnd).assertEqual(0);
      TestLogger.end(TAG_PAGE, 'pageSelectEmptyEnd_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0420
     * @tc.name pageSelectNegativeStart042
     * @tc.desc A negative selection start is stored as given because the field has no lower bound
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectNegativeStart_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSelectNegativeStart_042');
      let page: PageStateModel = newPage();
      page.setSelectStart('-3');
      expect(page.selectStart).assertEqual(-3);
      TestLogger.end(TAG_PAGE, 'pageSelectNegativeStart_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0430
     * @tc.name pageSelectDecimalEnd043
     * @tc.desc A decimal selection end is preserved and later consumed by substring truncation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageSelectDecimalEnd_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSelectDecimalEnd_043');
      let page: PageStateModel = newPage();
      page.setSelectEnd('2.5');
      expect(page.selectEnd).assertEqual(2.5);
      TestLogger.end(TAG_PAGE, 'pageSelectDecimalEnd_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0440
     * @tc.name pageSelectInfinityEnd044
     * @tc.desc An Infinity selection end is stored and later clamped by the editor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageSelectInfinityEnd_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageSelectInfinityEnd_044');
      let page: PageStateModel = newPage();
      page.setSelectEnd('Infinity');
      expect(page.selectEnd).assertEqual(Infinity);
      TestLogger.end(TAG_PAGE, 'pageSelectInfinityEnd_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0450
     * @tc.name pageChangeFlagIndependentOfToggles045
     * @tc.desc Button toggles neither raise nor consume the pending selection command
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageChangeFlagIndependentOfToggles_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageChangeFlagIndependentOfToggles_045');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleOn();
      TestLogger.value(TAG_PAGE, 'pending', page.isChangeSelection.toString());
      expect(page.isChangeSelection).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageChangeFlagIndependentOfToggles_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0460
     * @tc.name pageDropdownInputTypeZero046
     * @tc.desc Selecting slot zero records index zero and returns the input type dropdown id for refocusing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageDropdownInputTypeZero_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageDropdownInputTypeZero_046');
      let page: PageStateModel = newPage();
      let focusId: string = page.selectInputType(0);
      TestLogger.infoPair(TAG_PAGE, 'selection',
        'index=' + page.inputTypeIndex.toString() + ', focus=' + focusId);
      expect(page.inputTypeIndex).assertEqual(0);
      expect(focusId).assertEqual(INPUT_TYPE_SELECT_ID);
      TestLogger.end(TAG_PAGE, 'pageDropdownInputTypeZero_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0470
     * @tc.name pageDropdownInputTypeNegative047
     * @tc.desc A negative dropdown index is recorded verbatim because onSelect performs no range check
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageDropdownInputTypeNegative_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageDropdownInputTypeNegative_047');
      let page: PageStateModel = newPage();
      page.selectInputType(-1);
      TestLogger.value(TAG_PAGE, 'index', page.inputTypeIndex.toString());
      expect(page.inputTypeIndex).assertEqual(-1);
      TestLogger.end(TAG_PAGE, 'pageDropdownInputTypeNegative_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0480
     * @tc.name pageDropdownEnterKeyNegative048
     * @tc.desc A negative enter key index is recorded without clamping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageDropdownEnterKeyNegative_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageDropdownEnterKeyNegative_048');
      let page: PageStateModel = newPage();
      page.selectEnterKey(-1);
      expect(page.enterKeyIndex).assertEqual(-1);
      expect(page.currentEnterKeyLabel()).assertEqual('-1');
      TestLogger.end(TAG_PAGE, 'pageDropdownEnterKeyNegative_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0490
     * @tc.name pageIndependenceShowToOn049
     * @tc.desc Toggling show twice leaves the on flag unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageIndependenceShowToOn_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageIndependenceShowToOn_049');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.toggleShow();
      page.toggleShow();
      logPage('pageIndependenceShowToOn_049', page);
      expect(page.isShow).assertFalse();
      expect(page.isOn).assertFalse();
      TestLogger.end(TAG_PAGE, 'pageIndependenceShowToOn_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0500
     * @tc.name pageIndependenceOptionCounts050
     * @tc.desc The option counts stay at four after every kind of interaction
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'pageIndependenceOptionCounts_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageIndependenceOptionCounts_050');
      let page: PageStateModel = newPage();
      page.toggleAttach();
      page.selectInputType(3);
      page.setCursorField(CursorField.LEFT, '9');
      page.setSelectEnd('12');
      logPage('pageIndependenceOptionCounts_050', page);
      expect(page.buildInputTypeOptions()).assertEqual(SELECT_OPTION_COUNT);
      expect(page.buildEnterKeyOptions()).assertEqual(SELECT_OPTION_COUNT);
      TestLogger.end(TAG_PAGE, 'pageIndependenceOptionCounts_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_PAGE_0510
     * @tc.name pageDropdownExtremeLabel051
     * @tc.desc An infinite dropdown index is still rendered through the numeric label conversion
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'pageDropdownExtremeLabel_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_PAGE, 'pageDropdownExtremeLabel_051');
      let page: PageStateModel = newPage();
      page.selectInputType(Infinity);
      let label: string = page.currentInputTypeLabel();
      TestLogger.value(TAG_PAGE, 'label', label);
      expect(label).assertEqual('Infinity');
      expect(page.inputTypeIndex).assertEqual(Infinity);
      TestLogger.end(TAG_PAGE, 'pageDropdownExtremeLabel_051');
      await yieldToEventLoop();
      done();
    });

  });
}
