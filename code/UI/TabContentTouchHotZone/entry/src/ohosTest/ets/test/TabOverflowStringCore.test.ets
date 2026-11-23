/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { STRINGCONFIGURATION } from '../../../main/ets/bridge/TabContentTouchHotZoneBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TabOverflowStringCore';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function tabOverflowStringCoreTest(): void {
  describe('TabOverflowStringCoreTest', () => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0101
     * @tc.name      testTabOverflowString0101
     * @tc.desc      Checks video tab name constant equals 'video'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0101 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_VIDEO'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='video'`);
      expect(value).assertEqual('video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0101 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0102
     * @tc.name      testTabOverflowString0102
     * @tc.desc      Checks side panel name constant equals 'side'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0102 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_SIDE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='side'`);
      expect(value).assertEqual('side');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0102 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0103
     * @tc.name      testTabOverflowString0103
     * @tc.desc      Checks video description name constant equals 'videoDes'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0103 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_VIDEODES'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='videoDes'`);
      expect(value).assertEqual('videoDes');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0103 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0104
     * @tc.name      testTabOverflowString0104
     * @tc.desc      Checks top view name constant equals 'topView'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0104 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TOPVIEW'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='topView'`);
      expect(value).assertEqual('topView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0104 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0105
     * @tc.name      testTabOverflowString0105
     * @tc.desc      Checks play time text id constant equals 'playTimeText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0105 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_PLAYTIME_TEXT_ID'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='playTimeText'`);
      expect(value).assertEqual('playTimeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0105 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0106
     * @tc.name      testTabOverflowString0106
     * @tc.desc      Checks total time text id constant equals 'totalTimeText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0106 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TOTALTIME_TEXT_ID'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='totalTimeText'`);
      expect(value).assertEqual('totalTimeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0106 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0107
     * @tc.name      testTabOverflowString0107
     * @tc.desc      Checks progress text one id constant equals 'text1'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0107 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TEXTONE_ID'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='text1'`);
      expect(value).assertEqual('text1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0107 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0108
     * @tc.name      testTabOverflowString0108
     * @tc.desc      Checks progress text two id constant equals 'text2'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0108 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TEXTTWO_ID'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='text2'`);
      expect(value).assertEqual('text2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0108 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0109
     * @tc.name      testTabOverflowString0109
     * @tc.desc      Checks progress text three id constant equals 'text3'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0109 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TEXTTHREE_ID'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='text3'`);
      expect(value).assertEqual('text3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0109 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0110
     * @tc.name      testTabOverflowString0110
     * @tc.desc      Checks progress container id constant equals 'RelativeContainer'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0110 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_RELATIVE_CONTAINER'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='RelativeContainer'`);
      expect(value).assertEqual('RelativeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0110 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0111
     * @tc.name      testTabOverflowString0111
     * @tc.desc      Checks head image id constant equals 'headImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0111 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_HEAD_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='headImage'`);
      expect(value).assertEqual('headImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0111 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0112
     * @tc.name      testTabOverflowString0112
     * @tc.desc      Checks focus image id constant equals 'focusImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0112 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_FOCUS_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='focusImage'`);
      expect(value).assertEqual('focusImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0112 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0113
     * @tc.name      testTabOverflowString0113
     * @tc.desc      Checks like image id constant equals 'likeImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0113 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_LIKE_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='likeImage'`);
      expect(value).assertEqual('likeImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0113 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0114
     * @tc.name      testTabOverflowString0114
     * @tc.desc      Checks like text id constant equals 'likeText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0114 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_LIKE_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='likeText'`);
      expect(value).assertEqual('likeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0114 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0115
     * @tc.name      testTabOverflowString0115
     * @tc.desc      Checks comment image id constant equals 'commentImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0115 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_COMMENT_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='commentImage'`);
      expect(value).assertEqual('commentImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0115 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0116
     * @tc.name      testTabOverflowString0116
     * @tc.desc      Checks comment text id constant equals 'commentText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0116 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_COMMENT_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='commentText'`);
      expect(value).assertEqual('commentText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0116 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0117
     * @tc.name      testTabOverflowString0117
     * @tc.desc      Checks favorite image id constant equals 'favoriteImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0117 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_FAVORITE_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='favoriteImage'`);
      expect(value).assertEqual('favoriteImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0117 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0118
     * @tc.name      testTabOverflowString0118
     * @tc.desc      Checks favorite text id constant equals 'favoriteText' with source key spelling.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0118 begin');
      const value: string = STRINGCONFIGURATION['TABCONTEN_TOVERFLOW_FAVORITE_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='favoriteText'`);
      expect(value).assertEqual('favoriteText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0118 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0119
     * @tc.name      testTabOverflowString0119
     * @tc.desc      Checks share image id constant equals 'shareImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0119 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_SHARE_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='shareImage'`);
      expect(value).assertEqual('shareImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0119 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0120
     * @tc.name      testTabOverflowString0120
     * @tc.desc      Checks share text id constant equals 'shareText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0120 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_SHARE_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='shareText'`);
      expect(value).assertEqual('shareText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0120 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0121
     * @tc.name      testTabOverflowString0121
     * @tc.desc      Checks name text id constant equals 'nameText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0121 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_NAME_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='nameText'`);
      expect(value).assertEqual('nameText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0121 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0122
     * @tc.name      testTabOverflowString0122
     * @tc.desc      Checks description text id constant equals 'descriptionText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0122 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_DESCRIPTION_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='descriptionText'`);
      expect(value).assertEqual('descriptionText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0122 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0123
     * @tc.name      testTabOverflowString0123
     * @tc.desc      Checks time text id constant equals 'timeText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0123 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TIME_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='timeText'`);
      expect(value).assertEqual('timeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0123 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0124
     * @tc.name      testTabOverflowString0124
     * @tc.desc      Checks gray background id constant equals 'grayBackGround'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0124 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_GRAY_BACKGROUND'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='grayBackGround'`);
      expect(value).assertEqual('grayBackGround');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0124 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0125
     * @tc.name      testTabOverflowString0125
     * @tc.desc      Checks hot image id constant equals 'hotImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0125 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_HOT_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='hotImage'`);
      expect(value).assertEqual('hotImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0125 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0126
     * @tc.name      testTabOverflowString0126
     * @tc.desc      Checks hot text id constant equals 'hotText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0126 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_HOT_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='hotText'`);
      expect(value).assertEqual('hotText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0126 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0127
     * @tc.name      testTabOverflowString0127
     * @tc.desc      Checks hot spot text id constant equals 'hotSpot'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0127 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_HOT_SPOT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='hotSpot'`);
      expect(value).assertEqual('hotSpot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0127 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0128
     * @tc.name      testTabOverflowString0128
     * @tc.desc      Checks people number arrow id constant equals 'peopleNumArrow'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0128 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_PEOPLE_NUMARROW'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='peopleNumArrow'`);
      expect(value).assertEqual('peopleNumArrow');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0128 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0129
     * @tc.name      testTabOverflowString0129
     * @tc.desc      Checks people number text id constant equals 'peopleNum'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0129 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_PEOPLE_NUM'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='peopleNum'`);
      expect(value).assertEqual('peopleNum');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0129 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0130
     * @tc.name      testTabOverflowString0130
     * @tc.desc      Checks divider id constant equals 'divider'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0130 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_DIVIDER'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='divider'`);
      expect(value).assertEqual('divider');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0130 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0131
     * @tc.name      testTabOverflowString0131
     * @tc.desc      Checks search image id constant equals 'searchImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0131 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_SEARCH_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='searchImage'`);
      expect(value).assertEqual('searchImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0131 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0132
     * @tc.name      testTabOverflowString0132
     * @tc.desc      Checks follow text id constant equals 'followText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0132 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_FOLLOW_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='followText'`);
      expect(value).assertEqual('followText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0132 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0133
     * @tc.name      testTabOverflowString0133
     * @tc.desc      Checks selected text id constant equals 'selectedText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0133 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_SELECTED_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='selectedText'`);
      expect(value).assertEqual('selectedText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0133 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0134
     * @tc.name      testTabOverflowString0134
     * @tc.desc      Checks recommendation text id constant equals 'recommendationText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0134 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_RECOMMENDATION_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='recommendationText'`);
      expect(value).assertEqual('recommendationText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0134 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0135
     * @tc.name      testTabOverflowString0135
     * @tc.desc      Checks screening hall text id constant equals 'screeningHallText'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0135 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_SCREENINGHALL_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='screeningHallText'`);
      expect(value).assertEqual('screeningHallText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0135 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0136
     * @tc.name      testTabOverflowString0136
     * @tc.desc      Checks top view divider id constant equals 'divider'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0136 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TOPVIEW_DIVIDER'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='divider'`);
      expect(value).assertEqual('divider');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0136 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0137
     * @tc.name      testTabOverflowString0137
     * @tc.desc      Checks add image id constant equals 'addImage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0137 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_ADD_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='addImage'`);
      expect(value).assertEqual('addImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0137 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0138
     * @tc.name      testTabOverflowString0138
     * @tc.desc      Checks tabs component id constant equals 'tabs'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0138 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TABS'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='tabs'`);
      expect(value).assertEqual('tabs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0138 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0139
     * @tc.name      testTabOverflowString0139
     * @tc.desc      Checks tab bar id constant equals 'tabbar'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0139 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TABBAR'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='tabbar'`);
      expect(value).assertEqual('tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0139 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0140
     * @tc.name      testTabOverflowString0140
     * @tc.desc      Checks play time prefix constant equals '00:'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0140 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_PLAYTIME_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='00:'`);
      expect(value).assertEqual('00:');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0140 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0141
     * @tc.name      testTabOverflowString0141
     * @tc.desc      Checks total time prefix constant equals '/00:'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0141 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TOTALTIME_TEXT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='/00:'`);
      expect(value).assertEqual('/00:');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0141 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0142
     * @tc.name      testTabOverflowString0142
     * @tc.desc      Checks relative container anchor constant equals '__container__'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0142 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_CONTAINER'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='__container__'`);
      expect(value).assertEqual('__container__');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0142 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0143
     * @tc.name      testTabOverflowString0143
     * @tc.desc      Checks play button image id constant equals 'image'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0143 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_IMAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='image'`);
      expect(value).assertEqual('image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0143 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0144
     * @tc.name      testTabOverflowString0144
     * @tc.desc      Checks homepage tab text constant matches Chinese placeholder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0144 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_HOMEPAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='首页界面，仅供Tabs展示。'`);
      expect(value).assertEqual('首页界面，仅供Tabs展示。');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0144 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0145
     * @tc.name      testTabOverflowString0145
     * @tc.desc      Checks mall tab text constant matches Chinese placeholder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0145 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_MALL'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='商城界面，仅供Tabs展示。'`);
      expect(value).assertEqual('商城界面，仅供Tabs展示。');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0145 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0146
     * @tc.name      testTabOverflowString0146
     * @tc.desc      Checks mine tab text constant matches Chinese placeholder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0146 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_MINE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='我的界面，仅供Tabs展示。'`);
      expect(value).assertEqual('我的界面，仅供Tabs展示。');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0146 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0147
     * @tc.name      testTabOverflowString0147
     * @tc.desc      Checks video author name constant equals '@北大是只猫'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0147 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_VIDEO_DES_NAME'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='@北大是只猫'`);
      expect(value).assertEqual('@北大是只猫');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0147 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0148
     * @tc.name      testTabOverflowString0148
     * @tc.desc      Checks video description constant equals Chinese sentence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0148 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_VIDEO_DES_DESCRIPTION'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='今天天气是阴天。'`);
      expect(value).assertEqual('今天天气是阴天。');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0148 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0149
     * @tc.name      testTabOverflowString0149
     * @tc.desc      Checks video hotspot constant equals Chinese phrase.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0149 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_VIDEO_DES_HOTSPOT'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=' · 猫长藓要多晒太阳'`);
      expect(value).assertEqual(' · 猫长藓要多晒太阳');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0149 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0150
     * @tc.name      testTabOverflowString0150
     * @tc.desc      Checks video publish time constant equals '2024-1-3 14:52'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0150 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_VIDEO_DES_TIME'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='2024-1-3 14:52'`);
      expect(value).assertEqual('2024-1-3 14:52');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0150 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0151
     * @tc.name      testTabOverflowString0151
     * @tc.desc      Checks white color constant equals '#FFFFFF'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0151 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_WHITE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='#FFFFFF'`);
      expect(value).assertEqual('#FFFFFF');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0151 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0152
     * @tc.name      testTabOverflowString0152
     * @tc.desc      Checks black color constant equals '#000000'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0152 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_BLACK'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='#000000'`);
      expect(value).assertEqual('#000000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0152 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0153
     * @tc.name      testTabOverflowString0153
     * @tc.desc      Checks window stage key constant equals 'windowStage'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0153 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_WINDOW_STAGE'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='windowStage'`);
      expect(value).assertEqual('windowStage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0153 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0154
     * @tc.name      testTabOverflowString0154
     * @tc.desc      Checks time zero constant equals '0'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0154 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENT_OVERFLOW_TIME_ZERO'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='0'`);
      expect(value).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0154 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_STRING_0155
     * @tc.name      testTabOverflowString0155
     * @tc.desc      Checks time zero legacy key constant equals '0'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowString0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTabOverflowString0155 begin');
      const value: string = STRINGCONFIGURATION['TABCONTENTOVERFLOWTIMEZERO'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='0'`);
      expect(value).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='string'`);
      expect(typeof value).assertEqual('string');
      log('testTabOverflowString0155 end');
    })
  })
}
