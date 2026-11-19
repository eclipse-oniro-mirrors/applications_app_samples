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
import { notificationManager as notification } from '@kit.NotificationKit';
import { notificationContentUtil } from '@ohos/notification';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomNotificationBadge]';

// 统一记录实际值与期望值，避免逐处重复书写日志格式串
function logActual(actual: string, expected: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, expected);
}

export default function contentVolume01Test() {
  describe('ContentVolume01Test', () => {

    /**
     * @tc.name   testContentVolume010001
     * @tc.number SUB_CNB_CONTENT_0041
     * @tc.desc   合法值：notificationContentType=0 时直接返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010001 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 0 });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010001 end');
    })

    /**
     * @tc.name   testContentVolume010002
     * @tc.number SUB_CNB_CONTENT_0042
     * @tc.desc   合法值：notificationContentType=1 时直接返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010002 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 1 });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010002 end');
    })

    /**
     * @tc.name   testContentVolume010003
     * @tc.number SUB_CNB_CONTENT_0043
     * @tc.desc   合法值：notificationContentType=2 时直接返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010003 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 2 });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010003 end');
    })

    /**
     * @tc.name   testContentVolume010004
     * @tc.number SUB_CNB_CONTENT_0044
     * @tc.desc   合法值：notificationContentType=3 时直接返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010004 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 3 });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010004 end');
    })

    /**
     * @tc.name   testContentVolume010005
     * @tc.number SUB_CNB_CONTENT_0045
     * @tc.desc   合法值：notificationContentType=4 时直接返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010005 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 4 });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010005 end');
    })

    /**
     * @tc.name   testContentVolume010006
     * @tc.number SUB_CNB_CONTENT_0046
     * @tc.desc   合法值：notificationContentType=5 时直接返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010006 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 5 });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010006 end');
    })

    /**
     * @tc.name   testContentVolume010007
     * @tc.number SUB_CNB_CONTENT_0047
     * @tc.desc   合法值：notificationContentType=6 时直接返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010007 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 6 });
      logActual(String(result), String(6));
      expect(result).assertEqual(6);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010007 end');
    })

    /**
     * @tc.name   testContentVolume010008
     * @tc.number SUB_CNB_CONTENT_0048
     * @tc.desc   兼容值：仅设置废弃 contentType=0 时回退返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010008 begin');
      const result: number = notificationContentUtil.getContentTypeId({ contentType: 0 });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010008 end');
    })

    /**
     * @tc.name   testContentVolume010009
     * @tc.number SUB_CNB_CONTENT_0049
     * @tc.desc   兼容值：仅设置废弃 contentType=1 时回退返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010009 begin');
      const result: number = notificationContentUtil.getContentTypeId({ contentType: 1 });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010009 end');
    })

    /**
     * @tc.name   testContentVolume010010
     * @tc.number SUB_CNB_CONTENT_0050
     * @tc.desc   兼容值：仅设置废弃 contentType=2 时回退返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010010 begin');
      const result: number = notificationContentUtil.getContentTypeId({ contentType: 2 });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010010 end');
    })

    /**
     * @tc.name   testContentVolume010011
     * @tc.number SUB_CNB_CONTENT_0051
     * @tc.desc   兼容值：仅设置废弃 contentType=3 时回退返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010011 begin');
      const result: number = notificationContentUtil.getContentTypeId({ contentType: 3 });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010011 end');
    })

    /**
     * @tc.name   testContentVolume010012
     * @tc.number SUB_CNB_CONTENT_0052
     * @tc.desc   兼容值：仅设置废弃 contentType=4 时回退返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010012 begin');
      const result: number = notificationContentUtil.getContentTypeId({ contentType: 4 });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010012 end');
    })

    /**
     * @tc.name   testContentVolume010013
     * @tc.number SUB_CNB_CONTENT_0053
     * @tc.desc   兼容值：仅设置废弃 contentType=5 时回退返回该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010013 begin');
      const result: number = notificationContentUtil.getContentTypeId({ contentType: 5 });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010013 end');
    })

    /**
     * @tc.name   testContentVolume010014
     * @tc.number SUB_CNB_CONTENT_0054
     * @tc.desc   优先级：新字段 0 与废弃字段 0 冲突时以新字段为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010014 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 0, contentType: 0 });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010014 end');
    })

    /**
     * @tc.name   testContentVolume010015
     * @tc.number SUB_CNB_CONTENT_0055
     * @tc.desc   优先级：新字段 1 与废弃字段 1 冲突时以新字段为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010015 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 1, contentType: 1 });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010015 end');
    })

    /**
     * @tc.name   testContentVolume010016
     * @tc.number SUB_CNB_CONTENT_0056
     * @tc.desc   优先级：新字段 2 与废弃字段 2 冲突时以新字段为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010016 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 2, contentType: 2 });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010016 end');
    })

    /**
     * @tc.name   testContentVolume010017
     * @tc.number SUB_CNB_CONTENT_0057
     * @tc.desc   优先级：新字段 3 与废弃字段 3 冲突时以新字段为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010017 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 3, contentType: 3 });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010017 end');
    })

    /**
     * @tc.name   testContentVolume010018
     * @tc.number SUB_CNB_CONTENT_0058
     * @tc.desc   优先级：新字段 4 与废弃字段 4 冲突时以新字段为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010018 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 4, contentType: 4 });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010018 end');
    })

    /**
     * @tc.name   testContentVolume010019
     * @tc.number SUB_CNB_CONTENT_0059
     * @tc.desc   优先级：新字段 5 与废弃字段 5 冲突时以新字段为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010019 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 5, contentType: 5 });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010019 end');
    })

    /**
     * @tc.name   testContentVolume010020
     * @tc.number SUB_CNB_CONTENT_0060
     * @tc.desc   优先级：新字段 6 与废弃字段 0 冲突时以新字段为准
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010020 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 6, contentType: 0 });
      logActual(String(result), String(6));
      expect(result).assertEqual(6);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010020 end');
    })

    /**
     * @tc.name   testContentVolume010021
     * @tc.number SUB_CNB_CONTENT_0061
     * @tc.desc   一致性：新旧字段同为 0 时结果同为该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010021 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 0, contentType: 0 });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010021 end');
    })

    /**
     * @tc.name   testContentVolume010022
     * @tc.number SUB_CNB_CONTENT_0062
     * @tc.desc   一致性：新旧字段同为 1 时结果同为该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010022 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 1, contentType: 1 });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010022 end');
    })

    /**
     * @tc.name   testContentVolume010023
     * @tc.number SUB_CNB_CONTENT_0063
     * @tc.desc   一致性：新旧字段同为 2 时结果同为该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010023 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 2, contentType: 2 });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010023 end');
    })

    /**
     * @tc.name   testContentVolume010024
     * @tc.number SUB_CNB_CONTENT_0064
     * @tc.desc   一致性：新旧字段同为 3 时结果同为该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010024 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 3, contentType: 3 });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010024 end');
    })

    /**
     * @tc.name   testContentVolume010025
     * @tc.number SUB_CNB_CONTENT_0065
     * @tc.desc   一致性：新旧字段同为 4 时结果同为该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010025 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 4, contentType: 4 });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010025 end');
    })

    /**
     * @tc.name   testContentVolume010026
     * @tc.number SUB_CNB_CONTENT_0066
     * @tc.desc   一致性：新旧字段同为 5 时结果同为该类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010026 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: 5, contentType: 5 });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010026 end');
    })

    /**
     * @tc.name   testContentVolume010027
     * @tc.number SUB_CNB_CONTENT_0067
     * @tc.desc   回退：新字段被显式置空后退回废弃字段 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010027 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: undefined, contentType: 0 });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010027 end');
    })

    /**
     * @tc.name   testContentVolume010028
     * @tc.number SUB_CNB_CONTENT_0068
     * @tc.desc   回退：新字段被显式置空后退回废弃字段 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010028 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: undefined, contentType: 1 });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010028 end');
    })

    /**
     * @tc.name   testContentVolume010029
     * @tc.number SUB_CNB_CONTENT_0069
     * @tc.desc   回退：新字段被显式置空后退回废弃字段 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010029 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: undefined, contentType: 2 });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010029 end');
    })

    /**
     * @tc.name   testContentVolume010030
     * @tc.number SUB_CNB_CONTENT_0070
     * @tc.desc   回退：新字段被显式置空后退回废弃字段 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010030 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: undefined, contentType: 3 });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010030 end');
    })

    /**
     * @tc.name   testContentVolume010031
     * @tc.number SUB_CNB_CONTENT_0071
     * @tc.desc   回退：新字段被显式置空后退回废弃字段 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010031 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: undefined, contentType: 4 });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010031 end');
    })

    /**
     * @tc.name   testContentVolume010032
     * @tc.number SUB_CNB_CONTENT_0072
     * @tc.desc   回退：新字段被显式置空后退回废弃字段 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010032 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: undefined, contentType: 5 });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010032 end');
    })

    /**
     * @tc.name   testContentVolume010033
     * @tc.number SUB_CNB_CONTENT_0073
     * @tc.desc   回退：仅废弃字段 0 且携带基本内容时仍按该类型返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010033 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ contentType: 0, normal: { title: "t", text: "b" } });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010033 end');
    })

    /**
     * @tc.name   testContentVolume010034
     * @tc.number SUB_CNB_CONTENT_0074
     * @tc.desc   回退：仅废弃字段 1 且携带基本内容时仍按该类型返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010034 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ contentType: 1, normal: { title: "t", text: "b" } });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010034 end');
    })

    /**
     * @tc.name   testContentVolume010035
     * @tc.number SUB_CNB_CONTENT_0075
     * @tc.desc   回退：仅废弃字段 2 且携带基本内容时仍按该类型返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010035 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ contentType: 2, normal: { title: "t", text: "b" } });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010035 end');
    })

    /**
     * @tc.name   testContentVolume010036
     * @tc.number SUB_CNB_CONTENT_0076
     * @tc.desc   解耦：携带基本内容负载不影响类型 0 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010036 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 0, normal: { title: "t", text: "b" } });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010036 end');
    })

    /**
     * @tc.name   testContentVolume010037
     * @tc.number SUB_CNB_CONTENT_0077
     * @tc.desc   解耦：携带基本内容负载不影响类型 1 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010037 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 1, normal: { title: "t", text: "b" } });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010037 end');
    })

    /**
     * @tc.name   testContentVolume010038
     * @tc.number SUB_CNB_CONTENT_0078
     * @tc.desc   解耦：携带基本内容负载不影响类型 2 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010038 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 2, normal: { title: "t", text: "b" } });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010038 end');
    })

    /**
     * @tc.name   testContentVolume010039
     * @tc.number SUB_CNB_CONTENT_0079
     * @tc.desc   解耦：携带基本内容负载不影响类型 3 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010039 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 3, normal: { title: "t", text: "b" } });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010039 end');
    })

    /**
     * @tc.name   testContentVolume010040
     * @tc.number SUB_CNB_CONTENT_0080
     * @tc.desc   解耦：携带基本内容负载不影响类型 4 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010040 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 4, normal: { title: "t", text: "b" } });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010040 end');
    })

    /**
     * @tc.name   testContentVolume010041
     * @tc.number SUB_CNB_CONTENT_0081
     * @tc.desc   解耦：携带基本内容负载不影响类型 5 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010041 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 5, normal: { title: "t", text: "b" } });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010041 end');
    })

    /**
     * @tc.name   testContentVolume010042
     * @tc.number SUB_CNB_CONTENT_0082
     * @tc.desc   解耦：携带基本内容负载不影响类型 6 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010042 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 6, normal: { title: "t", text: "b" } });
      logActual(String(result), String(6));
      expect(result).assertEqual(6);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010042 end');
    })

    /**
     * @tc.name   testContentVolume010043
     * @tc.number SUB_CNB_CONTENT_0083
     * @tc.desc   解耦：携带多行负载不影响类型 0 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010043 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 0, multiLine: { title: "t", text: "b",
        briefText: "br", longTitle: "lt", lines: ["l0"] } });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010043 end');
    })

    /**
     * @tc.name   testContentVolume010044
     * @tc.number SUB_CNB_CONTENT_0084
     * @tc.desc   解耦：携带多行负载不影响类型 1 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010044 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 1, multiLine: { title: "t", text: "b",
        briefText: "br", longTitle: "lt", lines: ["l0"] } });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010044 end');
    })

    /**
     * @tc.name   testContentVolume010045
     * @tc.number SUB_CNB_CONTENT_0085
     * @tc.desc   解耦：携带多行负载不影响类型 2 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010045 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 2, multiLine: { title: "t", text: "b",
        briefText: "br", longTitle: "lt", lines: ["l0"] } });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010045 end');
    })

    /**
     * @tc.name   testContentVolume010046
     * @tc.number SUB_CNB_CONTENT_0086
     * @tc.desc   解耦：携带多行负载不影响类型 3 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010046 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 3, multiLine: { title: "t", text: "b",
        briefText: "br", longTitle: "lt", lines: ["l0"] } });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010046 end');
    })

    /**
     * @tc.name   testContentVolume010047
     * @tc.number SUB_CNB_CONTENT_0087
     * @tc.desc   解耦：携带多行负载不影响类型 4 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010047 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 4, multiLine: { title: "t", text: "b",
        briefText: "br", longTitle: "lt", lines: ["l0"] } });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010047 end');
    })

    /**
     * @tc.name   testContentVolume010048
     * @tc.number SUB_CNB_CONTENT_0088
     * @tc.desc   解耦：携带多行负载不影响类型 5 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010048 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 5, multiLine: { title: "t", text: "b",
        briefText: "br", longTitle: "lt", lines: ["l0"] } });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010048 end');
    })

    /**
     * @tc.name   testContentVolume010049
     * @tc.number SUB_CNB_CONTENT_0089
     * @tc.desc   解耦：携带多行负载不影响类型 6 的解析
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010049 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 6, multiLine: { title: "t", text: "b",
        briefText: "br", longTitle: "lt", lines: ["l0"] } });
      logActual(String(result), String(6));
      expect(result).assertEqual(6);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010049 end');
    })

    /**
     * @tc.name   testContentVolume010050
     * @tc.number SUB_CNB_CONTENT_0090
     * @tc.desc   缺省：{} 回落到基本文本 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010050 begin');
      const result: number = notificationContentUtil.getContentTypeId({});
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010050 end');
    })

    /**
     * @tc.name   testContentVolume010051
     * @tc.number SUB_CNB_CONTENT_0091
     * @tc.desc   缺省：{ notificationContentType: undefined } 回落到基本文本 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010051 begin');
      const result: number = notificationContentUtil.getContentTypeId({ notificationContentType: undefined });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010051 end');
    })

    /**
     * @tc.name   testContentVolume010052
     * @tc.number SUB_CNB_CONTENT_0092
     * @tc.desc   缺省：{ contentType: undefined } 回落到基本文本 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010052 begin');
      const result: number = notificationContentUtil.getContentTypeId({ contentType: undefined });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010052 end');
    })

    /**
     * @tc.name   testContentVolume010053
     * @tc.number SUB_CNB_CONTENT_0093
     * @tc.desc   缺省：{ notificationContentType: undefined, contentType: undefined } 回落到基本文本 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010053 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: undefined, contentType: undefined });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010053 end');
    })

    /**
     * @tc.name   testContentVolume010054
     * @tc.number SUB_CNB_CONTENT_0094
     * @tc.desc   兼容：废弃字段置空时新字段 0 仍生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010054 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 0, contentType: undefined });
      logActual(String(result), String(0));
      expect(result).assertEqual(0);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010054 end');
    })

    /**
     * @tc.name   testContentVolume010055
     * @tc.number SUB_CNB_CONTENT_0095
     * @tc.desc   兼容：废弃字段置空时新字段 1 仍生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010055 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 1, contentType: undefined });
      logActual(String(result), String(1));
      expect(result).assertEqual(1);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010055 end');
    })

    /**
     * @tc.name   testContentVolume010056
     * @tc.number SUB_CNB_CONTENT_0096
     * @tc.desc   兼容：废弃字段置空时新字段 2 仍生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010056 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 2, contentType: undefined });
      logActual(String(result), String(2));
      expect(result).assertEqual(2);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010056 end');
    })

    /**
     * @tc.name   testContentVolume010057
     * @tc.number SUB_CNB_CONTENT_0097
     * @tc.desc   兼容：废弃字段置空时新字段 3 仍生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010057 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 3, contentType: undefined });
      logActual(String(result), String(3));
      expect(result).assertEqual(3);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010057 end');
    })

    /**
     * @tc.name   testContentVolume010058
     * @tc.number SUB_CNB_CONTENT_0098
     * @tc.desc   兼容：废弃字段置空时新字段 4 仍生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010058 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 4, contentType: undefined });
      logActual(String(result), String(4));
      expect(result).assertEqual(4);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010058 end');
    })

    /**
     * @tc.name   testContentVolume010059
     * @tc.number SUB_CNB_CONTENT_0099
     * @tc.desc   兼容：废弃字段置空时新字段 5 仍生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010059 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 5, contentType: undefined });
      logActual(String(result), String(5));
      expect(result).assertEqual(5);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010059 end');
    })

    /**
     * @tc.name   testContentVolume010060
     * @tc.number SUB_CNB_CONTENT_0100
     * @tc.desc   兼容：废弃字段置空时新字段 6 仍生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testContentVolume010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010060 begin');
      const result: number =
        notificationContentUtil.getContentTypeId({ notificationContentType: 6, contentType: undefined });
      logActual(String(result), String(6));
      expect(result).assertEqual(6);
      logActual(String(String(result).length), String(1));
      expect(String(result).length).assertEqual(1);
      logActual(String(result % 1), String(0));
      expect(result % 1).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010060 end');
    })

    /**
     * @tc.name   testContentVolume010061
     * @tc.number SUB_CNB_CONTENT_0101
     * @tc.desc   新旧类型字段冲突时以 notificationContentType 为准，全缺失时回落 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContentVolume010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010061 begin');
      const both: number = notificationContentUtil.getContentTypeId({ notificationContentType: 6, contentType: 0 });
      const empty: number = notificationContentUtil.getContentTypeId({});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'both=%{public}d empty=%{public}d', both, empty);
      expect(both).assertEqual(6);
      expect(empty).assertEqual(0);
      expect(both - empty).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testContentVolume010061 end');
    })

  })
}
